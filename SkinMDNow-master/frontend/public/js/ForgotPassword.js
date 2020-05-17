function forgotPassword() {
    if(jQuery("#email").val() == ''){
        alert('Please enter registered Email-ID.')
        return false;
    }
    jQuery('#page_loading').show();

    var PasswordHelper = {
        "email": jQuery("#email").val()
    };
    
    jQuery.ajaxSetup({
        headers: {
        'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
        }
    });

    jQuery.ajax({
        url: skinmdserviceURL + "forgotpassword",
        type: "POST",
        data: JSON.stringify(PasswordHelper),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(result) {
            alert(result.message);         
            jQuery('#page_loading').hide();
            if(result.status == true){
                jQuery('#pageForgotPassword').hide(); 
                jQuery('#pageLogin').show(); 
            }
        },
        error: function error(response) {
            alert(strGlobalErrorMessage);
        }
    });
}

function gotoForgotPasswordScreen() {
    jQuery("#pageLogin").hide();
    jQuery("#pageForgotPassword").show();
    curr_div.push("#pageForgotPassword");
    prev_div.push("#pageLogin");
}
