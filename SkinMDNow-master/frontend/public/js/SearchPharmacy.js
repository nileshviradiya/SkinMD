function SearchPharmacy()
{
    $.ui.showBackbutton = true;
    jq.ui.showMask("Searching");
 
    var SearchHelper = { "strKeyword": $("#txtPharmacySearch").val(),"app_ID":app_ID};
    

    jQuery.ajax({
                    url: strWebserviceURL+"searchPharmacies",
                    type: "POST",
                    headers: { "cache-control": "no-cache" },
                    data: JSON.stringify(SearchHelper),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result)
                    {
                       
                        if(result.d.strErrorMessage == "" || result.d.strErrorMessage == null)
                        {
                          
                            filPharmacySearchResults(result.d.listPharmacies);
                        }
                        else
                        {
                            alert(strGlobalErrorMessage);
                      
                        }
                
                        jq.ui.hideMask();
                
                    },
                    error: function error(response)
                    {
                        jq.ui.hideMask();
             
                        alert(strGlobalErrorMessage);
                    }
                });    
}

function filPharmacySearchResults(listPharmacy)
{
 
    var varResultData = "";
    if(listPharmacy.length > 0)
    {
        jQuery.each(listPharmacy, function(key,value)
                {
                    varResultData += "<div style='padding-bottom:5px'><table onclick='gotoPreviousScreen(this)' guid='" + value.guidAccountId + "' strName='" + isNull(value.strFirstName) + " " + isNull(value.strMiddleName) + " " + isNull(value.strLastName) + "' strAddress='"+ formatAddress(value.strAddress2,value.strAddress3) +"' width='100%' border='0' cellpadding='4' style='background-color:#fff'><tr><td><b style='font-size:17px'>" + isNull(value.strFirstName) + " " + isNull(value.strMiddleName) + " " + isNull(value.strLastName) + "</td></tr><tr><td><i style='font-size:13px;'>" + isNull(value.strSpecialty) + "</i></td></tr><tr><td colspan='2' style='text-align:right'><b>" + isNull(value.strHospital) + "<b></td></tr><tr><td colspan='2' style='text-align:right;font-size:13px'>" + isNull(value.strAddress1) + "</td></tr><tr><td colspan='2' style='text-align:right;font-size:13px'>" + formatAddress(value.strAddress2,value.strAddress3)  + "</td></tr><tr><td colspan='2' style='text-align:right;font-size:13px'>"+ isNull(value.strCity) + ", " + isNull(value.strState) + " "+ isNull(value.strPostalCode) +"</td></tr></table></div>" ;
                });
        jQuery("#divPharmacySearchResults").html(varResultData);
        $.ui.loadContent("#pagePharmacySearchResults",false,false,"down");
    }
    else
    {
        alert("None Found. Please change your search criteria.");
    }
}

function gotoPreviousScreen(obj)
{
    obj.style.backgroundColor="#CCFFCC";
    jQuery( obj ).animate({
                     opacity: "toggle"
                          }, { duration: "slow" }).promise().done(function()
                                                                 {
                                                             
                                                                  $.ui.goBack();
                                                                  $.ui.updateContentDiv("divSelectedPharmacy","<b>Selected Pharmacy: </b><i>"+jQuery(obj).attr("strName")+ " - " + jQuery(obj).attr("strAddress") +" </i><br><br><hr width='95%' color='#ddd'><br>");
                                                         
                                                                  document.getElementById("drpPharmacy").selectedIndex = 0;
                                                                  window.localStorage.setItem("guidPharmacyId",jQuery(obj).attr("guid"));
                                                                         });
    
}




