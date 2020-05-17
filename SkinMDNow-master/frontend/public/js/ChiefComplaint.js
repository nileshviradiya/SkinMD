var ChiefComplaintData = "";
var MultiselectedValue = "";
var selectedValue = "";
var selectedArr = new Array();
var i;
var count = 0;
var MultiSelectOptionQuestionId = "";
var dropDownSelected = [];

var multiselectMainArray = [];

function ChiefComplaintJS() {

    jQuery('#page_loading').show();
    var ChiefComplaintId = (window.localStorage.getItem("drpChiefComplaintID")!=""&&window.localStorage.getItem("drpChiefComplaintID")!=null)?window.localStorage.getItem("drpChiefComplaintID"):window.sessionStorage.getItem("drpChiefComplaintID");

    
    if (ChiefComplaintId != "") {
       
        if ((window.localStorage.getItem("drpGender")!=null&&window.localStorage.getItem("drpGender")!="")?window.localStorage.getItem("drpGender"):window.sessionStorage.getItem("drpGender") == "Male") {
            var gender = false;

        } else {
            var gender = true;
        }
        var ChiefComplaintDyanimicData = "";
        var chiefComplaintParam = {
            "guidCheifComplaintId": ChiefComplaintId,
            "gender": gender,
            "app_ID": app_ID
        };
        var arrayQuestions = "";
        var ChiefStrErrorMesg = "";
        
        jQuery.ajaxSetup({
            headers: {
            'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
            }
        });

        jQuery.ajax({
            url: skinmdserviceURL + "getQuestionTemplate",
            type: "POST",
            data: JSON.stringify(chiefComplaintParam),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(res) {
                jQuery('#page_loading').hide();

                for (var key in res) {
                    var res3 = res[key];

                    for (var key3 in res3) {

                        if (key3.toString() == "listQuestions") {

                            arrayQuestions = res3[key3];
                        }
                        if (key3.toString() == "strErrorMessage") {

                            ChiefStrErrorMesg = res3[key3];

                        }
                    }

                }
               
                var QuestionListArray = [];
                var AnswerListArray = [];
                if (ChiefStrErrorMesg != null && ChiefStrErrorMesg != "") {
                    // nothing
                } else {
                    for (var keyQuestion in arrayQuestions) {
                        var quesObj = arrayQuestions[keyQuestion];
                        var questionName = "";
                        var newObj = Object();
                        for (var keyQuesObj in quesObj) {
                            if (keyQuesObj.toString() == "strQuestionName") {
                                if(quesObj[keyQuesObj] != null){                                    
                                    newObj.strQuestionName = quesObj[keyQuesObj].toString();
                                }else{
                                    newObj.strQuestionName = '';
                                }
                            }
                            
                            if (keyQuesObj.toString() == "strQuestionType") {
                                if(quesObj[keyQuesObj] != null){
                                    newObj.strQuestionType = quesObj[keyQuesObj].toString();
                                }else{
                                    newObj.strQuestionType = '';
                                }                                
                            }

                            if (keyQuesObj.toString() == "guidQuestionId") {
                                if(quesObj[keyQuesObj] != null){
                                    newObj.guidQuestionId = quesObj[keyQuesObj];
                                }else{
                                    newObj.guidQuestionId = '';
                                }
                            }

                            if (keyQuesObj.toString() == "listOptions") {
                                if(quesObj[keyQuesObj] != null){
                                    newObj.listOptions = quesObj[keyQuesObj];
                                }else{
                                    newObj.listOptions = '';
                                }                                
                            }
                        }
                        if (newObj.listOptions.length > -1) {
                            QuestionListArray.push(newObj);
                        }
                    }

                    var obj = [];

                    ChiefComplaintDyanimicData += "<dl id='dlChiefComplaint'>";
                    if(QuestionListArray.length > 0){
                        for (var i = 0; i < QuestionListArray.length; i++) {

                            obj.push(QuestionListArray[i]);

                            for (var j = 0; j < obj.length; j++) {

                                if (obj[j].strQuestionType == "Text Area") {

                                    ChiefComplaintDyanimicData += "<dt  data='" + obj[j].guidQuestionId + "'><p  class='icon add mini' >" + obj[j].strQuestionName + "</p></dt>";
                                    ChiefComplaintDyanimicData += "<dd><div class='dddiv'>";
                                    ChiefComplaintDyanimicData += "<textarea  guid='" + obj[j].guidQuestionId + "' id='txtDiscomfort' onchange='GetTextValue(this);' value='' style='width:100%;height:200px;' placeholder='' class='jq-ui-forms'></textarea>";
                                    ChiefComplaintDyanimicData += "</div></dd>";
                                }

                                if (obj[j].strQuestionType == "Multiple") {

                                    ChiefComplaintDyanimicData += "<dt data='" + obj[j].guidQuestionId + "'><p class='icon add mini' >" + obj[j].strQuestionName + "</p></dt>";

                                    if (obj[j].listOptions != "" && obj[j].listOptions != null) {
                                        var listObj = obj[j].listOptions;
                                        var arr = new Array();
                                        for (var keyoptionObj in listObj) {
                                            var newAnsObj = listObj[keyoptionObj];

                                            var arrObj = new Object();
                                            for (var keyAnsOpt in newAnsObj) {
                                                if (keyAnsOpt.toString() == "guidOptionId") {
                                                    arrObj.guidOptionId = newAnsObj[keyAnsOpt];
                                                }
                                                if (keyAnsOpt.toString() == "strOptionName") {
                                                    arrObj.strOptionName = newAnsObj[keyAnsOpt];
                                                }
                                            }
                                            arr.push(arrObj);
                                        }
                                        ChiefComplaintDyanimicData += "<dd><div class='dddiv'><select multiple='multiple'  onfocusout='multipleselectkind(this)' class='multi' data-native-menu='false' guid='" + obj[j].guidQuestionId + "' >";
                                        for (var k = 0; k < arr.length; k++) {
                                            ChiefComplaintDyanimicData += "<option value='" + arr[k].guidOptionId + "'>" + arr[k].strOptionName + "</option>";
                                        }
                                        ChiefComplaintDyanimicData += "</select></div></dd>";
                                    }else{
                                        ChiefComplaintDyanimicData += "<p style='color:red; text-align: center'>No options are available</p>";
                                    }
                                }
                                if (obj[j].strQuestionType == "Dropdown") {

                                    ChiefComplaintDyanimicData += "<dt data='" + obj[j].guidQuestionId + "'><p class='icon add mini' >" + obj[j].strQuestionName + "</p></dt>";

                                    if (obj[j].listOptions != "" && obj[j].listOptions != null) {
                                        var listObj = obj[j].listOptions;
                                        var arr = new Array();
                                        for (var keyoptionObj in listObj) {
                                            var newAnsObj = listObj[keyoptionObj];

                                            var arrObj = new Object();
                                            for (var keyAnsOpt in newAnsObj) {
                                                if (keyAnsOpt.toString() == "guidOptionId") {
                                                    arrObj.guidOptionId = newAnsObj[keyAnsOpt];
                                                }
                                                if (keyAnsOpt.toString() == "strOptionName") {
                                                    arrObj.strOptionName = newAnsObj[keyAnsOpt];
                                                }
                                            }
                                            arr.push(arrObj);
                                        }
                                        ChiefComplaintDyanimicData += "<dd><div class='dddiv'><select  onchange='GetSelectedIndex(this);' class='getindex' guid='" + obj[j].guidQuestionId + "' >";
                                        ChiefComplaintDyanimicData += "<option value=''></option>";
                                        for (var k = 0; k < arr.length; k++) {
                                            ChiefComplaintDyanimicData += "<option value='" + arr[k].guidOptionId + "'>" + arr[k].strOptionName + "</option>";

                                        }
                                        ChiefComplaintDyanimicData += "</select></div></dd>";

                                    }else{
                                        ChiefComplaintDyanimicData += "<p style='color:red; text-align: center'>No options are available for above question</p>";
                                    }
                                }
                            }
                            obj.length = 0;
                        }
                    }else{
                        ChiefComplaintDyanimicData += "<p style='color:red; padding-left: 80px;'>THERE ARE NO QUESTIONS AVAILABLE.</p>";    
                    }
                    ChiefComplaintDyanimicData += "<br>";
                    ChiefComplaintDyanimicData += "</dl><br>";
                    jQuery('#ChiefcomplaintCollapsableBox').html(ChiefComplaintDyanimicData);
                    setTimeout(()=>{
                        jQuery("#ChiefcomplaintCollapsableBox").show();
                        jQuery("#pageChiefComplaint").show();
                        jQuery('#dlChiefComplaint').accordion();
                        jQuery('#page_loading').hide();
                        jQuery("#pagePharmacy").hide();                    
                        
                        jQuery('#chiefc_loading').hide();
                        prev_div.push("#pagePharmacy");
                        curr_div.push("#pageChiefComplaint");
                    },1000);                        
                   
                }
            }
        });
    } else {
        jQuery('#page_loading').hide();
        jQuery('#chiefc_loading').hide();
        alert("Chief Complaint id is not selected");
    }

    jQuery("#pagePharmacy").hide();
    jQuery("#ChiefcomplaintCollapsableBox").show();
    jQuery("#pageChiefComplaint").show();
}


function GetSelectedIndex(selectObj) {

    var SelectOptionQuestionId = jQuery(selectObj).attr('guid');

    var idx = selectObj.selectedIndex;

    var which = selectObj.options[idx].value;

    selectedValue = SelectOptionQuestionId + "~Dropdown~" + which;
    dropDownSelected.push(selectedValue);

}

function multipleselectkind(obj) {

    var Newobj = Object();


    MultiSelectOptionQuestionId = jQuery(obj).attr('guid');
    Newobj.QuestionId = MultiSelectOptionQuestionId;
    for (var i = 0; i < obj.length; i++) {

        if (obj[i].selected) {

            var contains = containsObject(obj[i].value, selectedArr);

            if (contains == false) {
                var txt = obj[i].value;

                selectedArr.push(txt);
            }

        }

    }
    Newobj.MultiOptionList = selectedArr.join("~");
    selectedArr.length = null;

    multiselectMainArray.push(Newobj);
}

function containsObject(obj, list) {
    var i;
    for (i = 0; i < list.length; i++) {
        if (list[i] === obj) {
            return true;
        }
    }

    return false;
}

function GetTextValue(obj) {

    var TextBoxId = jQuery(obj).attr('guid');
    if (ChiefComplaintData == "") {
        ChiefComplaintData += TextBoxId + "~Text Area~" + obj.value;
    } else {
        ChiefComplaintData += "|" + TextBoxId + "~Text Area~" + obj.value;
    }

}

function SaveChiefComplaintData() {
    jQuery('#page_loading').show();

    if (dropDownSelected.length > 0) {
        if (ChiefComplaintData == "") {

            ChiefComplaintData += dropDownSelected.join("|");
        } else {
            ChiefComplaintData += "|" + dropDownSelected.join("|");
        }

    }

    if (multiselectMainArray.length > 0) {
        for (i = 0; i < multiselectMainArray.length; i++) {

            if (ChiefComplaintData == "") {

                ChiefComplaintData += multiselectMainArray[i].QuestionId + "~Multiple~" + multiselectMainArray[i].MultiOptionList;
            } else {
                ChiefComplaintData += "|" + multiselectMainArray[i].QuestionId + "~Multiple~" + multiselectMainArray[i].MultiOptionList;
            }
        }

    }

    var CaseId = (window.localStorage.getItem("guidCaseId")!=""&&window.localStorage.getItem("guidCaseId")!=null)?window.localStorage.getItem("guidCaseId"):window.sessionStorage.getItem("guidCaseId");
    var chiefComplaintSaveParam = {
        "additionalQuestions": {
            "guidCaseId": CaseId,
            "strErrorMessage": "",
            "strQuestionList": ChiefComplaintData
        },
        "app_ID": app_ID
    };
    
    jQuery.ajaxSetup({
        headers: {
        'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
        }
    });
    
    jQuery.ajax({
        url: skinmdserviceURL + "saveAdditionalQuestions",
        type: "POST",
        data: JSON.stringify(chiefComplaintSaveParam),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(result) {
            for (var i = 0; i < window.localStorage.length; i++){
                // do something with localStorage.getItem(localStorage.key(i));
               
            }
            jQuery('#page_loading').hide();
            selectedArr.length = null;
            ChiefComplaintData = "";
            jQuery('#txtEmail').html((window.localStorage.getItem("loggedInUserEmail")!=""&&window.localStorage.getItem("loggedInUserEmail")!=null)?window.localStorage.getItem("loggedInUserEmail"):window.sessionStorage.getItem("loggedInUserEmail"));
            jQuery("#spanPageThanksEmailID").html((window.localStorage.getItem("txtEmail")!=null&&window.localStorage.getItem("txtEmail")!="")?window.localStorage.getItem("txtEmail"):window.sessionStorage.getItem("txtEmail"));
            jQuery("#pageChiefComplaint").hide();
            jQuery("#backButton").show();
            jQuery("#pageThanks").show();
            curr_div.push("#pageThanks");
            prev_div.push("#ChiefComplaintbtnProceed");
        }
    });
}