/*
 Login.js
 SkinMdNow
 
 Created by QuestApple on 8/29/12.
 Copyright (c) 2012 QuestApple. All rights reserved.
 */
var hddiv='';
var flaglogin=0;
var curr_div=[];
function LoginLogout()
{
    if(jQuery("#btnLogin").text() == "Login")
    {

	hddiv = curr_div[curr_div.length-1];

 if(!hddiv)
 {
	
 	jQuery('#pageLogin').show();
 	jQuery('#pageIndex').hide();
	curr_div.push("#pageLogin");
	 prev_div.push("#pageIndex");
 }
 
else if(hddiv=='#pageLogin')
{	
jQuery('.panel').hide();
jQuery('#pageLogin').show();
}
else
 {
jQuery('.panel').hide();
 jQuery('#pageLogin').show();

curr_div.push("#pageLogin");
	 prev_div.push(hddiv);
 }       

    }
    else
    {
       		onConfirm();
    }
}

function onConfirm()
{
    if(jQuery('#btnLogin').text('Logout'))
    {

        window.localStorage.setItem("strUserName", "");
        window.localStorage.setItem("strPassword", "");
        window.localStorage.setItem("isLoggedIn","false");
        window.localStorage.setItem("guidCareGiverId","");
        jQuery('#btnLogin').text('Login');
        jQuery('#btnOldRequests').attr('style','display:none');

        jQuery("#divFavorites").hide("fast");
        jQuery("#divExistingPatients").hide("fast");
   
       flaglogin=0;
	if(flaglogin==0)
	{
		jQuery(".log_button").each(function()
		 {
	  		    jQuery(".log_button").html('Login');	
  		 });
    } 
	
       window.location.href = "index.html";
    }
    
}



function LoginMe()
{
    jQuery('.errorDiv').hide();
    jQuery('#page_loading').show();
    $('form').submit();
}
function handleKeyPress(event){
    if(event.key === 'Enter'){
        LoginMe();
    }
}


//window.localStorage.clear();
//window.localStorage.removeItem('chiefComplaint');
var locationURL = window.location.href;
    if(locationURL.indexOf('login')>0)
    {
        jQuery('.btnLoginAction').hide();
    }
    else {
        //alert();
        //jQuery('.btnLogin').show();
        jQuery(".btnLoginAction").each(function() {
            jQuery(".btnLoginAction").html('Login');
        });
    }
   
var isLoggedIn = (window.localStorage.getItem('isLoggedIn')!=null&&window.localStorage.getItem('isLoggedIn')!="")?window.localStorage.getItem('isLoggedIn'):window.sessionStorage.getItem('isLoggedIn');
if(isLoggedIn=="false")
{
    //alert(isLoggedIn);
    setTimeout(function(){
        jQuery('#directLogin').val('false');
        jQuery('#directLogin').attr('value','false');
    }, 1500);
}
