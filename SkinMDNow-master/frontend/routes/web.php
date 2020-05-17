<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@index');


Auth::routes(['verify' => true]);

Route::get('/home', 'HomeController@index');
Route::get('/user/verify/{token}', 'Auth\RegisterController@verifyUser');
Route::post('api/getPhysicians1', 'HomeController@getPhysicians1');
Route::post('api/uploadimage','HomeController@uploadimage');
Route::post('api/skinMDAddCase','HomeController@skinMDAddCase');
Route::post('api/savePatientAdditionalDetails','HomeController@savePatientAdditionalDetails');
Route::post('api/getQuestionTemplate','HomeController@getQuestionTemplate');
Route::post('api/saveAdditionalQuestions','HomeController@saveAdditionalQuestions');
Route::post('api/getCaseDetails','HomeController@getCaseDetails');
Route::post('api/updateCasePhotos','HomeController@updateCasePhotos');
Route::get('/term', 'HomeController@term')->name('term');
Route::post('api/addAccount', 'HomeController@addAccount');
Route::post('api/forgotpassword', 'HomeController@forgotPassword');
Route::post('api/getPhysicianFee', 'HomeController@getPhysicianFee');

/**Routes for Authrize Payment Gateway */
Route::get('/checkout', 'AuthorizeController@index');
Route::post('/checkout', 'AuthorizeController@chargeCreditCard');
