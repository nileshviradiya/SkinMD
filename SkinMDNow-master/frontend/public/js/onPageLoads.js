/* 
onPageLoads.js
SkinmdNow

Created by QuestApple on 11/7/12.
Copyright (c) 2012 QuestApple. All rights reserved.
*/
var announcetodelete;

function pageIndexOnLoad() {

    if ((window.localStorage.getItem("isLoggedIn")!=null&&window.localStorage.getItem("isLoggedIn")!="")?window.localStorage.getItem("isLoggedIn"):window.sessionStorage.getItem("isLoggedIn") == "true") {
        jQuery('#btnLogin').text('Logout');

        $('#btnOldRequests').show('fast');
        //$('#btnOldRequests').html("Old Request [" + (window.localStorage.getItem("intNumberOfRequests")!=null&&window.localStorage.getItem("intNumberOfRequests")!="")?window.localStorage.getItem("intNumberOfRequests"):window.sessionStorage.getItem("intNumberOfRequests") + "]");
        $('#btnOldRequests').html("Old Request [" + window.localStorage.getItem("intNumberOfRequests") + "]");
        jQuery('#btnAnnouncements').show('fast');
        jQuery('#btnAnnouncements').html("Announcements");


        if ((window.localStorage.getItem("hideannouncement")!=null&&window.localStorage.getItem("hideannouncement")!="")?window.localStorage.getItem("hideannouncement"):window.sessionStorage.getItem("hideannouncement") == 'show') {
            jQuery('#btnAnnouncements').show('fast');
            //jQuery('#ann_feat').show('fast');
        } else {
            jQuery('#ann_feat').hide('fast');
        }

        loadannouncements();

        if ((window.localStorage.getItem("strPatientList")!=null&&window.localStorage.getItem("strPatientList")!="")?window.localStorage.getItem("strPatientList"):window.sessionStorage.getItem("strPatientList") != "") {
            jQuery("#divExistingPatients").show("fast");
            reloadExistingPatientList();
        }

        if ((window.localStorage.getItem("strListPatientCareGiverRelation")!=null&&window.localStorage.getItem("strListPatientCareGiverRelation")!="")?window.localStorage.getItem("strListPatientCareGiverRelation"):window.sessionStorage.getItem("strListPatientCareGiverRelation") != "") {
           // reloadPatientRelationList();

        }


        if ((window.localStorage.getItem("strExistingCasesList")!=""&&window.localStorage.getItem("strExistingCasesList")!=null)?window.localStorage.getItem("strExistingCasesList"):window.sessionStorage.getItem("strExistingCasesList") != "") {

            reloadExistingCaseList();
        }

        if ((window.localStorage.getItem("isLoggedIn")!=null&&window.localStorage.getItem("isLoggedIn")!="")?window.localStorage.getItem("isLoggedIn"):window.sessionStorage.getItem("isLoggedIn") == "true" && (window.localStorage.getItem("strFavDocList")!=null&&window.localStorage.getItem("strFavDocList")!="")?window.localStorage.getItem("strFavDocList"):window.sessionStorage.getItem("strFavDocList") != "") {

            jQuery("#divFavorites").show("fast");

            reloadFavDocList();
        }

    }

}


function pagePatientInfoOnLoad() {
    if ((window.localStorage.getItem("drpGender")!=null&&window.localStorage.getItem("drpGender")!="")?window.localStorage.getItem("drpGender"):window.sessionStorage.getItem("drpGender") == "Male") {
        jQuery("#drpGender")[0].selectedIndex = 0;
    } else {
        jQuery("#drpGender")[0].selectedIndex = 1;
    }

    jQuery('.divSubmitToDoctor').text('Submit request to ' + (window.localStorage.getItem("strSelectedDoctor")!=""&&window.localStorage.getItem("strSelectedDoctor")!=null)?window.localStorage.getItem("strSelectedDoctor"):window.sessionStorage.getItem("strSelectedDoctor"));
}

function pageDoctorSelectionSearchOnLoad() {
    if ((window.localStorage.getItem("isLoggedIn")!=null&&window.localStorage.getItem("isLoggedIn")!="")?window.localStorage.getItem("isLoggedIn"):window.sessionStorage.getItem("isLoggedIn") == "true" && (window.localStorage.getItem("strFavDocList")!=null&&window.localStorage.getItem("strFavDocList")!="")?window.localStorage.getItem("strFavDocList"):window.sessionStorage.getItem("strFavDocList") != "") {

        jQuery("#divFavorites").show("fast");

        reloadFavDocList();

    }

}


function pageBillingInfoOnLoad() {

    jQuery("#divStateAgree").hide();
    jQuery("#txtBillingFirstName").val((window.localStorage.getItem("strCareGiverFirstName")!=""&&window.localStorage.getItem("strCareGiverFirstName")!=null)?window.localStorage.getItem("strCareGiverFirstName"):window.sessionStorage.getItem("strCareGiverFirstName"));
    jQuery("#txtBillingLastName").val((window.localStorage.getItem("strCareGiverLastName")!=null&&window.localStorage.getItem("strCareGiverLastName")!="")?window.localStorage.getItem("strCareGiverLastName"):window.sessionStorage.getItem("strCareGiverLastName"));
    jQuery("#chkStateAgree").hide();

    if ((window.localStorage.getItem("strWhoHasEnteredRequest")!=null&&window.localStorage.getItem("strWhoHasEnteredRequest")!="")?window.localStorage.getItem("strWhoHasEnteredRequest"):window.sessionStorage.getItem("strWhoHasEnteredRequest") == "Healthcare Professional") {} else {}

}

function pageBillingInfoOnUnLoad() {}


function pagePharmacyOnLoad() {
    if (window.localStorage.getItem("drpChiefComplaint") != "Not sure" && (window.localStorage.getItem("drpChiefComplaint")!=null&&window.localStorage.getItem("drpChiefComplaint")!="")?window.localStorage.getItem("drpChiefComplaint"):window.sessionStorage.getItem("drpChiefComplaint") != "") {
        jQuery('#btnPharmacyProceed').text("Describe the " + (window.localStorage.getItem("drpChiefComplaint")!=null&&window.localStorage.getItem("drpChiefComplaint")!="")?window.localStorage.getItem("drpChiefComplaint"):window.sessionStorage.getItem("drpChiefComplaint"));
    } else {
        jQuery('#btnPharmacyProceed').text("Describe the discomfort");
    }

}


function pageAffectedAreaOnLoad() {}

function pageOldRequestOnLoad() {
    //$.ui.showBackbutton = true;
}

function pageThanksOnLoad() {}



function pageChiefComplaintOnLoad() {

    jQuery("#pageChiefComplaint").hide();

}

function pageTermsOnLoad() {}

function loadannouncements() {

    var ann_Helper = {
        "orgId": app_ID,
        "CRMUserId": (window.localStorage.getItem("guidCareGiverId")!=null&&window.localStorage.getItem("guidCareGiverId")!="")?window.localStorage.getItem("guidCareGiverId"):window.sessionStorage.getItem("guidCareGiverId")
    }

    ;

    jQuery.ajax({

            url: strWebserviceURL + "getAllAnnouncements",
            type: "POST",
            data: JSON.stringify(ann_Helper),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(result) {

                    if (result.d.hideAnnouncements == 1) {
                        jQuery('#btnAnnouncements').hide();
                    } else {
                        jQuery('#btnAnnouncements').show('fast');
                        fillannouncementsresult(result.d.listAnnouncements);
                    }

                }

                ,
            error: function error(response) {
                jQuery('#page_loading').hide();
                
                //alert(response);
                //alert(strGlobalErrorMessage);
            }
        }

    );


    return false;
}




function Delete_ann(ann_to_delete) {

    var annid = ann_to_delete;

    var ann_delete = {
        "announcementId": annid,
        "orgId": app_ID,
        "CRMUserId": (window.localStorage.getItem("guidCareGiverId")!=null&&window.localStorage.getItem("guidCareGiverId")!="")?window.localStorage.getItem("guidCareGiverId"):window.sessionStorage.getItem("guidCareGiverId"),
        "flag": 2
    }

    ;

    jQuery.ajax({

            url: strWebserviceURL + "updateAnnouncement",
            type: "POST",
            data: JSON.stringify(ann_delete),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(result) {
                    loadannouncements();
                    jQuery("#pageAnnouncementsdetails").hide();
                    jQuery("#pageAnnouncements").show();
                    jQuery("#pageIndex").hide();
                    curr_div.push("#pageAnnouncements");
                    prev_div.pop();

                }

                ,
            error: function error(response) {
                jQuery('#page_loading').hide();

                //alert(strGlobalErrorMessage);
            }
        }

    );


}



function get_ann_details(ann_details, ann_url) {

    var annid = ann_details;
    announcetodelete = ann_details;
    var annurl = ann_url;

    var ann_details = {
        "announcementId": annid,
        "orgId": app_ID,
        "CRMUserId": (window.localStorage.getItem("guidCareGiverId")!=null&&window.localStorage.getItem("guidCareGiverId")!="")?window.localStorage.getItem("guidCareGiverId"):window.sessionStorage.getItem("guidCareGiverId"),
        "flag": 1
    }

    ;

    jQuery.ajax({

            url: strWebserviceURL + "updateAnnouncement",
            type: "POST",
            data: JSON.stringify(ann_details),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(result) {
                    
                    jQuery("#announcementsdesc").html("<iframe src='" + ann_url + "'></iframe>");

                    jQuery("#pageAnnouncementsdetails").show();
                    jQuery("#pageAnnouncements").hide();
                    curr_div.push("#pageAnnouncementsdetails");
                    prev_div.push("#pageAnnouncements");
                    loadannouncements();
                }

                ,
            error: function error(response) {
                jQuery('#page_loading').hide();

                //alert(strGlobalErrorMessage);
            }
        }

    );


}




function fillannouncementsresult(listAnnouncements) {
    $("#announcements_list").html("");


    var varResultData = "";
    var rdflag;
    var hide_ann = 'show_ann';
    var hide_count = 0;
    var no_unread = 0;

    if (listAnnouncements.length > 0) {
        jQuery.each(listAnnouncements, function(key, value) {
                hide_ann = 'show_ann';

                if (value.intTransactionType == 1) {
                    rdflag = 'read';
                } else if (value.intTransactionType == null || value.intTransactionType == 0 || value.intTransactionType == "") {
                    rdflag = 'unread';
                    no_unread++;
                } else {
                    hide_ann = 'hide_ann';
                    hide_count++;
                }

                if (value.strAannouncementDesc == "" || value.strAannouncementDesc == null) {
                    ann_title = 'Announcement ' + value.intAnnouncementId;
                } else {
                    ann_title = value.strAannouncementDesc;
                }

                $("#announcements_list").append('<table width="600px" class="' + hide_ann + '" style="padding:0px;background:#99CCED;border-bottom: 1px solid;margin-bottom: 2px;" ><tr width="600px"><td  width="3px" class="' + rdflag + '"> </td><td width="495" align="left"><a onclick=get_ann_details("' + value.lngAnnouncementId + '","' + value.strAnnouncementURL + '"); style="padding:30px;cursor:pointer;">' + ann_title + '</></a></td><td width="100px"><input type="button" class="delete_ann" onclick=Delete_ann(' + value.lngAnnouncementId + '); value="Delete"></td></tr></table>');


            }

        );

    }

    var ann_count = listAnnouncements.length - hide_count;


    if (no_unread > 0) {
        jQuery('.ann_counter').html(+no_unread);
        jQuery('.ann_ind').show();
    } else {
        jQuery('#btnAnnouncements').html("Announcements");
        jQuery('.ann_ind').hide();
    }

}



function get_org_physicians() {
    jQuery('#page_loading').show();
    var get_physician_Helper = {
        "appID": app_ID,
        "guidCareGiverId": ""
    };

    jQuery.ajax({

            url: strWebserviceURL + "getPhysicians",
            type: "POST",
            data: JSON.stringify(get_physician_Helper),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(result) {
                
                    var varResultData = "";
                    if (result.d.listPhysicians.length > 0) {
                        jQuery.each(result.d.listPhysicians, function(key, value) {
                                varResultData += "<div style='padding-bottom:5px;'><table width='70%' align='center' border='0' cellpadding='1' style='border:1px solid #311D68;padding:15px 15px 0;'><tr><td><b>" + value.strName + ", " + value.strDegree + "</b></td><td width='30px' valign='top' align='right'><span style='color:#311D68;font-weight:bold;'>$" + Math.round(value.strCost) + "</span></td></tr><tr><td colspan='2'><i style='font-size:13px;'>" + isNull(value.strSpecialty) + "</i></td></tr><tr><td colspan='2' style='text-align:right'><b>" + isNull(value.strHospital) + "<b></td></tr><tr><td colspan='2' style='text-align:right;font-size:13px'>" + isNull(value.strAddress1) + "</td></tr><tr><td colspan='2' style='text-align:right;font-size:13px'>" + formatAddress(value.strAddress2, value.strAddress3) + "</td></tr><tr><td colspan='2' style='text-align:right;font-size:13px'>" + isNull(value.strCity) + ", " + isNull(value.strState) + " " + isNull(value.strPostalCode) + "</td></tr><tr><td colspan='4' width='100%'><table width='100%'><tr style='height:45px;'><td align='center' style='text-align:left;width:100%'><span class='selafara'><a href='javascript:;' class='buttonNext iconRight right mini' style='margin-top:0px;font-size:12px;' onclick='gotoPaymentScreen(this)' guid='" + value.guidPhysicianId + "' strName='" + value.strName + ", " + value.strDegree + "' strCost='" + Math.round(value.strCost) + "' strState='" + isNull(value.strState) + "' strDegree='" + value.strDegree + "'>Select this Provider and Enter Patient Info</a> </sapn></td></tr></table></td></tr></table></div>";
                            }

                        );

                        jQuery("#fill_default_doc_list").html(varResultData);
                        jQuery('#page_loading').hide();
                    }
                }

                ,
            error: function error(response) {
                jQuery('#page_loading').hide();
                jQuery('#page_loading').hide();

                alert(strGlobalErrorMessage);
            }
        }

    );


}