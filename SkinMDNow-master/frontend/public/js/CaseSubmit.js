/* 
  Login.js
  SkinMdNow

  Created by QuestApple on 8/29/12.
  Copyright (c) 2012 QuestApple. All rights reserved.
*/
jQuery(function() {
    if(jQuery('#drpChiefComplaint option:selected').text()!="" && window.location.href.indexOf("login")<0)
    {
        window.localStorage.setItem("chiefComplaint", jQuery('#drpChiefComplaint option:selected').text());
    }
  /**This function invoke on final submit of case */
  jQuery.fn.fnRealCaseSubmit = function() {
      jQuery('#page_loading').show();
      var dtCaseDate = new Date();
      var intGender = 1;
      window.localStorage.setItem("txtReferralCode", "");
     
      if ((window.localStorage.getItem("codeType")!=""&&window.localStorage.getItem("codeType")!=null)?window.localStorage.getItem("codeType"):window.sessionStorage.getItem("codeType") == null) {
          window.localStorage.setItem("codeType", "DISCOUNT");
      }
      if ((window.localStorage.getItem("txtReferralCode")!=""&&window.localStorage.getItem("txtReferralCode")!=null)?window.localStorage.getItem("txtReferralCode"):window.sessionStorage.getItem("txtReferralCode") == null) {
          window.localStorage.setItem("txtReferralCode", "");
      }

      window.localStorage.setItem("txtReferralCode", "");
      
      if (jQuery('#drpGender option:selected').text() == "Male") {
          intGender = 0;
      }

      if (arrTempAnswer.length > 0) {
          var tempQuestionAnswerList = (window.localStorage.getItem("strQuestionAnswerList")!=""&&window.localStorage.getItem("strQuestionAnswerList")!=null)?window.localStorage.getItem("strQuestionAnswerList"):window.sessionStorage.getItem("strQuestionAnswerList");
          var tempAnswer = "";
          jQuery.each(arrTempAnswer, function(key, value) {
              tempAnswer += value + "|";
          });
          window.localStorage.setItem("strQuestionAnswerList", tempQuestionAnswerList + tempAnswer);
      }

      var skinMDCase = {
          "skinMDCase": {
              "addAccount": {
                  "guidAccountId": (window.localStorage.getItem("guidAccountId")!=""&&window.localStorage.getItem("guidAccountId")!=null)?window.localStorage.getItem("guidAccountId"):window.sessionStorage.getItem("guidAccountId"),
                  "guidParentAccountId": (window.localStorage.getItem("guidCareGiverId")!=""&&window.localStorage.getItem("guidCareGiverId")!=null)?window.localStorage.getItem("guidCareGiverId"):window.sessionStorage.getItem("guidCareGiverId"),
                  "intAccountTypeCode": 2,
                  "intGender": intGender,
                  "strEmail": (window.localStorage.getItem("txtEmail")!=""&&window.localStorage.getItem("txtEmail")!=null)?window.localStorage.getItem("txtEmail"):window.sessionStorage.getItem("txtEmail"),
                  "strErrorMessage": "",
                  "strFirstName": (window.localStorage.getItem("txtFirstName")!=""&&window.localStorage.getItem("txtFirstName")!=null)?window.localStorage.getItem("txtFirstName"):window.sessionStorage.getItem("txtFirstName"),
                  "strMiddleName": (window.localStorage.getItem("txtMiddleName")!=""&&window.localStorage.getItem("txtMiddleName")!=null)?window.localStorage.getItem("txtMiddleName"):window.sessionStorage.getItem("txtMiddleName"),
                  "strLastName": (window.localStorage.getItem("txtLastName")!=""&&window.localStorage.getItem("txtLastName")!=null)?window.localStorage.getItem("txtLastName"):window.sessionStorage.getItem("txtLastName"),
                  "strPassword": "",
                  "strPhone": (window.localStorage.getItem("txtPhone")!=""&&window.localStorage.getItem("txtPhone")!=null)?window.localStorage.getItem("txtPhone"):window.sessionStorage.getItem("txtPhone"),
                  "strAccountDOB": (window.localStorage.getItem("txtDateOfBirth")!=""&&window.localStorage.getItem("txtDateOfBirth")!=null)?window.localStorage.getItem("txtDateOfBirth"):window.sessionStorage.getItem("txtDateOfBirth"),
                  "isHealthProfessional": false,
                  "intRelationToCareGiverId": parseInt((window.localStorage.getItem("drpWhoIsEnteringRequestID")!=""&&window.localStorage.getItem("drpWhoIsEnteringRequestID")!=null)?window.localStorage.getItem("drpWhoIsEnteringRequestID"):window.sessionStorage.getItem("drpWhoIsEnteringRequestID"))
              },
              "AddCase": {
                  "boolOfficeVisitRecommended": false,
                  "dtCaseDate": dtCaseDate.toLocaleDateString(),
                  "guidCareGiverId": (window.localStorage.getItem("guidCareGiverId")!=""&&window.localStorage.getItem("guidCareGiverId")!=null)?window.localStorage.getItem("guidCareGiverId"):window.sessionStorage.getItem("guidCareGiverId"),
                  "guidCaseId": '23141434343434324324',
                  "guidChiefComplaintId": (window.localStorage.getItem("drpChiefComplaintID")!=""&&window.localStorage.getItem("drpChiefComplaintID")!=null)?window.localStorage.getItem("drpChiefComplaintID"):window.sessionStorage.getItem("drpChiefComplaintID"),
                  "guidDiagnosisId": "",
                  "guidDermAddressId": (window.localStorage.getItem("strDermAddressId")!=""&&window.localStorage.getItem("strDermAddressId")!=null)?window.localStorage.getItem("strDermAddressId"):window.sessionStorage.getItem("strDermAddressId"),
                  "guidDoctorId": (window.localStorage.getItem("guidDoctorId")!=""&&window.localStorage.getItem("guidDoctorId")!=null)?window.localStorage.getItem("guidDoctorId"):window.sessionStorage.getItem("guidDoctorId"),
                  "guidPatientId": "",
                  "intConsultingCost": parseFloat((window.localStorage.getItem("strSelectedDoctorPrice")!=""&&window.localStorage.getItem("strSelectedDoctorPrice")!=null)?window.localStorage.getItem("strSelectedDoctorPrice"):window.sessionStorage.getItem("strSelectedDoctorPrice")),
                  "strCaseNumber": "",
                  "strDeviceId": "1256986425863254785",
                  "strDeviceType": "anuvadesk",
                  "strDiagnosis": "",
                  "strErrorMessage": "",
                  "strPhotoList": (window.localStorage.getItem("strPhotoList")!=""&&window.localStorage.getItem("strPhotoList")!=null)?window.localStorage.getItem("strPhotoList"):window.sessionStorage.getItem("strPhotoList"),
                  "strQuestionAnswerList": (window.localStorage.getItem("strQuestionAnswerList")!=""&&window.localStorage.getItem("strQuestionAnswerList")!=null)?window.localStorage.getItem("strQuestionAnswerList"):window.sessionStorage.getItem("strQuestionAnswerList"),
                  "strStatusCode": "",
                  "strBodyMapList": (window.localStorage.getItem("strBodyMap")!=""&&window.localStorage.getItem("strBodyMap")!=null)?window.localStorage.getItem("strBodyMap"):window.sessionStorage.getItem("strBodyMap"),
                  "strRef_id": (window.localStorage.getItem("ref_id")!=""&&window.localStorage.getItem("ref_id")!=null)?window.localStorage.getItem("ref_id"):window.sessionStorage.getItem("ref_id")
              },
              "Payment": {
                  "codeType": (window.localStorage.getItem("codeType")!=""&&window.localStorage.getItem("codeType")!=null)?window.localStorage.getItem("codeType"):window.sessionStorage.getItem("codeType"),
                  "strReferralCode": "", //window.localStorage.getItem("txtReferralCode"),
                  "strSecurityCode": jQuery("#txtVerifyCode").val(),
                  "strExpirationDate": jQuery("#drpCardExpiryYear option:selected").val() + "-" + jQuery("#drpCardExpiryMonth option:selected").val(),
                  "intCreditCardType": jQuery("#drpCardType option:selected").val(),
                  "strCreditCardNumber": jQuery("#txtCreditCardNumber").val(),
                  "strPaymentDescription": "Payment from Mobile",
                  "strPaymentType": "A",
                  "strTransId": "",
                  "strBillingFirstName": (window.localStorage.getItem("txtBillingFirstName")!=""&&window.localStorage.getItem("txtBillingFirstName")!=null)?window.localStorage.getItem("txtBillingFirstName"):window.sessionStorage.getItem("txtBillingFirstName"),
                  "strBillingLastName": (window.localStorage.getItem("txtBillingLastName")!=""&&window.localStorage.getItem("txtBillingLastName")!=null)?window.localStorage.getItem("txtBillingLastName"):window.sessionStorage.getItem("txtBillingLastName"),
                  "strBillingAddress1": (window.localStorage.getItem("txtBillingStreetAddress")!=""&&window.localStorage.getItem("txtBillingStreetAddress")!=null)?window.localStorage.getItem("txtBillingStreetAddress"):window.sessionStorage.getItem("txtBillingStreetAddress"),
                  "strBillingCity": (window.localStorage.getItem("txtBillingCity")!=""&&window.localStorage.getItem("txtBillingCity")!=null)?window.localStorage.getItem("txtBillingCity"):window.sessionStorage.getItem("txtBillingCity"),
                  "strBillingState": (window.localStorage.getItem("drpBillingState")!=""&&window.localStorage.getItem("drpBillingState")!=null)?window.localStorage.getItem("drpBillingState"):window.sessionStorage.getItem("drpBillingState"),
                  "strBillingZipCode": (window.localStorage.getItem("txtBillingZipcode")!=""&&window.localStorage.getItem("txtBillingZipcode")!=null)?window.localStorage.getItem("txtBillingZipcode"):window.sessionStorage.getItem("txtBillingZipcode"),
                  "strAuthorizationCode": "",
                  "strPaymentDate": "",
                  "strErrorMessage": ""
              },
              "strCaseTitle": "",
              "strErrorMessage": ""
          },
          "app_ID": app_ID
      };
      
      jQuery.ajaxSetup({
        headers: {
        'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
        }
      });

      jQuery.ajax({
          url: skinmdserviceURL + "skinMDAddCase",
          type: "POST",
          data: JSON.stringify(skinMDCase),
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: function(result) {

              var strErrorMessage = result.strErrorMessage;

              if (strErrorMessage == "") {
                  jQuery('#page_loading').hide();
                  jQuery("#divPagePharmacyTitle").html("<b>Thank you, your new request has been submitted to " + (window.localStorage.getItem("strSelectedDoctor")!=""&&window.localStorage.getItem("strSelectedDoctor")!=null)?window.localStorage.getItem("strSelectedDoctor"):window.sessionStorage.getItem("strSelectedDoctor") + "<br><br><p style='margin-left: -608px;'>Case#: " + result.strCaseNumber + "<br><br></b><div style='font-size:18px;text-align:justify; margin-left: -268px;'>Please provide some additional useful information below.</div>");
                  jQuery("#divThanks").html("Thank you, this information has also been sent to " + (window.localStorage.getItem("strSelectedDoctor")!=null&&window.localStorage.getItem("strSelectedDoctor")!="")?window.localStorage.getItem("strSelectedDoctor"):window.sessionStorage.getItem("strSelectedDoctor"));
                  window.localStorage.setItem("guidCaseId", result.guidCaseId)
                  window.localStorage.setItem("guidAccountId", result.guidAccountId);

                  jQuery("#backButton").hide();
                  jQuery("#pagePharmacy").show();
                  jQuery("#pageBillingInfo").hide();
                  curr_div.push("#pagePharmacy");
                  prev_div.push("#pageBillingInfo");
              } else {
                  if (strErrorMessage.indexOf("number is invalid") >= 0) {
                      jQuery('#page_loading').hide();
                      alert("The credit card number is invalid.")
                  } else {
                      jQuery('#page_loading').hide();
                      if (strErrorMessage == "Code does not exist" || strErrorMessage == "Invalid referral code entered by user" || strErrorMessage == 'Invalid XML.') {

                          alert("Invalid referral code.");
                      } else {
                         
                          alert("error : " + strErrorMessage);
                      }
                  }
              }

          },
          error: function error(response) {
              jQuery('#page_loading').hide();

             
              alert(strGlobalErrorMessage);

          }


      });
  }

});