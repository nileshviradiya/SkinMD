var arrAllergies = [];
var arrFamilyMedicalHistory = [];
var arrCurrentMedicine = [];
var arrPatientMedicalHistory = [];
var arrTempAnswer = [];
var arrTempQuestions = [];
var curr_div = [];
var prev_div = [];
var paymentdivload = 0;
var noclearstore = 0;
var couponapplied = 1;
var allergy_counter = 0;
var ph_faxnum;
jQuery(function() {

    jQuery('#pageAffectedAreaMale').live('pagebeforeshow', function(event, ui) {


        var args = getUrlVars();
        if (args["reload"] == "yes") {
            jQuery("#divMaleFemaleButtons").fadeIn('fast');
            jQuery("#divMaleBody,.btnGotoMaleFront,#btnProceed,#divMaleFace,#divMaleChestAndStomach,#divMaleLeftHand,#divMaleRightHand,#divMaleLeftArm,#divMaleRightArm, #divMaleRightLeg,#divMaleLeftLeg,#divMaleLeftFoot,#divMaleRightFoot,#divMaleGenitalia,#divFemaleFace,#divFemaleChestAndStomach,#divFemaleLeftHand,#divFemaleRightHand,#divFemaleLeftArm,#divFemaleRightArm,#divFemaleLeftLeg,#divFemaleRightLeg,#divFemaleLeftFoot,#divFemaleRightFoot,#divFemaleGenitalia").hide();
        }
        if ((window.localStorage.getItem("isFromFirstPage") != null && window.localStorage.getItem("isFromFirstPage") != "") ? window.localStorage.getItem("isFromFirstPage") : window.sessionStorage.getItem("isFromFirstPage") == 'yes') {
            jQuery.fn.deselectAll();
            arrSelectedBodyParts = [];
        }

    });

});

function removeAllTableRows(tableName) {
    var table = document.getElementById(tableName);
    for (var i = table.rows.length - 1; i > -1; i--) {
        table.deleteRow(i);
    }
}

function fillPharmacyPageData(patientIndex) {

    var tempPatientData = [];
    var patientData = [];
    tempPatientData = JSON.parse((window.localStorage.getItem("strPatientList") != null && window.localStorage.getItem("strPatientList") != "") ? window.localStorage.getItem("strPatientList") : window.sessionStorage.getItem("strPatientList"));
    patientData = tempPatientData[patientIndex];

    removeAllTableRows("tblAllergies");
    removeAllTableRows("tblPatientMedicalHistory");
    removeAllTableRows("tblFamilyMedicalHistory");
    removeAllTableRows("tblCurrentMedicine");


    //*** Disable insurance for now.

    //jQuery("#txtHealthInsuranceGroup").val(patientData.insurance.strInsuranceGroup);
    //jQuery("#txtHealthInsuranceInsuranceID").val(patientData.insurance.strInsuranceIdentifier);
    //jQuery("#txtHealthInsuranceCompany").val(patientData.insurance.strInsuranceCompany);

    if (patientData.listDrugAllergies.length > 0) {
        jQuery.each(patientData.listDrugAllergies, function(key, value) {
            createMe("tblAllergies", value.strName);
        });
    }
    if (patientData.listMedicalHistory.length > 0) {
        jQuery.each(patientData.listMedicalHistory, function(key, value) {
            createMe("tblPatientMedicalHistory", value.strName);
        });
    }
    if (patientData.listFamilyMedicalHistory.length > 0) {
        jQuery.each(patientData.listFamilyMedicalHistory, function(key, value) {
            createMe("tblFamilyMedicalHistory", value.strName);
        });
    }
    if (patientData.listCurrentMedicine.length > 0) {
        jQuery.each(patientData.listCurrentMedicine, function(key, value) {
            createMe("tblCurrentMedicine", value.strName);
        });
    }
    if (patientData.listPharmacies.length > 0) {

        jQuery("#drpPharmacy").empty();
        jQuery("#drpPharmacy").append("<option value=''>Existing Pharmacy</option>");
        jQuery.each(patientData.listPharmacies, function(key, value) {

            var strPharmacyName = "";
            if (value.strPharmacyFax != null && value.strPharmacyFax != "") {
                strPharmacyName = isNull(value.strLastName) + " - " + value.strPharmacyFax;
            } else {
                strPharmacyName = isNull(value.strLastName);
            }
            jQuery("#drpPharmacy").append("<option value=' 'style='margin-left:41px; width:331px;" + value.guidAccountId + "'>" + strPharmacyName + "</option>");
        });
        jQuery("#divExistingPharmacy").show();
    } else {
        jQuery("#drpPharmacy").empty();
        jQuery("#divExistingPharmacy").hide();
    }

}

function selectPharmacy() {
    document.getElementById('divSelectedPharmacy').innerHTML = '';
    window.localStorage.setItem("guidPharmacyId", jQuery('#drpPharmacy option:selected').val());
}

jQuery(function() {


    jQuery('.pageAftdNext').click(function(e) {

        jQuery.fn.showSelected();
        arrSelectedBodyPartsName = [];
        jQuery.each(arrSelectedBodyParts, function() {
            arrSelectedBodyPartsName.push(jQuery(this).attr('title'));
        });

        window.localStorage.setItem("strBodyMap", arrSelectedBodyPartsName.join("~"));

        window.localStorage.setItem("indirectLoginSucess-strBodyMap", arrSelectedBodyPartsName.join("~"));

        jQuery("#backButton").show();
        jQuery("#pagePhoto").show();
        jQuery("#pageAffectedArea").toggle();
        curr_div.push("#pagePhoto");
        prev_div.push("#pageAffectedArea");
    });

    jQuery("#drpWhoIsEnteringRequest").change(function() {
        var selectedvalue = jQuery("#drpWhoIsEnteringRequest option:selected").text();


    });



    jQuery('.btnPatientProceed').click(function(e) {
        jQuery('.divSubmitToDoctor').text('Submit request to ' + (window.localStorage.getItem("strSelectedDoctor") != null && window.localStorage.getItem("strSelectedDoctor") != "") ? window.localStorage.getItem("strSelectedDoctor") : window.sessionStorage.getItem("strSelectedDoctor"));
        DestroyCalendar();
        if (jQuery('#drpWhoIsEnteringRequest option:selected').val() == "" || jQuery('#drpWhoIsEnteringRequest option:selected').val() == null) {
            alert("Please enter required information about the patient.");
            return false;
        } else if (jQuery('#drpExistingPatients option:selected').text() == "" || jQuery('#drpExistingPatients option:selected').text() == null) {
            alert("Please enter required information about the patient.");
            return false;
        } else if (jQuery('#txtFirstName').val() == "" || jQuery('#txtFirstName').val() == null) {
            alert("Please enter patient's first name.");
            return false;
        } else if (jQuery('#txtDateOfBirth').val() == "" || jQuery('#txtDateOfBirth').val() == null) {
            alert("Please enter date of birth.");
            return false;
        } else if (jQuery('#txtLastName').val() == "" || jQuery('#txtLastName').val() == null) {
            alert("Please enter patient's last name.");
            return false;
        } else if (jQuery('#txtEmail').val() == "" || jQuery('#txtEmail').val() == null) {
            alert("Please enter email address where doctor’s reply will be sent.");
            return false;
        } else if (jQuery('#txtPhone').val() == "" || jQuery('#txtPhone').val() == null || jQuery('#txtPhone').val().length < 10 || isNaN(jQuery('#txtPhone').val())) {

            alert("Please enter phone # (with area code) which a doctor may use.");
            return false;

        }

        var tempQuestionTemplate = JSON.parse(window.sessionStorage.getItem("strQuestionTemplate"));
        var tempMinAge = tempQuestionTemplate.intMinAge;
        var tempMaxAge = tempQuestionTemplate.intMaxAge;

        var strAge = checkAge(jQuery('#txtDateOfBirth').val());

        if (strAge == false || (strAge < 18 && jQuery('#drpWhoIsEnteringRequest option:selected').text() == "Self")) {
            alert("If you are less than 18 years of age, please have a parent or guardian submit this request.");
            return false;
        }

        if (strAge != false && strAge >= tempMinAge && strAge <= tempMaxAge && jQuery('#drpGender option:selected').text() == "Female") {

            if (tempQuestionTemplate.listQuestions.length > 0) {
                var tmpScreen = "";
                jQuery.each(tempQuestionTemplate.listQuestions, function(key, value) {
                    if (value.strQuestionType == "Dropdown") {
                        tmpScreen += "<br>" + value.strQuestionName + "<br>";
                        tmpScreen += "<br><span id='requiredbtn' style=''><select id='p_" + value.guidQuestionId + "' onchange='storeTempAnswer(this)' class='required'>";
                        tmpScreen += "<option id=''></option>";
                        jQuery.each(value.listOptions, function(questionKey, questionValue) {
                            tmpScreen += "<option id='PO_" + questionValue.guidOptionId + "'>" + questionValue.strOptionName + "</option>";
                        });
                        tmpScreen += "</select></span>";
                    }
                    /* tmpScreen += "<br><br><a href='javascript:;'  class='buttonNext buttNex' style=' cursor: pointer;background-color: #312769;border-radius:5px;margin-left: 190px;text-decoration:none;color: #FFFFFF !important; float: left;padding:10px 20px;font-family:\' robot,sens-serif\'; ' onclick='goBackToPatientScreen(true)'> OK </a> "; */

                });

                jQuery("#divTempQuestion").html(tmpScreen);

                jQuery("#pageTempQuestion").show();
                jQuery("#pagePatientInfo").hide();
                curr_div.push("#pageTempQuestion");
                prev_div.push("#pagePatientInfo");

                return false;

            } else {

                goBackToPatientScreen(false);

            }
        } else {

            goBackToPatientScreen(false);

        }




    });


    jQuery('.pageTellUsMoreBtnProceed').click(function(e) {
        var loggedIn = $('#loggedInTemp').val();
        if (loggedIn == "false") {
            var origin = window.location.origin;
            origin = origin + '/frontend/public/index.php/login';


            jQuery('#loginRedirect').attr('val', origin);
            window.localStorage.setItem('directLogin', 'true');


            var a = [];
            jQuery("#drpDescribeProblem1 option:selected").each(function() {
                a.push(jQuery(this).val());
            });
            var strDescribeProblem1 = a.join('~');
            strDescribeProblem1 = strDescribeProblem1.replace(/,([^,]*)$/, '~' + '$1');

            var b = [];
            jQuery("#drpDescribeProblem2 option:selected").each(function() {
                b.push(jQuery(this).val());
            });
            var strDescribeProblem2 = b.join('~');
            strDescribeProblem2 = strDescribeProblem2.replace(/,([^,]*)$/, '~' + '$1');

            window.localStorage.setItem("drpChiefComplaint", jQuery('#drpChiefComplaint option:selected').text());
            window.localStorage.setItem("drpChiefComplaintID", jQuery('#drpChiefComplaint option:selected').val());


            window.localStorage.setItem("indirectLoginSucess-drpChiefComplaint", jQuery('#drpChiefComplaint option:selected').text());
            window.localStorage.setItem("indirectLoginSucess-drpChiefComplaintID", jQuery('#drpChiefComplaint option:selected').val());

            window.localStorage.setItem("strQuestionAnswerList",
                "time_of_issue1~" + jQuery("#drpHowLong1 option:selected").val() + "|" +
                "time_of_issue2~" + jQuery("#drpHowLong2 option:selected").val() + "|" +

                "type_of_problem1~" + strDescribeProblem1 + "|" +
                "type_of_problem2~" + strDescribeProblem2 + "|" +
                "biopsied_or_excised~" + jQuery("#drpBiopsied option:selected").val() + "|");


            window.localStorage.setItem("indirectLoginSucess-strQuestionAnswerList",
                "time_of_issue1~" + jQuery("#drpHowLong1 option:selected").val() + "|" +
                "time_of_issue2~" + jQuery("#drpHowLong2 option:selected").val() + "|" +

                "type_of_problem1~" + strDescribeProblem1 + "|" +
                "type_of_problem2~" + strDescribeProblem2 + "|" +
                "biopsied_or_excised~" + jQuery("#drpBiopsied option:selected").val() + "|");


            for (var i = 0; i < localStorage.length; i++) {
                window.sessionStorage.setItem(localStorage.key(i), localStorage.getItem(localStorage.key(i)));
            }


            if ((window.localStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == null ||
                    window.localStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "" ||
                    window.localStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "undefined") ||
                (window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == null ||
                    window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "" ||
                    window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "undefined")) {
                alert("Please answer - 'What do you need help with?'");
            } else {

                jQuery("#pageTellUsMore").hide();
                // jQuery("#pageDoctorSelectionSearch").show();

                curr_div.push("#pageDoctorSelectionSearch");
                prev_div.push("#pageTellUsMore");


                sessionStorage.setItem('curr_div', curr_div);
                sessionStorage.setItem('prev_div', prev_div);

                window.location.href = origin;
            }
        } else {
            //alert('282');
            localStorage.setItem('directLogin', 'false');
            var a = [];
            jQuery("#drpDescribeProblem1 option:selected").each(function() {
                a.push(jQuery(this).val());
            });
            var strDescribeProblem1 = a.join('~');
            strDescribeProblem1 = strDescribeProblem1.replace(/,([^,]*)$/, '~' + '$1');

            var b = [];
            jQuery("#drpDescribeProblem2 option:selected").each(function() {
                b.push(jQuery(this).val());
            });
            var strDescribeProblem2 = b.join('~');
            strDescribeProblem2 = strDescribeProblem2.replace(/,([^,]*)$/, '~' + '$1');


            window.localStorage.setItem("drpChiefComplaint", jQuery('#drpChiefComplaint option:selected').text());
            window.localStorage.setItem("drpChiefComplaintID", jQuery('#drpChiefComplaint option:selected').val());

            window.localStorage.setItem("strQuestionAnswerList",
                "time_of_issue1~" + jQuery("#drpHowLong1 option:selected").val() + "|" +
                "time_of_issue2~" + jQuery("#drpHowLong2 option:selected").val() + "|" +

                "type_of_problem1~" + strDescribeProblem1 + "|" +
                "type_of_problem2~" + strDescribeProblem2 + "|" +
                "biopsied_or_excised~" + jQuery("#drpBiopsied option:selected").val() + "|");

            // if ((window.localStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == null ||
            // window.localStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "" ||
            // window.localStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "undefined") || 
            // (window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == null ||
            // window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "" ||
            // window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "undefined")) {
            if (jQuery("#drpChiefComplaint").val() == "") {

                //if ((window.localStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == null ||
                //window.localStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "" ||
                //window.localStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "undefined") || 
                //(window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == null ||
                //window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "" ||
                //window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "undefined") || jQuery("#drpChiefComplaint").val()=="") { 
                alert("Please answer - 'What do you need help with?'");
            } else {

                jQuery("#pageTellUsMore").hide();
                jQuery("#pageDoctorSelectionSearch").show();

                curr_div.push("#pageDoctorSelectionSearch");
                prev_div.push("#pageTellUsMore");
            }
        }

    });


    jQuery('#btnOldRequests').click(function(e) {

        jQuery("#pageOldRequest").show();
        jQuery("#pageIndex").hide();
        curr_div.push("#pageOldRequest");
        prev_div.push("#pageIndex");
    });

    jQuery('#btnAnnouncements,.ann_ind').click(function(e) {

        jQuery("#pageAnnouncements").show();
        jQuery("#pageIndex").hide();
        curr_div.push("#pageAnnouncements");
        prev_div.push("#pageIndex");
    });


    jQuery('#btnProceed2PatientInfoPage').click(function(e) {
        couponapplied = 1;
        if (jQuery('#drpselectfavoritesDoctor option:selected').text() != "") {

            window.localStorage.setItem("strSelectedDoctor", jQuery('#drpselectfavoritesDoctor option:selected').text());
            window.localStorage.setItem("guidDoctorId", jQuery('#drpselectfavoritesDoctor option:selected').val());
            window.localStorage.setItem("strSelectedDoctorPrice", jQuery('#drpselectfavoritesDoctor option:selected').attr("price"));
            window.localStorage.setItem("strSelectedDoctorState", jQuery('#drpselectfavoritesDoctor option:selected').attr("state"));
            window.localStorage.setItem("strSelectedDoctordegree", jQuery('#drpselectfavoritesDoctor option:selected').attr("degree"));

            //alert(window.localStorage.getItem("strSelectedDoctorPrice"));	


            // jQuery("#divCreditCardHeading").html("" + (window.localStorage.getItem("strSelectedDoctor") != null && window.localStorage.getItem("strSelectedDoctor") != "") ? window.localStorage.getItem("strSelectedDoctor") : window.sessionStorage.getItem("strSelectedDoctor") + " has a fee of $" + (window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") + ". Your credit card will be charged a total of $" + (window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") + ".<span class='apply_code'>Apply Code</span>");

            jQuery("#divCreditCardHeading").html(` 
            ${(window.localStorage.getItem("strSelectedDoctor") != null && window.localStorage.getItem("strSelectedDoctor") != "") ? window.localStorage.getItem("strSelectedDoctor") : window.sessionStorage.getItem("strSelectedDoctor")}has a fee of $ ${(window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice")}. Your credit card will be charged a total of $ ${(window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice")}.<span class='apply_code'>Apply Code</span>`);

            if ((window.localStorage.getItem("isLoggedIn") != null && window.localStorage.getItem("isLoggedIn") != "") ? window.localStorage.getItem("isLoggedIn") : window.sessionStorage.getItem("isLoggedIn") == "true" || window.sessionStorage.getItem("isLoggedIn") == "true") {

                jQuery("#pagePatientInfo").show();
                jQuery("#pageDoctorSelectionSearch").hide();

                curr_div.push("#pagePatientInfo");
                prev_div.push("#pageDoctorSelectionSearch");
            } else {

                paymentdivload = 1;
                jQuery("#btnLogin").html('Login');
                jQuery("#pageDoctorSelectionSearch").hide();
                jQuery("#pageLogin").show();
            }

        } else {
            alert("Please select a doctor");
        }
    });

    jQuery('.apply_coupon').click(function() {
        jQuery("#divcouponCodenew").show();
    });

    jQuery('.btnProceed2PatientInfoPage').click(function() {
        couponapplied = 1;

        window.localStorage.setItem("strSelectedDoctor", jQuery(this).attr('data'));
        window.localStorage.setItem("guidDoctorId", jQuery(this).attr('data'));
        if ((window.localStorage.getItem("isLoggedIn") != null && window.localStorage.getItem("isLoggedIn") != "") ? window.localStorage.getItem("isLoggedIn") : window.sessionStorage.getItem("isLoggedIn") == "true") {
            jQuery("#pagePatientInfo").show();
        } else {
            paymentdivload = 1;
            jQuery("#pageLoginScreen").show();
            prev_div.push("#pageDoctorSelectionSearch");
        }
    });

    jQuery('#pageBillingInfo').on('pagebeforeshow', function(event, ui) {
        // alert();
        changeLoginLogoutText('pageBillingInfo');
        // jQuery("#divCreditCardHeading").html("" + (window.localStorage.getItem("strSelectedDoctor")!=null&&window.localStorage.getItem("strSelectedDoctor")!="")?window.localStorage.getItem("strSelectedDoctor"):window.sessionStorage.getItem("strSelectedDoctor") + " has a fee of $" + (window.localStorage.getItem("strSelectedDoctorPrice")!=null&&window.localStorage.getItem("strSelectedDoctorPrice")!="")?window.localStorage.getItem("strSelectedDoctorPrice"):window.sessionStorage.getItem("strSelectedDoctorPrice") + ". Your credit card will be charged a total of $" + (window.localStorage.getItem("strSelectedDoctorPrice")!=null&&window.localStorage.getItem("strSelectedDoctorPrice")!="")?window.localStorage.getItem("strSelectedDoctorPrice"):window.sessionStorage.getItem("strSelectedDoctorPrice") + ".<span class='apply_code'>Apply Code</span>");


        if ((window.localStorage.getItem("strWhoHasEnteredRequest") != null && window.localStorage.getItem("strWhoHasEnteredRequest") != "") ? window.localStorage.getItem("strWhoHasEnteredRequest") : window.sessionStorage.getItem("strWhoHasEnteredRequest") != "Healthcare Professional") {
            jQuery('#divReferralCode').hide();
            jQuery('#divCreditCard').trigger("expand");
        } else {
            jQuery('#divReferralCode').fadeIn();
            jQuery('#divCreditCard').fadeIn();
            jQuery('#divReferralCode').trigger("expand");
        }
        jQuery('#btnBillingProceedReferral').html("Submit request to ");
    });


    jQuery('#btnBillingProceedCoupon').click(function(e) {
        if (couponapplied == 1) {

            jQuery('#page_loading').show();
            if (jQuery('#txtcouponCode').val() != "") {
                var couponcode = jQuery('#txtcouponCode').val();

                window.localStorage.setItem("txtReferralCode", couponcode);

                var CouponHelper = {
                    "doctorBaseFees": (window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice"),
                    "guidDoctorId": (window.localStorage.getItem("guidDoctorId") != null && window.localStorage.getItem("guidDoctorId") != "") ? window.localStorage.getItem("guidDoctorId") : window.sessionStorage.getItem("guidDoctorId"),
                    "strReferralCode": jQuery('#txtcouponCode').val(),
                    "codeType": "DISCOUNT",
                    "app_ID": app_ID
                };
                jQuery.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
                    }
                });
                jQuery.ajax({
                    url: skinmdserviceURL + "getPhysicianFee",
                    type: "POST",
                    data: JSON.stringify(CouponHelper),
                    contentType: "application/json; charset=utf-8",
                    // dataType: "json",
                    success: function(result) {
                        if (result.strErrorMessage == "" || result.strErrorMessage == null) {
                            jQuery('#page_loading').hide();
                            var doctor_fees_to_debit = result.physicianFees;
                            if (doctor_fees_to_debit > 0) {
                                window.localStorage.setItem("strSelectedDoctorPrice", doctor_fees_to_debit);
                                jQuery("#divCreditCardHeading").html("" + (window.localStorage.getItem("strSelectedDoctor") != null && window.localStorage.getItem("strSelectedDoctor") != "") ? window.localStorage.getItem("strSelectedDoctor") : window.sessionStorage.getItem("strSelectedDoctor") + " has a fee of $" + (window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") + ". Your credit card will be charged a total of $" + (window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") + ".");
                            } else {
                                doctor_fees_to_debit = 0;
                                window.localStorage.setItem("strSelectedDoctorPrice", doctor_fees_to_debit);
                                jQuery("#divCreditCardHeading").html("" + (window.localStorage.getItem("strSelectedDoctor") != null && window.localStorage.getItem("strSelectedDoctor") != "") ? window.localStorage.getItem("strSelectedDoctor") : window.sessionStorage.getItem("strSelectedDoctor") + " has a fee of $" + (window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") + ". Your credit card will not be charged. However, we still need you to fill the information requested below for verification purposes.");
                            }
                            couponapplied = 0;
                            window.localStorage.setItem("codeType", "DISCOUNT");
                            window.localStorage.setItem("ref_id", result.ref_id);
                            alert("Code Applied Successfully!");
                            jQuery("#divcouponCodenew").toggle();
                        } else {
                            // alert("DISCOUNT");
                            window.localStorage.setItem("codeType", "DISCOUNT");
                            //window.localStorage.setItem("codeType", "");
                            window.localStorage.setItem("txtReferralCode", "");

                            jQuery('#page_loading').hide();

                            alert(result.strErrorMessage);

                        }

                    },
                    error: function error(response) {
                        jQuery('#page_loading').hide();

                        var obj = jQuery.parseJSON(response.responseText);

                        if (obj.Message == "Invalid XML.") {
                            alert("Invalid coupon code.");
                        } else {
                            alert('Error :' + strGlobalErrorMessage);
                        }

                    }
                });

            } else {
                jQuery('#page_loading').hide();
                alert("Please enter the Coupon Code");
            }

        } else {
            alert('Coupon already applied.');
        }
    });


    function cent_discount(dsc) {
        console.log(dsc);
        var doctor_fees_to_debit = (window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") - ((window.localStorage.getItem("strSelectedDoctorPrice") != "" && window.localStorage.getItem("strSelectedDoctorPrice") != null) ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") * (dsc / 100));

        window.localStorage.setItem("strSelectedDoctorPrice", doctor_fees_to_debit);
        jQuery("#divCreditCardHeading").html("" + (window.localStorage.getItem("strSelectedDoctor") != null && window.localStorage.getItem("strSelectedDoctor") != "") ? window.localStorage.getItem("strSelectedDoctor") : window.sessionStorage.getItem("strSelectedDoctor") + ", " + (window.localStorage.getItem("strSelectedDoctordegree") != null && window.localStorage.getItem("strSelectedDoctordegree") != "") ? window.localStorage.getItem("strSelectedDoctordegree") : window.sessionStorage.getItem("strSelectedDoctordegree") + " has a fee of $" + (window.localStorage.getItem("strSelectedDoctorPrice") != "" && window.localStorage.getItem("strSelectedDoctorPrice") != null) ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") + ". Your credit card will be charged a total of $" + (window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") + ".");

        alert("Coupon Applied Successfully!");
        jQuery("#divcouponCode").trigger("click");
        jQuery("#divCreditCard").trigger("click");
    }



    function fix_discount(dsc) {
        console.log(dsc);
        var doctor_fees_to_debit = (window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") - dsc;

        window.localStorage.setItem("strSelectedDoctorPrice", doctor_fees_to_debit);
        jQuery("#divCreditCardHeading").html("" + (window.localStorage.getItem("strSelectedDoctor") != null && window.localStorage.getItem("strSelectedDoctor") != "") ? window.localStorage.getItem("strSelectedDoctor") : window.sessionStorage.getItem("strSelectedDoctor") + ", " + (window.localStorage.getItem("strSelectedDoctordegree") != null && window.localStorage.getItem("strSelectedDoctordegree") != "") ? window.localStorage.getItem("strSelectedDoctordegree") : window.sessionStorage.getItem("strSelectedDoctordegree") + " has a fee of $" + (window.localStorage.getItem("strSelectedDoctorPrice") != "" && window.localStorage.getItem("strSelectedDoctorPrice") != null) ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") + ". Your credit card will be charged a total of $" + (window.localStorage.getItem("strSelectedDoctorPrice") != null && window.localStorage.getItem("strSelectedDoctorPrice") != "") ? window.localStorage.getItem("strSelectedDoctorPrice") : window.sessionStorage.getItem("strSelectedDoctorPrice") + ".");
        alert("Coupon Applied Successfully!");
        jQuery("#divcouponCode").trigger("click");
        jQuery("#divCreditCard").trigger("click");
    }


    jQuery('#btnBillingProceedReferral').click(function(e) {
        if (jQuery('#txtReferralCode').val() != "") {
            jQuery('#page_loading').show();
            window.localStorage.setItem("codeType", "REFERRAL");

            // window.localStorage.setItem("strSelectedDoctorPrice",window.localStorage.getItem("strSelectedDoctorPricereal"));
            window.localStorage.setItem("txtReferralCode", jQuery('#txtReferralCode').val());
            window.localStorage.setItem("drpCardType", "");
            window.localStorage.setItem("txtCreditCardNumber", "");
            window.localStorage.setItem("txtVerifyCode", "");
            window.localStorage.setItem("drpCardExpiryMonth", "");
            window.localStorage.setItem("drpCardExpiryYear", "");
            window.localStorage.setItem("txtBillingFirstName", "");
            window.localStorage.setItem("txtBillingLastName", "");
            window.localStorage.setItem("txtBillingStreetAddress", "");
            window.localStorage.setItem("txtBillingCity", "");
            window.localStorage.setItem("drpBillingState", "");
            window.localStorage.setItem("txtBillingZipcode", "");
            window.localStorage.setItem("chkSaveForFuture", false);
            window.localStorage.setItem("chkIAgree", false);

            if ((window.localStorage.getItem("guidCaseId") != null && window.localStorage.getItem("guidCaseId") != "") ? window.localStorage.getItem("guidCaseId") : window.sessionStorage.getItem("guidCaseId") == null || (window.localStorage.getItem("guidCaseId") != null && window.localStorage.getItem("guidCaseId") != "") ? window.localStorage.getItem("guidCaseId") : window.sessionStorage.getItem("guidCaseId") == "") {

                caseSubmit();
            } else {

                jQuery('#page_loading').hide();
                jQuery("#backButton").hide();
                //jQuery("#pagePharmacy").show();
                jQuery("#pageBillingInfo").hide();
                //curr_div.push("#pagePharmacy");
                prev_div.push("#pageBillingInfo");
            }
        } else {
            alert("Please enter the Referral Code");
        }

    });

    jQuery('#btnBillingProceed').click(function(e) {

        if (jQuery("#chkIAgree").is(':checked')) {
            if (jQuery('#drpCardType  option:selected').text() == "") {
                alert("Please select Credit Card type.");
                return false;
            } else if (jQuery('#txtCreditCardNumber').val() == "" || jQuery('#txtCreditCardNumber').val().length < 15) {
                alert("Please enter Credit Card #");
                return false;
            } else if (jQuery('#txtVerifyCode').val() == "") {
                alert("Please enter Credit Card CVV Number. <br> V/MC/Disc - last 3 digits on back. <br>  Amex - 4 digit code on front.");
                return false;
            } else if (jQuery('#drpCardExpiryMonth  option:selected').val() == "") {
                alert("Please select Credit Card Expiry Month.");
                return false;
            } else if (jQuery('#drpCardExpiryYear  option:selected').val() == "") {
                alert("Please select Credit Card Expiry Year.");
                return false;
            } else if (jQuery('#txtBillingFirstName').val() == "") {
                alert("Please enter First Name.");
                return false;
            } else if (jQuery('#txtBillingLastName').val() == "") {
                alert("Please enter Last Name.");
                return false;
            } else if (jQuery('#txtBillingStreetAddress').val() == "") {
                alert("Please enter Street Address.");
                return false;
            } else if (jQuery('#txtBillingCity').val() == "") {
                alert("Please enter City Name.");
                return false;
            } else if (jQuery('#drpBillingState  option:selected').val() == "") {
                alert("Please select State.");
                return false;
            } else if (jQuery('#drpBillingState  option:selected').val() != "") {

                if ((window.localStorage.getItem("strSelectedDoctorState") != null && window.localStorage.getItem("strSelectedDoctorState") != "") ? window.localStorage.getItem("strSelectedDoctorState") : window.sessionStorage.getItem("strSelectedDoctorState") != jQuery('#drpBillingState option:selected').attr('attr-code')) {
                    if (jQuery("#chkStateAgree").is(':checked')) {
                        // All Good!!
                    } else {
                        alert("Please accept out of state verification.");
                        return false;
                    }
                }

            } else if (jQuery('#txtBillingZipcode').val() == "") {
                alert("Please enter Zip code.");
                return false;
            }

            if ((jQuery('#txtVerifyCode').val().length != 3) || (jQuery('#txtVerifyCode').val().length !== 3)) {
                alert("Invalid verification code, Please enter your 3 digit verification code");
                return false;
            }
            var dtype = jQuery('#txtVerifyCode').val().length;
            dtype = typeof dtype;


            window.localStorage.setItem("drpCardType", jQuery('#drpCardType  option:selected').text());
            window.localStorage.setItem("txtCreditCardNumber", jQuery('#txtCreditCardNumber').val());
            window.localStorage.setItem("txtVerifyCode", jQuery('#txtVerifyCode').val());
            window.localStorage.setItem("drpCardExpiryMonth", jQuery('#drpCardExpiryMonth  option:selected').text());
            window.localStorage.setItem("drpCardExpiryYear", jQuery('#drpCardExpiryYear  option:selected').text());
            window.localStorage.setItem("txtBillingFirstName", jQuery('#txtBillingFirstName').val());
            window.localStorage.setItem("txtBillingLastName", jQuery('#txtBillingLastName').val());
            window.localStorage.setItem("txtBillingStreetAddress", jQuery('#txtBillingStreetAddress').val());
            window.localStorage.setItem("txtBillingCity", jQuery('#txtBillingCity').val());
            window.localStorage.setItem("drpBillingState", jQuery('#drpBillingState  option:selected').val());
            window.localStorage.setItem("txtBillingZipcode", jQuery('#txtBillingZipcode').val());
            window.localStorage.setItem("chkSaveForFuture", jQuery('#chkSaveForFuture').is(':checked'));
            window.localStorage.setItem("chkIAgree", jQuery('#chkIAgree').is(':checked'));

            if ((window.localStorage.getItem("guidCaseId") != null && window.localStorage.getItem("guidCaseId") != "") ? window.localStorage.getItem("guidCaseId") : window.sessionStorage.getItem("guidCaseId") == null || (window.localStorage.getItem("guidCaseId") != null && window.localStorage.getItem("guidCaseId") != "") ? window.localStorage.getItem("guidCaseId") : window.sessionStorage.getItem("guidCaseId") == "") {
                caseSubmit();
            } else {
                jQuery("#pagePharmacy").show();
                jQuery("#pageBillingInfo").hide();
                curr_div.push("#pagePharmacy");
                prev_div.push("#pageBillingInfo");
            }
        } else {
            alert("You must agree with the Terms of Service before your request can be submitted.");
        }
    });

    jQuery('.deleteme').live('click', function(e) {
        e.preventDefault();
        jQuery(this).closest('li').remove();
        jQuery("ul").find("li:first").addClass("ui-corner-top");
        jQuery("ul").find("li:last").addClass("ui-corner-bottom");
        jQuery('#basicallergies').listview('refresh');
    });

    jQuery('#pagePharmacy').live('pagebeforeshow', function(event, ui) {
        changeLoginLogoutText('pagePharmacy');

        if (window.localStorage.getItem("chiefComplaint") != "Not sure" && (window.localStorage.getItem("chiefComplaint") != "" && window.localStorage.getItem("chiefComplaint") != null) ? window.localStorage.getItem("chiefComplaint") : window.sessionStorage.getItem("chiefComplaint") != "") {
            jQuery('#btnPharmacyProceed').changeButtonText("Describe the " + (window.localStorage.getItem("chiefComplaint") != "" && window.localStorage.getItem("chiefComplaint") != null) ? window.localStorage.getItem("chiefComplaint") : window.sessionStorage.getItem("chiefComplaint"));
        } else {
            jQuery('#btnPharmacyProceed').changeButtonText("Describe your discomfort");
        }
        jQuery('#pRequestHasBeenSentMessage').html("Request has been sent to " + (window.localStorage.getItem("strSelectedDoctor") != null && window.localStorage.getItem("strSelectedDoctor") != "") ? window.localStorage.getItem("strSelectedDoctor") : window.sessionStorage.getItem("strSelectedDoctor"));

    });

    jQuery('#btnPharmacyProceed').click(function(e) {
        if (jQuery('#txtPharmacyFax').val() != '' || jQuery('#txtPharmacyName').val() != '') {
            ph_fax = /^\d{3}-\d{3}-\d{4}$|^\d{10}$/.test(jQuery('#txtPharmacyFax').val());
            if (ph_fax) {
                if (jQuery('#txtPharmacyName').val() == '') {
                    //alert('Enter a Pharmacy Name');
                    savePatientAdditionalDetails();
                } else if (arrAllergies.length == 0) {
                    alert(' Enter drug allergies');
                } else {
                    ph_faxnum = jQuery('#txtPharmacyFax').val().replace(/-/g, "");
                    savePatientAdditionalDetails();
                }
            } else {
                //alert('Enter a Pharmacy Fax#');
                savePatientAdditionalDetails();
            }
        } else {
            savePatientAdditionalDetails();
        }
    });


    jQuery('#pageChiefComplaint').live('pagebeforeshow', function(event, ui) {


        changeLoginLogoutText('pageChiefComplaint');

        if (window.localStorage.getItem("chiefComplaint") != "Not sure" && (window.localStorage.getItem("chiefComplaint") != null && window.localStorage.getItem("chiefComplaint") != "") ? window.localStorage.getItem("chiefComplaint") : window.sessionStorage.getItem("chiefComplaint") != "") {
            jQuery('#divDescribe').text("How would you describe your " + (window.localStorage.getItem("chiefComplaint") != null && window.localStorage.getItem("chiefComplaint") != "") ? window.localStorage.getItem("chiefComplaint") : window.sessionStorage.getItem("chiefComplaint") + "?");
        } else {
            jQuery('#divDescribe').text("How would you describe your discomfort?");
        }
    });

    jQuery('#btnChiefComplaintProceed').click(function(e) {

        window.localStorage.setItem("txtDiscomfort", jQuery('#txtDiscomfort').val());
        window.localStorage.setItem("flipSimilarLesion", jQuery('#flipSimilarLesion option:selected').text());
        window.localStorage.setItem("flipSkinCancer", jQuery('#flipSkinCancer option:selected').text());
        window.localStorage.setItem("flipHadMelanoma", jQuery('#flipHadMelanoma option:selected').text());

    });

});


function getUrlVars() {

    var vars = [],
        hash;

    var href = window.location.href;

    var queryUrl = href.slice(href.lastIndexOf('?') + 1);

    var hashes = queryUrl.split('&');

    for (var i = 0; i < hashes.length; i++) {

        hash = hashes[i].split('=');

        vars.push(hash[0]);

        vars[hash[0]] = hash[1];

    }

    return vars;

}



function saveChiefComplaint() {
    window.localStorage.setItem("chiefComplaint", jQuery('#drpChiefComplaint option:selected').text());
    window.localStorage.setItem("indirectLoginSucess-chiefComplaint", jQuery('#drpChiefComplaint option:selected').text());
}

function reloadFavDocList() {



    if (jQuery('#drpselectfavoritesDoctor option:selected').text() == "") {
        jQuery("#drpselectfavoritesDoctor").empty();

        var arrFavDocList = (window.localStorage.getItem("strFavDocList") != null && window.localStorage.getItem("strFavDocList") != "") ? window.localStorage.getItem("strFavDocList").split('|') : (window.sessionStorage.getItem("strFavDocList") != null && window.sessionStorage.getItem("strFavDocList") != "") ? window.sessionStorage.getItem("strFavDocList").split('|') : '';
        if (arrFavDocList != "") {
            jQuery("#drpselectfavoritesDoctor").append("<option value=''></option>");

            jQuery.each(arrFavDocList, function(key, value) {
                if (value == '') {

                } else {
                    arrFavDoc = [];
                    if ((value != 'undefined') && (typeof value != undefined) && (typeof value !== undefined)) {
                        arrFavDoc = value.split("~");
                        arrFavDoc[1] = arrFavDoc[1].substr(arrFavDoc[1].indexOf(" ") + 1);
                        jQuery("#drpselectfavoritesDoctor").append("<option value='" + arrFavDoc[0] + "' price='" + arrFavDoc[2] + "' state='" + arrFavDoc[3] + "'   degree='" + arrFavDoc[4] + "'>" + arrFavDoc[1] + ", " + arrFavDoc[4] + "</option>");
                    }
                }
            });
        }
    } else {
        var strTempFavDocList = (window.localStorage.getItem("strFavDocList") != null && window.localStorage.getItem("strFavDocList") != "") ? window.localStorage.getItem("strFavDocList") : window.sessionStorage.getItem("strFavDocList");
        var strSelectedDoctorID = jQuery('#drpselectfavoritesDoctor option:selected').val();
        if (strTempFavDocList.indexOf(strSelectedDoctorID) >= 0) {

        } else {

        }
    }
}

function reloadExistingPatientList() {
    jQuery('#drpExistingPatients').empty();

    var arrPatientList = [];


    if (((window.localStorage.getItem("strPatientList") != null && window.localStorage.getItem("strPatientList") != "") ? window.localStorage.getItem("strPatientList") : window.sessionStorage.getItem("strPatientList") != 'undefined') && (typeof(window.localStorage.getItem("strPatientList") != "" && window.localStorage.getItem("strPatientList") != null) ? window.localStorage.getItem("strPatientList") : window.sessionStorage.getItem("strPatientList") != undefined) && (typeof(window.localStorage.getItem("strPatientList") != null && window.localStorage.getItem("strPatientList") != "") ? window.localStorage.getItem("strPatientList") : window.sessionStorage.getItem("strPatientList") !== undefined && window.sessionStorage.getItem("strPatientList") !== "undefined")) {
        if (window.sessionStorage.getItem("strPatientList") != "undefined") {
            arrPatientList = JSON.parse((window.localStorage.getItem("strPatientList") != null && window.localStorage.getItem("strPatientList") != "") ? window.localStorage.getItem("strPatientList") : window.sessionStorage.getItem("strPatientList"));
        }
    }

    strCareGiverGender = "Female";
    if ((window.localStorage.getItem("strCareGiverGender") != null && window.localStorage.getItem("strCareGiverGender") != "") ? window.localStorage.getItem("strCareGiverGender") : window.sessionStorage.getItem("strCareGiverGender") == 0) {
        strCareGiverGender = "Male";
    }

    jQuery("#drpExistingPatients").append("<option value=''></option>");


    if (arrPatientList.length > 0) {

        var isCareGiverFound = false;

        jQuery.each(arrPatientList, function(key, value) {
            if (value.isCareGiver == true) {
                isCareGiverFound = true;
                var strGender = "Female";
                arrPatients = value;
                if (arrPatients.intGender == 0) {
                    strGender = "Male";
                }
                jQuery("#drpExistingPatients").append("<option pharmacyIndex='" + key + "' value='" + arrPatients.guidAccountId + "' relation='1' fname='" + isNull(arrPatients.strFirstName) + "' mname='" + isNull(arrPatients.strMiddleName) + "' lname='" + isNull(arrPatients.strLastName) + "' dob='" + formatDOB(isNull(arrPatients.strDateOfBirth)) + "' email='" + isNull(arrPatients.strEmail) + "' phone='" + isNull(arrPatients.strPhone) + "' gender='" + strCareGiverGender + "'>I am the Patient</option>");
            }
        });

        if (!isCareGiverFound) {
            var strGender = "Female";
            if ((window.localStorage.getItem("strCareGiverGender") != null && window.localStorage.getItem("strCareGiverGender") != "") ? window.localStorage.getItem("strCareGiverGender") : window.sessionStorage.getItem("strCareGiverGender") == 0) {
                strGender = "Male";
            }
            jQuery("#drpExistingPatients").append("<option pharmacyIndex='' value='' relation='1' fname='" + isNull((window.localStorage.getItem("strCareGiverFirstName") != null && window.localStorage.getItem("strCareGiverFirstName") != "") ? window.localStorage.getItem("strCareGiverFirstName") : window.sessionStorage.getItem("strCareGiverFirstName")) + "' mname='" + isNull((window.localStorage.getItem("strCareGiverMiddleName") != null && window.localStorage.getItem("strCareGiverMiddleName") != "") ? window.localStorage.getItem("strCareGiverMiddleName") : window.sessionStorage.getItem("strCareGiverMiddleName")) + "' lname='" + isNull((window.localStorage.getItem("strCareGiverLastName") != null && window.localStorage.getItem("strCareGiverLastName") != "") ? window.localStorage.getItem("strCareGiverLastName") : window.sessionStorage.getItem("strCareGiverLastName")) + "' dob='" + formatDOB(isNull((window.localStorage.getItem("strCareGiverDOB") != null && window.localStorage.getItem("strCareGiverDOB") != "") ? window.localStorage.getItem("strCareGiverDOB") : window.sessionStorage.getItem("strCareGiverDOB"))) + "' email='" + isNull((window.localStorage.getItem("strUserName") != null && window.localStorage.getItem("strUserName") != "") ? window.localStorage.getItem("strUserName") : window.sessionStorage.getItem("strUserName")) + "' phone='" + isNull((window.localStorage.getItem("strCareGiverPhone") != null && window.localStorage.getItem("strCareGiverPhone") != "") ? window.localStorage.getItem("strCareGiverPhone") : window.sessionStorage.getItem("strCareGiverPhone")) + "' gender='" + strGender + "'>I am the Patient</option>");
        }
    } else {
        var strGender = "Female";
        if ((window.localStorage.getItem("strCareGiverGender") != null && window.localStorage.getItem("strCareGiverGender") != "") ? window.localStorage.getItem("strCareGiverGender") : window.sessionStorage.getItem("strCareGiverGender") == 0) {
            strGender = "Male";
        }
        jQuery("#drpExistingPatients").append("<option pharmacyIndex='' value='' relation='1' fname='" + isNull((window.localStorage.getItem("strCareGiverFirstName") != null && window.localStorage.getItem("strCareGiverFirstName") != "") ? window.localStorage.getItem("strCareGiverFirstName") : window.sessionStorage.getItem("strCareGiverFirstName")) + "' mname='" + isNull((window.localStorage.getItem("strCareGiverMiddleName") != null && window.localStorage.getItem("strCareGiverMiddleName") != "") ? window.localStorage.getItem("strCareGiverMiddleName") : window.sessionStorage.getItem("strCareGiverMiddleName")) + "' lname='" + isNull((window.localStorage.getItem("strCareGiverLastName") != "" && window.localStorage.getItem("strCareGiverLastName") != null) ? window.localStorage.getItem("strCareGiverLastName") : window.sessionStorage.getItem("strCareGiverLastName")) + "' dob='" + formatDOB(isNull((window.localStorage.getItem("strCareGiverDOB") != "" && window.localStorage.getItem("strCareGiverDOB") != null) ? window.localStorage.getItem("strCareGiverDOB") : window.sessionStorage.getItem("strCareGiverDOB"))) + "' email='" + isNull((window.localStorage.getItem("strUserName") != "" && window.localStorage.getItem("strUserName") != null) ? window.localStorage.getItem("strUserName") : window.sessionStorage.getItem("strUserName")) + "' phone='" + isNull((window.localStorage.getItem("strCareGiverPhone") != null && window.localStorage.getItem("strCareGiverPhone") != "") ? window.localStorage.getItem("strCareGiverPhone") : window.sessionStorage.getItem("strCareGiverPhone")) + "' gender='" + strGender + "'>I am the Patient</option>");
    }


    jQuery("#drpExistingPatients").append("<option value=''>Someone else</option>");



    if (arrPatientList.length > 0) {

        jQuery.each(arrPatientList, function(key, value) {
            if (value.isCareGiver == false) {
                var strGender = "Female";
                arrPatients = value;
                if (arrPatients.intGender == 0) {
                    strGender = "Male";
                }
                jQuery("#drpExistingPatients").append("<option pharmacyIndex='" + key + "' value='" + arrPatients.guidAccountId + "' fname='" + isNull(arrPatients.strFirstName) + "' mname='" + isNull(arrPatients.strMiddleName) + "' lname='" + isNull(arrPatients.strLastName) + "' dob='" + formatDOB(isNull(arrPatients.strDateOfBirth)) + "' email='" + isNull(arrPatients.strEmail) + "' phone='" + isNull(arrPatients.strPhone) + "' gender='" + strGender + "' relation='" + isNull(arrPatients.intRelationToCareGiverId) + "'>" + isNull(arrPatients.strFirstName) + " " + isNull(arrPatients.strMiddleName) + " " + isNull(arrPatients.strLastName) + " : " + isNull(arrPatients.strDateOfBirth) + "</option>");
            }
        });
    } else {

    }
}

function formatDOB(strDate) {

    var now = new Date(strDate);
    return now.getFullYear() + "-" + ("0" + (now.getMonth() + 1)).slice(-2) + "-" + ("0" + now.getDate()).slice(-2);
}

function setDateZero(date) {
    return date < 10 ? '0' + date : date;
}

function reloadPatientRelationList() {
    jQuery('#drpWhoIsEnteringRequest').empty();



    var arrPatientRelationList = JSON.parse((window.localStorage.getItem("strListPatientCareGiverRelation") != null && window.localStorage.getItem("strListPatientCareGiverRelation") != "") ? window.localStorage.getItem("strListPatientCareGiverRelation") : window.sessionStorage.getItem("strListPatientCareGiverRelation"));

    jQuery("#drpWhoIsEnteringRequest").append("<option value=''></option>");

    if (arrPatientRelationList.length > 0) {
        jQuery.each(arrPatientRelationList, function(key, value) {
            jQuery("#drpWhoIsEnteringRequest").append("<option value='" + value.intRelationToCareGiverId + "'>" + value.strRelationToCareGiverLabel + "</option>");
        });
    }

}

function reloadExistingCaseList() {


    var arrExistingCaseList = (window.localStorage.getItem("strExistingCasesList") != null && window.localStorage.getItem("strExistingCasesList") != "") ? window.localStorage.getItem("strExistingCasesList").split('|') : (window.sessionStorage.getItem("strExistingCasesList") != null && window.sessionStorage.getItem("strExistingCasesList") != "") ? window.sessionStorage.getItem("strExistingCasesList").split('|') : '';
    if (arrExistingCaseList != "") {
        var divExistingCaseData = "<table width='70%' border='0' align='center'>";


        jQuery.each(arrExistingCaseList, function(key, value) {
            var arrExistingCase = value.split("~");

            var varStatusColorCode;
            if (arrExistingCase[9] == 1) {
                varStatusColorCode = "#f6bfbf";
            } else {
                varStatusColorCode = "#c4e3b2";
            }
            divExistingCaseData += "<tr onclick='gotoExistingCase(this)' guid='" + arrExistingCase[0] + "' style='height:45px;background-color:" + varStatusColorCode + ";border-radius:10px;'><td  style='padding:10px; border-radius:10px; text-align:left'><b style='line-height:1'>" + arrExistingCase[1] + "</b><span style='float:right; font-size:14px;'> " + arrExistingCase[8] + "</span><br><span style='line-height:1;font-size:14px'> <lable style='font-weight:bold'>Name: </lable>" + arrExistingCase[2] + " " + arrExistingCase[3] + " " + arrExistingCase[4] + "</span></b><br><span style='line-height:1;font-size:14px'> <lable style='font-weight:bold'>Gender:</lable> " + arrExistingCase[6] + " </span><br><span style='line-height:1; font-size:14px'> <lable style='font-weight:bold'>DOB: </lable>" + arrExistingCase[5] + "</span><br><span style='line-height:1;font-size:14px;'> <lable style='font-weight:bold'>Compliant: </lable>" + arrExistingCase[7] + "</span> </td></tr>";

            // divExistingCaseData += "<tr onclick='gotoExistingCase(this)' guid='" + arrExistingCase[0] + "' style='height:45px;background-color:#99cced'><td width='5px' style='background-color:" + varStatusColorCode + "'></td><td  style='padding:20px;border-bottom: 1px solid #000000;text-align:left'><b>" + arrExistingCase[1] + "</b><span style='float:right'>" + arrExistingCase[8] + "</span><br> Name: " + arrExistingCase[2] + " " + arrExistingCase[3] + " " + arrExistingCase[4] + "</b><br> Gender: " + arrExistingCase[6] + " <br> Date: " + arrExistingCase[5] + "<span style='float:right'>" + arrExistingCase[7] + "</span> </td></tr>";

        });
        divExistingCaseData += "</table>";

        jQuery('#divExistingCaseData').html(divExistingCaseData);
    }
}

function gotoExistingCase(obj) {
    jQuery('#page_loading').show();

    getCaseDetails(jQuery(obj).attr('guid'));

}


function fillExistingPatientDetails() {
    jQuery("#txtFirstName").val(jQuery("#drpExistingPatients option:selected").attr('fname'));
    jQuery("#txtMiddleName").val(jQuery("#drpExistingPatients option:selected").attr('mname'));
    jQuery("#txtLastName").val(jQuery("#drpExistingPatients option:selected").attr('lname'));
    jQuery("#txtDateOfBirth").val(jQuery("#drpExistingPatients option:selected").attr('dob'));
    for (var i = 0; i < window.localStorage.length; i++) {
        // do something with localStorage.getItem(localStorage.key(i));

    }
    jQuery("#txtEmail").val(jQuery("#drpExistingPatients option:selected").attr('email'));
    jQuery("#txtPhone").val(jQuery("#drpExistingPatients option:selected").attr('phone'));

    if (jQuery("#drpExistingPatients option:selected").text() == "Someone else") {

        if (jQuery('#selectGender').is(':checked')) {
            jQuery("#drpGender").val("Male");
            jQuery("#drpGender").selectmenu('refresh');
        } else {
            jQuery("#drpGender").val("Female");
            jQuery("#drpGender").selectmenu('refresh');
        }
    } else {
        jQuery("#drpGender").val(jQuery("#drpExistingPatients option:selected").attr('gender'));
        jQuery("#drpGender").selectmenu('refresh');
    }

    if (jQuery("#drpExistingPatients option:selected").text() == "I am the Patient") {
        jQuery("#divWhoisEnteringRequest").hide();
        jQuery('#txtEmail').val((window.localStorage.getItem("loggedInUserEmail") != "" && window.localStorage.getItem("loggedInUserEmail") != null) ? window.localStorage.getItem("loggedInUserEmail") : window.sessionStorage.getItem("loggedInUserEmail"));
        document.getElementById("txtEmail").value = (window.localStorage.getItem("loggedInUserEmail") != "" && window.localStorage.getItem("loggedInUserEmail") != null) ? window.localStorage.getItem("loggedInUserEmail") : window.sessionStorage.getItem("loggedInUserEmail");
    } else {
        jQuery("#divWhoisEnteringRequest").show();
    }

    if (jQuery("#drpExistingPatients option:selected").attr('relation') != "") {

        var rel_count = jQuery("#drpExistingPatients option:selected").attr('relation');

        jQuery("#drpWhoIsEnteringRequest").val(rel_count);
        jQuery("#drpWhoIsEnteringRequest").selectmenu('refresh');
    } else
        jQuery("#drpWhoIsEnteringRequest").val("");




    window.localStorage.setItem("guidAccountId", jQuery("#drpExistingPatients option:selected").val());

}

function caseSubmit() {
    jQuery.fn.fnRealCaseSubmit();
}

function StartNewCase() {
    // arrSelectedBodyParts = [];
    // jQuery("#dtPharmacy").trigger("click");
    // //alert('start new case');
    // clearLocalStorage();
    // jQuery("#pageIndex").hide();
    // jQuery("#pageAffectedArea").show();
    // jQuery("#backButton").hide();
    // curr_div.push("#pageAffectedArea");
    // prev_div.push("#pageIndex");

    arrSelectedBodyParts = [];
    jQuery("#dtPharmacy").trigger("click");
    clearLocalStorage();
    jQuery("#pageIndex").hide();
    jQuery("#pageAffectedArea").show();
    jQuery("#backButton").hide();
    curr_div.push("#pageAffectedArea");
    prev_div.push("#pageIndex");
}


function StartNewCaseLoginScreen() {
    var location = window.location.href;
    var baseURL = location.substr(0, location.lastIndexOf("/"));
    baseURL = baseURL + '/home';
    window.location.href = baseURL;
}

function clearLocalStorage() {
    window.localStorage.removeItem("chiefComplaint");
    window.localStorage.removeItem("guidAccountId");
    window.localStorage.removeItem("txtEmail");
    window.localStorage.removeItem("txtFirstName");
    window.localStorage.removeItem("txtMiddleName");
    window.localStorage.removeItem("txtLastName");
    window.localStorage.removeItem("txtPhone");
    window.localStorage.removeItem("txtDateOfBirth");
    window.localStorage.removeItem("drpChiefComplaintID");
    window.localStorage.removeItem("drpChiefComplaint");
    window.localStorage.removeItem("strSelectedDoctorPrice");
    window.localStorage.removeItem("strPhotoList");
    window.localStorage.removeItem("strQuestionAnswerList");
    window.localStorage.removeItem("strBodyMap");
    window.localStorage.removeItem("guidCaseId");
    window.localStorage.removeItem("txtReferralCode");
    window.localStorage.removeItem("guidPharmacyId");
    window.localStorage.removeItem("drpWhoIsEnteringRequestID");


    arrTempAnswer = [];
    arrTempQuestions = [];
    window.localStorage.removeItem('chiefComplaint');
    //alert('993');
    window.localStorage.clear();
}

function clearccdetails() {

    window.localStorage.removeItem("txtReferralCode");
    window.localStorage.removeItem("drpCardType");
    window.localStorage.removeItem("txtCreditCardNumber");
    window.localStorage.removeItem("txtVerifyCode");
    window.localStorage.removeItem("drpCardExpiryMonth");
    window.localStorage.removeItem("drpCardExpiryYear");
    window.localStorage.removeItem("txtBillingFirstName");
    window.localStorage.removeItem("txtBillingLastName");
    window.localStorage.removeItem("txtBillingStreetAddress");
    window.localStorage.removeItem("txtBillingCity");
    window.localStorage.removeItem("drpBillingState");
    window.localStorage.removeItem("txtBillingZipcode");
    window.localStorage.removeItem("chkSaveForFuture");
    window.localStorage.removeItem("chkIAgree");

    jQuery("#txtReferralCode").val('');
    jQuery("#drpCardType").val('');
    jQuery("#txtCreditCardNumber").val('');
    jQuery("#txtVerifyCode").val('');
    jQuery("#drpCardExpiryMonth").val('');
    jQuery("#drpCardExpiryYear").val('');
    jQuery("#txtBillingFirstName").val('');
    jQuery("#txtBillingLastName").val('');
    jQuery("#txtBillingStreetAddress").val('');
    jQuery("#txtBillingCity").val('');
    jQuery("#drpBillingState").val('');
    jQuery("#txtBillingZipcode").val('');
    jQuery("#chkSaveForFuture").val('');
    jQuery("#chkIAgree").val('');
}

function refreshData() {
    LoginMe(true);

}


function gotoIndex() {
    localStorage.clear();
    jQuery('#page_loading').show();
    window.location.reload();
    /* noclearstore=1;
    LoginMe(true);

  */
}

function updateBillingInfoScreen() {

}

(function(jQuery) {
    jQuery.fn.accordion = function() {
        var el = this;
        var ddHeight;
        ddHeight = new Array();

        el.addClass('enhance');

        el.find('dd').each(function(i) {
            var dd = jQuery(this);

            ddHeight[i] = "100%";
            dd.addClass('closed')
        });

        el.find('dt p').bind('click', function(e) {
            e.preventDefault();

            var toExpand = jQuery(this).parent().next('dd');
            var i = toExpand.index('dd');

            if (toExpand.attr('id') == 'active') {

                toExpand
                    .removeAttr('id')
                    .removeAttr('style')
                    .addClass('closed');
                jQuery(this).removeClass("icon remove mini");
                jQuery(this).addClass("icon add mini");
            } else {

                var active = toExpand.parent().find('#active');

                if (active) {

                    active
                        .removeAttr('id')
                        .removeAttr('style')
                        .addClass('closed');
                    jQuery(active).parent().find('p').removeClass("icon remove mini");
                    jQuery(active).parent().find('p').addClass("icon add mini");
                }


                toExpand
                    .attr('id', 'active')
                    .css('height', ddHeight[i] + 'px')
                    .removeClass('closed');
                jQuery(this).removeClass("icon add mini");
                jQuery(this).addClass("icon remove mini");

            }
        });
    }
})(jQuery);



function addAllergies(tableName, txtName) {

    allergy_counter++;
    createMe(tableName, txtName);

}

function createMe(tableName, data) {
    if (data != "") {

        var tbl = document.getElementById(tableName);
        var lastRow = tbl.rows.length;

        var row = tbl.insertRow(lastRow);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        cell1.innerHTML = data;

        cell2.innerHTML = '<div style="padding:10px 10px 10px 10px;height:20px;" onclick="deleteMe(\'' + tableName + '\',this.parentNode.parentNode.rowIndex,\'' + data + '\')"><img border="0" src="https://skinmdnow.nuvolatek.net/frontend/public/images/delete.png" width="16" height="16" style="cursor:pointer;"></div>';
        cell2.className = "tdDelete";

        if (lastRow >= 1) {
            cell1.style.borderTop = "1px solid #ccc";
            cell2.style.borderTop = "1px solid #ccc";
        }
        updateArray(tableName, data);
    } else {
        alert("Please enter text.");
    }
}

function updateArray(tableName, data) {
    if (tableName == "tblAllergies") {
        arrAllergies = updateArrayTemp(arrAllergies, data);
    } else if (tableName == "tblPatientMedicalHistory") {
        arrPatientMedicalHistory = updateArrayTemp(arrPatientMedicalHistory, data);
    } else if (tableName == "tblFamilyMedicalHistory") {
        arrFamilyMedicalHistory = updateArrayTemp(arrFamilyMedicalHistory, data);
    } else if (tableName == "tblCurrentMedicine") {
        arrCurrentMedicine = updateArrayTemp(arrCurrentMedicine, data);
    }
}



function updateArrayTemp(array, data) {
    if (array.indexOf(data, 0) == -1) {
        array.push({
            "strName": data
        });

    } else {
        alert("Already Exists");
    }
    return array;
}


function deleteMe(tableName, rowIndex, data) {

    var tbl = document.getElementById(tableName);
    tbl.deleteRow(rowIndex);

    if (tableName == "tblAllergies") {
        arrAllergies.splice(arrAllergies.indexOf({
            "strName": data
        }), 1);
        allergy_counter--;
    } else if (tableName == "tblPatientMedicalHistory") {
        arrPatientMedicalHistory.splice(arrPatientMedicalHistory.indexOf({
            "strName": data
        }), 1);
    } else if (tableName == "tblFamilyMedicalHistory") {
        arrFamilyMedicalHistory.splice(arrFamilyMedicalHistory.indexOf({
            "strName": data
        }), 1);
    } else if (tableName == "tblCurrentMedicine") {
        arrCurrentMedicine.splice(arrCurrentMedicine.indexOf({
            "strName": data
        }), 1);
    }


}

function openCreateAccountPage() {

    jQuery('#pageLogin').hide();

    jQuery('#pageCreateNew').show();

    curr_div.push("#pageCreateNew");
    prev_div.push("#pageLogin");

}

function cancelAccount() {
    DestroyCalendar();
    var sd = prev_div[prev_div.length - 1];
    if (sd) {
        jQuery(sd).show();
        jQuery("#pageCreateNew").hide();
    } else {
        jQuery("#pageCreateNew").hide();
        jQuery("#pageIndex").show();
    }
}

function addAccount() {
    DestroyCalendar();
    var strAge = checkAge(jQuery('#txtNewDateOfBirth').val());
    if (strAge >= 18) {
        if (jQuery('#txtNewFirstName').val() == "" || jQuery('#txtNewLastName').val() == "") {
            alert("Please enter First Name & Last Name");

        } else if (jQuery('#txtNewEmail').val() == "") {
            alert("Please enter Email Address");
        } else if (jQuery('#txtNewPassword').val() == "" || jQuery('#txtNewConfirmPassword').val() == "") {
            alert("Please enter Password & Confirm Password");
        } else if (jQuery('#txtNewPassword').val() != jQuery('#txtNewConfirmPassword').val()) {
            alert("Password and Confirm Password fields don't match. Please re-enter them.");
        } else if (jQuery('#txtNewUsername').val() == "") {
            alert("Please enter Username.");
        } else if (jQuery('#txtNewUsername').val().length < 5) {
            alert("Username length should be grether 4.");
        } else {
            jQuery.fn.fnAddAccount();
        }
    } else {
        alert("You have to be at least 18 years old to submit a case with SkinMDNow.");
    }
}

function closePageDoctorFeesInfo() {

    jQuery('#pageDoctorFeesInfo').hide();
}


function showTerms() {

    jQuery('#pageTerms').show();
    jQuery('#pageBillingInfo').hide();
    curr_div.push("#pageTerms");
    prev_div.push("#pageBillingInfo");
}

function removeAt(iIndex) {
    var vItem = this[iIndex];
    if (vItem) {
        this.splice(iIndex, 1);
    }
    return vItem;
}

function storeTempAnswer(selectedObj) {
    var tempSelectedQuestionID = jQuery(selectedObj).attr("id");
    var tempSelectedAnswerID = jQuery("#" + tempSelectedQuestionID + " option:selected").attr("id");


    var tempSelection = tempSelectedQuestionID + "~" + tempSelectedAnswerID;



    var index = arrTempQuestions.indexOf(tempSelectedQuestionID);


    if (index < 0) {
        arrTempAnswer.push(tempSelection);
        arrTempQuestions.push(tempSelectedQuestionID);
    } else {
        arrTempAnswer = arrTempAnswer.removeAt(index);
        arrTempAnswer.push(tempSelection);
        arrTempQuestions.push(tempSelectedQuestionID);
    }

}

function goBackToPatientScreen(isRequired) {

    if (isRequired) {
        var IsEmpty = false;
        jQuery(".required").each(function() {
            var id = jQuery(this).attr('id');

            if (jQuery("#" + id + " option:selected").text() == "") {
                alert("Please answer this question.");
                IsEmpty = true;
                return false;
            } else {
                jQuery("#pageTempQuestion, #pagePatientInfo").hide();
                jQuery("#pageBillingInfo").show();
            }
        });

        if (IsEmpty) {
            return false;
        }
    }

    window.localStorage.setItem("strWhoHasEnteredRequest", jQuery('#drpWhoIsEnteringRequest option:selected').text());
    window.localStorage.setItem("drpWhoIsEnteringRequest", jQuery('#drpWhoIsEnteringRequest option:selected').text());
    window.localStorage.setItem("drpWhoIsEnteringRequestID", jQuery('#drpWhoIsEnteringRequest option:selected').val());
    window.localStorage.setItem("txtFirstName", jQuery('#txtFirstName').val());
    window.localStorage.setItem("txtMiddleName", jQuery('#txtMiddleName').val());
    window.localStorage.setItem("txtLastName", jQuery('#txtLastName').val());
    window.localStorage.setItem("drpGender", jQuery('#drpGender option:selected').text());
    window.localStorage.setItem("txtDateOfBirth", jQuery('#txtDateOfBirth').val());
    window.localStorage.setItem("txtEmail", jQuery('#txtEmail').val());
    window.localStorage.setItem("txtPhone", jQuery('#txtPhone').val());

    arrAllergies = [];
    arrFamilyMedicalHistory = [];
    arrCurrentMedicine = [];
    arrPatientMedicalHistory = [];

    if (jQuery('#drpWhoIsEnteringRequest option:selected').text() == "Healthcare Professional") {
        jQuery("#divReferralCodeDT").show();
        if (jQuery("#divReferralCode").hasClass('add')) {
            jQuery("#divReferralCode").trigger("click");
        }
        jQuery("#divReferralCodedddiv").show();
        jQuery("#divcouponCodeDT").hide();

        jQuery("#divCreditCarddddiv").hide();
        jQuery("#divCreditCard").hide();
        jQuery("#pagePatientInfo").hide();
        jQuery("#pageBillingInfo").show();

        curr_div.push("#pageBillingInfo");
        prev_div.push("#pagePatientInfo");
    } else if (jQuery("#drpExistingPatients option:selected").text() == "Someone else" && jQuery('#drpWhoIsEnteringRequest option:selected').text() != "Healthcare Professional") {
        jQuery("#divReferralCodeDT").hide();
        jQuery("#divReferralCodedddiv").hide();
        jQuery("#divcouponCodeDT").show();
        jQuery("#divcouponCodeDT").trigger("click");
        jQuery("#divCreditCard").show();
        jQuery(".showccdv").show();
        jQuery("#divCreditCarddddiv").show();
        jQuery("#pagePatientInfo").hide();
        jQuery("#pageBillingInfo").show();
        curr_div.push("#pageBillingInfo");
        prev_div.push("#pagePatientInfo");
    } else {
        jQuery("#divReferralCodeDT").hide();
        jQuery("#divcouponCodeDT").show();
        jQuery("#divCreditCard").show();
        if (jQuery("#divcc").hasClass('add')) {
            jQuery("#divcc").trigger("click");
        }
        jQuery("#divCreditCarddddiv").show();
        jQuery("#pagePatientInfo").hide();
        jQuery("#pageBillingInfo").show();
    }

    if (jQuery('#drpExistingPatients option').length > 0 && jQuery('#drpExistingPatients option:selected').val() != "") {
        var varPatientIndex = jQuery("#drpExistingPatients option:selected").attr('pharmacyIndex');
        fillPharmacyPageData(varPatientIndex);
        jQuery("#pageBillingInfo").show();
        jQuery("#pagePatientInfo").hide();
        curr_div.push("#pageBillingInfo");
        prev_div.push("#pagePatientInfo");
    } else {
        jQuery("#drpPharmacy").empty();
        jQuery("#divExistingPharmacy").hide();
    }
}




function comparewithdoctorstate() {
    if ((window.localStorage.getItem("strSelectedDoctorState") != "" && window.localStorage.getItem("strSelectedDoctorState") != null) ? window.localStorage.getItem("strSelectedDoctorState") : window.sessionStorage.getItem("strSelectedDoctorState") != jQuery('#drpBillingState option:selected').attr('attr-code')) {
        jQuery("#divStateAgree").show();
    } else {
        jQuery("#divStateAgree").hide();
    }
}




jQuery(document).ready(function() {
    jQuery('#Existingdoctors').on('change', function() {
        var ddd = this.value;
        gotoPaymentScreen(this.value);
    });
    jQuery('.btnLogOut').click(function(event) {
        //alert('1395');
        jQuery('#indirectLoginSucess').val('');
        jQuery('#indirectLoginSucess').attr('value', '');
        //alert('1399');
        localStorage.clear();

        sessionStorage.clear();

        window.localStorage.clear();
        window.localStorage.removeItem('chiefComplaint');
        window.sessionStorage.clear();
        window.sessionStorage.removeItem('chiefComplaint');
        var n = 0,
            key;
        event.preventDefault();
        document.getElementById('logout-form').submit();
    });
});