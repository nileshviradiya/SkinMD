<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'SkinMDNow Patient') }}</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <script src="{{ asset('js/jquery-1.8.2.min.js') }}"></script>
    <link href="{{ asset('images/favicon.ico') }}" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="{{ asset('css/icons.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/font-awesome.min.css') }}" />
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="{{ asset('js/jquery-ui.css') }}" />
    <link rel="stylesheet" href="{{ asset('js/jquery.mobile-1.2.0.min.css') }} " />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    

    <script type="text/javascript">
        function preventBack() {
            window.history.forward();
        }
        setTimeout("preventBack()", 0);
        window.onunload = function() {
            null
        };
    </script>

    <style>
        .ui-mobile .ui-page {
            min-height: 100% !important;
            overflow-x: hidden;

        }

        .logoback {
            background: #fff;
            padding: 0px;
        }

        .footer {
            color: #5F5F5F !important;
        }

        #content {
            text-align: center !important;
        }

        #drpChiefComplaint {
            text-align: left !important;
        }

        a {
            outline: none;
        }

        .affctbtn {
            background: url("images/right_arrow.png") no-repeat scroll 96px 18px !important;
        }

        .iconRight.right {
            /*background: url("images/right_arrow.png") no-repeat scroll 99px 18px;*/
        }

        /* .iconRight.left {
            background: url("images/left_arrow.png") no-repeat scroll 19px 18px;
        } */

        .icon.magnifier {
            background: url("images/search_br.png") no-repeat scroll 18px 5px;
        }

        /*.icon.magnifier1 {
            background: url("images/search_br.png") no-repeat scroll 0px 12px;
        }
        */
        /* .icon.info {
            background: url("images/info1.png") no-repeat scroll 5px 1px;
            margin-left: 4px;
        } */

        .tellusm .iconRight.right {
            background: url("images/right_arrow.png") no-repeat scroll 318px 11px;
        }

        .selafara .iconRight.right {
            background: url("images/right_arrow.png") no-repeat scroll 475px 10px;
            /*background-color: #312769;
	        padding:10px 20px;*/
        }


        .ps2 a#Deleteannouncement {
            background: url(images/right_arrow.png) no-repeat scroll 102px 18px rgba(0, 0, 0, 0) !important;
        }

        ol li {
            padding: 0;
            margin: 0 0 0 15px;
            list-style: decimal outside none;
        }

        ol i {
            padding: 0;
            margin: 0 0 0 20px;
            list-style: decimal outside none;
        }

        #spanPharmacy .bullet,
        #spanQuestionAnswer .bullet,
        #spanChiefComplaint .bullet {
            margin: 18px 0 0 4px;
            
        }

        #footerwrap {
            position: absolute;
            bottom: 0px;
            width: 100%;
            background: #ffffff;
            border-top: 2px solid rgb(237, 237, 237);
            padding-bottom:10px;
           
        }

        .ps2 {
            float: right \9 !important;
            margin-left: 500px \9 !important
        }

        #btnStartNew,
        #btnOldRequests,
        #btnAnnouncements {
            /*background: url("images/btn_1.png") repeat-x scroll 0 0 #332465;*/
            /*background-color: #4482FF;*/
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

        #btnHowDoesThisWork {
            background: url("images/btn_2.png") repeat-x scroll 0 0 transparent;
            color: #FFFFFF;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 24px;
            font-weight: normal;
            padding: 17px 0;
            text-align: center;
            text-decoration: none;
            width: 426px;
            -moz-border-radius: 20px 20px 20px 20px;
            -webkit-border-radius: 20px 20px 20px 20px;
            border-radius: 20px 20px 20px 20px;
        }

        .hmlog {
            cursor: pointer;
            /*background: url("images/btn_3.png") repeat-x scroll 0 0 transparent;*/
            background-color: #312769;
            color: #FFFFFF !important;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 20px;
            font-weight: normal !important;
            padding: 8px 0;
            text-align: center;
            text-decoration: none;
            width: 115px;
            -moz-border-radius: 7px;
            -webkit-border-radius: 7px;
            border-radius: 7px;
        }

        element.style {
            margin: 0 0 0 130px;
            position: absolute;
            z-index: 100;
        }

        .phots {
            /* background: url("images/btn_4.png") repeat-x scroll 0 0 #8BE430 !important;
            border-radius: 20px 20px 20px 20px;
            color: #FFFFFF !important;
            cursor: pointer;
            float: left;
            font-family: Arial;
            font-size: 24px;
            font-weight: normal !important;
            line-height: 20px;
            text-align: center;
            text-decoration: none;
            */
            /* background-color: #4482FF; */
            color: #FFFFFF !important;
            /* float: left; */
            font-family: 'roboto', senserif;
            font-size: 20px;
            font-weight: normal !important;
            /* padding: 0px 0; */
            text-align: center;
            text-decoration: none;
            width: 115px;
            /* position: absolute;
            top: 36px;
            left: 43px; */
            -moz-border-radius: 7px;
            -webkit-border-radius: 7px;
            border-radius: 7px;
        }

        .phots-01 {
            background-color: #312769;
            color: #FFFFFF;
            /* float: left; */
            font-family: 'roboto', senserif;
            font-weight: normal !important;
            text-decoration: none !important;
            font-size: 14px;
            /* position: absolute; */
            padding: 8px;
            /* top: 610px; */
            /* left: 190px; */
            /* margin: 0px 7px; */
            -webkit-border-radius: 7px;
        }

        .phots-11 {
            background-color: #312769;
            color: #FFFFFF;
            float: left;
            font-family: 'roboto', senserif;
            font-weight: normal !important;
            text-decoration: none !important;
            font-size: 14px;
            
            padding: 8px;
           
            margin: 0px 7px;
            -webkit-border-radius: 7px;
            margin-left:144px;
        }

       .phots-08  {
    background-color: #312769;
    color: #FFFFFF;
    float: left;
    font-family: 'roboto', senserif;
    font-weight: normal !important;
    text-decoration: none !important;
    font-size: 14px;
    position: absolute;
    padding: 8px;
    /* top: 1710px;
    left: 150px; */
    margin: 0px 7px;
    -webkit-border-radius: 7px;
}

        .phots-02 {
            background-color: #312769;
            color: #FFFFFF;
            float: left;
            font-family: 'roboto', senserif;
            font-weight: normal !important;
            text-decoration: none !important;
            font-size: 14px;
            position: absolute;
            padding: 8px;
            top: 60px;
            left: 43px;
            margin: 0px 7px;
            -webkit-border-radius: 7px;
        }

        .phots a {
            color: #FFFFFF !important;
            float: left;
            font-weight: normal !important;
            padding: 8px !important;
            text-decoration: none;
            width: 70px;
        }

        .serchm a {
            color: #FFFFFF !important;
            display: block;
            text-decoration: none;
            width: 340px;
            font-weight: normal !important;
        }

        .tipsfor a {
            color: #FFFFFF !important;
            display: block;
            font-size: 19px;
            font-weight: normal !important;
            text-align: right;
            text-decoration: none;
            width: 331px;
        }

        .tellusm a {
            color: #FFFFFF !important;
            display: block;
            text-decoration: none;
            width: 340px;
            font-weight: normal !important;
        }

        .selafara a {
            color: #FFFFFF !important;
            display: block;
            text-decoration: none;
            font-size: 17px !important;
            font-weight: normal !important;
            font-family: 'roboto', senserif;
        }

        .scrlog {
            background: url("images/btn_5.png") repeat-x scroll 0 0 transparent;
            color: #FFFFFF !important;
            cursor: pointer;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 24px;
            font-weight: normal !important;
            padding: 13px 0;
            text-align: center;
            text-decoration: none;
            width: 130px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border-radius: 15px 15px 15px 15px;
        }

        #btnPharmacyProceed {
            margin-bottom: 70px !important;
        }

        .lfbtys {
            /*background: url("images/btn_4.png") repeat-x scroll 0 0 transparent !important;
            color: #FFFFFF !important;
            float: left;
            font-family: Arial;
            font-size: 24px;
            font-weight: normal !important;
            padding: 14px 0;
            text-align: center;
            text-decoration: none;
            width: 351px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border-radius: 15px 15px 15px 15px;*/
            cursor: pointer;
            /* background: url(images/btn_3.png) repeat-x scroll 0 0 transparent; */
            background-color: #312769;
            color: #FFFFFF !important;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 14px;
            font-weight: normal !important;
            padding: 6px 0;
            text-align: center;
            text-decoration: none;
            width: 100px;
            -moz-border-radius: 7px;
            -webkit-border-radius: 7px;
            border-radius: 7px;
            /* margin-left: 33%;*/
            display: inline-block;
            float: right;
        }

        .lfbtys:hover {
            /*background-color: #558DFF;*/
        }

        .lfbtysccode {
            background: url("images/btn_4.png") repeat-x scroll 0 0 transparent !important;
            color: #FFFFFF !important;
            float: right;
            font-family: 'roboto', senserif;
            font-size: 24px;
            font-weight: normal !important;
            margin-top: 6px;
            padding: 9px 0;
            text-align: center;
            text-decoration: none;
            width: 115px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border-radius: 15px 15px 15px 15px;

        }

        input#txtcouponCode {
            width: 347px !important;
            float: left;
        }

        .apply_code {
            color: grey;
            padding: 0 0 0 5px;
            text-decoration: underline;
            cursor: pointer;
        }

        .lfbtys1 {

            color: #4482FF !important;
            float: left;
            font-family: 'roboto', senserif;
            font-weight: normal !important;
            text-decoration: none;
            font-size: 14px;
            -webkit-border-radius: 7px;
            position: absolute;
        }

        .lfbtys1:hover {
            color: #096dd9;
            text-decoration: underline;
        }

        .tipsfor {
            /*background: url("images/btn_6.png") repeat-x scroll 0 0 transparent;*/
            background-color: #311D68;
            color: #FFFFFF !important;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 24px;
            font-weight: normal !important;
            padding: 14px 0;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            width: 351px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border-radius: 15px 15px 15px 15px;
        }

        .tellusm {
            background: url("images/btn_4.png") repeat-x scroll 0 0 transparent !important;
            color: #FFFFFF !important;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 24px;
            font-weight: normal !important;
            padding: 14px 0;
            text-align: center;
            text-decoration: none;
            width: 351px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border-radius: 15px 15px 15px 15px;
        }

        .lfbtys2 {
            /*background: url("images/btn_5.png") repeat-x scroll 0 0 transparent !important;
            color: #FFFFFF !important;
            float: left;
            font-family: Arial;
            font-size: 24px;
            font-weight: normal !important;
            padding: 14px 0;
            text-align: center;
            text-decoration: none;
            width: 351px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border-radius: 15px 15px 15px 15px;*/
            cursor: pointer;
            background-color: #312769;
            color: #FFFFFF !important;
            float: left;
            font-family: 'roboto', senserif;
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
            /*top:9%;*/
            display: inline-block;
            /* float:right;*/
            bottom: 24%;
        }

        input.ren,
        input.add_ren {
            background: url("images/btn_3.png") repeat-x scroll 0 0 transparent !important;
            color: #FFFFFF !important;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 16px;
            font-weight: normal !important;
            padding: 2px 10px;
            text-align: center;
            text-decoration: none;
            width: 100px;
            -moz-border-radius: 7px 7px 7px 7px;
            -webkit-border-radius: 7px 7px 7px 7px;
            border-radius: 7px 7px 7px 7px;
            margin: 7px 0 0 7px;
        }

        input.delete,
        input.add_Delete {
            background: url("https://skinmdnow.nuvolatek.net/frontend/public/images/btn_7.png") repeat-x scroll 0 0 transparent !important;
            color: #FFFFFF !important;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 16px;
            font-weight: normal !important;
            padding: 2px 10px;
            text-align: center;
            text-decoration: none;
            width: 100px;
            -moz-border-radius: 7px 7px 7px 7px;
            -webkit-border-radius: 7px 7px 7px 7px;
            border-radius: 7px 7px 7px 7px;
            margin: 7px 0 0 7px;
        }

        input.add_new_up {
            //background: url("images/btn_1.png") repeat-x scroll 0 0 transparent !important;
            background: url("https://skinmdnow.nuvolatek.net/frontend/public/images/btn_1.png") repeat-x scroll 0 0 transparent !important;
            color: #FFFFFF !important;
            align: center;
            font-family: 'roboto', senserif;
            font-size: 16px;
            font-weight: normal !important;
            padding: 2px 10px;
            text-align: center;
            text-decoration: none;
            width: 100px;
            -moz-border-radius: 7px 7px 7px 7px;
            -webkit-border-radius: 7px 7px 7px 7px;
            border-radius: 7px 7px 7px 7px;
            margin: 7px 0 0 7px;
        }

        #image-list li label {
            display: block;
            clear: both;
        }

        #image-list img {
            clear: both;
        }

        .serchm {
            background: url("images/btn_5.png") repeat-x scroll 0 0 transparent !important;
            color: #FFFFFF !important;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 24px;
            font-weight: normal !important;
            padding: 14px 0;
            text-align: center;
            text-decoration: none;
            width: 351px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border-radius: 15px 15px 15px 15px;
        }

        .lfbtys8 {
            background: url("images/btn_5.png") repeat-x scroll 0 0 transparent !important;
            color: #FFFFFF !important;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 18px;
            font-weight: normal !important;
            padding: 14px 0;
            text-align: center;
            text-decoration: none;
            width: 351px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border-radius: 15px 15px 15px 15px;
        }

        .lfbtys9 {
            background: url("images/btn_5.png") repeat-x scroll 0 0 transparent !important;
            color: #FFFFFF !important;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 18px !important;
            font-weight: normal !important;
            padding: 14px 0;
            text-align: center;
            text-decoration: none;
            width: 397px;
            margin: 0 0 0 147px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border-radius: 15px 15px 15px 15px;
        }

        .selafara {
            /*	background: url("images/btn_5.png") repeat-x scroll 0 0 transparent !important;*/
            /*color: #FFFFFF !important;
            float: left;
            font-family: 'roboto',senserif;
            font-size: 24px !important;
            font-weight: normal !important;
            padding: 14px 0;
            text-align: center;
            text-decoration: none;
            width: 494px;
            margin: 0 0 0 90px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border-radius: 15px 15px 15px 15px;*/

            background-color: #312769;
            color: #FFFFFF;
            float: right;
            font-family: 'roboto', senserif;
            font-weight: normal !important;
            text-decoration: none !important;
            font-size: 15px;
            /* position: absolute;*/
            padding: 10px 20px;
            top: 174px;
            left: 293px;
            margin: 0px 7px;
            -webkit-border-radius: 7px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        .lfbtys4 {
            /*background: url("images/btn_5.png") repeat-x scroll 0 0 transparent;*/
            background-color: #312769;
            color: #FFFFFF !important;
            font-family: 'roboto', senserif;
            font-size: 21px;
            font-weight: normal !important;
            padding: 14px 0;
            text-align: center;
            text-decoration: none;
            width: 249px;
            margin: -2px 0 0;
            display: block;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        .lfbtys3 {
            /*background: url("https://skinmdnow.nuvolatek.net/frontend/public/images/btn_7.png") repeat-x scroll 0 0 transparent;*/
            color: #FFFFFF !important;
            /*	float: left;
            font-family: Arial;
            font-size: 24px;
            font-weight: normal !important;
            padding: 14px 0;
            text-align: center;
            text-decoration: none;
            width: 351px;*/
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border-radius: 15px 15px 15px 15px;

            background-color: #312769;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 20px;
            font-weight: normal !important;
            padding: 10px 0;
            text-align: center;
            text-decoration: none;
            margin-left: 117px;
            width: 115px;
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
            /* width: 115px;*/
            -moz-border-radius: 7px;
            -webkit-border-radius: 7px;
            border-radius: 7px;
        }

        .forpast: hover {
            text-decoration: underline !important;
        }

        .add_min {
            background: url("images/creadit_cardbg.png") repeat-x scroll 0 0 transparent;
            color: #000 !important;
            float: left;
            font-family: 'roboto', senserif;
            font-size: 24px;
            font-weight: normal !important;
            padding: 24px 14px;
            clear: both;
            text-decoration: none;
            width: 321px;
            margin: 0px;

        }

        dd.closed {
            display: none;
        }

        dd#active {
            display: block;
        }

        #pageAffectedArea area:hover {
            background: #ff0000;
            cursor: hand;
        }

        #divSelectGender input[type=checkbox] {
            height: 0px !important;
            left: 0px !important;
            display: none;
        }

        #divCreditCarddddiv .ui-checkbox .ui-icon-checkbox-on {
            display: none;
        }

        .ui-selectmenu {
            border: none !important;
            background: transparent !important;
        }

        #drpNewGender-menu {
            width: 150px !important;
            left: 0 !important;
            margin-left: 105px;
        }

        #drpNewIsHealthProffesional-menu {
            left: 0 !important;
        }

        /* .ds:hover {
            background: #61A0CD !important;
        } */

        #ren_add_img {
            clear: both;
            float: left;
            margin: 0 0 15px;
            width: 100%;
        }

        #addimage-list li {
            display: block;
        }

        .rmvpart {
            float: right;
            margin: 3px 0 0 10px;
            width: 145px;
        }

        .rmvlabel {
            float: left;
        }

        #image-list li {
            border-bottom: 1px solid #a7c8de;
            clear: both;
            list-style: none outside none;
            overflow: hidden;
            padding: 15px !important;
        }

        #image-list li img {
            width: 200px;
        }

        #pageAffectedArea a#btnLogin {
            position: absolute;
            top: 366px !important;
        }

        div.imageuploaddiv {
            text-align: center;
        }

        #pagemen center {
            
            /* margin: 0 auto; */
            margin-top:-383px;
            width: 1000px;
            min-height: 600px;
            background-color: #FFFFFF;
            margin-left:0px;
            padding-top:20px;
            margin-bottom:170px;
        }
        }

        #content .label_for {
            font-size: 18px !important;
        }

        input.infotabb {
            width: 290px !important;
            float: left;
        }

        .infotabbadd {
            width: 50px !important;
            float: right;
            margin: 15px 0 0 1px;
        }

        #dlPharmacy dt,
        #pageChiefComplaint dt {
            cursor: pointer;
            padding: 10px 0;
        }

        .cnvclassml93519 {
            width: 291px;
            height: 300px;
        }

        .newname {
            display: none;
        }

        #header_comp_note {
            color: #FF0000;
            float: left;
            margin: 28px 0 0;
            padding: 0;
            text-align: center;
            width: 100%;
        }

        .comp_note {
            line-height: 24px;
        }

        div.otherB {
            display: none;
        }

        /* #additionalphotos {
            color: #fff;
            cursor: pointer;
            height: 50px !important;
            padding: 7px 16px;
            min-width: 289px;
            text-decoration: none;
            background: url("images/btn_3.png") repeat-x scroll 0 0;
            border-radius: 15px;
            margin-left: 50px;
        } */
        #additionalphotos {
            color: #ffffff;
            cursor: pointer;
            height: 50px !important;
            padding: 7px 16px;
            min-width: 289px;
            text-decoration: none;
            /* background: url(images/btn_3.png) repeat-x scroll 0 0; */
            border-radius: 7px;
            border: 1px solid #000;
            margin-left: 50px;
            background-color: #312769;
            font-size:12px;
        }



        div.div_in_content {
            margin: 1px 2px 14px 36px;
            text-align: left;
            width: 600px;
            font-size: 14px;
        }

        .div_in_content span {
            margin-left: 22px;
        }

        @media screen and (-webkit-min-device-pixel-ratio:0) {

            .icon.magnifier1 {
                /*background: url("images/search_br.png") no-repeat scroll 0px 11px;*/
            }
        }

        #chkStateAgree {
            z-index: 99;
        }

        table.hide_ann {
            display: none;
        }

        table td.read {
            background: #008F00;
            padding: 40px 2px;
        }

        table td.unread {
            background: #DB0000;
            padding: 40px 2px;
        }

        .delete_ann {
            background: url("images/delete1.png") no-repeat scroll 0 0 transparent;
            color: rgba(0, 0, 0, 0);
            width: 30px;
            border: 0;
            cursor: pointer;
            height: 50px;
            width: 51px;
        }

        .footer_link img {
            float: left;
            width: 175px
        }

        .footer_smn_link {
            display: block;
            float: left;
            text-align: left;
            margin-left: 59px;
        }

        .foot_label {
            margin-top: 14px;
            padding: 0 !important;
            text-align: center;
            font-size: 13px;
        }

        .ann_ind {
            display: none;
            background: url('images/ann2.png')no-repeat scroll 0 0;
            float: right;
            height: 45px;
            margin: 9px 0px 0px 310px;
            position: absolute;
            width: 45px;
        }

        .ann_counter {
            color: #000000;
            display: inline-block;
            font-weight: bold;
            padding-top: 0px;
            top: 12px !important;
        }

        #announcementsdesc iframe {
            border: medium none;
            min-height: 335px;
            overflow-x: hidden;
            width: 100%;
        }

        #announcementsdesc iframe #headertop table {
            display: none;
        }

        /* custome css*/
        .ui-select:focus {
            border: #1890ff 2px solid !important;
            border-radius: 1px !important;
            -webkit-transition: border 0.4s linear;
            transition: border 0.4s linear;
            background-color: #FFFFFF;
        }

        .ui-select:hover {
            background-color: #FFFFFF;
        }

        .ui-select>div {
            /*border: #1890ff 1px solid !important;*/
            /*border: #1890ff 0.5px solid !important; */
            border-radius: 5px !important;
            background-color: #FAFAFA;
        }
    </style>
    <script src="{{ asset('js/jquery-ui1_10_0.js') }}"></script>
    <script src="{{ asset('js/jquery.mobile-1.2.0.min.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/jquery.maphilight.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/Config.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/jquery.xdomainrequest.min.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/BirthDateCalculate.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/login.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/bodymap.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/ChiefComplaint.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/onPageLoads.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/CaseSubmit.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/CaseDetails.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/SearchPhysician.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/SearchPharmacy.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/savePatientAdditionalDetails.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/AddAccount.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/ForgotPassword.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/custom.js') }}"></script>
    <script src="{{ asset('3rdParty/iPhoneStyleToggle/iphone-style-checkboxes.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('3rdParty/iPhoneStyleToggle/style.css') }}" type='text/css'>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/htmlDatePicker.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('js/htmlDatePicker.css') }}" type='text/css'>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/customselect.js') }}"></script>
    <script type="text/javascript" charset="utf-8" src="{{ asset('js/jquery.maskedinput-1.2.2.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('css/common.css') }} " />
    
</head>
<script type="text/javascript">
    jQuery(document).bind("mobileinit", function() {
        jQuery.mobile.ajaxLinksEnabled(false);
    });
</script>
<script type="text/javascript">
    var showienote = 0;

    jQuery.support.cors = true;
    var dividname;

    jQuery(window).unload(function() {
        if (noclearstore == 0) {
            //alert('1068');
            clearLocalStorage();

            window.localStorage.setItem("strUserName", "");
            window.localStorage.setItem("strPassword", "");
            window.localStorage.setItem("isLoggedIn", "false");
            window.localStorage.setItem("guidCareGiverId", "");
            jQuery('#btnLogin').text('Login');
            jQuery('#btnOldRequests').attr('style', 'display:none');

            jQuery("#divFavorites").hide("fast");
            jQuery("#divExistingPatients").hide("fast");
        }


    });

    jQuery("area").mouseover(function() {
        //alert('mouseover');
        jQuery(this).trigger("click");
    });

    jQuery(document).ready(function() {
        
        footlink = 'https://www.skinmdnow.com/';
        headlink = 'https://www.skinmdnow.com/';

        jQuery('#txtPharmacyFax').mask("999-999-9999");

        if (app_ID == 1) {

            jQuery("#footer_link img").css('display', 'none');
            jQuery("#default_doc_list").hide();
            jQuery(".foot_label").css('margin-left', '0px');
        } else {

            jQuery("#footer_link img").css('visibility', 'visible');
            jQuery(".footer_smn_link").css('display', 'inline');
            jQuery(".footer_smn_link").css('margin-right', '125px');
            jQuery(".footer_smn_link").css('float', 'right');
            jQuery(".foot_label").css('margin-left', '370px');
            jQuery("#search_doc_form").hide();
        }
/* 
        termslink += app_ID + "/TermsOfService.html";

        document.getElementById("header_link").setAttribute("href", headlink);
        document.getElementById("header_link").setAttribute("target", "blank");

        document.getElementById("footer_link").setAttribute("href", footlink);
        document.getElementById("footer_link").setAttribute("target", "blank");

        document.getElementById("terms_link").setAttribute("href", termslink);
        document.getElementById("terms_link").setAttribute("target", "blank"); */

    });



    jQuery(document).on("click", "#btnLogin", function() {
        LoginLogout()
    });
    jQuery(document).on("click", "#btnLogin1", function() {
        LoginLogout1()
    });
    jQuery(document).on("click", "#btnLogin2", function() {
        LoginLogout2()
    });
    jQuery(document).on("click", "#btnLogin3", function() {
        LoginLogout3()
    });
    jQuery(document).on("click", "#btnLogin4", function() {
        LoginLogout4()
    });
    jQuery(document).on("click", "#btnLogin5", function() {
        LoginLogout5()
    });

    jQuery(".body").live("each", function() {
        jQuery("canvas:eq(1)").css("background", "transparent");
    });
    jQuery(document).ready(function($) {

        var ppcount = 0;

        jQuery(".backButton").on("click", function() {
            ppcount = prev_div.length;

            DestroyCalendar();
            if (ppcount > 0) {
                dividname = prev_div.pop().substring(1);
            } else {
                dividname = 'pageIndex';
            }


            if (dividname == "pageBillingInfo") {
                clearccdetails();
            }
            if (document.getElementById(dividname)) {
                jQuery(".panel").hide();
                jQuery(document.getElementById(dividname)).show();

            } else {
                jQuery(".panel").hide();
            }

        });


        jQuery("#btnHowDoesThisWork").click(function() {

            jQuery("#pageIndex").hide();
            jQuery("#howitworks").show();

            curr_div.push("#howitworks");
            prev_div.push("#pageIndex");



        });
        jQuery("#ChiefComplaintbtnProceed").click(function() {

        });


        jQuery(".tipsdiv").click(function() {
            jQuery(".panel").hide();
            jQuery("#pagePhoto").hide();
            jQuery("#tipsforgood").show();

            curr_div.push("#tipsforgood");
            prev_div.push("#pagePhoto");

        });

        jQuery("#divReferralCode").click(function() {
            jQuery("#divReferralCodedddiv").show();
            jQuery("#divCreditCarddddiv").hide();

        });
        jQuery("#divcouponCode").click(function() {


            jQuery("#divcouponCodedddiv").show();
            jQuery("#divCreditCarddddiv").hide();

        });

        jQuery("#divCreditCard").click(function() {
            jQuery("#divCreditCarddddiv").show();

            jQuery("#divReferralCodedddiv").hide();
            jQuery("#divcouponCodedddiv").hide();
        });

        jQuery("dt.add").click(function() {
            jQuery("dt").removeClass('remove');
        });
        jQuery("a").live("click", function() {

            if (dividname == 'pageIndex' || dividname == 'pageAffectedArea' || dividname == 'pagePharmacy') {

                dividname = '';
            }

        });
        jQuery("span.apply_code").live("click", function() {
            jQuery("#divcouponCodenew").toggle();

        });

        jQuery('#selectGender').iphoneStyle({
            checkedLabel: 'Male',
            uncheckedLabel: 'Female'
        });
        jQuery('#selectFrontBack').iphoneStyle({
            checkedLabel: 'Front',
            uncheckedLabel: 'Back&nbsp;&nbsp;'
        });

        //ACCORDION BUTTON ACTION (ON CLICK DO THE FOLLOWING)
        jQuery('.accordionButton').click(function() {

            //REMOVE THE ON CLASS FROM ALL BUTTONS
            jQuery('.accordionButton').removeClass('on icon remove mini');
            jQuery('.accordionButton').addClass('off icon add mini');

            //NO MATTER WHAT WE CLOSE ALL OPEN SLIDES
            jQuery('.accordionContent').hide();

            //IF THE NEXT SLIDE WASN'T OPEN THEN OPEN IT
            if (jQuery(this).next().is(':hidden') == true) {

                //ADD THE ON CLASS TO THE BUTTON
                jQuery(this).removeClass('off icon add mini');
                jQuery(this).addClass('on icon remove mini');

                //OPEN THE SLIDE
                jQuery(this).next().show();
            }

        });
    });
</script>
<script>
    function loadChiefComplaint() {

        jQuery("#data_loading").show();

        $.ajax({
            url: strWebserviceURL + "getChiefComplaints",
            type: "POST",
            data: "",
            contentType: "application/json;",
            cache: false,
            dataType: "json",
            success: function(result) {

                if (result.d.strErrorMessage == "" || result.d.strErrorMessage == null) {
                    var tempChiefComplaintSelectedIndex = jQuery("#drpChiefComplaint").prop("selectedIndex");

                    jQuery("#drpChiefComplaint").empty();
                    jQuery("#drpChiefComplaint").append("<option value=''></option>");
                    jQuery.each(result.d, function(key, value) {
                        jQuery("#drpChiefComplaint").append("<option class='ccmp' value='" + value.guidChiefComplaintId + "'>" + value.strName + "</option>");
                    });
                    document.getElementById("drpChiefComplaint").selectedIndex = tempChiefComplaintSelectedIndex;
                    jQuery("#data_loading").hide();

                } else {

                    jQuery("#drpChiefComplaint").empty();
                    jQuery("#data_loading").hide();
                    
                }
            },
            error: function error(response) {
                jQuery("#data_loading").hide();
                

            }
        });


    }

    jQuery(document).ready(function() {
        //get_org_physicians();
        pageIndexOnLoad();
        //loadChiefComplaint();
        jQuery('#dlBillingInfo').accordion();
        jQuery('#dlPharmacy').accordion();
        function showHide(obj, objToHide) {
            var el = $("#" + objToHide)[0];

            if (obj.className == "collapsed icon add mini selected" || obj.className == "collapsed icon add mini") {
                obj.className = "expanded icon remove mini";
            } else {
                obj.className = "collapsed icon add mini";
            }
            $(el).toggle();

        }
    });
</script>
<script type="text/javascript">
    document.addEventListener("resume", reloadAppValues, false);

    function reloadAppValues() {
        if ((window.localStorage.getItem("isLoggedIn")!=null&&window.localStorage.getItem("isLoggedIn")!="")?window.localStorage.getItem("isLoggedIn"):window.sessionStorage.getItem("isLoggedIn") == "true") {
            $('#txtUsername').val((window.localStorage.getItem("strUserName")!=null&&window.localStorage.getItem("strUserName")!="")?window.localStorage.getItem("strUserName"):window.sessionStorage.getItem("strUserName"));
            $('#txtPassword').val((window.localStorage.getItem("strPassword")!=null&&window.localStorage.getItem("strPassword")!="")?window.localStorage.getItem("strPassword"):window.sessionStorage.getItem("strPassword"));
            LoginMe(false);
        }
        loadChiefComplaint();
    }

    function onBodyLoad() {

        document.addEventListener("deviceready", onDeviceReady, false);
    }

    function onDeviceReady() {


        pictureSource = navigator.camera.PictureSourceType;
        destinationType = navigator.camera.DestinationType;

    }
</script>
<script type="text/javascript">
    function openBirthDate() {

        var now = new Date();
        var days = {};
        var years = {};
        var months = {
            1: 'Jan',
            2: 'Feb',
            3: 'Mar',
            4: 'Apr',
            5: 'May',
            6: 'Jun',
            7: 'Jul',
            8: 'Aug',
            9: 'Sep',
            10: 'Oct',
            11: 'Nov',
            12: 'Dec'
        };

        for (var i = 1; i < 32; i += 1) {
            days[i] = i;
        }

        for (i = now.getFullYear() - 100; i < now.getFullYear() + 1; i += 1) {
            years[i] = i;
        }

        SpinningWheel.addSlot(years, 'right', 1999);
        SpinningWheel.addSlot(months, '', 4);
        SpinningWheel.addSlot(days, 'right', 12);

        SpinningWheel.setCancelAction(cancel);
        SpinningWheel.setDoneAction(done);

        SpinningWheel.open();
    }

    function openOneSlot() {
        SpinningWheel.addSlot({
            1: 'Ichi',
            2: 'Ni',
            3: 'San',
            4: 'Shi',
            5: 'Go'
        });

        SpinningWheel.setCancelAction(cancel);
        SpinningWheel.setDoneAction(done);

        SpinningWheel.open();
    }

    function done() {
        var results = SpinningWheel.getSelectedValues();
        $("#txtNewDateOfBirth").val(results.keys[0] + '-' + results.keys[1] + '-' + results.keys[2]);
        SpinningWheel.close();
    }

    function cancel() {

        SpinningWheel.close();
    }


    window.addEventListener('load', function() {
        setTimeout(function() {
            window.scrollTo(0, 0);
        }, 100);
    }, true);
</script>
<script type="text/javascript">
    jQuery(function() {
        var ele = jQuery('#scroll');
        var speed = 25,
            scroll = 5,
            scrolling;
        jQuery('#scroll-up').mouseenter(function() {
            // Scroll the element up
            scrolling = window.setInterval(function() {
                ele.scrollTop(ele.scrollTop() - scroll);
            }, speed);
        });
        jQuery('#scroll-down').mouseenter(function() {
            // Scroll the element down
            scrolling = window.setInterval(function() {
                ele.scrollTop(ele.scrollTop() + scroll);
            }, speed);
        });
        jQuery('#scroll-up, #scroll-down').bind({
            click: function(e) {
                // Prevent the default click action
                e.preventDefault();
            },
            mouseleave: function() {
                if (scrolling) {
                    window.clearInterval(scrolling);
                    scrolling = false;
                }
            }
        });
    });
</script>

<body>
    <div id="headertop">
        <header id="custom_header">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="25%"><a  id="header_link" href="{{url('/')}}"  ><img src="{{ asset('images/logo.png') }}" width="258"></a></td>
                    <td width="50%" style='text-align:center;padding-top:2px;'></td>
                    @guest
                    <td width="25%" align="right">
                    <a class="buttonLightColor icon mini hmlog log_button  ui-link btnLoginAction">
                    {{ __('Login') }}
                    </a>  
                    @else
                        <td width="25%" align="right">
                            <a class="buttonLightColor icon mini hmlog log_button  ui-link btnLogOut" 
                            >
                                            {{ __('Logout') }}
                            </a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                    @endguest
                </tr>
            </table>

            <div id="header_comp_note" class="otherB">You are using in-compatible version of Internet Explorer version. Please upgrade to Internet Explorer 10 or use Firefox 22+, Chrome 28+, Safari 15+. </div>
        </header>
    </div>

    <div id="jQUi">
        @yield('content')
    </div>

    <div id="page_loading" style="display:none;width:100%;height:100%;margin: 0 auto;left:0;text-align:center;position:fixed;top:0px;z-index:9999999!important;">
        <div style="position: relative;text-align: center;top: 279px;"><img src="{{ asset('images/loading.gif') }}"></div>
    </div>

    <div id="data_loading" style="display:none;width:100%;height:100%;margin: 0 auto;position:fixed;left:0;text-align:center;fixed;top:0px;z-index:9999999!important;">
        <div style="position: relative;text-align: center;top: 279px;"><img src="{{ asset('images/loading.gif') }}"></div>
    </div>

    <div id="chiefc_loading" style="display:none;width:100%;height:100%;margin: 0 auto;left:0;text-align:center;position:fixed;top:0px;">
        <div style="position: relative;text-align: center;top: 279px;"><img src="{{ asset('images/loading.gif') }}"></div>
    </div>

    <div id="footerwrap">
        <div class="footer">
            <p class="foot_label" style="border: none !important;">Safe. Private. Secure.</p>
            <p class="foot_label" style="border: none !important;">Web app is supported on IE10+, Firefox 22+, Chrome 28+, Safari 15+ at 1024 x 768 pixels resolution.</p>
        </div>
    </div>
    <script>
        jQuery(document).ready(function() {

            if ((window.localStorage.getItem("isLoggedIn")!=""&&window.localStorage.getItem("isLoggedIn")!=null)?window.localStorage.getItem("isLoggedIn"):window.sessionStorage.getItem("isLoggedIn") == 'true') {

                // jQuery(".log_button").each(function() {
                //     jQuery(".log_button").html('Logout');
                // });
            }
        });
        function StartNewCase() {
            // if(window.localStorage.length>0)
            // {
            //     arrSelectedBodyParts = [];
            //     jQuery("#dtPharmacy").trigger("click");
            //     jQuery("#pageIndex").hide();
            //     jQuery("#pageAffectedArea").show();
            //     jQuery("#backButton").hide();
            //     curr_div.push("#pageAffectedArea");
            //     prev_div.push("#pageIndex");
            // }
            // else{
            //     var location = window.location.href;
            //     var baseURL = location.substr(0, location.lastIndexOf("/"));
            //     baseURL = baseURL+'/home';
            //     window.location.href=baseURL;
            // }
            arrSelectedBodyParts = [];
            jQuery("#dtPharmacy").trigger("click");
            clearLocalStorage();
            jQuery("#pageIndex").hide();
            jQuery("#pageAffectedArea").show();
            jQuery("#backButton").hide();
            curr_div.push("#pageAffectedArea");
            prev_div.push("#pageIndex");
        }
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
                var base = window.location.origin;
                if(base.indexOf("login")<0)
                {
                    var login = base+'/frontend/public/index.php/login';
                    jQuery(".btnLoginAction").attr('href',login);
                }
            });
        }
        function redirectToHome() {
               
            location.href=window.location.origin+'/frontend/public/index.php/home';   
        }
    </script>
</body>
</html>