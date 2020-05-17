function SearchPhysician()
{
    jQuery('#page_loading').show();
    window.localStorage.setItem("CouponCode",'testcouponcode');
    window.localStorage.setItem("disc_Code",'%100%');
    window.localStorage.setItem("CouponCode1",'testcoupon1');
    window.localStorage.setItem("disc_Code1",'$5$');

    if(jQuery("#drpDoctorSearchState  option:selected").val() != "XX")
    {
      
        var SearchHelper = { 
            "strKeyword": jQuery("#txtSearchDoctorNameField").val(),
            "strSpecialty": jQuery("#drpSearchDoctorSpecialty  option:selected").val(),
            "strState":jQuery("#drpDoctorSearchState  option:selected").val(),
           };
        jQuery.ajaxSetup({
            headers: {
            'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
            }
        });
        jQuery.ajax({
             //url: skinmdserviceURL + "getPhysicians1", 
             url : 'https://skinmdnow.nuvolatek.net/frontend/public/api/getPhysicians1',
             /*url: "http://34.235.116.137:8080/frontend/public/api/getPhysicians1",*/
            type: "POST",
            data: SearchHelper,
            success: function (result)
            {                           
                result = JSON.parse(result);
                if(result.strErrorMessage == "" || result.strErrorMessage == null)
                {
                    fillDoctorSearchResults(result.listPhysicians);
                }else{
                    alert(strGlobalErrorMessage);
                }
                jQuery('#page_loading').hide();                    
            },
            error: function error(response)
            {
                jQuery('#page_loading').hide();
                
                alert(strGlobalErrorMessage);
            }
        });
    }
    else
    {
	jQuery('#page_loading').hide();
        alert("Please Select a State.");
    }
}

function fillDoctorSearchResults(listPhysicians)
{
    var varResultData = "";
    if(listPhysicians.length > 0)
    {
        jQuery.each(listPhysicians, function(key,value)
                {
                    varResultData += "<div style='padding-bottom:5px;'><table width='70%' align='center' border='0' cellpadding='1' style='border:1px solid #311D68;padding:15px 15px 0; border-radius:8px;'><tr><td><b style='font-size:22px;float:left'>" + value.strName + ((value.strDegree == null)? '' : (", " + value.strDegree) ) + "</b></td><td width='30px' valign='top' align='right'><span style='color:#311D68;font-weight:bold; font-size:32px;margin-right:6px;'>$" + Math.round(value.strCost) + "</span></td></tr><tr><td colspan='2' ><i style='font-size:13px; font-style:normal;float:left;margin-top:-12px;margin-bottom:8px;'>" + isNull(value.strSpecialty) + "</i></td></tr><tr><td colspan='2' style='text-align:left'><b>" + isNull(value.strHospital) + "<b></td></tr><tr><td colspan='2' style='text-align:left;font-size:13px'>" + isNull(value.strAddress1) + "</td></tr><tr><td colspan='2' style='text-align:left;font-size:13px'>" + formatAddress(value.strAddress2,value.strAddress3)  + "</td></tr><tr><td colspan='2' style='text-align:left;font-size:13px'>"+ isNull(value.strCity) + ", " + isNull(value.strState) + " "+ isNull(value.strPostalCode) +"</td></tr><tr><td colspan='4' width='100%'><table width='100%'><tr style='height:45px;'><td align='center' style='text-align:left;width:100%'><span class='selafara'><a href='javascript:;' class='buttonNext iconRight right mini' style='margin-top:0px; font-size:12px;' onclick='gotoPaymentScreen(this)' guid='" + value.guidPhysicianId + "' strName='" + value.strName +", "+value.strDegree +  "' strCost='" + Math.round(value.strCost) + "' strState='"+isNull(value.strState)+"' strDegree='"+value.strDegree+  "' dermAddress='" + value.dermId + "'>Select Provider</a> </sapn></td></tr></table></td></tr></table></div>" ;

                    // varResultData += "<div style='padding-bottom:5px;'><table width='70%' align='center' border='0' cellpadding='1' style='border:1px solid #311D68;padding:15px 15px 0; border-radius:8px;'><tr><td><b style='font-size:22px;float:left'>" + value.strName + ((value.strDegree == null)? '' : (", " + value.strDegree) ) + "</b></td><td width='30px' valign='top' align='right'><span style='color:#311D68;font-weight:bold; font-size:32px'>$" + Math.round(value.strCost) + "</span></td></tr><tr><td colspan='2'><i style='font-size:13px; font-style:normal;float:left;'>" + isNull(value.strSpecialty) + "</i></td></tr><tr><td colspan='2' style='text-align:left'><b>" + isNull(value.strHospital) + "<b></td></tr><tr><td colspan='2' style='text-align:left;font-size:13px'>" + isNull(value.strAddress1) + "</td></tr><tr><td colspan='2' style='text-align:left;font-size:13px'>" + formatAddress(value.strAddress2,value.strAddress3)  + "</td></tr><tr><td colspan='2' style='text-align:left;font-size:13px'>"+ isNull(value.strCity) + ", " + isNull(value.strState) + " "+ isNull(value.strPostalCode) +"</td></tr><tr><td colspan='4' width='100%'><table width='100%'><tr style='height:45px;'><td align='center' style='text-align:left;width:100%'><span class='selafara'><a href='javascript:;' class='buttonNext iconRight right mini' style='margin-top:0px; font-size:12px;' onclick='gotoPaymentScreen(this)' guid='" + value.guidPhysicianId + "' strName='" + value.strName +", "+value.strDegree +  "' strCost='" + Math.round(value.strCost) + "' strState='"+isNull(value.strState)+"' strDegree='"+value.strDegree+  "' dermAddress='" + value.dermId + "'>Select Provider</a> </sapn></td></tr></table></td></tr></table></div>" ;

 });
 
        jQuery("#divDoctorSearchResults").html(varResultData);

	 jQuery("#pageDoctorSearch").show();
	jQuery("#pageDoctorSelectionSearch").hide();
	 curr_div.push("#pageDoctorSearch");
	 prev_div.push("#pageDoctorSelectionSearch");
    }
    else
    {
        alert("No doctors were found. Please change your search criteria.");
    }
}

function gotoPaymentScreen(obj)
{
    couponapplied=1;
    window.localStorage.setItem("strDermAddressId", jQuery(obj).attr('dermAddress'));
    window.localStorage.setItem("strSelectedDoctor", jQuery(obj).attr('strName'));
    window.localStorage.setItem("guidDoctorId", jQuery(obj).attr('guid'));

    window.localStorage.setItem("strSelectedDoctorPrice", jQuery(obj).attr('strCost'));
     window.localStorage.setItem("strSelectedDoctorPricereal", jQuery(obj).attr('strCost'));
	window.localStorage.setItem("strSelectedDoctordegree",jQuery(obj).attr('strDegree'));	

    window.localStorage.setItem("strSelectedDoctorState", jQuery(obj).attr('strState'));
    jQuery("#divCreditCardHeading").html(""+(window.localStorage.getItem("strSelectedDoctor")!=null&&window.localStorage.getItem("strSelectedDoctor")!="")?window.localStorage.getItem("strSelectedDoctor"):window.sessionStorage.getItem("strSelectedDoctor")+" has a fee of $"+ (window.localStorage.getItem("strSelectedDoctorPrice")!=null&&window.localStorage.getItem("strSelectedDoctorPrice")!="")?window.localStorage.getItem("strSelectedDoctorPrice"):window.sessionStorage.getItem("strSelectedDoctorPrice")+". Your credit card will be charged a total of $"+ (window.localStorage.getItem("strSelectedDoctorPrice")!=null&&window.localStorage.getItem("strSelectedDoctorPrice")!="")?window.localStorage.getItem("strSelectedDoctorPrice"):window.sessionStorage.getItem("strSelectedDoctorPrice")+".<span class='apply_code'>Apply Code</span>");

    /* if (window.localStorage.getItem("isLoggedIn") == "true")
    { */
        
        jQuery("#pagePatientInfo").show();
        jQuery("#pageDoctorSearch").hide();
        jQuery("#pageDoctorSelectionSearch").hide();
        jQuery("#pageChiefComplaint").hide();
        curr_div.push("#pagePatientInfo");
        prev_div.push("#pageDoctorSelectionSearch");    
    /* }else{
        jQuery("#btnLogin").html('Login');	
  		jQuery("#pageDoctorSelectionSearch").hide();	
    	jQuery("#pageLogin").show();
        jQuery("#pageDoctorSearch").hide();
        jQuery("#pageChiefComplaint").hide();	
        curr_div.push("#pageLogin");
        prev_div.push("#pageDoctorSelectionSearch");
	    paymentdivload = 1;
    } */
}

function isNull(obj)
{
    if(obj && obj != "null")
    {
        return obj;
    }
    else
    {
        return "";
    }
}

function formatAddress(addr2, addr3)
{
    var varAddress = "";
    if(addr2 && addr3)
    {
        varAddress = addr2 +", "+addr3;
    }
    else if(addr2 && !addr3)
    {
        varAddress = addr2;
    }
    else if(!addr2 && addr3)
    {
        varAddress = addr3;
    }
    else
    {
        varAddress = "";
    }
    return varAddress;
}





