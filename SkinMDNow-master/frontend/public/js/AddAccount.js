jQuery(function() {

   jQuery.fn.fnAddAccount = function() {
      jQuery('#page_loading').show();

      var isHealthProfessional = true;

      if (jQuery('#drpNewIsHealthProffesional  option:selected').val() == "false") {
         isHealthProfessional = false;
      }
      var skinMDAddAccount = {
            "guidAccountId": "",
            "guidParentAccountId": "",
            "intAccountTypeCode": 1,
            "intGender": parseInt(jQuery('#drpNewGender option:selected').val()),
            "email": jQuery('#txtNewEmail').val(),
            "username": jQuery('#txtNewUsername').val(),
            "strFirstName": jQuery('#txtNewFirstName').val(),
            "strMiddleName": jQuery('#txtNewMiddleName').val(),
            "strLastName": jQuery('#txtNewLastName').val(),
            "strPassword": jQuery('#txtNewPassword').val(),
            "strPhone": jQuery('#txtNewPhone').val(),
            "strAccountDOB": jQuery('#txtNewDateOfBirth').val(),
            "isHealthProfessional": isHealthProfessional,
            "strErrorMessage": ""
         };

      jQuery.ajaxSetup({
         headers: {
         'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
         }
      });
 
      jQuery.ajax({
           url: skinmdserviceURL + "addAccount",
           type: "POST",
           data: JSON.stringify(skinMDAddAccount),
           contentType: "application/json; charset=utf-8",
           dataType: "json",
           success: function(result) {
               jQuery('#page_loading').hide();
               if (result.strErrorMessage == "") {
                     alert("Account created.");
                   /* jQuery('#txtPassword').val(jQuery('#txtNewPassword').val());
                   jQuery('#txtUsername').val(jQuery('#txtNewEmail').val());
                   window.localStorage.setItem("strUserName", jQuery('#txtNewEmail').val());
                   window.localStorage.setItem("strPassword", jQuery('#txtNewPassword').val());
                   LoginMe(false); */
                   jQuery("#pageCreateNew").hide();
                   jQuery("#pageLogin").show();
               } else {
                  alert(result.strErrorMessage);
               }
           },
           error: function error(response) {
               alert(strGlobalErrorMessage);
           }
      });
   }
});