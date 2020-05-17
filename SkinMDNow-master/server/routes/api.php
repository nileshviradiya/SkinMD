<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/', function(){
  $bytes = openssl_random_pseudo_bytes(2);

  $pwd = bin2hex($bytes);
  return response()->json(['status' => 200, 'message' => 'Successfully',]);
});  //generate token

Route::post('register', 'AuthController@register');  //generate token
Route::post('login', 'AuthController@login');  //generate token
Route::post('logout', 'AuthController@logout'); // logout will make the token to blacklisted you have to create token again from login route
Route::post('refresh', 'AuthController@refresh'); //can refresh token with existing token
Route::post('secret/test', 'AuthController@test');
Route::post('forgotpassword', 'AuthController@forgotPassword');  //forgot password request
Route::post('getSkinCaseList', 'AuthController@getSkinCaseList');
Route::post('getusers','AuthController@getallusers');
Route::post('getUserById','AuthController@getUserById');
Route::put('user/{id}','AuthController@updateUser');
Route::delete('deleteUsers','AuthController@deleteUsers');
Route::post('uploadimage','AuthController@uploadimage');
Route::post('uploadSignatureImage','AuthController@uploadSignatureImage');
Route::post('getUserType','AuthController@getUserType');

/*Routes for Question Answer*/
Route::post('getqalist','AuthController@getqalist');
Route::post('getComplaints','AuthController@getComplaints');
Route::post('addqa','AuthController@addqa');
Route::post('getQAById','AuthController@getQAById');
Route::put('questionansupdate/{id}','AuthController@questionansupdate');
Route::delete('deleteQA','AuthController@deleteQA');

/*Routes for Question*/
Route::post('getquestionslist1','AuthController@getquestionslist');
Route::post('getOwners','AuthController@getOwners');
Route::post('addquestions','AuthController@addquestions');
Route::post('getQuestionById','AuthController@getQuestionById');
Route::put('updateQuestion/{id}','AuthController@updateQuestion');
Route::delete('deleteQuestion','AuthController@deleteQuestion');

/*Routes for Question Choice*/
Route::post('getquestionsChoicelist','AuthController@getquestionsChoicelist');
Route::post('addquestionsChoice','AuthController@addquestionsChoice');
Route::post('getQuestionChoiceById','AuthController@getQuestionChoiceById');
Route::put('updateQuestionChoice/{id}','AuthController@updateQuestionChoice');
Route::delete('deleteQuestionChoice','AuthController@deleteQuestionChoice');

/*Routes for Pharmacy*/
Route::post('getpharmacylist','AuthController@pharmacylist');
Route::post('addPharmacy','AuthController@addPharmacy');
Route::post('getPharmacyById','AuthController@getPharmacyById');
Route::put('updatePharmacy/{id}','AuthController@updatePharmacy');
Route::delete('deletePharmacy','AuthController@deletePharmacy');

/*Routes for Prescription*/
Route::post('getPrescriptionlist','AuthController@Prescriptionlist');
Route::post('addPrescription','AuthController@addPrescription');
Route::post('getPrescriptionById','AuthController@getPrescriptionById');
Route::put('updatePrescription/{id}','AuthController@updatePrescription');
Route::delete('deletePrescription','AuthController@deletePrescription');

/*Routes for Chief-complaint*/
Route::post('getComplaintlist','AuthController@Complaintlist');
Route::post('addComplaint','AuthController@addComplaint');
Route::post('getComplaintById','AuthController@getComplaintById');
Route::put('updateComplaint/{id}','AuthController@updateComplaint');
Route::delete('deleteComplaint','AuthController@deleteComplaint');


/*Routes for Derm Address*/
Route::post('getDermAddress','AuthController@getdermaddresslist');
Route::post('addDermAddress','AuthController@addDermAddress');
Route::post('getDermaddressById','AuthController@getDermaddressById');
Route::put('updateDermaddress/{id}','AuthController@updateDermaddress');
Route::delete('deleteDermaddress','AuthController@deleteDermaddress');

/**Routes for load US State data */
Route::post('getStateData','AuthController@getStateData');

/**Routes for case module */
Route::post('getCaseById','AuthController@getCaseDetails');
Route::put('updatecase/{id}','AuthController@updateCase');
Route::post('updateCaseData','AuthController@updateCaseData');


/**Routes for Referral codes*/
Route::post('getusersCodes','AuthController@getusersCodes');
Route::post('deleteReferrals','AuthController@deleteReferrals');
Route::post('addReferral','AuthController@addReferral');
Route::post('getReferralById','AuthController@getReferralById');
Route::post('updateReferral','AuthController@updateReferral');

/**Routes for Case Activity Log messages */
Route::post('getActivity','AuthController@getActivity');

/**Routes for Email Template */
Route::post('getTemplateData','AuthController@getTemplateData');
Route::post('getTemplateById','AuthController@getTemplateById');
Route::post('updateTemplate','AuthController@updateTemplate');


/**Routes for Transaction */
Route::post('getTransactionlist','AuthController@getTransactionlist');
Route::post('getTransactionById','AuthController@getTransactionById');

//On Unauthorized Login
Route::get('error', function(){
  return response()->json(['error' => 'Invalid Token']);
})->name('login');
