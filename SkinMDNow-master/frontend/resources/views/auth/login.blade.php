@extends('layouts.skin')

@section('content')
<div id="content">
    <div id="modalContainer"> </div>
    <!--Login Page-->
    <div id="pageLogin" class="panel" data-modal="true">
        <form method="POST" action="{{ route('login') }}">
            @csrf
            
            @if (\Session::has('status'))                
            <h3 style="color:green">{!! \Session::get('status') !!}</h3>
            @endif
            
            @if (\Session::has('warning'))                
            <h3 style="color:red">{!! \Session::get('warning') !!}</h3>
            @endif
            
            <h3 class="h3St">Login Now</h3>
            <div class="loginDiv">
                <input id="username" type="text" class="jq-ui-forms" name="username" style="margin-bottom: 6px !important;" value="{{ old('username') }}" required autocomplete="username" autofocus placeholder="Username" onKeyPress="handleKeyPress(event);">
                    @error('username')
                        <div class="errorDiv">{{ $message }}</div>
                    @enderror
                <input id="password" type="password" class="form-control" name="password" style="margin-bottom: 6px !important;" required autocomplete="current-password"  placeholder="Password"  onKeyPress="handleKeyPress(event);">
                    @error('password')
                        <div class="errorDiv">{{ $message }}</div>
                    @enderror
                <div>
                    <a href="javascript:;" onClick="gotoForgotPasswordScreen()" class="buttonLightColor lfbtys1" 
                style="position: relative;/* left: 33%;top: 52%; */">Forgot password?</a> 
                    <a href="javascript:;" class="buttonNext lfbtys" onClick="LoginMe(false)" style="position:relative;">Login</a>
                </div>
                <br clear="all">
                <br clear="all">
                
                <div style="margin-top: 22px;margin-left: -37px;"> 
                    <a id='btnStartNew' onClick="StartNewCaseLoginScreen()" href="" class="button" style="">Start New Request</a> 
                    <br clear="all">
                    <br clear="all">
                    <br clear="all">
                </div>
                <br clear="all">

                <a href="javascript:;" class="registerBtn" onClick="openCreateAccountPage()" class="button">Create New Account</a>
                <br clear="all"> <br clear="all">
                <!-- <span class="backBtn"> 
                    <i class="fa fa-angle-left"></i>
                    <a class="phots-01">Back</a>
                </span> -->
                <br clear="all"> <br clear="all">
            </div>
            <input type="hidden" value="true" id="directLogin" name="directLogin" />
        </form>
    </div>    
    <!--END-->

    <!--Forgot Password-->
    <div id="pageForgotPassword" class="panel" data-header="custom_header" style="display:none;">
        <h3 class="h3St">Reset Password</h3>
        <div class="forgotDiv">
            <!-- 
            <form method="POST" action="{{ route('password.email') }}" id="forgotPassword">
                @csrf -->
                <div class="form-group row">
                    <div class="col-md-6">
                        <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus placeholder="Enter Registered Email">

                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                </div>
            <!-- </form> -->
            
            <!-- <div style="width:350px;">
                <a href="javascript:;" onClick="forgotPassword()" class="button forpast resetPassword">Reset my password</a>
                <span class="backBtn" style="cursor: pointer;"> 
                    <i class="fa fa-angle-left"></i>
                    <a class="phots-01" onclick="jQuery('#pageForgotPassword').hide(); jQuery('#pageLogin').show(); ">Back</a>
                </span>
            </div> -->

            <div style="width:350px;">
                <a href="#" class="phots-01 ui-link button forpast" onclick="jQuery('#pageForgotPassword').hide(); jQuery('#pageLogin').show();">Back</a> 
                <a href="javascript:;" onclick="forgotPassword()" class="button forpast resetPassword ui-link">Reset my password</a>
            </div>

        </div>
    </div>
    <!--END-->

    <!--New user signup-->    
    <div id="pageCreateNew" class="panel" data-header="custom_header" style="padding:10px;display:none">
        <h3 style="color:#2D3446; font-family:'roboto', senserif">Create an Account</h3>
        <div style="margin:50px 0 0 310px;">
            <input type="text" id="txtNewFirstName" placeholder="First Name" class="jq-ui-forms" />
            <input type="text" id="txtNewMiddleName" placeholder="Middle Name" class="jq-ui-forms" />
            <input type="text" id="txtNewLastName" placeholder="Last Name" class="jq-ui-forms" />
            <div>
                <ul class="cretat">
                    <li class="firtset" style="width:120px!important;">
                        <select id="drpNewGender" style="width:150px!important;" data-native-menu="true">
                            <option value="0">Male</option>
                            <option value="1">Female</option>
                        </select>
                        <i class="fa fa-arrow-down" aria-hidden="true" style="      position: absolute;
                            top: 267px;
                            right: 585px;
                            color:#FFFFFF;
                            font-size: 15px;"></i>
                    </li>
                    <li style="padding:6px 0px 19px 18px;"> DOB:&nbsp; </li>
                    <li class="firtset1" style="width:80px;">
                        <input id="txtNewDateOfBirth" type='text' onClick="GetDate(this);" readonly placeholder="1980-12-01" class="jq-ui-forms" style="width:140px!important;" />
                    </li>
                </ul>
            </div>
            <br clear="all">
            <input type="tel" name="tel" id="txtNewPhone" value="" placeholder="Best Phone # (with area code)" class="jq-ui-forms" />
            <input type="text" id="txtNewUsername" placeholder="Username" class="jq-ui-forms" />
            <input type="email" id="txtNewEmail" value="" placeholder="Email" class="jq-ui-forms" />
            <input type="password" id="txtNewPassword" placeholder="Password" class="jq-ui-forms" />
            <input type="password" id="txtNewConfirmPassword" placeholder="Confirm Password" class="jq-ui-forms" />
            <div style="border:0px solid red; overflow:hidden;clear:both;">
                <label for="drpNewIsHealthProffesional" class="label_for" style="padding-top:8px; width:350px;">Are you a healthcare professional using <br />
                    Skin<sup>md</sup> Now for your patient?</label>
                <div style="width:353px !important;">
                    <select id="drpNewIsHealthProffesional" data-native-menu="false">
                        <option value="false">No</option>
                        <option value="true">Yes</option>
                    </select>
                    <i class="fa fa-arrow-down" aria-hidden="true" style=" 
                        position: absolute;
                        top: 584px;
                        right: 352px;
                        color: #FFFFFF;
                        font-size: 15px;"></i>
                    <br clear="all" />
                </div>
            </div>
            <br clear="all" />
            <a href="javascript:;" onClick="addAccount()" class="buttonNext lfbtys2" style="cursor: pointer;
                background-color: #312769;
                color: #FFFFFF !important;
                float: left;
                font-family: 'roboto',senserif;
                font-weight: normal !important;
                padding: 8px 0;
                text-align: center;
                text-decoration: none;
                font-size: 14px;
                width: 115px;
                -moz-border-radius: 7px;
                -webkit-border-radius: 7px;
                border-radius: 7px;
                position: absolute;
                left: 40% !important;
                font-size: 17px;
                width: 189px;
                /* top: 9%; */
                display: inline-block;
                /* float: right; */
                bottom: 22%;
            }">
            Create New Account</a> <br clear="all" />
            <br clear="all"  />
            <a href="javascript:;" onClick="cancelAccount()" class="buttonDelete lfbtys3">Cancel</a><br clear="all" />
            <br clear="all" />
        </div>
    </div>
    <!--END-->
</div>
@endsection
<style>
a.phots-01.ui-link.button.forpast {
    width: 39px;
    height: 18.5px;
    margin-top: 0.5px;
}
.ui-body-c .ui-link {
    color: #FFFFFF;
    font-weight: bold;
    font-size: 14px;
    text-decoration: none;
}
.forpast {
    color: #4482FF;
    float: left;
    font-family: 'roboto', senserif;
    font-size: 15px;
    font-weight: normal !important;
    padding: 8px 0;
    text-align: center;
    text-decoration: none;
    -moz-border-radius: 7px;
    -webkit-border-radius: 7px;
    border-radius: 7px;
}
.phots-01 {
    background-color: #312769;
    color: #FFFFFF;
    font-family: 'roboto', senserif;
    font-weight: normal !important;
    text-decoration: none !important;
    font-size: 14px;
    padding: 8px;
    -webkit-border-radius: 7px;
    padding: 9px 15px !important;
}
#content {
    text-align: center !important;
}
#btnStartNew, #btnOldRequests, #btnAnnouncements {
    /* background: url(images/btn_1.png) repeat-x scroll 0 0 #332465; */
    /* background-color: #4482FF; */
    background-color: #312769;
    color: #FFFFFF;
    float: left;
    font-family: 'roboto', senserif;
    font-size: 14px;
    font-weight: normal;
    padding: 8px;
    text-align: center;
    text-decoration: none;
    width: 150px;
    cursor: pointer;
    margin: 0 auto;
    margin: 0px 0 18px 61px;
    -moz-border-radius: 20px 20px 20px 20px;
    -webkit-border-radius: 20px 20px 20px 20px;
    border-radius: 7px;
    margin-left: 108px;
}

</style>
<script type="text/javascript">
// var i=1;
// if(i==1)
//     {
//         location.reload(true);
//         i=2;
//         return false;
//     }

// function StartNewCase() {
//     alert();
//     // arrSelectedBodyParts = [];
//     // jQuery("#dtPharmacy").trigger("click");
//     // clearLocalStorage();
//     // jQuery("#pageIndex").hide();
//     // jQuery("#pageAffectedArea").show();
//     // jQuery("#backButton").hide();
//     // curr_div.push("#pageAffectedArea");
//     // prev_div.push("#pageIndex");
// }
</script>
<script>
    // window.localStorage.clear();
    // window.localStorage.removeItem('chiefComplaint');
    // var locationURL = window.location.href;
    //     if(locationURL.indexOf('login')>0)
    //     {
    //         jQuery('.btnLoginAction').hide();
    //     }
    //     else {
    //         //alert();
    //         //jQuery('.btnLogin').show();
    //         jQuery(".btnLoginAction").each(function() {
    //             jQuery(".btnLoginAction").html('Login');
    //         });
    //     }
    
</script>