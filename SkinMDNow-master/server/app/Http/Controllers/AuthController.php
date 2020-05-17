<?php
namespace App\Http\Controllers;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

use App\Http\Controllers\Controller;
use Tymon\JWTAuth\Facades\JWTFactory;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Foundation\Auth\ResetsPasswords;
use App\Mail\ForgotPasswordEmail;
use App\Mail\VerifyMail;
use App\Mail\AddcaseMail;
use Mail;

use App\User;
use App\Question_answer_template;
use Validator;
use Hash;
use Exception;
use File;

class AuthServerController extends Controller
{
    use SendsPasswordResetEmails;
    public $serverUrl;
    public $clientUrl;

    protected $username = 'username';
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->serverUrl = env('APP_SERVERURL', url('/'));
        $this->clientUrl = env('APP_CLIENTURL', url('/'));
        $this->middleware('auth:api', ['except' => ['login', 'forgotPassword','getUserById','uploadimage','uploadSignatureImage']]);
    }

    /**
     * Update a Case
     * @param  Request $request
     * @return [type]
     */
    public function updateCase(Request $request, $id){
        $requestData = $request->all();
        
        if(!is_null($requestData['diagnosis']) || !empty($requestData['patientCaseImages'])){
            $imgIds = array();            
            $ids = array();
            $ids = $requestData['patientCaseOldImages'];            
            if(!empty($requestData['patientCaseImages'])){
                foreach ($requestData['patientCaseImages'] as $key => $value) {
                    $name = array('img_name' => $value);
                    $ids[] = DB::table('case_photos')->insertGetId($name);
                }
            }   
            $imgIds = implode(',', $ids);
            $user = Auth::user();
            $caseUpdateData = array('photos_ids' => $imgIds, 'follow_up' => $requestData['diagnosis'], 'submitted_by' => $user->id,);
            $cases = DB::table('cases')->where('id', $requestData['id'])->update($caseUpdateData);

            return response()->json(['status' => true], 200);
        }else{
            return response()->json(['status' => true], 200);
        }
    }

    public function getUserById(Request $request){
        $response = DB::table('users')->where(array('id' => $request->id, 'is_deleted' => 0))->first();
        $response->states = DB::table('us_state')->get();
        if(!empty($response)){
            if($response->user_type != 3){
                unset($response->mname);
                unset($response->remember_token);
                unset($response->health_care_professional);
                unset($response->created_by);
                unset($response->updated_at);
                unset($response->created_at);
            }        
            if(!empty($response->speciality)){
                $getVal = explode(',',$response->speciality );
                $sqlQry = "select GROUP_CONCAT(name) as name FROM specilities WHERE id IN($response->speciality)";
                $getSpecility = DB::select(DB::raw($sqlQry));
                if(!empty($getSpecility)){
                    //$response->speciality = $getSpecility[0]->name;
                }
                
            }
            //dd($response->speciality);
            $response->url = (is_null($response->user_image)) ? null : url("/storage/signature_images") . "/" . $response->user_image;
            $response->password = '';
            return response()->json(['status' => true, 'data'=> $response]);
        }else{
            return response()->json(['status' => false, 'error'=> "This record not found."]);
        }
    }

    public function getallusers(){
        $userId = $this->guard()->user()->id;//looged_in user ID
        $users = DB::select(DB::raw('SELECT 
                                            USR.id, 
                                            USR.user_type, 
                                            UT.user_type as typeofuser,
                                            CONCAT(USR.fname, " ",IFNULL(USR.mname,""), " ",USR.lname) as fullname, 
                                            USR.phone, 
                                            IFNULL(USR.title,"-") as dermatologist, 
                                            USR.email, 
                                            status
                                        FROM users USR LEFT JOIN user_types UT ON USR.user_type = UT.id WHERE USR.is_deleted = 0 AND  USR.id != ' . $userId));
        if(count($users) > 0){
            foreach ($users as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'id' => $value->id,
                    'user_type' => $value->user_type,
                    'typeofuser' => $value->typeofuser,
                    'fullname' => $value->fullname, 
                    'dermatologist' => $value->dermatologist,
                    'phone' => ($value->phone == '')? '' : $value->phone,
                    'email' => $value->email,
                    'status' => ($value->status)? 'Active' : 'Inactive',
                    'actions' => '',
                );
            }
            // $Response['states'] = DB::table('us_state')->get();
            return response()->json(['data'=>$Response,'states' => DB::table('us_state')->get()]);
        }else{
            $Response = array();
            return response()->json(['data'=>$Response]);
        }
    }

    public function getSkinCaseList(Request $request){
        $reqParam = $request->all();

        $userId = $this->guard()->user()->id; //looged_in user ID

        if($this->guard()->user()->user_type == 1){
            $caseId = (empty($reqParam['caseid']))? '' : ' AND cs.id = ' . $reqParam['caseid']['skincaseId'];
            $caseSql = 'select cs.*, cst.fname as customerName, prod.fname as providerName FROM cases cs LEFT JOIN users cst ON cs.care_giver_id = cst.id LEFT JOIN users prod ON cs.provider_id = prod.id where cs.is_case_deleted = 0 ' . $caseId.' order by cs.created_datetime desc';
            $getCaseData = DB::select(DB::raw( $caseSql ));
        }else{
            $caseId = (empty($reqParam['caseid']))? '' : ' AND cs.id = ' . $reqParam['caseid']['skincaseId'];
            $caseSql = 'select cs.*, cst.fname as customerName, prod.fname as providerName FROM cases cs LEFT JOIN users cst ON cs.care_giver_id = cst.id LEFT JOIN users prod ON cs.provider_id = prod.id where cs.is_case_deleted = 0  AND cs.provider_id = ' . $userId . $caseId .' order by cs.created_datetime desc';            
            $getCaseData = DB::select(DB::raw( $caseSql ));
        }
        
        $caseResponse = array();
        if(count($getCaseData) > 0){
            foreach ($getCaseData as $key => $value) {
                /**it will compare if request type is Active then return active cases OR if type resolved then return resolved case list*/
                $isTrueCase = false;
                if($request->type == "Active" && $value->status == "Active"){
                    $isTrueCase = true;    
                }else if($request->type == 'Resolved' && ($value->status == "Resolved" ||  $value->status == "Cancelled")){
                    $isTrueCase = true;    
                }

                if($isTrueCase){  
                    $caseResponse[] = array(
                            'key' => $value->id,
                            'id' => $value->id,
                            'title' => $value->patient_fname.' - Growth - '.date('l, F, d, Y', strtotime($value->created_datetime)), //Friday, January 04, 2019
                            'case_number' => $value->case_number,
                            'priority' => $value->case_priority,
                            'owner' => $value->providerName,
                            'customer' => $value->customerName,
                            'status' => $value->status,
                            'viewurl' => '/dashboard/' . $request->listType . '/' . $value->id,
                            'created_on' => date('m/d/Y H:i A', strtotime($value->created_datetime))
                        );
                }
            }
            return response()->json(['data'=>$caseResponse]);
        }else{
            $caseResponse = array();
            return response()->json(['data'=>$caseResponse]);
        }
    }

    /**
     * Create a User
     * @param  Request $request
     * @return [type]
     */
    public function register(Request $request)
    {

        $validatedData = Validator::make($request->all(), [
            'email' => 'unique:users|email',
            'username' => 'unique:users',
            'consult_fee' => 'numeric',
            'dob' => 'date|before:18 years ago'
        ], ['before' => 'The user should be 18 years old.']);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }

        $input = $request->all();
        $userId = $this->guard()->user()->id;//looged_in user ID
        
        $passwordUser = trim($this->getRandomStr());

        $insertData = array();
        $insertData['user_type'] = $input['user_type'];
        $insertData['fname'] = $input['fname'];
        $insertData['username'] = $input['username'];
        $insertData['lname'] = (!empty($input['lname']))? $input['lname'] : NULL;
        $insertData['gender'] = $input['gender'];
        $insertData['dob'] = $input['dob'];
        $insertData['email'] = (empty($input['email']))? NULL : $input['email'];
        $insertData['password'] = Hash::make($passwordUser);
        $insertData['phone'] = (empty($input['phone']))? NULL : $input['phone'];
        $insertData['created_by'] = $userId;
        $insertData['status'] = $input['status'];
    
        if($input['user_type'] == 3){
            $insertData['mname'] = (!empty($input['mname']))? $input['mname'] : NULL;
            $insertData['health_care_professional'] = $input['health_care_professional'];
        }else{
            $insertData['new_consults'] = $input['new_consults'];
            $insertData['Title'] = (empty($input['Title']))? NULL : $input['Title'];
            $insertData['npi'] = (empty($input['npi']))? NULL : $input['npi'];
            $insertData['speciality'] = (empty($input['speciality']))? NULL : implode(',', $input['speciality']);
            $insertData['consult_fee'] = (empty($input['consult_fee']))? 0 : $input['consult_fee'];
            $insertData['degrees'] = (empty($input['degrees']))? NULL : $input['degrees'];
            $insertData['user_image'] = (empty($input['user_image']))? NULL : $input['user_image'];
            $insertData['access_mode'] = (empty($input['access_mode']))? 0 : $input['access_mode'];
            $insertData['license_type'] = (empty($input['license_type']))? 0 : $input['license_type'];
        }

        try {

            User::create($insertData);
            
            $registerContent = DB::table('email_template')->where(array('email_type' => 2) )->select('content')->get();

            if(isset($registerContent[0])){                        
                $registerContentValue =  $registerContent[0]->content;
                $search = array('{{name}}','{{email}}','{{username}}','{{password}}',"\n");
                
                $replace = array( ($input['fname'].' '.$input['lname']), $input['email'], $input['username'], $passwordUser, '<br />');

                $registerContentValue = str_replace($search, $replace, $registerContentValue);

            }else{
                $registerContentValue = "<p>Thank you for register. <br />Your login details are as mentioned below: <br /> <b>Username:</b> ". $input['username'] . " <br /> <b>Password:</b> " . $passwordUser."</p>";
            }

            $registerContentValue .= "<br /> <br /> --- <br />For login click on this link <a href='" . (($input['user_type'] == 3)? $this->clientUrl : $this->serverUrl) . "'> Login</a>";
                    
            Mail::to($input['email'])->cc(['vimal.raval@techextensor.com'])->send(new VerifyMail($registerContentValue));        

            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

    public function getUserType(Request $request){
        return response()->json(['status'=>true, 'data'=> $this->guard()->user()->user_type]);
    }
    /**
     * Update a User
     * @param  Request $request
     * @return [type]
     */
    public function updateUser(Request $request, $id){
        $validatedData = Validator::make($request->all(), [
            'email' => [
                'email',
                Rule::unique('users')->ignore($request->id),
            ],
            'username' => [Rule::unique('users')->ignore($request->id),],
            'consult_fee' => 'numeric'
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }

        $update_data = $request->all();        
        if(isset($update_data['new_user_image'])){
            $image_path = public_path('/storage/signature_images/'.$update_data['user_image']); 
            if(File::exists($image_path)) { File::delete($image_path); /* delete old image */ }
            //we have to write code to delete old image
            $update_data['user_image'] = $update_data['new_user_image']; //set new file name
            unset($update_data['new_user_image']);//remove this temp name
        }
        
        if(!empty($update_data['password']) && !is_null($update_data['password'])){ 
            $update_data['password'] = Hash::make($update_data['password']); 
        }else{
            unset($update_data['password']);
        }

        if(!empty($update_data['speciality'])){
            $update_data['speciality'] = implode(',', $update_data['speciality']);
        }
        
        $user = User::where('id', $id)->update($update_data);

        if($user){
            return response()->json(['status' => true], 200);
        }else{
            return response()->json(['status' => false, 'error' => 'User not updated.'],400);
        }
    }

    /**
     * Delete Users
     * @param  Request $request
     * @return [type]
     */
    public function deleteUsers(Request $request){        
        try {
            User::whereIn('id', $request->all())->update(array('is_deleted' => 1));
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

    /**
     * Get a JWT token via given credentials.
     *
     * @param  \Illuminate\Http\Request  $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        $credentials = $request->only('username', 'password'); 
        $user = User::where('username', $request->username)->first();
        if (Hash::check($request->password, $user->password) && in_array($user->user_type, array(1,2)))
        {
            $token = $this->guard()->attempt($credentials);
            if ($token) {
                return $this->respondWithToken($token);
            }
        }
        return response()->json(['error' => 'Unauthorized'], 401);
    }

    public function getRandomStr() { 
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'; 
        $randomString = ''; 
        
        for ($i = 0; $i < 10; $i++) { 
            $index = rand(0, strlen($characters) - 1); 
            $randomString .= $characters[$index]; 
        }     
        return $randomString; 
    }

    /**
     * Handle forgot password reset sender
     *
     * @param  \Illuminate\Http\Request  $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function forgotPassword(Request $request)
    {
        $req = $request->all();
        $getUserType = DB::table('users')->where('email', $req['email'])->get();
        if(!empty($getUserType[0])){
            if($getUserType[0]->user_type > 2){
                return response()->json(['status' => false, 'message' => 'Email address not found.']);
            }else{
                $password = trim($this->getRandomStr());

                DB::table('users')->where('email', $req['email'])->update(array('password' => Hash::make($password)) );
                
                $getUserType[0]->new_password = $password;

                /**Email Send code start */
                $forgotContent = DB::table('email_template')->where(array('email_type' => 1) )->select('content')->get();

                if(isset($forgotContent[0])){                        
                    $forgotContentValue =  $forgotContent[0]->content;
                    $search = array('{{name}}','{{email}}','{{username}}','{{password}}',"\n");
                    
                    $replace = array( ( $getUserType[0]->fname.' '. $getUserType[0]->lname . ','), $getUserType[0]->email, $getUserType[0]->username, $password, '<br />');

                    $forgotContentValue = str_replace($search, $replace, $forgotContentValue);

                }else{
                    $forgotContentValue = "We have reset your password.<br/> Please find the new password as mentioned below<br />
                    <b>Username:</b>  ".$getUserType[0]->username." <br />
                    <b>Password:</b>  $password <br />";
                }
                Mail::to($req['email'])->cc(['vimal.raval@techextensor.com'])->send(new ForgotPasswordEmail($forgotContentValue));              
                //dd(Mail);
                /**END - Email Send code */

                return response()->json(['status' => true, 'message' => 'New password sent to the email address you entered.']);
            }
        }else{
            return response()->json(['status' => false, 'message' => 'Email address not found.']);
        }
    }
    
    /**
     * Get a response for a successful password reset link.
     *
     * @param string $response 
     * @return \Dingo\Api\Http\Response
     */
    protected function sendResetLinkResponse()  {
        return response()->json(['status' => true, 'message' => 'Password reset email sent.']);
    }

    /**
     * Get the response for a failed password reset link
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param string $response 
     * @return \Dingo\Api\Http\Response 
     */
    protected function sendResetLinkFailedResponse(Request $request, $response)
    {
        return response()->json(['status' => false, 'message' => 'Email could not be sent to this email address']);
    }

    /** 
     * Handles forgotten password reset
     * @param \Illuminate\Http\Request  $request The request
     * @return \Dingo\Api\Http\Response 
    */
    public function doReset(Request $request)
    {
        return $this->reset($request);
    }

    /**
     * Reset password method
     */
    protected function resetPassword($user, $password )
    {
        $user->password = Hash::make($password);
        $user->save();

        event(new PasswordReset($user));
    }

    /**
     * Get a response for a successful password reset.
     *
     * @param string $response 
     * @return \Dingo\Api\Http\Response
     */
    protected function sendResetResponse() {
        return response()->json(['messsage' => 'Password reset succesful.']);
    }

    /**
     * Get the response for a failed password reset
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param string $response 
     * @return \Dingo\Api\Http\Response 
     */
    protected function sendResetFailedResponse(Request $request, $response) 
    {
        return $this->response->errorUnauthorized('Token Invalid');
    }

    /**
     * Get the authenticated User
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function test()
    {
        return response()->json(['status' => 200, 'message' => 'succcesful',]);
    }

    /**
     * Log the user out (Invalidate the token)
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        $this->guard()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken($this->guard()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'token' => $token,
            'token_type' => 'bearer',
            'expiredAt' => $this->guard()->factory()->getTTL() * 60
        ]);
    }

    /**
     * Get the guard to be used during authentication.
     *
     * @return \Illuminate\Contracts\Auth\Guard
     */
    public function guard()
    {
        return Auth::guard();
    }   

    /**Load US State Data */
    public function getStateData(){
        $states = DB::table('us_state')->get();
        if(count($states) > 0){
            return response()->json(['data' => $states]);
        }else{
            return response()->json(['data'=> array()]);
        }
    }

    public function uploadSignatureImage(Request $request){
        
        $header = $request->header();
        
        $referer_url = $header['referer'][0];

        $destinationPath = public_path('/storage/signature_images/');
        
        $validatedData = Validator::make($request->all(), [
            'file' => 'required|image|mimes:jpeg,png,jpg,svg|max:2048',
        ]);
        
        if($validatedData->fails()){            
            return response()->json(implode($validatedData->errors()->all(), ','),400);
        }

        if ($request->hasFile('file')) {
            $image = $request->file('file');
            $name = time().'.'.$image->getClientOriginalExtension();
            $image->move($destinationPath, $name);
            return $name;
        }
        
    }

    public function uploadimage(Request $request){
        
        $header = $request->header();
        
        $referer_url = $header['referer'][0];
    
        $destinationPath = public_path('/storage/cases_images/');
        
        $validatedData = Validator::make($request->all(), [
            'file' => 'required|image|mimes:jpeg,png,jpg,svg|max:2048',
        ]);
        
        if($validatedData->fails()){            
            return response()->json(implode($validatedData->errors()->all(), ','),400);
        }

        if ($request->hasFile('file')) {
            $image = $request->file('file');
            $name = time().'.'.$image->getClientOriginalExtension();
            $image->move($destinationPath, $name);
            return $name;
        }
        
    }
    /*****************************************Email Template functions***********************************************/
    public function getTemplateData(Request $request){        
        $reqParam = $request->all();        
        $list = DB::select(DB::raw('SELECT *, CASE WHEN status > 0 THEN "Active" ELSE "Inactive" END as status FROM email_template'));
        if(count($list) > 0){
            foreach ($list as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'id' => $value->id,
                    'email_type' => $value->email_type, 
                    'content' => $value->content, 
                    'created_at' => date('m/d/Y h:i A',strtotime($value->created_at)), 
                    'status' => $value->status,
                    'actions' => '',
                );
            }
            return response()->json(['data' => $Response]);
        }else{
            return response()->json(['data'=> array()]);
        }
    }

    /** Get Referral ID for edit records*/
    public function getTemplateById(Request $request){
        $response = DB::table('email_template')->where('id', $request->id)->first();
        $response->dynamicData = json_decode($response->parameter);
        
        return response()->json(['status' => true, 'data'=> $response]);
    }
    
    /**
     * Update a Template code
     * @param  Request $request
     * @return [type]
     */
    public function updateTemplate(Request $request){
        $reqParam = $request->all();
        $validatedData = Validator::make($reqParam, [
            'content' => 'required',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }

        try {
            DB::table('email_template')->where('id', $reqParam['id'])->update($reqParam);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }


    /******************************************END - Email Template**************************************************/
   

    /*****************************************Referral Code functions***********************************************/
    /**
     * Get list of all referral code by doctor id
     * */
    public function getusersCodes(Request $request){
        $reqParam = $request->all();
        $list = DB::select(DB::raw('select *, CASE WHEN status > 0 THEN "Active" ELSE "Inactive" END as status FROM refferal_codes WHERE is_deleted = 0 AND provider_id = '. $reqParam['id']));
        if(count($list) > 0){
            foreach ($list as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'id' => $value->id,
                    'org_name' => $value->org_name, 
                    'referral_code' => $value->referral_code, 
                    'provider_id' => $value->provider_id, 
                    'comments' => $value->comments, 
                    'created_at' => date('m/d/Y h:i A',strtotime($value->created_at)), 
                    'status' => $value->status,
                    'actions' => '',
                );
            }
            return response()->json(['data'=>$Response]);
        }else{
            $Response = array();
            return response()->json(['data'=>$Response]);
        }
    }
    /**
     * Update status for given referral ids
     */
    public function deleteReferrals(Request $request){
        try {
            DB::table('refferal_codes')->whereIn('id', $request->all())->update(array('is_deleted' => 1));
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    
    /**
     * Add Referral code
     */
    public function addReferral(Request $request){

        $validatedData = Validator::make($request->all(), [
            'referral_code' => 'required',
            'org_name' => 'required',
            'comments' => 'required'
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }
        
        $input = $request->all();
        
        try {
            DB::table('refferal_codes')->insert($input);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    
    /** Get Referral ID for edit records*/
    public function getReferralById(Request $request){
        $response = DB::table('refferal_codes')->where('id', $request->id)->first();
        return response()->json(['status' => true, 'data'=> $response]);
    }
    
    /**
     * Update a Referral code
     * @param  Request $request
     * @return [type]
     */
    public function updateReferral(Request $request){
        $reqParam = $request->all();
        $validatedData = Validator::make($reqParam, [
            'referral_code' => 'required',
            'org_name' => 'required',
            'comments' => 'required'
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }

        try {
            DB::table('refferal_codes')->where('id', $reqParam['id'])->update($reqParam);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

    
    /**************************************** Derm Address Module's functions **************************************/
    
    /**
     * Get Derm Address list
     */
    public function getdermaddresslist(Request $request){
        $list = DB::select(DB::raw('select DA.*, CASE
            WHEN DA.status > 0 THEN "Active"
            ELSE "Inactive"
        END as status,
        CASE WHEN DA.is_primary_address > 0 THEN "Yes" ELSE "No" END as primary_address,
        ST.name as state_name
        FROM derm_address DA 
            LEFT JOIN us_state ST ON DA.state = ST.id WHERE is_deleted = 0 AND DA.user_id = '. $request->userid));
        if(count($list) > 0){
            foreach ($list as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'id' => $value->id,
                    'city' => $value->city, 
                    'state' => $value->state_name, 
                    'practice_name' => $value->practice_name, 
                    'is_primary_address' => $value->primary_address, 
                    'created_at' => date('m/d/Y h:i A',strtotime($value->created_at)), 
                    'status' => $value->status,
                    'actions' => '',
                );
            }
            return response()->json(['data'=>$Response]);
        }else{
            $Response = array();
            return response()->json(['data'=>$Response]);
        }
    }
    
    /**
     * Delete Derm Address
     * @param  Request $request
     * @return [type]
     */
    public function deleteDermaddress(Request $request){
        try {
            DB::table('derm_address')->whereIn('id', $request->all())->update(array('is_deleted' => 1));
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    
    /**
     * Add Derm Address
     */
    public function addDermaddress(Request $request){

        $validatedData = Validator::make($request->all(), [
            'state' => 'required',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }
        
        $input = $request->all();
        
        try {
            DB::table('derm_address')->insert($input);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

    /** Get Derm Address ID for edit records*/
    public function getDermaddressById(Request $request){
        $response = DB::table('derm_address')->where(array('id'=> $request->id, 'is_deleted' => 0))->first();
        if(!empty($response)){
            return response()->json(['status' => true, 'data'=> $response]);
        }else{
            return response()->json(['status' => false, 'error'=> 'This record not found']);
        }
    }
    
    /**
     * Update a Derm Address
     * @param  Request $request
     * @return [type]
     */
    public function updateDermaddress(Request $request, $id){
        $validatedData = Validator::make($request->all(), [
            'state' => 'required',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }

        try {
            DB::table('derm_address')->where('id', $id)->update($request->all());
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }


    /********************************* End-Derm Address Module's functions ****************************************/


    /**************************************** Complaint Module's functions **************************************/
    
    /**
     * Get Complaint list
     */
    public function Complaintlist(){
        $list = DB::select(DB::raw('select *, CASE
            WHEN status > 0 THEN "Active"
            ELSE "Inactive"
        END as status
        FROM chief_complaints WHERE is_deleted = 0 order by created_datetime desc'));

        if(count($list) > 0){
            foreach ($list as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'id' => $value->id,
                    'name' => $value->name, 
                    'datetime' => strtotime($value->created_datetime), 
                    'display' => (!empty($value->display_order))? $value->display_order : "", 
                    'created' => date('m/d/Y h:i A',strtotime($value->created_datetime)), 
                    'status' => $value->status,
                    'actions' => '',
                );
            }
            return response()->json(['data'=>$Response]);
        }else{
            $Response = array();
            return response()->json(['data'=>$Response]);
        }
    }
    
    /**
     * Delete Complaint
     * @param  Request $request
     * @return [type]
     */
    public function deleteComplaint(Request $request){
        try {
            DB::table('chief_complaints')->whereIn('id', $request->all())->update(array('is_deleted' => 1));
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    
    /**
     * Add Complaint
     */
    public function addComplaint(Request $request){

        $validatedData = Validator::make($request->all(), [
            'name' => 'required',
            'owner' => 'required',
            'display_order' => 'numeric'
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }
        
        $input = $request->all();
        
        try {
            DB::table('chief_complaints')->insert($input);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

    /** Get Complaints ID for edit records*/
    public function getComplaintById(Request $request){
        $response = DB::table('chief_complaints')->where('id', $request->id)->where('is_deleted', 0)->first();
        if(!empty($response)){
            return response()->json(['status' => true, 'data'=> $response]);
        }else{
            return response()->json(['status' => false, 'error'=> 'This record not found']);
        }
    }
    
    /**
     * Update a Complaint
     * @param  Request $request
     * @return [type]
     */
    public function updateComplaint(Request $request, $id){
        $validatedData = Validator::make($request->all(), [
            'name' => 'required',
            'owner' => 'required',
            'display_order' => 'numeric'
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }

        try {
            DB::table('chief_complaints')->where('id', $id)->update($request->all());
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }


    /********************************* End-Complaint Module's functions ****************************************/

    
    /**************************************** Prescription Module's functions **************************************/
    
    /**
     * Get Prescription list
     */
    public function Prescriptionlist(Request $request){
        $reqParam = $request->all();
        $presIds = null;
        $whereSql = ' WHERE prs.is_deleted = 0 ';
        if(!is_null($reqParam['caseid'])){
            $getPresIds = "SELECT GROUP_CONCAT(id) as ids FROM prescriptions WHERE case_id = " . $reqParam['caseid']['skincaseId']; 
            $presIds = DB::select(DB::raw($getPresIds));
            $presIds = $presIds[0]->ids;
            $whereSql .= (is_null($presIds))? ' AND cs.id = '. $reqParam['caseid']['skincaseId'] : " AND prs.id IN($presIds)";
        }

        $presSql = "select prs.*, CASE WHEN prs.status > 0 THEN 'Active' ELSE 'Inactive' END as status, ph.pharmacy_name as pharmacyName FROM prescriptions prs  LEFT JOIN cases cs ON prs.case_id = cs.id LEFT JOIN pharmacy ph ON prs.pharmacy = ph.id $whereSql order by prs.created_datetime desc";
        
        $list = DB::select(DB::raw( $presSql ));

        if(count($list) > 0){
            foreach ($list as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'case_id' => (!is_null($reqParam['caseid']))? $value->case_id : NULL,
                    'id' => $value->id,
                    'prescription' => $value->medication, 
                    'firstname' => (!empty($value->pharmacyName))? $value->pharmacyName : "", 
                    'pharmacyfax' => (empty($value->fax_pharmacy))? '' : $value->fax_pharmacy,
                    'datetime' => strtotime($value->created_datetime), 
                    'created' => date('m/d/Y h:i A',strtotime($value->created_datetime)), 
                    'status' => $value->status,
                    'actions' => '',
                );
            }
            return response()->json(['data'=>$Response]);
        }else{
            $Response = array();
            return response()->json(['data'=>$Response]);
        }
    }
    
    /**
     * Delete Prescription
     * @param  Request $request
     * @return [type]
     */
    public function deletePrescription(Request $request){
        try {
            DB::table('prescriptions')->whereIn('id', $request->all())->update(array('is_deleted' => 1));
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    
    /**
     * Add Prescription
     */
    public function addPrescription(Request $request){

        $validatedData = Validator::make($request->all(), [
            'case_id' => 'required',
            'medication' => 'required|min:10',
            'fax_pharmacy' => 'numeric|digits:10',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }
        
        $input = $request->all();
        unset($input['caseid']);
        try {
            $id = DB::table('prescriptions')->insertGetId($input);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

    /** Get Prescription ID for edit records*/
    public function getPrescriptionById(Request $request){
        $response = DB::table('prescriptions')->where('id', $request->id)->where('is_deleted', 0)->first();
        if(!empty($response)){
            return response()->json(['status' => true, 'data'=> $response]);
        }else{
            return response()->json(['status' => false, 'error'=> 'This record not found']);
        }
       
    }
    
    /**
     * Update a Prescription
     * @param  Request $request
     * @return [type]
     */
    public function updatePrescription(Request $request, $id){
        $validatedData = Validator::make($request->all(), [
            'case_id' => 'required',
            'medication' => 'required|min:10',
            'fax_pharmacy' => 'numeric|digits:10',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }
        
        $input = $request->all();
        unset($input['caseid']);

        try {
            DB::table('prescriptions')->where('id', $id)->update($input);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }


    /********************************* End-Prescription Module's functions ****************************************/



    /**************************************** Pharmacy Module's functions **************************************/
    
    /**
     * Get Pharmacy list
     */
    public function pharmacylist(){
        $list = DB::select(DB::raw('select *, CASE
            WHEN status > 0 THEN "Active"
            ELSE "Inactive"
        END as status FROM  pharmacy WHERE is_deleted = 0 order by created_datetime desc'));

        if(count($list) > 0){
            foreach ($list as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'id' => $value->id,
                    'pharmacy_name' => $value->pharmacy_name, 
                    'description' => (empty($value->description))? "" : $value->description,
                    'datetime' => strtotime($value->created_datetime), 
                    'created' => date('m/d/Y h:i A',strtotime($value->created_datetime)), 
                    'status' => $value->status,
                    'actions' => '',
                );
            }
            return response()->json(['data'=>$Response]);
        }else{
            $Response = array();
            return response()->json(['data'=>$Response]);
        }
    }
    
    /**
     * Delete Pharmacy
     * @param  Request $request
     * @return [type]
     */
    public function deletePharmacy(Request $request){
        try {
            DB::table('pharmacy')->whereIn('id', $request->all())->update(array('is_deleted' => 1));
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    
    /**
     * Add Question choice
     */
    public function addPharmacy(Request $request){

        $validatedData = Validator::make($request->all(), [
            'pharmacy_name' => 'required|max:30|min:4',
            'pharmacy_fax' => 'numeric|digits:10',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }
        
        $input = $request->all();
        
        try {
            DB::table('pharmacy')->insert($input);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

    /** Get Pharmacy ID for edit records*/
    public function getPharmacyById(Request $request){
        $response = DB::table('pharmacy')->where('id', $request->id)->where('is_deleted', 0)->first();
        if(!empty($response)){
            $response = DB::table('pharmacy')->where('id', $request->id)->first();
            return response()->json(['status' => true, 'data'=> $response]);
        }else{
            return response()->json(['status' => false, 'error'=> 'This record not found']);
        }
    }
    
    /**
     * Update a Pharmacy
     * @param  Request $request
     * @return [type]
     */
    public function updatePharmacy(Request $request, $id){
        $validatedData = Validator::make($request->all(), [
            'pharmacy_name' => 'required|max:30|min:4',
            'pharmacy_fax' => 'numeric|digits:10',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }

        try {
            DB::table('pharmacy')->where('id', $id)->update($request->all());
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

    /********************************* End - Pharmacy Module's functions ****************************************/

    
    /**************************************** Question Choice Module's functions **************************************/
    
    /**
     * Question Module's functions
     */
    public function getquestionsChoicelist(Request $request){
        $reqParam = $request->all();
        $where = ' WHERE is_deleted = 0 order by created_datetime desc';
        if(!empty($reqParam)){
            $where = " WHERE is_deleted = 0 AND (question_answer_id = " . $reqParam['id'] . ") OR (question_answer_id  IS NULL)  order by created_datetime desc";
        }
        
        $questionsChoice_list = DB::select(DB::raw('select *, CASE WHEN status > 0 THEN "Active" ELSE "Inactive" END as status from  question_choices' . $where));

        if(count($questionsChoice_list) > 0){
        foreach ($questionsChoice_list as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'id' => $value->id,
                    'name' => $value->question_answer, 
                    'queansname' => $value->question_answer,
                    'datetime' => strtotime($value->created_datetime), 
                    'created' => date('m/d/Y h:i A',strtotime($value->created_datetime)), 
                    'status' => $value->status,
                    'actions' => '',
                );
            }
            return response()->json(['data'=>$Response]);
        }else{
            $Response = array();
            return response()->json(['data'=>$Response]);
        }
    }
        
    /**
     * Delete Question Choices
     * @param  Request $request
     * @return [type]
     */
    public function deleteQuestionChoice(Request $request){
        try {
            DB::table('question_choices')->whereIn('id', $request->all())->update(array('is_deleted' => 1));
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

    /**
     * Add Question choice
     */
    public function addquestionsChoice(Request $request){

        $validatedData = Validator::make($request->all(), [
            'question_answer' => 'required',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }
        
        $input = $request->all();
        
        try {
            DB::table('question_choices')->insert($input);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    
    /** Get Question Choice by ID for edit records*/
    public function getQuestionChoiceById(Request $request){
        $response = DB::table('question_choices')->where('id', $request->id)->where('is_deleted', 0)->first();
        if(!empty($response)){
            return response()->json(['status' => true, 'data'=> $response]);
        }else{
            return response()->json(['status' => false, 'error'=> 'This record not found']);
        }
    }
    
    /**
     * Update a Question
     * @param  Request $request
     * @return [type]
     */
    public function updateQuestionChoice(Request $request, $id){
        $validatedData = Validator::make($request->all(), [
            'question_answer' => 'required',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }

        try {
            DB::table('question_choices')->where('id', $id)->update($request->all());
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    
    /************************** End - Question Choice functions ****************************************/
    
    /**************************************** Case Activity log functions **************************************/

    public function getActivity(Request $request){
        $getParam = $request->all();
        // $getParam['caseid'] = 160;
        $caseSql = "SELECT CA.*, CS.case_number, CONCAT(US.fname,' ',US.lname) as user_name FROM case_activity_log CA LEFT JOIN cases CS ON CA.case_id = CS.id LEFT JOIN users US ON CA.by_user_id = US.id WHERE CS.id = " . $getParam['caseid'];
        try {
            $Response = DB::select(DB::raw($caseSql));            
            return response()->json(['data'=>$Response]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    
    /************************************************ End *****************************************************/

    /**************************************** Question Module's functions **************************************/

    /**
     * Question Module's functions
     */
    public function getquestionslist(Request $request){
        $where = '';
        if(isset($request->is_deleted)){
            $where = " WHERE is_deleted = ". $request->is_deleted;
        }
        
        if(isset($request->id)){ //get records from qa 
            $questionAns = DB::table('question_answer_templates')->where('id', $request->id)->get();
            if(!empty($questionAns) && $questionAns[0]->questions_list){
                $where = " WHERE (is_deleted = 0 || id IN(" . $questionAns[0]->questions_list ."))";
            }else{
                $where = " WHERE is_deleted = 0 ";
            }
        }

        if(isset($request->qcId)){ //get records from question
            $questionAns = DB::table('question_choices')->where('id', $request->qcId)->get();
            if(!empty($questionAns) && $questionAns[0]->question_answer_id){
                $where = " WHERE (is_deleted = 0 || id = " . $questionAns[0]->question_answer_id .")";
            }else{
                $where = " WHERE is_deleted = 0 ";
            }
        }

        
        $questions_list = DB::select(DB::raw('select *, CASE
            WHEN status > 0 THEN "Active"
            ELSE "Inactive"
        END as status from questions '. $where .' order by created_datetime desc'));

        if(count($questions_list) > 0){
           // print_r($questions_list);exit;
            foreach ($questions_list as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'id' => $value->id,
                    'name' => $value->question, 
                    'display_order' => (!empty($value->display_order))? $value->display_order : "", 
                    'created' => date('m/d/Y h:i A',strtotime($value->created_datetime)), 
                    'datetime' => strtotime($value->created_datetime), 
                    'status' => $value->status,
                    'actions' => '',
                );
            }
            return response()->json(['data'=>$Response]);
        }else{
            $Response = array();
            return response()->json(['data'=>$Response]);
        }
    }
    
    /**
     * Get Owners
     */     
    public function getOwners(Request $request){
        $userId = '';
        if(isset($request->que_id)){
            $response = DB::table('questions')->where('id', $request->que_id)->first();
            if(isset($response->owner)){
                $userId = $response->owner;
            }
        }
        if($userId != ''){
            $sql = 'select *, CONCAT(fname," ",lname) as name from users WHERE user_type != 3 AND (is_deleted = 0 || id= '.$userId.' )';
        }else{
            $sql = 'select *, CONCAT(fname," ",lname) as name from users WHERE user_type != 3 AND is_deleted = 0';
        }
        
        $OwnersData = DB::select(DB::raw($sql));
        //echo $sql;exit;
        if(count($OwnersData) > 0){
           foreach ($OwnersData as $key => $value) {
               if(($value->id == $userId) || ($value->is_deleted == 0) ){
                    $Response[] = array(
                        'key' => $value->id,
                        'id' => $value->id,
                        'name' => $value->name, 
                    );
                }
            }
            return response()->json(['data'=>$Response]);
        }else{
            $Response = array();
            return response()->json(['data'=>$Response]);
        }
    }

    /**
     * Add Question
     */
    public function addquestions(Request $request){

        $validatedData = Validator::make($request->all(), [
            'question' => 'required',
            'display_order' => 'required|numeric',
            'question_type' => 'required',
            'owner' => 'required',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }
        
        $input = $request->all();
        
        try {
            DB::table('questions')->insert($input);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    
    /**
     * Delete QAs
     * @param  Request $request
     * @return [type]
     */
    public function deleteQuestion(Request $request){        
        try {
            DB::table('questions')->whereIn('id', $request->all())->update(array('is_deleted' => 1));
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

    /** Get Question by ID for edit records*/
    public function getQuestionById(Request $request){
        $response = DB::table('questions')->where('id', $request->id)->where('is_deleted', 0)->first();
        if(!empty($response)){
            $getAllAttachQues = DB::select(DB::raw("SELECT GROUP_CONCAT(id) as questions_choice_list FROM question_choices WHERE question_answer_id = $request->id"));
            $response->questions_choice_list = (is_null($getAllAttachQues[0]->questions_choice_list) || empty($getAllAttachQues[0]->questions_choice_list))? '' : $getAllAttachQues[0]->questions_choice_list;
            return response()->json(['status' => true, 'data'=> $response]);
        }else{
            return response()->json(['status' => false, 'error'=> 'This record not found']);
        }
    }
    
    /**
     * Update a Question
     * @param  Request $request
     * @return [type]
     */
    public function updateQuestion(Request $request, $id){
        $validatedData = Validator::make($request->all(), [
            'question' => 'required',
            'display_order' => 'required|numeric',
            'question_type' => 'required',
            'questions_choice_list' => 'required',
            'owner' => 'required',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }

        try {
            $reqParam = $request->all();
            $QC_ids = $reqParam['questions_choice_list'];
            $getAllAttachQues = DB::select(DB::raw("SELECT GROUP_CONCAT(id) as questions_choice_list FROM question_choices WHERE question_answer_id = $id"));
            
            if($getAllAttachQues[0]->questions_choice_list != null){
                //remove question from question choices
                DB::table('question_choices')->whereIn('id', explode(',', $getAllAttachQues[0]->questions_choice_list) )->update(array('question_answer_id' => NULL));
            }  
            
            //update question id in questions choices
            DB::table('question_choices')->whereIn('id', $QC_ids)->update(array('question_answer_id' => $id));
            
            //Update question details
            unset($reqParam['questions_choice_list']);

            DB::table('questions')->where('id', $id)->update($reqParam);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    
    /************************** End - Question functions ****************************************/

    /**
     * Question Answers functions 
     */     
    public function getqalist(){
        $qa_list = DB::select(DB::raw('select *, CASE
            WHEN status > 0 THEN "Active"
            ELSE "Inactive"
        END as status from question_answer_templates WHERE is_deleted = 0 order by created_datetime desc'));
    
         if(count($qa_list) > 0){
           foreach ($qa_list as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'id' => $value->id,
                    'name' => $value->question, 
                    'datetime' => strtotime($value->created_datetime), 
                    'created' => date('m/d/Y h:i A',strtotime($value->created_datetime)), 
                    'status' => $value->status,
                    'actions' => '',
                );
            }
            return response()->json(['data'=>$Response]);
        }else{
            $Response = array();
            return response()->json(['data'=>$Response]);
        }
    }

    /**
     * Get complaints
     */     
    public function getComplaints(Request $request){        
        if(isset($request->id) && !is_null($request->id)){
            $response = DB::table('question_answer_templates')->select('chief_complaints as cc')->where('id', $request->id)->first();
            if(!empty($response)){
                $sql = "SELECT * FROM chief_complaints WHERE status = 1 AND (is_deleted = 0 || id = $response->cc)";
            }else{
                $sql = "SELECT * FROM chief_complaints WHERE status = 1 AND is_deleted = 0";
            }
            
        }else{
            $sql = "SELECT * FROM chief_complaints WHERE status = 1 AND is_deleted = 0";
        }       

        $ComplaintsData = DB::select(DB::raw($sql));
         if(count($ComplaintsData) > 0){
           foreach ($ComplaintsData as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'id' => $value->id,
                    'name' => $value->name, 
                );
            }
            return response()->json(['data'=>$Response]);
        }else{
            $Response = array();
            return response()->json(['data'=>$Response]);
        }
    }
    
    /**
     * Add QA
     */
    public function addqa(Request $request){

        $validatedData = Validator::make($request->all(), [
            'question' => 'required',
            'chief_complaints' => 'required',
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }

        $input = $request->all();
        $userId = $this->guard()->user()->id;//looged_in user ID
        $input['created_by'] = $userId;
        try {
            DB::table('question_answer_templates')->insert($input);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

    /** Get QA by QA ID for edit records*/
    public function getQAById(Request $request){
        $response = DB::table('question_answer_templates')->where('id', $request->id)->where('is_deleted', 0)->first();
        if(!empty($response) > 0){
            return response()->json(['status' => true, 'data'=> $response]);
        }else{
            return response()->json(['status' => false, 'error'=> "This record not found."]);
        }
    }
    
    /**
     * Update a QA
     * @param  Request $request
     * @return [type]
     */
    public function questionansupdate(Request $request, $id){
        $validatedData = Validator::make($request->all(), [
            'question' => 'required',
            'chief_complaints' => 'required'
        ]);

        if($validatedData->fails()){
            return response()->json(['status' => false, 'error'=> $validatedData->errors()->all()],400);
        }

        try {
            $requestData = $request->all();
            $requestData['questions_list'] = (!empty($requestData['questions_list']))? implode(',', $requestData['questions_list']) : NULL;
            DB::table('question_answer_templates')->where('id', $id)->update($requestData);
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }
    /**
     * Delete QAs
     * @param  Request $request
     * @return [type]
     */
    public function deleteQA(Request $request){        
        try {
            DB::table('question_answer_templates')->whereIn('id', $request->all())->update(array('is_deleted' => 1));
            return response()->json(['status' => true]);
        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }
    }

     /**This function is for to get case details from patient case listing page */
     public function getCaseDetails(Request $request){
        // return response()->json(['status' => true, 'data'=> '12']);
        $reqData = $request->all();
        // $reqData['guidCaseId'] = 160;
        $casePhotos = array();
        $listCaseRx = array();
        $listCurrentMedicine = array();
        $listDrugAllergies = array();
        $listFamilyMedicalHistory = array();
        $listMedicalHistory = array();
        $patientQuestionAnswer = array();
        $physician = array();
        
        /**
         * Get case details
         *  */
        $caseSql = "SELECT CS.*, CCS.name as cname, CONCAT(USR.fname,' ',IFNULL(USR.mname, ''),' ',USR.lname ) as careGiverName
                        FROM cases CS 
                            LEFT JOIN chief_complaints CCS ON CS.complaint_id = CCS.id 
                            LEFT JOIN users USR ON CS.care_giver_id = USR.id 
                            WHERE CS.is_case_deleted = 0 AND CS.id = " . $reqData['guidCaseId'];

        $getCases = DB::select(DB::raw( $caseSql )); 

        if(!empty($getCases)){
            $singleCase = $getCases[0];

            /**
             * Get uploaded photos details for case 
             * */
            if(is_null($singleCase->photos_ids) || empty($singleCase->photos_ids)){
                $getPhotos = array();
            }else{
                $imgFldrURL = url('/storage/cases_images');
                $photo_idss = trim($singleCase->photos_ids,',');
                $photoSql = "SELECT '__type' as Photo, 'Image' as strTitle, CONCAT('$imgFldrURL','/',img_name) as strUrl
                                FROM case_photos WHERE id IN($photo_idss)";
                $getPhotos = DB::select(DB::raw( $photoSql )); // list of all photos
            }
            
            /** 
             * Get Referral code
             */
            if(is_null($singleCase->refferal_code_id)){
                $referral_code_name = '';
            }else{
                $ref_result = DB::table('refferal_codes')->where('id', $singleCase->refferal_code_id)->first();
                if(isset($ref_result) && isset($ref_result->referral_code)){
                    $referral_code_name = $ref_result->referral_code;
                } else {
                    $referral_code_name = "";
                }
            }
            // dd('1686');
            
            /**
             * Get Transaction details
             */
            
            $getTransaction = DB::table('transactions')->where('case_id', $singleCase->id)->first();
            //dd($getTransaction);
            /**Get Body part details for case */
            if(is_null($singleCase->affected_area_list)){
                $getBodyParts = null;
            }else{                
                $bodyPartSql = "SELECT GROUP_CONCAT(name) as bodyParts FROM body_areas WHERE id IN($singleCase->affected_area_list)";

                $getBodyParts = DB::select(DB::raw( $bodyPartSql )); // list of all photos

                if(isset($getBodyParts[0])){
                    $getBodyParts = $getBodyParts[0]->bodyParts;
                } else {
                    $getBodyParts = "";
                }                
            }

            $casePhotos = array("__type" => "CasePhotos", "listPhotos" => $getPhotos, "strBodyMapList" => $getBodyParts, "strErrorMessage" => null);
            

            /**
             * Get data for Current Medicine
             */
            if(is_null($singleCase->patient_current_medication_id)){
                $listCurrentMedicine = array();
            }else{
                $curMedSql = "SELECT GROUP_CONCAT(name) as strName FROM patient_current_medication WHERE id IN($singleCase->patient_current_medication_id)";
                $listCurrentMedicine = DB::select(DB::raw($curMedSql));
                $listCurrentMedicine = (!empty($listCurrentMedicine))? $listCurrentMedicine[0]->strName : $listCurrentMedicine;
            }

            /**
             * Get data for patient_drug_allergies
             */
            if(is_null($singleCase->patient_drug_allergies_id)){
                $listDrugAllergies = array();
            }else{
                $drgMedSql = "SELECT GROUP_CONCAT(name) as strName FROM patient_drug_allergies WHERE id IN($singleCase->patient_drug_allergies_id)";
                $listDrugAllergies = DB::select(DB::raw($drgMedSql));
                $listDrugAllergies = (!empty($listDrugAllergies))? $listDrugAllergies[0]->strName : $listDrugAllergies;
            }

            /**
             * Get data for FamilyMedicalHistory
             */
            if(is_null($singleCase->family_medical_history_id)){
                $listFamilyMedicalHistory = array();
            }else{
                $FamMedSql = "SELECT GROUP_CONCAT(name) as strName FROM family_medical_history WHERE id IN($singleCase->family_medical_history_id)";
                $listFamilyMedicalHistory = DB::select(DB::raw($FamMedSql));
                $listFamilyMedicalHistory = (!empty($listFamilyMedicalHistory))? $listFamilyMedicalHistory[0]->strName : $listFamilyMedicalHistory;

            }
            
            /**
             * Get data for MedicalHistory
             */
            if(is_null($singleCase->patient_medical_history_id)){
                $listMedicalHistory = array();
            }else{
                $OnlyMedSql = "SELECT GROUP_CONCAT(name) as strName FROM patient_medical_history WHERE id IN($singleCase->patient_medical_history_id)";
                $listMedicalHistory = DB::select(DB::raw($OnlyMedSql));
                $listMedicalHistory = (!empty($listMedicalHistory))? $listMedicalHistory[0]->strName : $listMedicalHistory;
            }
            
            /**
             * Get data for CaseRx
             */
            if(is_null($singleCase->prescriptions_ids)){
                $listCaseRx = '';
            }else{
                $presData = "SELECT GROUP_CONCAT(id) as ids FROM prescriptions WHERE case_id = $singleCase->id";                                
                $listCaseRx = DB::select(DB::raw($presData));
                if(isset($listCaseRx[0])){
                    $listCaseRx = $listCaseRx[0]->ids;
                } else {
                    $listCaseRx = "";
                }                
            }


            /**
             * Get Physician details for case
             */            
            if(is_null($singleCase->provider_id)){
                $physician = array();
            }else{
                $sql = "SELECT 
                                USR.id as guidPhysicianId,
                                'false' as isFavourite,
                                DM.street1 as strAddress1,
                                DM.street2 as strAddress2,
                                DM.street3 as strAddress3,
                                DM.city as strCity,
                                USR.consult_fee as strCost,
                                USR.degrees as strDegree,
                                USR.email as strEmail,
                                USR.fname as strFirstName,
                                USR.lname as strLastName,
                                DM.practice_name as strHospital,
                                null as strMobilePhone,
                                USR.phone as strPhone,
                                null as strName,
                                DM.postal_code as strPostalCode,
                                null as strSkills,
                                GROUP_CONCAT(SP.name) as strSpecialty,
                                USR.Title as strTitle,
                                ST.code as strState
                            FROM users USR                        
                                LEFT JOIN derm_address DM ON USR.id = DM.user_id
                                LEFT JOIN us_state ST ON DM.state = ST.id
                                RIGHT JOIN specilities SP ON (FIND_IN_SET(SP.id, USR.speciality) != false) 
                            WHERE USR.id = $singleCase->provider_id";

                $physician = DB::select(DB::raw($sql));
                if(!empty($physician)){
                    $physician = $physician[0];
                }else{
                    $physician = array();
                }
            }

            /**
             * Get data for Patient Question Answer
             */
            $listOfQuestions = array();
            
            $getQuesData = $this->getQuestionAnswer($reqData['guidCaseId']);            

            /**Get All que ans list */
            $CaseQuesANswers = array();
            if(!empty($getQuesData)){
                foreach ($getQuesData as $key => $value) {
                    if(!isset($value['pregnantTemplate'])){
                        if(count($value['listOptions']) > 0){
                            $answerList = array();
                            foreach ($value['listOptions'] as $key1 => $value1) {
                                $answerList[] = $value1['strOptionName'];
                            }
                            $answerList = implode(',', $answerList);
                        }
                        $CaseQuesANswers[] = array('key' => $key,'question' => $value['strQuestionName'],'answers' => $answerList );
                    }
                }
            }
            
            /**Relation type*/
            $getRelationName = DB::table('patient_caregiver_relation')->where('id', $singleCase->patient_caregiver_relation)->select('relation_name as name')->get();            
            $getRelationName = $getRelationName[0]->name;

            /**Care giver details */
            $getCareGiver = DB::table('users')->where('id', $singleCase->care_giver_id)->select('fname','lname')->get();
            
            $strFullName = $singleCase->patient_lname . ', ' . $singleCase->patient_fname;
            $strFullName .=  (is_null($singleCase->patient_mname))? ' ' : $singleCase->patient_mname;
            
            $createdDate = date('m/d/Y', strtotime($singleCase->created_datetime));
            
            /**Pregnant Staus */
            $pregnantStatusValue = array();
            if(isset($singleCase->pregnant_status) && !is_null($singleCase->pregnant_status)){
                if($singleCase->pregnant_status != ""){
                    $pregSql = "SELECT  question_answer FROM question_choices WHERE id = " . $singleCase->pregnant_status;
                    $resultPreg = DB::select(DB::raw($pregSql));
                    if(!empty($resultPreg)){
                        $val = $resultPreg[0]->question_answer;
                        if(strtolower($val) == 'no'){
                            $pregnantStatusValue = array("key" => "Is the patient pregnant, trying to become pregnant, or nursing?", "value" => $val);
                        }else{
                            $pregnantStatusValue = array("key" => "Patient is", "value" => $val);
                        }
                    }
                }
            }

            /**Get Patient Case images */
            $getCasePhotos = array();
            if(!is_null($singleCase->photos_ids) && !empty($singleCase->photos_ids)){
                $imgFldrURL = url('/storage/cases_images/');
                $photo_idss = trim($singleCase->photos_ids,',');
                $photoSql = "SELECT id, img_name as imagename, CONCAT('$imgFldrURL','/',img_name) as strUrl FROM case_photos WHERE id IN($photo_idss)";
                $getCasePhotos = DB::select(DB::raw( $photoSql )); // list of all photos
            }

            /**Patient Details array */
            $patientDetailsAr = array(
                "__type" => "PatientDetails",
				"guidAccountId" => "1",
				"insurance" => null,
                "intGender" => !empty($singleCase->patient_gender)?$singleCase->patient_gender:'',
                "gender" => !empty($singleCase->patient_gender)?($singleCase->patient_gender > 0)? 'Female' : 'Male':'',
                "consult_in" => (!empty($createdDate)&&!empty($strFullName)&&!empty($getRelationName))?$createdDate. ' by ' . $strFullName . "($getRelationName)":'',
				"intRelationToCareGiverId"=> !empty($singleCase->patient_caregiver_relation)?$singleCase->patient_caregiver_relation:'',
                "isCareGiver"=> false,
                "listCurrentMedicine" => !empty($listCurrentMedicine)?$listCurrentMedicine:'',
                "listDrugAllergies" => !empty($listDrugAllergies)?$listDrugAllergies:'',  
                "listFamilyMedicalHistory" => !empty($listFamilyMedicalHistory)?$listFamilyMedicalHistory:'',  
                "listMedicalHistory" => !empty($listMedicalHistory)?$listMedicalHistory:'', 
				"listPharmacies"=> [],
				"strAddress"=> null,
				"strCareGiverFullName"=> (isset($getCareGiver[0]) &&  !empty($getCareGiver[0]->lname)?$getCareGiver[0]->lname:''.', '.isset($getCareGiver[0]) && !empty($getCareGiver[0]->fname)?$getCareGiver[0]->fname:''),
				"strCity"=> null,
				"strCountry"=> null,
				"strDateOfBirth"=> !empty($singleCase->patient_dob)?date('m/d/Y', strtotime($singleCase->patient_dob)):'',
				"strEmail"=> !empty($singleCase->patient_email)?$singleCase->patient_email:'',
				"strFirstName"=> !empty($singleCase->patient_fname)?$singleCase->patient_fname:'',
				"strLastName"=> !empty($singleCase->patient_lname)?$singleCase->patient_lname:'',
				"strMiddleName"=> !empty($singleCase->patient_mname)?$singleCase->patient_mname:'',
				"strPatientName"=> !empty($strFullName)?$strFullName:'',
				"strPhone"=> !empty($singleCase->patient_phone)?$singleCase->patient_phone:'',
                "strPostalCode"=> null,
                "pregnantStatusValue" => !empty($pregnantStatusValue)?$pregnantStatusValue:'',
				"strRelationWithCareGiver"=> !empty($getRelationName)?$getRelationName:'',
				"strState"=> null,
				"strStreet"=> null
            );

             /**
             * New data
             */
            $patientQuestionAnswer = array(
                '__type' => 'PatientQuestionAnswer',
                'listQuestions' => $getQuesData,
                'patientDetails' => $patientDetailsAr,
                'payment' => array(),//pending
                'strBodyMapList' => $getBodyParts,
                'strCaseDate' => date('m/d/Y', strtotime($singleCase->created_datetime)),
                'strChiefComplaint' => $singleCase->cname,
                'CaseQuesANswers' => $CaseQuesANswers,
                'strErrorMessage' => null
            );

            /**
             * Final Data array
             */

            $caseDetails = array(
                "__type" => "CaseDetails",
                "casePhotos" => $casePhotos,
                "guidPatientId" => "1", //will store this ID static
                "case_number" => $singleCase->case_number,
                "case_id" => $singleCase->id,
                "intConsultingCost" => $singleCase->consult_cost,
                'diagnosis' => $singleCase->follow_up,
                'getCasePhotos' => $getCasePhotos,
                "listCaseDx" => array(),
                "listCaseRx" => $listCaseRx, 
                "listCurrentMedicine" => $listCurrentMedicine, 
                "listDrugAllergies" => $listDrugAllergies, 
                "listFamilyMedicalHistory" => $listFamilyMedicalHistory, 
                "listMedicalHistory" => $listMedicalHistory, 
                "patientQuestionAnswer" => $patientQuestionAnswer, //pending
                "physician" => $physician,
                "strCareGiverFullName" => $singleCase->careGiverName,
                "strCaseCloseDate" => (!is_null($singleCase->case_close_date)? date('m/d/Y', strtotime($singleCase->case_close_date)) : NULL),
                "strCaseDate" => date('m/d/Y', strtotime($singleCase->created_datetime)),
                "strCaseStatus" => $singleCase->status,
                "strChiefComplaint" => $singleCase->cname,
                "strCouponCode" => null, //pending from referral code table
                "strErrorMessage" => null,
                "strPatientDOB" => date('m/d/Y', strtotime($singleCase->patient_dob)),
                "strPatientInstructions" => $singleCase->follow_up,
                "strPharmacy" => null,
                "strReferralCode" => $referral_code_name, //pending from referral code table                
                "card" => (!is_null($getTransaction->strCreditCardNumber))? $getTransaction->strCreditCardNumber : null,
                "authcode" => (!is_null($getTransaction->strAuthorizationCode))? $getTransaction->strAuthorizationCode : null,
                "paidon" => (!is_null($getTransaction->created_at))? date('m/d/Y H:i A', strtotime($getTransaction->created_at)) : null,
            );
            return response()->json(['status' => true, 'data'=> $caseDetails]);
        }else{
            return response()->json(['status'=>false, 'error'=> 'No case found']);
        }        
    }

    /**
     * This function is for prepare data for Question's answers
     */
    public function getQuestionAnswer($reqParam = NULL){
        $getQueAns = array();
        $getQueAns2 = array();
        $finalData = array();

        if(!is_null($reqParam)){
            $getCaseAnswersData = "SELECT  ANS.*, QS.question as queName FROM answers_of_questions ANS 
                                            LEFT JOIN questions	QS ON ANS.que_id = QS.id
                                        WHERE case_id = $reqParam";
            $result = DB::select(DB::raw($getCaseAnswersData));
            
            $getCase = "SELECT * FROM cases WHERE id = $reqParam";
            $caseData = DB::select(DB::raw($getCase));
            
            if(!empty($caseData)){         
                /**
                 * Get data for - How long have you had this issue?
                 */
                if($caseData[0]->time_of_issue1 > 0){
                    $labelForthisq1 = $caseData[0]->time_of_issue1.' '.$caseData[0]->time_of_issue2;
                    $getQueAns[] = array(
                        "__type" => "Question",
                        "guidQuestionId" => null,
                        "listOptions" => array(array("__type" => "QuestionOption", "guidOptionId" => null, "strOptionName" => $labelForthisq1)),
                        "strQuestionName" => "How long have you had this issue?",
                        "strQuestionType" => null
                    );
                }

                /**
                 * Get data for - Please describe your problem. (Select one or more)
                 */
                if(!empty($caseData[0]->type_of_problem1)){
                    $getCaseAnswersData = "SELECT  GROUP_CONCAT(name) as probNames FROM type_of_problem WHERE id IN(" . $caseData[0]->type_of_problem1 . ")";
                    
                    $resultProbs = DB::select(DB::raw($getCaseAnswersData));
                    if(!empty($resultProbs)){
                        $prbLabel = $resultProbs[0]->probNames . ' '.  ( (is_null($caseData[0]->type_of_problem1)? '' : $caseData[0]->type_of_problem1) );
                        $getQueAns[] = array(
                            "__type" => "Question",
                            "guidQuestionId" => null,
                            "listOptions" => array(array("__type" => "QuestionOption", "guidOptionId" => null, "strOptionName" => $prbLabel)),
                            "strQuestionName" => "Please describe your problem. (Select one or more)",
                            "strQuestionType" => null
                        );
                    }                    
                }

                /**
                 * Get data for - Has this condition been biopsied or excised before?
                 */
                
                $getQueAns[] = array(
                    "__type" => "Question",
                    "guidQuestionId" => null,
                    "listOptions" => array(array("__type" => "QuestionOption", "guidOptionId" => null, "strOptionName" => ($caseData[0]->biopsied_or_excised > 0)? 'Yes' : 'No')),
                    "strQuestionName" => "Has this condition been biopsied or excised before?",
                    "strQuestionType" => null
                );
                
                /**
                 * Get data for - Pregnancy Template answer
                 */
                if(!is_null($caseData[0]->pregnant_status)){
                    $pregnancySql = "SELECT  question_answer FROM question_choices WHERE id = " . $caseData[0]->pregnant_status;
                    
                    $resultPregnancy = DB::select(DB::raw($pregnancySql));
                    
                    if(!empty($resultPregnancy)){
                        $getQueAns[] = array(
                            "__type" => "Question",
                            "guidQuestionId" => null,
                            "listOptions" => array(array("__type" => "QuestionOption", "guidOptionId" => null, "strOptionName" => $resultPregnancy[0]->question_answer)),
                            "strQuestionName" => "Is the patient pregnant, trying to become pregnant, or nursing?",
                            "pregnantTemplate" => true,
                            "strQuestionType" => null
                        );
                    }                    
                }
            }

            if(!empty($result)){
                foreach ($result as $key => $value) {
                    $getQueAns2[$key] = array(
                        "__type" => "Question",
                        "guidQuestionId" => $value->que_id,
                        "listOptions" => array(),
                        "strQuestionName" => $value->queName,
                        "strQuestionType" => null
                    );

                    if($value->question_type == 'Text Area'){
                        $getQueAns2[$key]['listOptions'] = array(array("__type" => "QuestionOption", "guidOptionId" => null, "strOptionName" => $value->que_answers));
                    }else{
                        $listOfQueChoices = explode(',',$value->que_answers);
                        foreach ($listOfQueChoices as $key1 => $value1) {
                            
                            $getQueChoiceData = DB::table('question_choices')->where('id', $value1)->select('question_answer')->get(); 
                            if(!empty($getQueChoiceData)){
                                $resData = $getQueChoiceData[0]->question_answer;
                            }else{
                                $resData = null;
                            }

                            $getQueAns2[$key]['listOptions'][$key1] = array("__type" => "QuestionOption", "guidOptionId" => $value1, "strOptionName" => $resData);
                        }
                    }   
                }
            }
            
            $finalData = array_merge($getQueAns, $getQueAns2);
            
        }

        return $finalData;
    }
    
    /**
     * This function is update case details
     */
    public function updateCaseData(Request $request)
    {
        error_reporting(E_ALL);
        $reqParam = $request->all();
        $sqlUpdate = array();
        $message = '';
        $user = Auth::user();
       
        $EmailContent = DB::table('email_template')->where(array('email_type' => 4) )->select('content')->get();

        switch ($reqParam['type']) {
            case 'delete':                                
                $sqlUpdate = array('is_case_deleted' => 1, 'case_close_date' => date('Y-m-d'),'submitted_by' => $user->id);
                $message = 'Case Deleted successfully';
                break;
            
            case 'resolve':
                $sqlUpdate = array('status' => 2, 'case_close_date' => date('Y-m-d'),'submitted_by' => $user->id);
                $message = 'Case Resolved successfully';
                $EmailContent = DB::table('email_template')->where(array('email_type' => 4) )->select('content')->get();
                break;
            
            case 'cancel':
                $sqlUpdate = array('status' => 3, 'case_close_date' => date('Y-m-d'),'submitted_by' => $user->id);
                $message = 'Case Cancelled successfully';
                $EmailContent = DB::table('email_template')->where(array('email_type' => 5) )->select('content')->get();
                break;
            
            default:
                # code...
                break;
        }

        try {            
          
            /**Email Template for Case Resolved and Cancel */
            
            $getCase = DB::table('cases')->where(array('id' => $reqParam['caseid']) )->get();
            $care_giverEmail = DB::table('users')->where(array('id' => $getCase[0]->care_giver_id) )->get();
            // $care_giverEmail = $care_giverEmail[0]->email;
            $care_giverEmail = isset($care_giverEmail[0]->email) ? $care_giverEmail[0]->email : "";
           
            $doctorName = '';
            $patientName = '';
            $patientDOB = '';
            $case_number = '';

            if(count($getCase) > 0){                
                $doctorDetails = DB::table('users')->where(array('id' => $getCase[0]->provider_id) )->get();

                $doctorName = $doctorDetails[0]->fname.' '.$doctorDetails[0]->lname;
                $patientName = $getCase[0]->patient_fname.' ' . $getCase[0]->patient_lname;
                $patientDOB = date('m/d/Y', strtotime($getCase[0]->patient_dob));
                $case_number = $getCase[0]->case_number;
            }

            if(isset($EmailContent[0])){                 
                $EmailContentValue =  $EmailContent[0]->content;
                $search = array('{{doctor}}','{{case_number}}','{{patient}}','{{patient_dob}}',"\n");
                // echo "search"; dd($search);
                $replace = array( $doctorName, $case_number, $patientName, $patientDOB, '<br />');

                $EmailContentValue = str_replace($search, $replace, $EmailContentValue);

            }else{
                $EmailContentValue = "Case has been Resolved.";
            }

            $EmailContentValue .= "<br /> <br /> --- <br />For login click on this link <a href='" . $this->clientUrl . "'> Login</a>";
            
           
            if($reqParam['type']=='resolve')
            {
                if($care_giverEmail != ""){
                    Mail::to($care_giverEmail)->cc(['vimal.raval@techextensor.com'])->send(new AddcaseMail(array('content' => $EmailContentValue, 'subject' => 'Case has been Resolved'))); 
                } 
            }

            /**END- Template */

            $ids = $reqParam['caseid'];
            $ids = (gettype($ids) == 'integer')? array($ids) : $ids;
            
            DB::table('cases')->whereIn('id', $ids)->update($sqlUpdate);

            return response()->json(['status' => true, 'message' => $message]);

        } catch (Exception $e) {
            return response()->json(['status'=>false, 'error'=> $e]);
        }        
    }   

    /**Transaction Module */
    public function transactionQuery($id = NULL){
        $where = "";
        if(!is_null($id)){
            $where = " WHERE TRN.id = $id ";
        }
        $sql = "SELECT TRN.strCreditCardNumber, TRN.strBillingZipCode, TRN.strBillingCity, TRN.strBillingFirstName, TRN.strBillingLastName, TRN.strPaymentDescription, TRN.intCreditCardType,TRN.id, TRN.strTransId, TRN.created_at, TRN.consult_cost, TRN.case_id, USR.fname, USR.mname, USR.lname, USR.email,  CS.is_case_deleted, CS.status as csStatus, CS.case_number, CS.patient_fname, CS.created_datetime,CS.patient_fname, CS.patient_mname, CS.patient_lname, PRVDR.fname as pFname,PRVDR.mname as pMname, PRVDR.lname as pLname, ST.name as stateName, CC.name as cheifName FROM transactions TRN LEFT JOIN users USR ON TRN.caregiver_id = USR.id LEFT JOIN cases CS ON TRN.case_id = CS.id LEFT JOIN users PRVDR ON TRN.provider_id = PRVDR.id 
        LEFT JOIN us_state ST ON TRN.strBillingState = ST.id 
        LEFT JOIN chief_complaints CC ON CS.complaint_id = CC.id $where ORDER BY TRN.created_at DESC";    
        return DB::select(DB::raw($sql));
    }

    public function getTransactionlist(Request $request){        
        $reqParam = $request->all();    
        
        $list = $this->transactionQuery();

        if(count($list) > 0){
            foreach ($list as $key => $value) {
                $Response[] = array(
                    'key' => $value->id,
                    'id' => $value->id,
                    'strTransId' => (!is_null($value->strTransId))? $value->strTransId : '',
                    'amount' => number_format((float)$value->consult_cost, 2, '.', ''),                   
                    'title' => $value->patient_fname." - $value->cheifName - ".date('l, F, d, Y', strtotime($value->created_datetime)), //Friday, January 04, 2019
                    'care_giver_name' => $value->fname." ".$value->mname." ".$value->lname, 
                    'csStatus' => ($value->is_case_deleted)? "Deleted" : $value->csStatus, 
                    'email' => $value->email, 
                    'caseView' => "/dashboard/skincase/". $value->case_id, 
                    'paymentMadeOn' => date('m/d/Y h:i A',strtotime($value->created_at)), 
                    'practitioner' => $value->pFname.' '.$value->pMname.' '.$value->pLname,
                    'actions' => ""
                );
            }
            return response()->json(['data' => $Response]);
        }else{
            return response()->json(['data'=> array()]);
        }
    }

    /** Get Referral ID for edit records*/
    public function getTransactionById(Request $request){
        $list = $this->transactionQuery($request->id);
        $response = array();
        foreach ($list as $key => $value) {
            $response[] = array(
                'key' => $value->id,
                'id' => $value->id,
                'case_number' => $value->case_number,
                'strTransId' => (!is_null($value->strTransId))? $value->strTransId : '-',
                'amount' => '$'. number_format((float)$value->consult_cost, 2, '.', ''),     
                'title' => $value->patient_fname.' - Growth - '.date('l, F, d, Y', strtotime($value->created_datetime)), //Friday, January 04, 2019
                'care_giver_name' => $value->fname." ".$value->mname." ".$value->lname, 
                'csStatus' => ($value->is_case_deleted)? "Deleted" : $value->csStatus, 
                'email' => $value->email, 
                'strCreditCardNumber' => $value->strCreditCardNumber,
                'intCreditCardType' => $value->intCreditCardType,
                'strPaymentDescription' => $value->strPaymentDescription,
                'strBillingFirstName' => $value->strBillingFirstName,
                'strBillingLastName' => $value->strBillingLastName,
                'strBillingCity' => $value->strBillingCity,
                'stateName' => $value->stateName,
                'strBillingZipCode' => $value->strBillingZipCode,
                'caseView' => "/dashboard/skincase/". $value->case_id, 
                'paymentMadeOn' => date('m/d/Y h:i A',strtotime($value->created_at)), 
                'practitioner' => $value->pFname.' '.$value->pMname.' '.$value->pLname,
                'patientName' => $value->patient_fname.' '. $value->patient_mname.' '.$value->patient_lname
                
            );
        }
        return response()->json(['status' => true, 'data'=> $response[0]]);
    }
    
}
