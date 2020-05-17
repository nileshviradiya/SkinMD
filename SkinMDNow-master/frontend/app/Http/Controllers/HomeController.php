<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Illuminate\Http\Request;

use Illuminate\Routing\Controller;

use net\authorize\api\contract\v1 as AnetAPI;
use net\authorize\api\controller as AnetController;

use App\VerifyUser;
use App\Mail\VerifyMail;
use App\Mail\ResetPasswordMail;
use App\Mail\AddcaseMail;
use Mail;
use Validator;



class HomeController extends Controller
{
    use SendsPasswordResetEmails;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request)
    {
        // $uri = $request->path();
        // echo $uri;
        // die;
        // dd($request->headers->headers);
        // die;
        //$this->middleware('auth', ['except' => ['addAccount','forgotPassword']]);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $user = Auth::user();
        // dd($user);
        // die;
        if($user==null)
        {
            $getComplaints = DB::table('chief_complaints') ->orderBy('display_order', 'ASC')->orderBy('name','ASC')->get();// Get all complaint data here
           
            $us_state = DB::table('us_state')->get(); //Get all state data here
           
            $specilities = DB::table('specilities')->get(); //Get all specilities data here
            
            //$currentUser = array('id' => $user->id, 'username' => $user->username, 'fname' => $user->fname, 'mname' => $user->mname, 'lname' => $user->lname, 'gender' => (($user->gender > 0)? 'Female' : 'Male'),'dob' => date('m/d/Y', strtotime($user->dob)), 'phone' => $user->phone, 'email' => $user->email);
            
            //$caseCount = DB::table('cases')->where('care_giver_id', $user->id)->count();
            
            $relation = DB::table('patient_caregiver_relation')->get(); //Get all patient_caregiver_relation data here

            //$getAllPatient = DB::table('patient_details')->where('caregiver_id', $user->id)->get(); //Get all patients data here
           
            //$getFavDoctorList = DB::table('cases')->where('care_giver_id', $user->id)->get(); //Get all patients data here

            //$docSql = "SELECT US.id as id, US.Title as title, US.fname as fname, US.lname as lname, US.consult_fee as consult_fee, '' as state, degrees as degree FROM cases CS LEFT JOIN users US ON CS.provider_id = US.id WHERE CS.care_giver_id = $user->id GROUP BY id";

            //$FavDoctors = DB::select(DB::raw( $docSql ));     
                
            // $strListPatientCareGiverRelation = array();
            // if(count($relation) > 0){
            //     foreach ($relation as $key => $value) {
            //         $strListPatientCareGiverRelation[] = array('intRelationToCareGiverId' => $value->id, 'strRelationToCareGiverLabel' => $value->relation_name, '__type' => 'PatientCareGiverRelation');
            //     }
            // }
            
            // $fullName = $user->fname . ((!empty($user->mname))? $user->mname : '') . $user->lname;
            
            /**Get all list of patients */
            //$ListOfpatients = $this->prepareDataForPatient($getAllPatient);        

            
            // $strFavDocList = "";
            // if(count($FavDoctors) > 0){
            //     foreach ($FavDoctors as $key => $value) {
            //         $strFavDocList .= $value->id . '~' . $value->title . ' ' . $value->fname . ' ' . $value->lname . '~' . $value->consult_fee . '~' . $value->state . '~' . $value->degree.'|';
            //     }
            // }
            
            $questionTemplate = $this->getPragnantTemplate(); //Get all list of Pregnancy template
            
            //$caseSql = "SELECT CS.*, CCS.name as cname FROM cases CS LEFT JOIN chief_complaints CCS ON CS.complaint_id = CCS.id WHERE CS.care_giver_id = $user->id GROUP BY CS.id order by CS.created_datetime desc";
            
            
            //$getCases = DB::select(DB::raw( $caseSql )); 
            
            // $strExistingCasesList = array();
            // if(!empty($getCases)){
            //     foreach ($getCases as $key => $value) {
            //         $strExistingCasesList[] = $value->id .'~'. $value->case_number .'~'. $value->patient_fname .'~'. (!empty($value->patient_mname)? $value->patient_mname : '') .'~'. $value->patient_lname .'~'.  date('m/d/Y', strtotime($value->patient_dob)) .'~'. (($value->patient_gender > 0)? 'Female' : 'Male') .'~'. $value->cname .'~'. date('m/d/Y H:i A', strtotime($value->created_datetime)) .'~'. (($value->status == 'Active')? 1 : 0) .'~'. $value->care_giver_id;
            //     }
            //     $strExistingCasesList = implode('|', $strExistingCasesList);
            // }
            
            $loginResponse = array(
                //'guidCareGiverId' => $user->id,
                //'intGender' => $user->gender,
                'intMaxAge' => 0,
                'intMinAge' => 0,
                //'intNumberOfRequests' => $caseCount,
                //'listPatientCareGiverRelation' => $strListPatientCareGiverRelation,
                //'listPatients' => $ListOfpatients, 
                'questionTemplate' => (!empty($questionTemplate))? $questionTemplate[0] : [],
                'strAppFeatures' => "1~Announcement",
                //'strCareGiverFirstName' => $user->fname,
                //'strCareGiverLastName' => $user->lname,
                //'strCareGiverMiddleName' => $user->mname,            
                //'strDateOfBirth' => date('m/d/Y', strtotime($user->dob)),
                //'strCareGiverFullName' => $fullName,
                //'strExistingCasesList' => $strExistingCasesList,   
                //'strFavDocList' => $strFavDocList,            
                "strErrorMessage" => "",
                //"strCareGiverPhone" => $user->phone
            );
     
        
            return view('home')->with(
                array(
                        'chief_complaints' => $getComplaints, 
                        'state' => $us_state, 
                        'specilities' => $specilities,
                        'relation' => $relation,
                        //'currentUser' => $currentUser,
                        'loginResponse' => $loginResponse
                    )
                );
        }   
        else {
            $getComplaints = DB::table('chief_complaints') ->orderBy('display_order', 'ASC')->orderBy('name','ASC')->get();// Get all complaint data here
            
            $us_state = DB::table('us_state')->get(); //Get all state data here
            
            $specilities = DB::table('specilities')->get(); //Get all specilities data here
            
            $currentUser = array('id' => $user->id, 'username' => $user->username, 'fname' => $user->fname, 'mname' => $user->mname, 'lname' => $user->lname, 'gender' => (($user->gender > 0)? 'Female' : 'Male'),'dob' => date('m/d/Y', strtotime($user->dob)), 'phone' => $user->phone, 'email' => $user->email);
            
            $caseCount = DB::table('cases')->where('care_giver_id', $user->id)->count();
            
            $relation = DB::table('patient_caregiver_relation')->get(); //Get all patient_caregiver_relation data here

            $getAllPatient = DB::table('patient_details')->where('caregiver_id', $user->id)->get(); //Get all patients data here
            
            $getFavDoctorList = DB::table('cases')->where('care_giver_id', $user->id)->get(); //Get all patients data here

            $docSql = "SELECT US.id as id, US.Title as title, US.fname as fname, US.lname as lname, US.consult_fee as consult_fee, '' as state, degrees as degree FROM cases CS LEFT JOIN users US ON CS.provider_id = US.id WHERE CS.care_giver_id = $user->id GROUP BY id";

            $FavDoctors = DB::select(DB::raw( $docSql ));     
                
            $strListPatientCareGiverRelation = array();
            if(count($relation) > 0){
                foreach ($relation as $key => $value) {
                    $strListPatientCareGiverRelation[] = array('intRelationToCareGiverId' => $value->id, 'strRelationToCareGiverLabel' => $value->relation_name, '__type' => 'PatientCareGiverRelation');
                }
            }

            $fullName = $user->fname . ((!empty($user->mname))? $user->mname : '') . $user->lname;

            /**Get all list of patients */
            $ListOfpatients = $this->prepareDataForPatient($getAllPatient);        

            /**
             * Get List of Fav. doctors
             */
            $strFavDocList = "";
            if(count($FavDoctors) > 0){
                foreach ($FavDoctors as $key => $value) {
                    $strFavDocList .= $value->id . '~' . $value->title . ' ' . $value->fname . ' ' . $value->lname . '~' . $value->consult_fee . '~' . $value->state . '~' . $value->degree.'|';
                }
            }
            
            $questionTemplate = $this->getPragnantTemplate(); //Get all list of Pregnancy template

            $caseSql = "SELECT CS.*, CCS.name as cname FROM cases CS LEFT JOIN chief_complaints CCS ON CS.complaint_id = CCS.id WHERE CS.care_giver_id = $user->id GROUP BY CS.id order by CS.created_datetime desc";

            $getCases = DB::select(DB::raw( $caseSql )); 

            $strExistingCasesList = array();
            if(!empty($getCases)){
                foreach ($getCases as $key => $value) {
                    $strExistingCasesList[] = $value->id .'~'. $value->case_number .'~'. $value->patient_fname .'~'. (!empty($value->patient_mname)? $value->patient_mname : '') .'~'. $value->patient_lname .'~'.  date('m/d/Y', strtotime($value->patient_dob)) .'~'. (($value->patient_gender > 0)? 'Female' : 'Male') .'~'. $value->cname .'~'. date('m/d/Y H:i A', strtotime($value->created_datetime)) .'~'. (($value->status == 'Active')? 1 : 0) .'~'. $value->care_giver_id;
                }
                $strExistingCasesList = implode('|', $strExistingCasesList);
            }
            
            $loginResponse = array(
                'guidCareGiverId' => $user->id,
                'intGender' => $user->gender,
                'intMaxAge' => 0,
                'intMinAge' => 0,
                'intNumberOfRequests' => $caseCount,
                'listPatientCareGiverRelation' => $strListPatientCareGiverRelation,
                'listPatients' => $ListOfpatients, 
                'questionTemplate' => (!empty($questionTemplate))? $questionTemplate[0] : [],
                'strAppFeatures' => "1~Announcement",
                'strCareGiverFirstName' => $user->fname,
                'strCareGiverLastName' => $user->lname,
                'strCareGiverMiddleName' => $user->mname,            
                'strDateOfBirth' => date('m/d/Y', strtotime($user->dob)),
                'strCareGiverFullName' => $fullName,
                'strExistingCasesList' => $strExistingCasesList,   
                'strFavDocList' => $strFavDocList,            
                "strErrorMessage" => "",
                "strCareGiverPhone" => $user->phone
            );
        
            
            return view('home')->with(
                    array(
                            'chief_complaints' => $getComplaints, 
                            'state' => $us_state, 
                            'specilities' => $specilities,
                            'relation' => $relation,
                            'currentUser' => $currentUser,
                            'loginResponse' => $loginResponse
                        )
                    );
        }
    }

    public function prepareDataForPatient($getAllPatient = NULL){
        $ListOfpatients = array();             
        if(!is_null($getAllPatient)){   
            if(count($getAllPatient) > 0){            
                $listCurrentMedicine = array();
                $listDrugAllergies = array();
                $listFamilyMedicalHistory = array();
                $listMedicalHistory = array();
                $listPharmacies = array();
                foreach ($getAllPatient as $key => $value) {
                    
                    if(!empty($value->patient_current_medication_id)){
                        $listCurrentMedicine = "SELECT name as strName FROM patient_current_medication WHERE id IN(". trim($value->patient_current_medication_id,',') .")";
                        $listCurrentMedicine = DB::select(DB::raw( $listCurrentMedicine ));
                    }

                    if(!empty($value->patient_drug_allergies_id)){
                        $listDrugAllergies = "SELECT name as strName FROM patient_drug_allergies WHERE id IN(". trim($value->patient_drug_allergies_id,',') .")";
                        $listDrugAllergies = DB::select(DB::raw( $listDrugAllergies ));
                    }

                    if(!empty($value->family_medical_history_id)){
                        $listFamilyMedicalHistory = "SELECT name as strName FROM family_medical_history WHERE id IN(". trim($value->family_medical_history_id,',') .")";
                        $listFamilyMedicalHistory = DB::select(DB::raw( $listFamilyMedicalHistory ));
                    }

                    if(!empty($value->patient_medical_history_id)){
                        $listMedicalHistory = "SELECT name as strName FROM patient_medical_history WHERE id IN(". trim($value->patient_medical_history_id,',') .")";
                        $listMedicalHistory = DB::select(DB::raw( $listMedicalHistory ));
                    }

                    if(!empty($value->patient_pharmacy_id)){
                        $sql = "SELECT * FROM pharmacy WHERE id IN(". trim($value->patient_pharmacy_id,',') .")";
                        $resultData = DB::select(DB::raw( $sql ));

                        if(count($resultData) > 0){
                            foreach ($resultData as $key => $valuePharmacy) {
                                $listPharmacies[] =   array(
                                                            "guidAccountId" => $value->id,
                                                            "strAddress1" => null,
                                                            "strAddress2" => null,
                                                            "strAddress3" => null,
                                                            "strCity" => null,
                                                            "strFirstName" => $valuePharmacy->pharmacy_name,
                                                            "strLastName" => $valuePharmacy->pharmacy_name,
                                                            "strMiddleName" => null,
                                                            "strPharmacyFax" => $valuePharmacy->pharmacy_fax,
                                                            "strPhone" => null,
                                                            "strPostalCode" => null,
                                                            "strState" => null
                                                        );
                        
                            }
                        }
                    }
                    $ListOfpatients[] = array(
                        "guidAccountId" => $value->id,
                        "intGender" => $value->gender,
                        "intRelationToCareGiverId" => $value->relation_id,
                        "isCareGiver" => ($value->relation_id == 1)? true : false,
                        "listCurrentMedicine" => $listCurrentMedicine,
                        "listDrugAllergies" => $listDrugAllergies,
                        "listFamilyMedicalHistory" => $listFamilyMedicalHistory,
                        "listMedicalHistory" => $listMedicalHistory,
                        "listPharmacies" => $listPharmacies,
                        "strAddress" => NULL,
                        "strCareGiverFullName" => NULL,
                        "strCity" => NULL,
                        "strCountry" => NULL,
                        "strDateOfBirth" => date('d M Y', strtotime($value->dob)),
                        "strEmail" => $value->email,
                        "strFirstName" => $value->first_name,
                        "strLastName" => $value->last_name,
                        "strMiddleName" => $value->middle_name,
                        "strPatientName" => NULL,
                        "strPhone" => $value->phone,
                        "strPostalCode" => NULL,
                        "strRelationWithCareGiver" => NULL,
                        "strState" => NULL,
                        "strStreet" => NULL
                    );
                }
            }
        }
        return $ListOfpatients;
    }
    
    public function round_up ( $value, $precision ) { 
        $pow = pow ( 10, $precision ); 
        return ( ceil ( $pow * $value ) + ceil ( $pow * $value - ceil ( $pow * $value ) ) ) / $pow; 
    } 

    public function getPhysicianFee(Request $request){
        $param = $request->all();
        /* doctorBaseFees: "30"
        guidDoctorId: "66"
        strReferralCode: "acne" */
        if(!empty($param)){
            $getFees = DB::table('refferal_codes')->where(array('status' => 1, 'is_deleted' => 0, 'referral_code' => $param['strReferralCode'], 'provider_id' => $param['guidDoctorId']))->count();
            if($getFees > 0){
                $getCode = DB::table('refferal_codes')->where(array('status' => 1, 'is_deleted' => 0, 'referral_code' => $param['strReferralCode'], 'provider_id' => $param['guidDoctorId']))->first();
                if(empty($getCode->comments)){
                    return json_encode(array('listPhysicians' => array(),'strErrorMessage' => "Invalid Referral code."));
                }else{
                    
                    $startVal = substr($getCode->comments, 0,1);
                    $endVal = substr( $getCode->comments,-1);
                    $amount = substr($getCode->comments, 1, -1);

                    $finalAmount = 0;
                    $doctorFees = $param['doctorBaseFees'];

                    if($startVal == "$" &&  $endVal == "$")
                    {
                        if(is_numeric($amount)){
                            $finalAmount = $doctorFees - (float)$amount;
                        }
                    }else if($startVal == "%" &&  $endVal == "%"){
                        if(is_numeric($amount)){
                            $percentage = ($doctorFees * (float)$amount) / 100;
                            $finalAmount = $doctorFees - $percentage;
                        }
                    }else if($startVal == "#" &&  $endVal == "#"){
                        if(is_numeric($amount)){
                            $finalAmount = $amount;
                        }else{
                            $finalAmount = 0;
                        }
                    }else{
                        return json_encode(array('physicianFees' => array(),'strErrorMessage' => "Invalid Referral code."));    
                    }

                    if($finalAmount < 0){
                        $finalAmount = 0;
                    }else{
                        $finalAmount = $this->round_up($finalAmount, 2);                        
                    }
                    return json_encode(array('ref_id' => $getCode->id, 'physicianFees' => $finalAmount,'strErrorMessage' => ""));
                    
                }
            }else{
                return json_encode(array('physicianFees' => array(),'strErrorMessage' => "This Referral code does not exist."));    
            }
        }else{
            return json_encode(array('physicianFees' => array(),'strErrorMessage' => "Invalid Details"));
        }
    }
    
    public function term(){
        return view('term');
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
    
    /**Generate random key */
    public function generateKey(){
        $tokens = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $serial = '';
        for ($i = 0; $i < 4; $i++) {
            for ($j = 0; $j < 5; $j++) {
                $serial .= $tokens[rand(0, 35)];
            }
            if ($i < 3) {
                $serial .= '-';
            }
        }
        return $serial;
    }
    
    /**
     * Add New Case 
     * */
    public function skinMDAddCase(Request $request){
        GENERATEKEY:        
        $case_number = $this->generateKey();
        $caseId = DB::table('cases')->where('case_number', $case_number)->first();
        
        if(!is_null($caseId)){
            goto GENERATEKEY;
        }
    
        $requestParam = $request->all();
        $add_account = $requestParam['skinMDCase']['addAccount']; //Get new pationet details
        $AddCase = $requestParam['skinMDCase']['AddCase']; //Get add new case details
        $Payment = $requestParam['skinMDCase']['Payment']; //Get payment details
        // dd($Payment);
        /**
            * Add Account
            */
        $patient_fname = null;
        $patient_mname = null;
        $patient_lname = null;
        $patient_gender = null;
        $patient_dob = null;
        $patient_caregiver_relation = null;
        $patient_email = null;
        $patient_phone = null;
        $guidAccountId = null;
    
        if(!empty($add_account)){
            $patient_fname = $add_account['strFirstName'];
            $patient_mname = $add_account['strMiddleName'];
            $patient_lname = $add_account['strLastName'];
            $patient_gender = $add_account['intGender'];
            $patient_dob = $add_account['strAccountDOB'];
            $patient_caregiver_relation = $add_account['intRelationToCareGiverId'];
            $patient_email = $add_account['strEmail'];
            $patient_phone = $add_account['strPhone'];
            
            $rel_id =($add_account['intRelationToCareGiverId']) ? $add_account['intRelationToCareGiverId'] : 0;
            $patientDetails = array('caregiver_id' => $add_account['guidParentAccountId'],'relation_id' => $rel_id,'first_name' => $add_account['strFirstName'],'middle_name' => $add_account['strMiddleName'],'last_name' => $add_account['strLastName'],'gender' => $add_account['intGender'],'dob' => $add_account['strAccountDOB'],'email' => $add_account['strEmail'],'phone' => $add_account['strPhone']);
    
            if(is_null($add_account['guidAccountId'])){ 
                $guidAccountId = DB::table('patient_details')->insertGetId($patientDetails);
            }else{
                $guidAccountId = $add_account['guidAccountId'];
                DB::table('patient_details')->where('id', $add_account['guidAccountId'])->update($patientDetails);
            }
        }
        /**END Add Account */
    
        /**
            * Add Case
            */
    
        /**Get all photos */
        $imgIds = NULL;
        if(!is_null($AddCase['strPhotoList'])){
            $imgList = array_filter(explode('~Image|', $AddCase['strPhotoList']));            
            $ids = array();
            if(count($imgList) > 0){
                foreach ($imgList as $key => $value) {
                    $name = array('img_name' => $value);
                    $ids[] = DB::table('case_photos')->insertGetId($name);
                }
                $imgIds = implode(',', $ids);
            }
        }
    
        /**Get case details */
        $time_of_issue1 = null;
        $time_of_issue2 = null;
        $type_of_problem1 = null;
        $type_of_problem2 = null;
        $biopsied_or_excised = null;
        $pregnant_status = null;
        
        if(!is_null($AddCase['strQuestionAnswerList'])){
            $QueAns = explode('|', $AddCase['strQuestionAnswerList']);
            if(count($QueAns) > 0){
                foreach ($QueAns as $key => $value) {
                    $ans = explode('~', $value);
                    switch ($ans[0]) {
                        
                        case 'time_of_issue1':
                            $time_of_issue1 = $ans[1];
                            break;
                        
                        case 'time_of_issue2':
                            $time_of_issue2 = $ans[1];
                            break;
                        
                        case 'type_of_problem1':
                            $newText = str_replace('type_of_problem1~', '', $value);
                            $newText = str_replace('~', ',', $newText);
                            $type_of_problem1 = $newText;
                            break;
                        
                        case 'type_of_problem2':
                            $type_of_problem2 = $ans[1];
                            break;
                        
                        case 'biopsied_or_excised':
                            $biopsied_or_excised = $ans[1];
                            break;
                        
                        case 'p_15':
                            $pregnant_status = explode('_', $ans[1]);
                            $pregnant_status = $pregnant_status[1];
                            break;
                        
                        default:
                            # code...
                            break;
                    }
                }
            }
        }
    
        /**Get Body parts selection */
        $body_areas = null;
        if(!is_null($AddCase['strBodyMapList'])){
            $listBody = implode("','", explode('~', $AddCase['strBodyMapList']));         
            $listBody = "'" . $listBody . "'";
                
            $body_areas = DB::select(DB::raw('SELECT GROUP_CONCAT(id) as id FROM body_areas WHERE name IN ('. $listBody .')'));
        }
    
        /**Create Case Start*/
        if($AddCase['intConsultingCost'] == 0 || $AddCase['intConsultingCost'] == '0'){
            $user = Auth::user();
            $newCaseData = array(
                            'case_number' => $case_number,
                            'care_giver_id' => $AddCase['guidCareGiverId'],
                            'provider_id' => ($AddCase['guidDoctorId']) ? $AddCase['guidDoctorId'] : 0,
                            'derm_id' => $AddCase['guidDermAddressId'],
                            'patient_details_id' => $guidAccountId,
                            'photos_ids' => $imgIds,
                            'consult_cost' => $AddCase['intConsultingCost'],
                            'complaint_id' => $AddCase['guidChiefComplaintId'],
                            'time_of_issue1' => $time_of_issue1,
                            'time_of_issue2' => $time_of_issue2,
                            'type_of_problem1' => $type_of_problem1,
                            'type_of_problem2' => $type_of_problem2,
                            'biopsied_or_excised' => $biopsied_or_excised,
                            'pregnant_status' => $pregnant_status,
                            'affected_area_list' => (!empty($body_areas[0]->id))? $body_areas[0]->id : null,
                            'patient_fname' => $patient_fname,
                            'patient_mname' => $patient_mname,
                            'patient_lname' => $patient_lname,
                            'patient_gender' => $patient_gender,
                            'patient_dob' => date('Y-m-d', strtotime($patient_dob)),
                            'patient_caregiver_relation' => $patient_caregiver_relation,
                            'patient_email' => $patient_email,
                            'patient_phone' => $patient_phone,
                            'submitted_by' => $user->id,
                            'refferal_code_id' => (!is_null($AddCase['strRef_id']) && !empty($AddCase['strRef_id']))? $AddCase['strRef_id'] : NULL,                                            
                            'status' => 1,
                            'case_priority' => 1
                        );
                                
            $caseId = DB::table('cases')->insertGetId($newCaseData);
            /**Insert Transaction details in Table */
            $transactionData = array(
                'case_id' => $caseId,
                'caregiver_id' => $AddCase['guidCareGiverId'],
                'provider_id' => ($AddCase['guidDoctorId']) ? $AddCase['guidDoctorId'] : 0, //$AddCase['guidDoctorId'],
                'consult_cost' => $AddCase['intConsultingCost'],
                'payment_type' => 'Authorized',
                'strCreditCardNumber' => "XXXX" . substr($Payment['strCreditCardNumber'], -4),
                'intCreditCardType' =>  ((int)$Payment['intCreditCardType']) + 1,
                'strPaymentDescription' => $Payment['strPaymentDescription'],
                'strTransId' => null,
                'strAuthorizationCode' => $Payment['strSecurityCode'],
                'strBillingFirstName' => $Payment['strBillingFirstName'],
                'strBillingLastName' => $Payment['strBillingLastName'],
                'strBillingAddress1' => $Payment['strBillingAddress1'],
                'strBillingCity' => $Payment['strBillingCity'],
                'strBillingState' => $Payment['strBillingState'],
                'strBillingZipCode' => $Payment['strBillingZipCode']
            );
    
            $transactions = DB::table('transactions')->insertGetId($transactionData);
    
            /**END - Transaction details*/
            
            /**Send Email to CareGiver and Doctor */
            
                /**Template for CareGiver*/
                $providerName = DB::select(DB::raw("SELECT CONCAT(fname,' ',lname) as name FROM users WHERE id =". $AddCase['guidDoctorId']));
                $careGiverEmail = DB::select(DB::raw("SELECT email FROM users WHERE id = ". $AddCase['guidCareGiverId']));
                
                $careGiverContent = DB::table('email_template')->where(array('email_type' => 3) )->select('content')->get();
    
                if(isset($careGiverContent[0])){
                    $careGiverContentValue =  $careGiverContent[0]->content;
                    $search = array('{{name}}','{{email}}',"\n");
                    $replace = array( $providerName[0]->name, $careGiverEmail[0]->email, '<br />');
    
                    $careGiverContentValue = str_replace($search, $replace, $careGiverContentValue);
    
                }else{
                    $careGiverContentValue = "<p>Your information has been sent to ". $providerName[0]->name ." <br />When the doctor has finished reviewing your case, you will receive an email at - ". $careGiverEmail[0]->email ."</p>";
                }
    
                $careGiverContentValue .= "<br /> <br />  --- <br />For login click on this link <a href='" . url('/') . "'> Login</a>";
                
                Mail::to($careGiverEmail[0]->email)->cc(['vimal.raval@techextensor.com'])->send(new AddcaseMail(array('content' => $careGiverContentValue, 'subject' => 'Information has been sent to ' . $providerName[0]->name)));
                /**END*/      
    
                /**Template for Doctor*/
                
                $providerName = DB::select(DB::raw("SELECT CONCAT(fname,' ',lname) as name, email FROM users WHERE id =". $AddCase['guidDoctorId']));
    
                $doctorContent = DB::table('email_template')->where(array('email_type' => 6) )->select('content')->get();
    
                if(isset($doctorContent[0])){
                    $doctorContentValue =  $doctorContent[0]->content;
                    $search = array('{{doctor_name}}','{{case_number}}','{{created_at}}', "\n");
                    $replace = array( $providerName[0]->name, $case_number, date('m/d/Y h:i A'),'<br />');
    
                    $doctorContentValue = str_replace($search, $replace, $doctorContentValue);
    
                }else{
                    $doctorContentValue = "<p>Dear ". $providerName[0]->name .", <br /><b>Consult #</b> ". $case_number ." <br /> <b>Submitted:<b> ". date('m/d/Y h:i A') ."</p>";
                }
    
                $doctorContentValue .= "<br /> <br />  --- <br />For login click on this link <a href='" . url('/') . "'> Login</a>";
                
                Mail::to($providerName[0]->email)->cc(['vimal.raval@techextensor.com'])->send(new AddcaseMail(array('content' => $doctorContentValue, 'subject' => 'You have a new patient consult waiting for you')));
                /**END*/
                
            /**END - Send Email to CareGiver and Doctor */
    
            return json_encode(array('strErrorMessage' => '', 'strCaseNumber' => $case_number, 'guidCaseId' => $caseId, 'guidAccountId' => $guidAccountId));
    
        }
    
        if(!empty($Payment)){
            // Common setup for API credentials
            $merchantAuthentication = new AnetAPI\MerchantAuthenticationType();
            //$merchantAuthentication->setName(config('services.authorize.login'));
            //$merchantAuthentication->setTransactionKey(config('services.authorize.key'));
            
            $merchantAuthentication->setName("2rqL3d32cLz");
            $merchantAuthentication->setTransactionKey("2938UXZ9b3B7Xtmr");
            
    
            $refId = 'ref'.time();
    
            // Create the payment data for a credit card
            $creditCard = new AnetAPI\CreditCardType();
            $creditCard->setCardNumber($Payment['strCreditCardNumber']);
            $creditCard->setCardCode($Payment['strSecurityCode']);
            
            // $creditCard->setExpirationDate( "2038-12");
            $expiry = $Payment['strExpirationDate'];
            $creditCard->setExpirationDate($expiry);
            $paymentOne = new AnetAPI\PaymentType();
            $paymentOne->setCreditCard($creditCard);
    
            // Create a transaction
            $transactionRequestType = new AnetAPI\TransactionRequestType();
            $transactionRequestType->setTransactionType("authCaptureTransaction");
            $transactionRequestType->setAmount($AddCase['intConsultingCost']);
            $transactionRequestType->setPayment($paymentOne);
    
            $requestTransaction = new AnetAPI\CreateTransactionRequest();
            $requestTransaction->setMerchantAuthentication($merchantAuthentication);
            $requestTransaction->setRefId( $refId);
            $requestTransaction->setTransactionRequest($transactionRequestType);
            $controller = new AnetController\CreateTransactionController($requestTransaction);
            $response = $controller->executeWithApiResponse(\net\authorize\api\constants\ANetEnvironment::PRODUCTION);
            
            if ($response != null)
            {
                $tresponse = $response->getTransactionResponse();
                //dd($tresponse);
                if ($response->getMessages()->getResultCode() == "Ok")
                {
                    $user = Auth::user();
                    $newCaseData = array(
                                            'case_number' => $case_number,
                                            'care_giver_id' => $AddCase['guidCareGiverId'],
                                            'provider_id' => ($AddCase['guidDoctorId']) ? $AddCase['guidDoctorId'] : 0, //$AddCase['guidDoctorId'],
                                            'derm_id' => $AddCase['guidDermAddressId'],
                                            'patient_details_id' => $guidAccountId,
                                            'photos_ids' => $imgIds,
                                            'consult_cost' => $AddCase['intConsultingCost'],
                                            'complaint_id' => $AddCase['guidChiefComplaintId'],
                                            'time_of_issue1' => $time_of_issue1,
                                            'time_of_issue2' => $time_of_issue2,
                                            'type_of_problem1' => $type_of_problem1,
                                            'type_of_problem2' => $type_of_problem2,
                                            'biopsied_or_excised' => $biopsied_or_excised,
                                            'pregnant_status' => $pregnant_status,
                                            'affected_area_list' => (!empty($body_areas[0]->id))? $body_areas[0]->id : null,
                                            'patient_fname' => $patient_fname,
                                            'patient_mname' => $patient_mname,
                                            'patient_lname' => $patient_lname,
                                            'patient_gender' => $patient_gender,
                                            'patient_dob' => date('Y-m-d', strtotime($patient_dob)),
                                            'patient_caregiver_relation' => $patient_caregiver_relation,
                                            'patient_email' => $patient_email,
                                            'patient_phone' => $patient_phone,
                                            'submitted_by' => $user->id,
                                            'refferal_code_id' => (!is_null($AddCase['strRef_id']) && !empty($AddCase['strRef_id']))? $AddCase['strRef_id'] : NULL,                                            
                                            'status' => 1,
                                            'case_priority' => 1
                                        );
                                        
                    $caseId = DB::table('cases')->insertGetId($newCaseData);
                    /**Insert Transaction details in Table */
                    $transactionData = array(
                        'case_id' => $caseId,
                        'caregiver_id' => $AddCase['guidCareGiverId'],
                        'provider_id' => ($AddCase['guidDoctorId']) ? $AddCase['guidDoctorId'] : 0, //$AddCase['guidDoctorId'],
                        'consult_cost' => $AddCase['intConsultingCost'],
                        'payment_type' => 'Authorized',
                        'strCreditCardNumber' => $tresponse->getAccountNumber(),
                        'intCreditCardType' =>  ((int)$Payment['intCreditCardType']) + 1,
                        'strPaymentDescription' => $Payment['strPaymentDescription'],
                        'strTransId' => $tresponse->getTransId(),
                        'strAuthorizationCode' => $tresponse->getAuthCode(),
                        'strBillingFirstName' => $Payment['strBillingFirstName'],
                        'strBillingLastName' => $Payment['strBillingLastName'],
                        'strBillingAddress1' => $Payment['strBillingAddress1'],
                        'strBillingCity' => $Payment['strBillingCity'],
                        'strBillingState' => $Payment['strBillingState'],
                        'strBillingZipCode' => $Payment['strBillingZipCode']
                    );
    
                    $transactions = DB::table('transactions')->insertGetId($transactionData);
    
                    /**END - Transaction details*/
                    
                    /**Send Email to CareGiver and Doctor */
                    
                        /**Template for CareGiver*/
                        $providerName = DB::select(DB::raw("SELECT CONCAT(fname,' ',lname) as name FROM users WHERE id =". $AddCase['guidDoctorId']));
                        $careGiverEmail = DB::select(DB::raw("SELECT email FROM users WHERE id = ". $AddCase['guidCareGiverId']));
                        
                        $careGiverContent = DB::table('email_template')->where(array('email_type' => 3) )->select('content')->get();
    
                        if(isset($careGiverContent[0])){
                            $careGiverContentValue =  $careGiverContent[0]->content;
                            $search = array('{{name}}','{{email}}',"\n");
                            $replace = array( $providerName[0]->name, $careGiverEmail[0]->email, '<br />');
    
                            $careGiverContentValue = str_replace($search, $replace, $careGiverContentValue);
    
                        }else{
                            $careGiverContentValue = "<p>Your information has been sent to ". $providerName[0]->name ." <br />When the doctor has finished reviewing your case, you will receive an email at - ". $careGiverEmail[0]->email ."</p>";
                        }
    
                        $careGiverContentValue .= "<br /> <br />  --- <br />For login click on this link <a href='" . url('/') . "'> Login</a>";
                        
                        Mail::to($careGiverEmail[0]->email)->cc(['vimal.raval@techextensor.com'])->send(new AddcaseMail(array('content' => $careGiverContentValue, 'subject' => 'Information has been sent to ' . $providerName[0]->name)));
                        /**END*/      
    
                        /**Template for Doctor*/
                        
                        $providerName = DB::select(DB::raw("SELECT CONCAT(fname,' ',lname) as name, email FROM users WHERE id =". $AddCase['guidDoctorId']));
    
                        $doctorContent = DB::table('email_template')->where(array('email_type' => 6) )->select('content')->get();
    
                        if(isset($doctorContent[0])){
                            $doctorContentValue =  $doctorContent[0]->content;
                            $search = array('{{doctor_name}}','{{case_number}}','{{created_at}}', "\n");
                            $replace = array( $providerName[0]->name, $case_number, date('m/d/Y h:i A'),'<br />');
    
                            $doctorContentValue = str_replace($search, $replace, $doctorContentValue);
    
                        }else{
                            $doctorContentValue = "<p>Dear ". $providerName[0]->name .", <br /><b>Consult #</b> ". $case_number ." <br /> <b>Submitted:<b> ". date('m/d/Y h:i A') ."</p>";
                        }
    
                        $doctorContentValue .= "<br /> <br />  --- <br />For login click on this link <a href='" . url('/') . "'> Login</a>";
                        
                        Mail::to($providerName[0]->email)->cc(['vimal.raval@techextensor.com'])->send(new AddcaseMail(array('content' => $doctorContentValue, 'subject' => 'You have a new patient consult waiting for you')));
                        /**END*/
                        
                    /**END - Send Email to CareGiver and Doctor */
    
                    return json_encode(array('strErrorMessage' => '', 'strCaseNumber' => $case_number, 'guidCaseId' => $caseId, 'guidAccountId' => $guidAccountId));
    
                }
                else
                {
                    $tresponse = $response->getTransactionResponse();
                
                    if ($tresponse != null && $tresponse->getErrors() != null) {
                        return json_encode(array('strErrorMessage' => "Error Message : " . $tresponse->getErrors()[0]->getErrorText(), 'strCaseNumber' => '', 'guidCaseId' => "", 'guidAccountId' => ""));
                    } else {
                        return json_encode(array('strErrorMessage' => "Error Message : " . $response->getMessages()->getMessage()[0]->getText(), 'strCaseNumber' => '', 'guidCaseId' => "", 'guidAccountId' => ""));
                    }
                }
            }
            else
            {
                return json_encode(array('strErrorMessage' => "Charge Credit Card Null response returned", 'strCaseNumber' => '', 'guidCaseId' => "", 'guidAccountId' => ""));
            }
                    
        }else{
            return json_encode(array('strErrorMessage' => 'Payment Failed', 'strCaseNumber' => '', 'guidCaseId' => '', 'guidAccountId' => ''));
    
        }
        
        /**END-create case*/
    }

    /**Add Additional details for Case */    
    public function savePatientAdditionalDetails(Request $request){
        $requestData = $request->all();
        //echo "<pre>"; print_r($requestData); die();
        $requestData = $requestData['patientAdditionalDetails'];
		
        $patientId = $requestData['guidAccountId'];
        $patient_details = DB::table('patient_details')->where('id', $patientId)->get();
		if(!isset($patient_details)){
			$user = Auth::user();
			$patientDetails = array('caregiver_id' => $user->id, 'relation_id' => 1, 'first_name' => $user->fname, 'middle_name' => $user->mname, 'last_name' => $user->lname, 'gender' => (($user->gender > 0)? 'Female' : 'Male'),'dob' => date('m/d/Y', strtotime($user->dob)), 'phone' => $user->phone, 'email' => $user->email);
			
			GENERATEKEY:        
			$case_number = $this->generateKey();
			$caseId = DB::table('cases')->where('case_number', $case_number)->first();
			
			if(!is_null($caseId)){
				goto GENERATEKEY;
			}
			
			$patientId = DB::table('patient_details')->insertGetId($patientDetails);
			
			$newCaseData = array(
				'case_number' => $case_number,
				'care_giver_id' => $user->id,
				'provider_id' => $user->id,
				'derm_id' => '',
				'patient_details_id' => $patientId,
				'photos_ids' => '',
				'consult_cost' => '',
				'complaint_id' => '',
				'time_of_issue1' => '',
				'time_of_issue2' => '',
				'type_of_problem1' => '',
				'type_of_problem2' => '',
				'biopsied_or_excised' => '',
				'pregnant_status' => '',
				'affected_area_list' => null,
				'patient_fname' => $user->fname,
				'patient_mname' => $user->mname,
				'patient_lname' => $user->lname,
				'patient_gender' =>(($user->gender > 0)? 'Female' : 'Male'),
				'patient_dob' => date('m/d/Y', strtotime($user->dob)),
				'patient_caregiver_relation' => 1,
				'patient_email' => $user->email,
				'patient_phone' => $user->phone,
				'submitted_by' => $user->id,
				'refferal_code_id' =>  NULL,                                            
				'status' => 1,
				'case_priority' => 1
                        );
			
			
			$caseId = DB::table('cases')->insertGetId($newCaseData);
			
			
		}
		
		
        $patient_details = isset($patient_details[0])?$patient_details[0]:'';
		//if(isset($patient_details)){
			$patient_pharmacy_id = isset($patient_details->patient_pharmacy_id)?$patient_details->patient_pharmacy_id:'';
			$patient_current_medication_id = isset($patient_details->patient_current_medication_id)?$patient_details->patient_current_medication_id:'';
			$patient_drug_allergies_id = isset($patient_details->patient_drug_allergies_id)?$patient_details->patient_drug_allergies_id:'';
			$family_medical_history_id = isset($patient_details->family_medical_history_id)?$patient_details->family_medical_history_id:'';
			$patient_medical_history_id = isset($patient_details->patient_medical_history_id)?$patient_details->patient_medical_history_id:'';
		//} else {
		//}

        //Add Pharmacy details
        $pharmacyId = NULL;
        if(isset($requestData['strPharmacyName']))
        {
            if(is_null($requestData['guidPharmacyId']) && $requestData['strPharmacyName'] != ''){
                $pharmacyId = DB::table('pharmacy')->insertGetId(array('pharmacy_name' => $requestData['strPharmacyName'], 'pharmacy_fax' => isset($requestData['strPharmacyFax'])&&!empty($requestData['strPharmacyFax'])?$requestData['strPharmacyFax']:'','status' => 1));
            }
        }
        else{
            $pharmacyId = (!is_null($requestData['guidPharmacyId']))? $requestData['guidPharmacyId'] : NULL;
        }
        
        $patient_pharmacy_id = (is_null($pharmacyId))? $patient_pharmacy_id :  (is_null($patient_pharmacy_id)? $pharmacyId : ( $patient_pharmacy_id . ',' . $pharmacyId));

        /**Create New prescription for case IF pharmacy details added by user in case form */
        $prescription = null;
        if(!empty($pharmacyId)){
            $prescription = DB::table('prescriptions')->insertGetId(array('case_id' => $requestData['guidCaseId'], 'pharmacy' => $pharmacyId,'status' => 1));
        }
        
        //Add CurrentMedicine
        $currentMedicineIds = NULL;
        if(!empty($requestData['listCurrentMedicine'])){
            $CM = array();
            foreach ($requestData['listCurrentMedicine'] as $key => $value) {
                $cMed = DB::table('patient_current_medication')->where('name', $value['strName'])->select('id')->first();  if(isset($cMed->id)){
                    $CM[] = $cMed->id;
                }else{
                    $CM[] = DB::table('patient_current_medication')->insertGetId(array('name' => $value['strName']));
                }
            }
            $currentMedicineIds = implode(',', $CM);
            if(is_null($patient_current_medication_id)){
                $patient_current_medication_id = $currentMedicineIds;
            }else{
                array_push($CM, $patient_current_medication_id);
                $patient_current_medication_id = implode(',', array_unique($CM));
            }
        }
        //Add DrugAllergies
        $drugMedicineIds = NULL;
        if(!empty($requestData['listDrugAllergies'])){
            $DA = array();
            foreach ($requestData['listDrugAllergies'] as $key => $value) {
                $dMed = DB::table('patient_drug_allergies')->where('name', $value['strName'])->select('id')->first();  
                if(isset($dMed->id)){
                    $DA[] = $dMed->id;
                }else{
                    $DA[] = DB::table('patient_drug_allergies')->insertGetId(array('name' => $value['strName']));
                }
            }
            $drugMedicineIds = implode(',', $DA);
            
            if(is_null($patient_drug_allergies_id)){
                $patient_drug_allergies_id = $drugMedicineIds;
            }else{
                array_push($DA, $patient_drug_allergies_id);
                $patient_drug_allergies_id = implode(',', array_unique($DA));
            }
        }
        
        //Add listFamilyMedicalHistory
        $FamilyMedicineIds = NULL;
        if(!empty($requestData['listFamilyMedicalHistory'])){
            $FMH = array();
            foreach ($requestData['listFamilyMedicalHistory'] as $key => $value) {
                $fMed = DB::table('family_medical_history')->where('name', $value['strName'])->select('id')->first();  
                if(isset($fMed->id)){
                    $FMH[] = $fMed->id;
                }else{
                    $FMH[] = DB::table('family_medical_history')->insertGetId(array('name' => $value['strName']));
                }
            }
            $FamilyMedicineIds = implode(',', $FMH);
            
            if(is_null($family_medical_history_id)){
                $family_medical_history_id = $FamilyMedicineIds;
            }else{
                array_push($FMH, $family_medical_history_id);
                $family_medical_history_id = implode(',', array_unique($FMH));
            }
        }

        //Add MedicalHistory
        $MedicineIds = NULL;
        if(!empty($requestData['listMedicalHistory'])){
            $MH = array();
            foreach ($requestData['listMedicalHistory'] as $key => $value) {
                $fmMed = DB::table('patient_medical_history')->where('name', $value['strName'])->select('id')->first();  
                if(isset($fmMed->id)){
                    $MH[] = $fmMed->id;
                }else{
                    $MH[] = DB::table('patient_medical_history')->insertGetId(array('name' => $value['strName']));
                }
            }
            $MedicineIds = implode(',', $MH);
            
            if(is_null($patient_medical_history_id)){
                $patient_medical_history_id = $MedicineIds;
            }else{
                array_push($MH, $patient_medical_history_id);
                $patient_medical_history_id = implode(',', array_unique($MH));
            }
        }

        $additionalDetails = array('prescriptions_ids' => $prescription,'patient_pharmacy_id' => $pharmacyId, 'patient_current_medication_id' =>  $currentMedicineIds, 'patient_drug_allergies_id' =>  $drugMedicineIds, 'family_medical_history_id' => $FamilyMedicineIds, 'patient_medical_history_id' => $MedicineIds);
        
        //Update additional records
        DB::table('cases')->where('id', $requestData['guidCaseId'])->update($additionalDetails);
                
        $patientData = array('patient_pharmacy_id' => $patient_pharmacy_id, 'patient_current_medication_id' => $patient_current_medication_id, 'patient_drug_allergies_id' => $patient_drug_allergies_id, 'family_medical_history_id' => $family_medical_history_id, 'patient_medical_history_id' => $patient_medical_history_id);
        
        DB::table('patient_details')->where('id', $patientId)->update($patientData);

        return json_encode(array('strErrorMessage' => ''));
    }

    /**
     * Search  Provider by State, Speciality, 
     * Provider Last name / Practice name 
    */
    public function getPhysicians1(Request $request){

        
        $requestParam = (object)$request->all();
        // dd($requestParam);
		// die; 

        // dd($request);
        // die;
        $requestParam = (object)$request->all();
        
        $sql = "select 
                    DA.id as dermId,
                    DA.street1 as strAddress1,
                    DA.street2 as strAddress2,
                    DA.street3 as strAddress3,
                    DA.city as strCity,
                    ST.code as strState,
                    DA.postal_code as strPostalCode,
                    DA.practice_name as strHospital,
                    USR.id as guidPhysicianId,
                    USR.consult_fee as strCost,
                    USR.degrees as strDegree,
                    USR.email as strEmail,
                    null as strFirstName,
                    null as strLastName,
                    null as strMobilePhone,
                    CONCAT(USR.fname,' ',USR.lname) as strName,
                    USR.phone as strPhone,
                    null as strSkills,
                    GROUP_CONCAT(SP.name) as strSpecialty,
                    USR.Title as strTitle
                FROM derm_address DA
                    LEFT JOIN us_state ST ON DA.state = ST.id 
                    RIGHT JOIN users USR ON DA.user_id = USR.id
                    RIGHT JOIN specilities SP ON (FIND_IN_SET(SP.id, USR.speciality) != false)";
        if(!empty($requestParam->strSpecialty) && $requestParam->strSpecialty != 'All'){
            $sql =  $sql . " && (FIND_IN_SET($requestParam->strSpecialty, USR.speciality) != false)";
        }

        $sql = $sql . " WHERE USR.user_type != 3 AND USR.new_consults > 0 AND DA.state = $requestParam->strState";

        if(!empty($requestParam->strKeyword)){
            $sql = $sql . " AND (USR.lname LIKE '%$requestParam->strKeyword%' OR DA.practice_name LIKE '%$requestParam->strKeyword%')";
        }

        $sql = $sql . " GROUP BY USR.id";

        
        try {
            
            $providers = DB::select(DB::raw( $sql ));
            
            return json_encode(array('listPhysicians' => $providers,'strErrorMessage' => ''));

        } catch (\Exception $e) {        
            
            return json_encode(array('listPhysicians' => array(),'strErrorMessage' => $e->getMessage()));

        }
    }

    public function getPragnantTemplate(){
        $sql = "SELECT QA.question, GROUP_CONCAT(DISTINCT QA.questions_list) as questions_list , QA.id  FROM question_answer_templates QA 
                LEFT JOIN questions QUE ON FIND_IN_SET(QUE.id, QA.questions_list) != false  
                    WHERE QA.question = 'pragnant' AND QA.patient_gender = 1 group by QA.patient_gender";
        $getAnswerTemplate = DB::select(DB::raw( $sql ));
        $responseData = array();
        if(!empty($getAnswerTemplate)){
            foreach ($getAnswerTemplate as $key => $value) {
                $responseData[$key] = array('__type' => 'QuestionTemplate', 'guidQuestionTemplateId' => $value->id,'intMaxAge' => 60, 'intMinAge' => 10, 'listQuestions' => [], 'strErrorMessage' => null, 'strQuestionName' => $value->question);
                if(!empty($value->questions_list)){
                    $getQues = DB::select(DB::raw( "SELECT * FROM questions WHERE id IN ($value->questions_list)" ));
                    if(!empty($getQues)){
                        foreach ($getQues as $key1 => $value1) {
                            $responseData[$key]['listQuestions'][$key1] = array('__type' => 'Question', 'guidQuestionId' => $value1->id, 'strQuestionName' => $value1->question, 'strQuestionType' => $value1->question_type, 'listOptions' => array());
                            $getQuesChoice = DB::select(DB::raw( "SELECT * FROM question_choices WHERE question_answer_id = $value1->id"));
                            if(!empty($getQuesChoice)){
                                foreach ($getQuesChoice as $key2 => $value2) {
                                    $responseData[$key]['listQuestions'][$key1]['listOptions'][$key2] = array('__type' => 'QuestionOption', 'guidOptionId' => $value2->id, 'strOptionName' => $value2->question_answer);
                                }
                            }
                        }
                    }            
                }
            }
        }
        return $responseData;
    }

    public function getQuestionTemplate(Request $request){
        $requestData = $request->all();
       
        $sql = "SELECT QA.question, GROUP_CONCAT(DISTINCT QA.questions_list) as questions_list , QA.id  FROM question_answer_templates QA 
                LEFT JOIN questions QUE ON FIND_IN_SET(QUE.id, QA.questions_list) != false  
                    WHERE  QA.patient_gender = ". (($requestData['gender'])? 1 : 0) . " group by QA.patient_gender";
        // die($sql);
        $getAnswerTemplate = DB::select(DB::raw( $sql ));
        $responseData = array();
        if(!empty($getAnswerTemplate)){
            foreach ($getAnswerTemplate as $key => $value) {
                $responseData[$key] = array('__type' => 'QuestionTemplate', 'guidQuestionTemplateId' => $value->id,'intMaxAge' => 0, 'intMinAge' => 0, 'listQuestions' => [], 'strErrorMessage' => null, 'strQuestionName' => $value->question);
                if(!empty($value->questions_list)){
                    $getQues = DB::select(DB::raw( "SELECT * FROM questions WHERE id IN ($value->questions_list)" ));
                    if(!empty($getQues)){
                        foreach ($getQues as $key1 => $value1) {
                            $responseData[$key]['listQuestions'][$key1] = array('__type' => 'Question', 'guidQuestionId' => $value1->id, 'strQuestionName' => $value1->question, 'strQuestionType' => $value1->question_type, 'listOptions' => array());
                            $getQuesChoice = DB::select(DB::raw( "SELECT * FROM question_choices WHERE question_answer_id = $value1->id"));
                            if(!empty($getQuesChoice)){
                                foreach ($getQuesChoice as $key2 => $value2) {
                                    $responseData[$key]['listQuestions'][$key1]['listOptions'][$key2] = array('__type' => 'QuestionOption', 'guidOptionId' => $value2->id, 'strOptionName' => $value2->question_answer);
                                }
                            }
                        }
                    }            
                }
            }
        }
        return json_encode($responseData);
    }

    public function saveAdditionalQuestions(Request $request){
        
        $requestData = $request->all();
        
        if(!empty($requestData['additionalQuestions']['strQuestionList'])){
            
            $questionList = explode('|', $requestData['additionalQuestions']['strQuestionList']);

            if(!empty($questionList)){
                foreach ($questionList as $key => $value) {
                    $queSplit = explode('~', $value);
                    if(!empty($queSplit)){                        
                        $answer = (!empty($queSplit[2]))? $queSplit[2] : '';
                        if($queSplit[1] == 'Multiple'){
                            $answer = implode(',', array_slice($queSplit, 2));
                        }                        
                        $answerData = array('case_id' => $requestData['additionalQuestions']['guidCaseId'],'que_id' => $queSplit[0], 'question_type' => $queSplit[1], 'que_answers' => $answer);
                        
                        $getDuplicate = DB::table('answers_of_questions')->where(array('case_id' => $requestData['additionalQuestions']['guidCaseId'],'que_id' => $queSplit[0]) )->count();

                        if($getDuplicate > 0){
                            $guidAccountId = DB::table('answers_of_questions')->where(array('case_id' => $requestData['additionalQuestions']['guidCaseId'],'que_id' => $queSplit[0]))->update($answerData);
                        }else{                            
                            $guidAccountId = DB::table('answers_of_questions')->insertGetId($answerData);
                        }
                    }
                }
            }
        }
        return json_encode(array('strErrorMessage' => ''));
    }

    /**This function is for to get case details from patient case listing page */
    public function getCaseDetails(Request $request){
        $reqData = $request->all();
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
                            WHERE CS.id = " . $reqData['guidCaseId'] ." GROUP BY CS.id";

        $getCases = DB::select(DB::raw( $caseSql )); 

        if(!empty($getCases)){
            $singleCase = $getCases[0];

            /**
             * Get uploaded photos details for case 
             * */
            if(is_null($singleCase->photos_ids) || empty($singleCase->photos_ids)){
                $getPhotos = array();
            }else{
                $photoIdss = trim($singleCase->photos_ids,',');
                
                //$imgFldrURL = env('APP_SERVERURL', 'http://34.235.116.137:8080/public/') . 'storage/cases_images';
                $imgFldrURL = env('APP_SERVERURL', 'https://skinmdnow.nuvolatek.net/server/public/') . 'storage/cases_images';
                $photoSql = "SELECT '__type' as Photo, 'Image' as strTitle, CONCAT('$imgFldrURL','/',img_name) as strUrl
                                FROM case_photos WHERE id IN($photoIdss)";
                $getPhotos = DB::select(DB::raw( $photoSql )); // list of all photos
            }
                
            /**Get Body part details for case */
            if(is_null($singleCase->affected_area_list) || empty($singleCase->affected_area_list)){
                $getBodyParts = null;
            }else{                
                $bodyPartSql = "SELECT GROUP_CONCAT(name) as bodyParts FROM body_areas WHERE id IN($singleCase->affected_area_list)";

                $getBodyParts = DB::select(DB::raw( $bodyPartSql )); // list of all photos

                $getBodyParts = $getBodyParts[0]->bodyParts;
            }

            $casePhotos = array("__type" => "CasePhotos", "listPhotos" => $getPhotos, "strBodyMapList" => $getBodyParts, "strErrorMessage" => null);
            
            /**
             * Get data for Current Medicine
             */
            if(is_null($singleCase->patient_current_medication_id) || empty($singleCase->patient_current_medication_id)){
                $listCurrentMedicine = array();
            }else{
                $curMedSql = "SELECT  'CurrentMedicine' as '__type', name as strName FROM patient_current_medication WHERE id IN($singleCase->patient_current_medication_id)";
                $listCurrentMedicine = DB::select(DB::raw($curMedSql));
            }

            /**
             * Get data for patient_drug_allergies
             */
            if(is_null($singleCase->patient_drug_allergies_id) || empty($singleCase->patient_drug_allergies_id)){
                $listDrugAllergies = array();
            }else{
                $drgMedSql = "SELECT  'DrugAllergies' as '__type', name as strName FROM patient_drug_allergies WHERE id IN($singleCase->patient_drug_allergies_id)";
                $listDrugAllergies = DB::select(DB::raw($drgMedSql));
            }

            /**
             * Get data for FamilyMedicalHistory
             */
            if(is_null($singleCase->family_medical_history_id) || empty($singleCase->family_medical_history_id)){
                $listFamilyMedicalHistory = array();
            }else{
                $FamMedSql = "SELECT  'FamilyMedicalHistory' as '__type', name as strName FROM family_medical_history WHERE id IN($singleCase->family_medical_history_id)";
                $listFamilyMedicalHistory = DB::select(DB::raw($FamMedSql));
            }
            
            /**
             * Get data for MedicalHistory
             */
            if(is_null($singleCase->patient_medical_history_id) || empty($singleCase->patient_medical_history_id)){
                $listMedicalHistory = array();
            }else{
                $OnlyMedSql = "SELECT 'MedicalHistory' as '__type', name as strName FROM patient_medical_history WHERE id IN($singleCase->patient_medical_history_id)";
                $listMedicalHistory = DB::select(DB::raw($OnlyMedSql));
            }
            
            /**
             * Get data for CaseRx
             */
            $presData = "SELECT 'CaseRx' as '__type', PRM.pharmacy_name as strPharmacyName, PRM.pharmacy_fax as strPharmacyFax, PRC.medication as strPrescription FROM prescriptions PRC 
                            LEFT JOIN pharmacy PRM ON PRC.pharmacy = PRM.id
                            WHERE PRC.case_id = $singleCase->id";
            $listCaseRx = DB::select(DB::raw($presData));

            /**
             * Get Physician details for case
             */            
            if(is_null($singleCase->provider_id) || empty($singleCase->provider_id)){
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
            
            $getQuesData = $this->getQuestionAnswer(isset($reqData['guidCaseId'])?$reqData['guidCaseId']:'');
            
            /**Relation type*/
            $getRelationName = DB::table('patient_caregiver_relation')->where('id', $singleCase->patient_caregiver_relation)->select('relation_name as name')->get();            
            $getRelationName = $getRelationName[0]->name;

            /**Care giver details */
            $getCareGiver = DB::table('users')->where('id', $singleCase->care_giver_id)->select('fname','lname')->get();
            
            $strFullName = $singleCase->patient_lname . ' ' . $singleCase->patient_fname;
            $strFullName .=  (is_null($singleCase->patient_mname))? ' ' : $singleCase->patient_mname;

            $patientDetailsAr = array(
                "__type" => "PatientDetails",
                "guidAccountId" => "1",
                "insurance" => null,
                "intGender" => $singleCase->patient_gender,
                "intRelationToCareGiverId"=> $singleCase->patient_caregiver_relation,
                "isCareGiver"=> false,
                "listCurrentMedicine" => $listCurrentMedicine, 
                "listDrugAllergies" => $listDrugAllergies, 
                "listFamilyMedicalHistory" => $listFamilyMedicalHistory, 
                "listMedicalHistory" => $listMedicalHistory, 
                "listPharmacies"=> [],
                "strAddress"=> null,
                "strCareGiverFullName"=> ($getCareGiver[0]->lname.', '.$getCareGiver[0]->fname),
                "strCity"=> null,
                "strCountry"=> null,
                "strDateOfBirth"=> date('d/m/Y', strtotime($singleCase->patient_dob)),
                "strEmail"=> $singleCase->patient_email,
                "strFirstName"=> $singleCase->patient_fname,
                "strLastName"=> $singleCase->patient_lname,
                "strMiddleName"=> $singleCase->patient_mname,
                "strPatientName"=> $strFullName,
                "strPhone"=> $singleCase->patient_phone,
                "strPostalCode"=> null,
                "strRelationWithCareGiver"=> $getRelationName,
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
                                            'strErrorMessage' => null
                                        );

            /**
             * Final Data array
             */
            $caseDetails = array(
                "__type" => "CaseDetails",
                "casePhotos" => $casePhotos,
                "guidPatientId" => "1", //will store this ID static
                "intConsultingCost" => $singleCase->consult_cost,
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
                "strCaseStatus" => (($singleCase->status = 'Active')? 1 : 0),
                "strChiefComplaint" => $singleCase->cname,
                "strCouponCode" => null, //pending from referral code table
                "strErrorMessage" => null,
                "strPatientDOB" => date('m/d/Y', strtotime($singleCase->patient_dob)),
                "strPatientInstructions" => $singleCase->follow_up,
                "strPharmacy" => null,
                "strReferralCode" => null //pending from referral code table
            );

            
            return json_encode($caseDetails);
            //dd($caseDetails);
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
                                            LEFT JOIN questions QS ON ANS.que_id = QS.id
                                        WHERE case_id = $reqParam";
            $result = DB::select(DB::raw($getCaseAnswersData));
            
            $getCase = "SELECT * FROM cases WHERE id = $reqParam";
            $caseData = DB::select(DB::raw($getCase));
            
            if(!empty($caseData)){                
                /**
                 * Get Data for * What do you need help with? - Question
                 */
                
                 /**Getting duplicate text in view case page so we have commented this for now */

                /* $complaintName = DB::table('chief_complaints')->where('id', $caseData[0]->complaint_id)->select('name')->get();
                $complaintLabel = (!empty($complaintName))? $complaintName[0]->name : null;
                
                if(!is_null($complaintLabel)){
                    
                     $getQueAns[] = array(
                        "__type" => "Question",
                        "guidQuestionId" => null,
                        "listOptions" => array(array("__type" => "QuestionOption", "guidOptionId" => null, "strOptionName" => $complaintLabel)),
                        "strQuestionName" => "What do you need help with?",
                        "strQuestionType" => null
                    ); 
                } */

                /**
                 * Get data for - How long have you had this issue?
                 */
                if($caseData[0]->time_of_issue1 > 0){
                    $labelForthisq1 = $caseData[0]->time_of_issue1.' '.$caseData[0]->time_of_issue2;
                    $getQueAns[] = array(
                        "__type" => "Question",
                        "guidQuestionId" => null,
                        "listOptions" => array(array("__type" => "QuestionOption", "guidOptionId" => null, "strOptionName" => $labelForthisq1)),
                        "strQuestionName" => "<b>How long have you had this issue?</b>",
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
                            "strQuestionName" => "<b>Please describe your problem. (Select one or more)</b>",
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
                    "strQuestionName" => "<b>Has this condition been biopsied or excised before?</b>",
                    "strQuestionType" => null
                );
                
                /**
                 * Get data for - Pregnancy Template answer
                 */
                if(!is_null($caseData[0]->pregnant_status) && ( isset($caseData[0]->pregnant_status) && $caseData[0]->pregnant_status !="")){
                    $pregnancySql = "SELECT  question_answer FROM question_choices WHERE id = " . $caseData[0]->pregnant_status;
                    
                    $resultPregnancy = DB::select(DB::raw($pregnancySql));
                    
                    if(!empty($resultPregnancy)){
                        $getQueAns[] = array(
                            "__type" => "Question",
                            "guidQuestionId" => null,
                            "listOptions" => array(array("__type" => "QuestionOption", "guidOptionId" => null, "strOptionName" => $resultPregnancy[0]->question_answer)),
                            "strQuestionName" => "<b>Is the patient pregnant, trying to become pregnant, or nursing?</b>",
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
                            if(isset($getQueChoiceData[0]->question_answer)){
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
     * This function is for to update photos in related case
     */
    public function updateCasePhotos(Request $request){
        $reqData = $request->all();
        $imgIds = null;
        if(!is_null($reqData['strPhotoList'])){
            $imgList = array_filter(explode('~Image|', $reqData['strPhotoList']));            
            $ids = array();
            if(count($imgList) > 0){
                foreach ($imgList as $key => $value) {
                    $name = array('img_name' => $value);
                    $ids[] = DB::table('case_photos')->insertGetId($name);
                }
                $imgIds = implode(',', $ids);
            }
        }
        
        $getCase = $us_state = DB::table('cases')->where('id', $reqData['guidCaseId'])->select('photos_ids')->get();
        $newImgIds = (is_null($getCase[0]->photos_ids))? $imgIds :  (   (is_null($imgIds))? $getCase[0]->photos_ids : ($getCase[0]->photos_ids.','.$imgIds)  );
        

        /**Update images name in case table if name are not null */
        if(!is_null($newImgIds) && $newImgIds != ''){
            DB::table('cases')->where('id', $reqData['guidCaseId'])->update(array('photos_ids' => $newImgIds));
        }
    }

    public function addAccount(Request $request){        
        
        $data = $request->all();

        $registerContent = DB::table('email_template')->where(array('email_type' => 2) )->select('content')->get();

        if(isset($registerContent[0])){                        
            $registerContentValue =  $registerContent[0]->content;
            $search = array('{{name}}','{{email}}','{{username}}','{{password}}',"\n");
            
            $replace = array( ("<b>".$data['strFirstName'].' '.$data['strLastName'] . '</b>,'), $data['email'], $data['username'], $data['strPassword'], '<br />');

            $registerContentValue = str_replace($search, $replace, $registerContentValue);

        }else{
            $registerContentValue = "<p>Thank you for register. <br />Your login details are as mentioned below: <br /> <b>Username:</b> ". $data['username'] . " <br /> <b>Password:</b> " . $data['strPassword']."</p>";
        }
       
        $validatedData = Validator::make($request->all(), [
            'email' => 'unique:users|email',
            'username' => 'unique:users',
            'dob' => 'date|before:18 years ago'
        ], ['before' => 'The user should be 18 years old.']);
        
        if($validatedData->fails()){
            return response()->json(['strErrorMessage' => implode("\n", $validatedData->errors()->all())],200);
        }
        
        $user = User::create([
            'fname' => $data['strFirstName'],
            'mname' => $data['strMiddleName'],
            'lname' => $data['strLastName'],
            'username' => $data['username'],
            'user_type' => 3,
            'gender' => $data['intGender'],
            'dob' => date('Y-m-d', strtotime($data['strAccountDOB'])),
            'phone' => $data['strPhone'],
            'email' => $data['email'],
            'password' => Hash::make($data['strPassword']),
            'health_care_professional' => ($data['isHealthProfessional'] == 'true')? 1 : 0,
            'verified' => 1,
            'status' => 1,
            'created_by' => 1
        ]);

        $verifyUser = VerifyUser::create([
            'user_id' => $user->id,
            'token' => str_random(40)
        ]);
        
        $registerContentValue .= "<br /> <br />  --- <br />For login click on this link <a href='" . url('/') . "'> Login</a>";
                
        Mail::to($user->email)->cc(['vimal.raval@techextensor.com'])->send(new VerifyMail($registerContentValue));        

        return response()->json(['strErrorMessage' =>  ''],200);

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
            if($getUserType[0]->user_type < 3){
                return response()->json(['status' => false, 'message' => 'CareGiver Email address not found.']);
            }else{
                $password = $this->getRandomStr();

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
                
                $forgotContentValue .= "<br /> <br />  --- <br />For login click on this link <a href='" . url('/') . "'> Login</a>";

                Mail::to($req['email'])->cc(['vimal.raval@techextensor.com'])->send(new ResetPasswordMail($forgotContentValue));
                
                /**END - Email Send code */

                return response()->json(['status' => true, 'message' => 'New password sent to the email address you entered.']);
            }
        }else{
            return response()->json(['status' => false, 'message' => 'CareGiver Email address not found.']);
        }
    }
    
}