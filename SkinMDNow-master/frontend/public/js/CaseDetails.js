function getCaseDetails(caseGuid) {
    window.localStorage.setItem("this_case_id", caseGuid);
    jQuery('#divReportImagePopup').hide();
    jQuery('#add_photo').hide();
    jQuery('#page_loading').show();
    var tempLocalDate = new Date();
    var skinMDCaseDetails = {
        "guidCaseId": caseGuid,
        "strTimezoneOffset": tempLocalDate.getTimezoneOffset(),
        "app_ID": app_ID
    };

    jQuery.ajaxSetup({
        headers: {
        'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
        }
    });

    jQuery.ajax({
        url: skinmdserviceURL + "getCaseDetails",
        type: "POST",
        data: JSON.stringify(skinMDCaseDetails),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(result) {

            if (result.strErrorMessage == "" || result.strErrorMessage == "null" || result.strErrorMessage == null) {
                window.localStorage.setItem("add_physician_id", result.physician.guidPhysicianId);

                jQuery("#spanHospitalName").html(result.physician.strHospital);
                jQuery("#spanDoctorName").html(result.physician.strFirstName + " " + result.physician.strLastName + ", " + result.physician.strDegree);
                jQuery("#spanCaseDate").html(result.strCaseDate);
                if (result.strPatientInstructions == "" || result.strPatientInstructions == null) {
                    jQuery("#spanPatientInfo").html("<i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;None</i>");
                } else {
                    jQuery("#spanPatientInfo").html(result.strPatientInstructions);
                }
                var pat_name = result.patientQuestionAnswer.patientDetails.strPatientName;
                //debugger
                pat_name = pat_name.replace(',', "");
                jQuery("#spanLastFirstName").html(pat_name);
                if (result.strCaseCloseDate != null && result.strCaseCloseDate != "") {
                    jQuery("#spanCompletedOn").html("<b>Completed on:</b>&nbsp;" + result.strCaseCloseDate + "<br>");
                } else {
                    jQuery("#spanCompletedOn").html(" ");
                }
                jQuery("#spanDOB").html(" " + isNull(result.strPatientDOB));

                if (result.patientQuestionAnswer.patientDetails.intGender == 0) {
                    jQuery("#spanGender").html("Male");
                } else {
                    jQuery("#spanGender").html("Female");
                }

                jQuery("#spanSubmittedBy").html(result.strCareGiverFullName);

                showBodyParts(result.patientQuestionAnswer.strBodyMapList);

                if (result.intConsultingCost != null && result.intConsultingCost != "") {

                    jQuery("#spanBillingAmount").html("$" + Math.round(result.intConsultingCost) + "<br>");

                } else {
                    jQuery("#spanBillingAmount").html("$" + Math.round(result.intConsultingCost) + "<br>");

                }


                if (result.strCouponCode == null || result.strCouponCode == '') {
                    var x = 'referral';
                } else {
                    var x = result.strCouponCode.charAt(0);
                }

                if ((result.strCouponCode == null || result.strCouponCode == '') && (result.strReferralCode == null || result.strReferralCode == '')) {
                    jQuery("#spanBillingMethod").html("Credit Card <br>");

                } else if (x == '%' || x == '$' || x == '#') {
                    jQuery("#spanBillingMethod").html("Credit Card  [" + result.strReferralCode + "]<br>");
                } else {
                    jQuery("#spanBillingMethod").html("Referral [" + result.strReferralCode + "]<br>");
                }



                if (result.strChiefComplaint != null && result.strChiefComplaint != "") {
                    jQuery("#spanChiefComplaint").html("<b>What do you need help with?</b><br><ol class='bullet' style='margin-left:1px;'><li>" + result.strChiefComplaint + "</li></ol><br>");
                }

                showPhotos(result.casePhotos.listPhotos);
                showQuestionAnswer(result.patientQuestionAnswer.listQuestions);

                showRX(result.listCaseRx);

                showAllergies(result.listDrugAllergies);
                showFamilyMedicalHistory(result.listFamilyMedicalHistory);
                showMedicalHistory(result.listMedicalHistory);
                showCurrentMedicine(result.listCurrentMedicine);


                jQuery("#backButton").show();
                jQuery("#pageOldRequestDetail").show();
                jQuery("#pageOldRequest").hide();
                curr_div.push("#pageOldRequestDetail");
                prev_div.push("#pageOldRequest");
            } else {
               
            }
            jQuery('#page_loading1').hide();
            jQuery('#page_loading').hide();

        },
        error: function error(response) {
            jQuery('#page_loading1').hide();
            jQuery('#page_loading').hide();
            

        }
    });
}

function showBodyParts(strBodyMapList) {
    jQuery("#listBodyParts").html("");

    if (strBodyMapList != null && strBodyMapList != "" && strBodyMapList.indexOf(",") == -1) {
        jQuery("#listBodyParts").append("<li>" + strBodyMapList + "</li>");
    } else if (strBodyMapList != null && strBodyMapList != "" && strBodyMapList.indexOf(",") >= 0) {
        var arrBodyParts = strBodyMapList.split(",");
        jQuery.each(arrBodyParts, function(key, value) {
            jQuery("#listBodyParts").append("<li>" + value + "</li>");
        });
    } else {
        jQuery("#listBodyParts").html("<i>None</i>");
    }

}

function showAllergies(listDrugAllergies) {
    jQuery("#listAllergies").html("");

    if (listDrugAllergies.length > 0) {
        jQuery.each(listDrugAllergies, function(key, value) {
            jQuery("#listAllergies").append("<li>" + value.strName + "</li>");
        });
    } else {
        jQuery("#listAllergies").html("<i>None</i>");
    }
}

function showFamilyMedicalHistory(listFamilyMedicalHistory) {
    jQuery("#listFamilyMedicalHistory").html("");

    if (listFamilyMedicalHistory.length > 0) {
        jQuery.each(listFamilyMedicalHistory, function(key, value) {
            jQuery("#listFamilyMedicalHistory").append("<li>" + value.strName + "</li>");
        });
    } else {
        jQuery("#listFamilyMedicalHistory").html("<i>None</i>");
    }
}

function showMedicalHistory(listPatientMedicalHistory) {
    jQuery("#listPatientMedicalHistory").html("");

    if (listPatientMedicalHistory.length > 0) {
        jQuery.each(listPatientMedicalHistory, function(key, value) {
            jQuery("#listPatientMedicalHistory").append("<li>" + value.strName + "</li>");
        });
    } else {
        jQuery("#listPatientMedicalHistory").html("<i>None</i>");
    }
}

function showCurrentMedicine(listCurrentMedicine) {
    jQuery("#listCurrentMedicine").html("");

    if (listCurrentMedicine.length > 0) {
        jQuery.each(listCurrentMedicine, function(key, value) {
            jQuery("#listCurrentMedicine").append("<li>" + value.strName + "</li>");
        });
    } else {
        jQuery("#listCurrentMedicine").html("<i>None</i>");
    }
}

function showQuestionAnswer(listQuestionAnswer) {
    jQuery("#spanQuestionAnswer").html("");

    if (listQuestionAnswer.length > 0) {
        var varQuestionAnswer = "";

        jQuery.each(listQuestionAnswer, function(key, value) {
            if (value.strQuestionName.indexOf("_") == -1) {
                varQuestionAnswer += "<span class='reportLabel' style='font-weight:bold;'>" + value.strQuestionName + "</span><br>";
                var arrOptions = [];
                jQuery.each(value.listOptions, function(optionKey, optionValue) {
                    arrOptions.push(optionValue.strOptionName);
                });
                varQuestionAnswer += "<ol class='bullet'><li>" + arrOptions.toString() + "</li></ol><br>";
            }
        });
        varQuestionAnswer += "</table>";

        jQuery("#spanQuestionAnswer").html(varQuestionAnswer);
    }
}

function showPhotos(listPhotos) {
    jQuery("#listPhotos").html("");

    if (listPhotos.length > 0) {
        jQuery('#divReportImagePopup').hide();
        jQuery.each(listPhotos, function(key, value) {
            jQuery("#listPhotos").append("<li strUrl='" + value.strUrl + "' strTitle='" + value.strTitle + "' onclick='showReportImagePopup(this)'><u>" + value.strTitle + "</u><br><br></li>");

        });
    } else {
        jQuery("#listPhotos").html("<i>None</i><br>");
    }
}

function showReportImagePopup(obj) {
//  jQuery(obj).attr("strUrl").substr(0,jQuery(obj).attr("strUrl").length-1)
    var imgPath = "";
    var arr = jQuery(obj).attr("strUrl").split(",");
    if(arr.length > 0){
        imgPath = arr[0];
    } else {
        imgPath = jQuery(obj).attr("strUrl");
    }
    jQuery("#divReportImagePopupInner").html("<center><img width='250px'  height='250px' src='" + imgPath  + "'><br><br><b style='font-size:16px'>" + jQuery(obj).attr("strTitle") + "</center></b>");

    jQuery('#divReportImagePopup').show();
}


function showRX(listCaseRx) {
    jQuery("#listTreatment").html("");
    jQuery("#spanPharmacy").html("");
    var strPharmacy = "";
    var strPharmacyFax = "";
    if (listCaseRx.length > 0) {

        jQuery.each(listCaseRx, function(key, value) {
            if (value.strPrescription != null) {
                jQuery("#listTreatment").append("<li>" + value.strPrescription + "</li>");
            }
            if (strPharmacy == "" && value.strPharmacyName != null && value.strPharmacyName != "") {
                strPharmacy = value.strPharmacyName;
            }
            if (value.strPharmacyFax != null && value.strPharmacyFax != "") {
                strPharmacyFax = "Fax:&nbsp;" + value.strPharmacyFax;
            }
        });
        if (strPharmacy != "") {
            jQuery("#spanPharmacy").html("<b>Pharmacy : </b><br><ol class='bullet'><li>" + strPharmacy + "<br>" + strPharmacyFax + "</li></ol><br>");
        }

        if (jQuery("#listTreatment").find('li').length == 0) {
            jQuery("#listTreatment").html("<i>None</i>");
        }
    } else {
        jQuery("#listTreatment").html("<i>None</i>");
    }
}

function showDX(listCaseDx) {
    jQuery("#listDiagnose").html("");

    if (listCaseDx.length > 0) {
        jQuery.each(listCaseDx, function(key, value) {
            jQuery("#listDiagnose").append("<li>" + value.strDiagnosis + "</li>");
        });
    } else {
        jQuery("#listDiagnose").html("<i>None</i>");
    }
}