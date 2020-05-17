@extends('layouts.skin')

@section('content')
<style>
.panelClass{
    
    /* min-height: 400px; */
    margin-bottom: 87px;
    background-color: #FFFFFF;
   
    width: 1000px;
    margin-left: -8px;
    margin-top:-15px;
}

.how_title{
    color:#2D3446;
    margin-bottom:10px;
    font-size: 16px;
    font-weight:bold;
    font-family: 'Roboto', sans-serif;
}

#divSelectGender .iPhoneCheckLabelOff{
    color: white  !important;
    background: url('3rdParty/iPhoneStyleToggle/on.png?1284697268') no-repeat  !important;
    text-shadow: 0px 0px 2px rgba(0, 0, 0, 0.6) !important;
}
</style>
<div id="content">
        <!--Landing Page-->
        <div id="pageIndex" class="panel panelClass" data-header="custom_header">
          
                <h2 class="how_title" style="padding-top:10px;">Have a Skin Problem?</h2>
                <span class="how_span" style="font-size:18px; font-weight:bold;">3 easy steps</span>
                <br clear="all"> <br clear="all">
                <div class="div_in_content">
                    1. Share a photo and describe your skin problem.<br>
                    <br>
                    2. Select a Provider.<br>
                    <br>
                    3. Submit your request and payment to receive a diagnosis, treatment plan and prescription.<br>
                    <br>
                </div>
         

            <div style="margin:5px 0 0 285px; float:left;"> 
                @guest
                    <a id='btnStartNew' onClick="StartNewCase()" href="javascript:;" class="button" style="margin-left: 109px; ">Start New Request</a> 
                    <br clear="all">
                @else
                <a id='btnStartNew' onClick="StartNewCase()" href="javascript:;" class="button" style="margin-left: 109px; ">Start New Request</a> 
                <br clear="all">
                <a id='btnOldRequests' href="#pageOldRequest" class="button" style="display:none;font-size:14px; background-color:#9cc983;">Old Request</a>
                <br clear="all">
                <!-- <div id="ann_feat" style='display:none;'> 
                    <a id='btnAnnouncements' class="button" style="display:none;font-size:14px; background-color:#83c341;">Announcements</a>
                    <div class="ann_ind"> <span class="ann_counter"></span></div>
                </div>  -->
                <br clear="all">
                <br clear="all">
                @endguest
            </div>
            <br clear="all">
            
        </div>
        <!--END-->

        <!--Body Selection-->
        <div id="pageAffectedArea" class="panel" data-header="custom_header" data-load="pageAffectedAreaOnLoad" style="display:none">
            <div id="divCounterPopup" class="selectedArea">
                <div id="scroll">
                    <div class='divCounterPopupInner'> </div>
                </div>
                <!-- <div> <a id="scroll-down" href="#" class="scrollupbox"></a> 
                <a id="scroll-up" href="#"  class="scrollupbox"></a></div> -->
            </div>
            <br clear="all">
            <div id="pagemen">
                <center style=" box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);">
                    <div id="divSelectGender" data-theme="c" data-track-theme="a" style="position: absolute; z-index: 99; top:100px; right:115px;"> <br clear="all">
                        <br clear="all">
                        <input type="checkbox" checked='checked' value="Male" id="selectGender" style="border:1px solid blue;" />
                        <br clear="all">
                        <input type="checkbox" checked='checked' value="Front" id="selectFrontBack" style="border:1px solid blue;" />

                    </div>

                    <div id="divMaleBody">
                        <h2 style="width:352px;margin-left:-80px; font-family: 'roboto',senserif;color:#2D3446; padding-top:4px;">Select Affected Area(s)</h2>
                        <div class="divCounter" style="left:-29px; position: absolute;  top: 25px;background-color: none!important;color:#312769;  z-index: 9999;"> </div>
                        <img src="{{ asset('images/Bodymap/MaleFrontt.png') }}" id="mapp_image" style="1px solid red;" usemap="#sp79903" width="151" height="360" alt="click map" border="0" class="body" />
                        <map id="sp79903" name="sp79903">
                            <!-- Region 1 Head -->
                            <area id="MFface" data="divMaleFace" shape="circle" alt="Head" title="Head" coords="76,29,27" href="#">
                            <!-- Region 2 Chest_Stomach -->
                            <area id="MFchestStomach" data="divMaleChestAndStomach" shape="rect" alt="Chest & Stomach" title="Chest & Stomach" coords="49,68,101,168" nohref />
                            <!-- Region 3 LeftArm -->
                            <area id="MFleftArm" data="divMaleLeftArm" shape="rect" alt="LeftArm" title="LeftArm" coords="106,56,145,173" nohref />
                            <!-- Region 4 RightArm -->
                            <area id="MFrightArm" data="divMaleRightArm" shape="rect" alt="RightArm" title="RightArm" coords="6,56,45,173" nohref />
                            <!-- Region 3 LeftHand -->
                            <area id="MFleftHand" data="divMaleLeftHand" shape="rect" alt="LeftHand" title="LeftHand" coords="115,177,151,218" nohref />
                            <!-- Region 4 RightHand -->
                            <area id="MFrightHand" data="divMaleRightHand" shape="rect" alt="RightHand" title="RightHand" coords="1,176,37,217" nohref />
                            <!-- Region 5 RightLeg -->
                            <area id="MFrightLeg" data="divMaleRightLeg" shape="rect" alt="RightLeg" title="RightLeg" coords="41,199,74,327" nohref />
                            <!-- Region 6 LeftLeg -->
                            <area id="MFleftLeg" data="divMaleLeftLeg" shape="rect" alt="LeftLeg" title="leftLeg" coords="77,200,109,327" nohref />
                            <!-- Region 6 LeftFoot -->
                            <area id="MFleftFoot" data="divMaleLeftFoot" shape="rect" alt="LeftFoot" title="leftFoot" coords="77,329,111,358" nohref />
                            <!-- Region 5 RightFoot -->
                            <area id="MFrightFoot" data="divMaleRightFoot" shape="rect" alt="RightFoot" title="RightFoot" coords="41,329,75,358" nohref />
                            <!-- Region 7 Genitals -->
                            <area id="MFgenitalia" data="divMaleGenitalia" shape="rect" alt="Genitals" title="Genitals" coords="43,170,108,198" nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <!--  -->
                    <a class="button btnGotoMaleFront icon left mini lfbtys4" data="btnGotoMaleFront" style="display: none; margin-bottom:50px;" href="javascript:;">Select other area(s)</a>
                    <div id="divMaleFace" style="display: none">
                        <img src="{{ asset('images/Bodymap/MaleFace.png') }}" usemap="#ml93519" width="291" height="300" alt="click map" border="0" class="body" />
                        <map id="ml93519" name="ml93519">
                            <area id='MFscalp' shape='polygon' title='Scalp' coords='63,69,231,69,237,54,226,39,211,26,182,8,131,5,101,15,77,31,59,56,59,56' nohref />
                            <area id='MFforehead' shape='rect' title='Forehead' coords='63,77,233,112' nohref />
                            <area id='MFrbrow' shape='rect' title='R brow' coords='79,117,140,130' nohref />
                            <area id='MFlbrow' shape='rect' title='L brow' coords='152,115,220,129' nohref />
                            <area id='MFreye' shape='rect' title='R eye' coords='79,131,131,153' nohref />
                            <area id='MFleye' shape='rect' title='L eye' coords='164,131,214,153' nohref />
                            <area id='MFnose' shape='rect' title='Nose' coords='134,134,162,194' nohref />
                            <area id='MFrcheek' shape='rect' title='R cheek' coords='81,157,122,193' nohref />
                            <area id='MFlcheek' shape='rect' title='L cheek' coords='174,158,211,192' nohref />
                            <area id='MFrear' shape='rect' title='R ear' coords='48,114,77,188' nohref />
                            <area id='MFlear' shape='rect' title='L ear' coords='221,114,247,188' nohref />
                            <area id='MFchin' shape='polygon' title='Chin' coords='114,229,187,229,183,244,166,258,136,258,114,243,106,234' nohref />
                            <area id='MFneck' shape='polygon' title='Neck' coords='83,285,208,282,208,228,191,243,175,257,156,264,132,261,114,249,99,235,86,226' nohref />
                            <area id='MFbetweenLipAndNose' shape='rect' title='Between nose and lips' coords='224,191,281,214' nohref />
                            <area id='MFupperLip' shape='rect' title='Upper lip' coords='224,227,282,248' nohref />
                            <area id='MFlowerLip' shape='rect' title='Lower lip' coords='224,263,283,285' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divMaleChestAndStomach" style="display: none"> <img src="{{ asset('images/Bodymap/MaleFrontChestStomach.png') }}" usemap="#so19698" width="284" height="300" alt="click map" border="0" class="body" />
                        <map id="so19698" name="so19698">
                            <!-- Region 1 Chest -->
                            <area id='MFrpectoral' shape='rect' title='R chest' coords='32,20,127,121' nohref />
                            <area id='MFlpectoral' shape='rect' title='L chest' coords='157,22,253,123' nohref />
                            <area id='MFlnipple' shape='rect' title='L nipple' coords='56,77,87,103' nohref />
                            <area id='MFrnipple' shape='rect' title='R nipple' coords='205,83,228,102' nohref />
                            <area id='MFabdomen' shape='rect' title='Abdomen' coords='63,130,218,299' nohref />
                            <area id='MFumbilicus' shape='rect' title='Belly button' coords='127,247,154,272' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divMaleLeftHand" style="display: none">
                        <img src="{{ asset('images/Bodymap/MaleFrontLeftHand.png') }}" usemap="#wl53573" width="193" height="300" alt="click map" border="0" class="body" />
                        <map id="wl53573" name="wl53573">
                            <area id='MFlpalm' shape='rect' title='L palm' coords='51,136,147,233' nohref />
                            <area id='MFlpalmarthumb' shape='rect' title='L palmar thumb' coords='5,102,48,176' nohref />
                            <area id='MFlpalmar2ndfinger' shape='rect' title='L palmar 2nd finger' coords='45,15,85,131' nohref />
                            <area id='MFlpalmar3rdfinger' shape='rect' title='L palmar 3rd finger' coords='89,2,118,121' nohref />
                            <area id='MFlpalmar4thfinger' shape='rect' title='L palmar 4th finger' coords='121,11,156,130' nohref />
                            <area id='MFlpalmar5thfinger' shape='rect' title='L palmar 5th finger' coords='159,55,192,163' nohref />
                            <area id='MFlvolarwrist' shape='rect' title='L volar wrist' coords='70,259,178,296' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divMaleRightHand" style="display: none">
                        <img src="{{ asset('images/Bodymap/MaleFrontRightHand.png') }}" usemap="#sk67287" width="193" height="300" alt="click map" border="0" class="body" />
                        <map id="sk67287" name="sk67287">
                            <area id='MFrpalm' shape='rect' title='R palm' coords='34,144,140,222' nohref />
                            <area id='MFrpalmarthumb' shape='rect' title='R palmar thumb' coords='146,104,187,194' nohref />
                            <area id='MFrpalmar2ndfinger' shape='rect' title='R palmar 2nd finger' coords='110,12,146,123' nohref />
                            <area id='MFrpalmar3rdfinger' shape='rect' title='R palmar 3rd finger' coords='70,1,106,120' nohref />
                            <area id='MFrpalmar4thfinger' shape='rect' title='R palmar 4th finger' coords='37,18,73,134' nohref />
                            <area id='MFrpalmar5thfinger' shape='rect' title='R palmar 5th finger' coords='2,70,39,167' nohref />
                            <area id='MFrvolarwrist' shape='rect' title='R volar wrist' coords='23,261,113,296' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divMaleLeftArm" style="display: none">
                        <img src="{{ asset('images/Bodymap/MaleFrontLeftArm.png') }}" usemap="#ao71756" width="114" height="300" alt="click map" border="0" class="body" />
                        <map id="ao71756" name="ao71756">
                            <area id='MFlshoulder' shape='rect' title='L shoulder' coords='1,1,59,67' nohref />
                            <area id='MFlanteriorupperarm' shape='rect' title='L anterior upper arm' coords='15,69,59,137' nohref />
                            <area id='MFlantecubitalfossa' shape='rect' title='L antecubital fossa' coords='14,143,60,173' nohref />
                            <area id='MFlanteriorforearm' shape='rect' title='L anterior forearm' coords='24,169,70,261' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divMaleRightArm" style="display: none">
                        <img src="{{ asset('images/Bodymap/MaleFrontRightArm.png') }}" usemap="#yg90466" width="114" height="300" alt="click map" border="0" class="body" />
                        <map id="yg90466" name="yg90466">
                            <area id='Mfrshoulder' shape='rect' title='R shoulder' coords='59,5,115,65' nohref />
                            <area id='MFranteriorupperarm' shape='rect' title='R anterior upper arm' coords='65,73,98,146' nohref />
                            <area id='MFrantecubitalfossa' shape='rect' title='R antecubital fossa' coords='61,144,93,164' nohref />
                            <area id='MFranteriorforearm' shape='rect' title='R anterior forearm' coords='42,164,94,261' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divMaleLeftLeg" style="display: none">
                        <img src="{{ asset('images/Bodymap/MaleFrontLeftLeg.png') }}" usemap="#jt93705" width="68" height="300" alt="click map" border="0" class="body" />
                        <map id="jt93705" name="jt93705">
                            <area id='MFlanteriorthigh' shape='rect' title='L anterior thigh' coords='9,1,61,90' nohref />
                            <area id='MFlknee' shape='rect' title='L knee' coords='7,93,49,138' nohref />
                            <area id='MFlanteriorlowerleg' shape='rect' title='L shin' coords='6,145,62,246' nohref />

                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divMaleRightLeg" style="display: none">
                        <img src="{{ asset('images/Bodymap/MaleFrontRightLeg.png') }}" usemap="#ee35863" width="68" height="300" alt="click map" border="0" class="body" />
                        <map id="ee35863" name="ee35863">
                            <area id='MFranteriorthigh' shape='rect' title='R anterior thigh' coords='2,1,68,94' nohref />
                            <area id='MFrknee' shape='rect' title='R knee' coords='23,102,63,133' nohref />
                            <area id='MFranteriorlowerleg' shape='rect' title='R shin' coords='8,145,52,249' nohref />

                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divMaleLeftFoot" style="display: none">
                        <img src="{{ asset('images/Bodymap/MaleFrontLeftFoot.png') }}" usemap="#ux83200" width="155" height="300" alt="click map" border="0" class="body" />
                        <map id="ux83200" name="ux83200">
                            <area id='MFldorsalfoot' shape='rect' title='L dorsal foot' coords='27,161,133,232' nohref />
                            <area id='MFldorsalanteriorankle' shape='rect' title='L anterior ankle' coords='80,100,105,157' nohref />
                            <area id='MFldorsal1sttoe' shape='rect' title='L dorsal 1st toe' coords='20,230,59,293' nohref />
                            <area id='MFldorsal2ndtoe' shape='rect' title='L dorsal 2nd toe' coords='66,235,85,298' nohref />
                            <area id='MFldorsal3rdtoe' shape='rect' title='L dorsal 3rd toe' coords='86,233,107,283' nohref />
                            <area id='MFldorsal4thtoe' shape='rect' title='L dorsal 4th toe' coords='106,229,120,277' nohref />
                            <area id='MFldorsal5thtoe' shape='rect' title='L dorsal 5th toe' coords='120,218,138,250' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divMaleRightFoot" style="display: none">
                        <img src="{{ asset('images/Bodymap/MaleFrontRightFoot.png') }}" usemap="#vn49199" width="155" height="300" alt="click map" border="0" class="body" />
                        <map id="vn49199" name="vn49199">
                            <area id='MFrdorsalfoot' shape='rect' title='R dorsal foot' coords='23,165,132,229' nohref />
                            <area id='MFrdorsalanteriorankle' shape='rect' title='R anterior ankle' coords='47,107,79,152' nohref />
                            <area id='MFrdorsal1sttoe' shape='rect' title='R dorsal 1st toe' coords='97,233,136,298' nohref />
                            <area id='MFrdorsal2ndtoe' shape='rect' title='R dorsal 2nd toe' coords='68,233,89,294' nohref />
                            <area id='MFrdorsal3rdtoe' shape='rect' title='R dorsal 3rd toe' coords='45,230,67,283' nohref />
                            <area id='MFrdorsal4thtoe' shape='rect' title='R dorsal 4th toe' coords='29,217,50,276' nohref />
                            <area id='MFrdorsal5thtoe' shape='rect' title='R dorsal 5th toe' coords='14,209,32,254' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divMaleGenitalia" style="display: none"> <img src="{{ asset('images/Bodymap/MaleFrontGenitalia.png') }}" usemap="#rq37833" width="284" height="300" alt="click map" border="0" class="body" />
                        <map id="rq37833" name="rq37833">
                            <area id='MFlButtock' shape='Polygon' title='L buttock' coords='164,214,278,214,278,252,272,270,242,289,214,294,187,294,163,285,163,283' nohref />
                            <area id='MFrButtock' shape='Polygon' title='R buttock' coords='120,212,2,217,4,262,31,283,61,294,98,293,122,287' nohref />
                            <area id='MFlUpperThigh' shape='Polygon' title='L upper thigh' coords='283,184,279,7,241,27,208,65,188,120,189,156,201,189' nohref />
                            <area id='MFrUpperThigh' shape='Polygon' title='R upper thigh' coords='0,188,0,20,7,15,22,13,35,14,56,39,76,66,91,89,100,111,103,132,102,159,94,180,94,186,92,186' nohref />
                            <area id='MFanus' shape='circle' title='Anus' coords='143,244,22' nohref />
                            <area id='MFscrotum' shape='circle' title='Scrotum' coords='144,174,34' nohref />
                            <area id='MFglansHead' shape='Polygon' title='Glans (head)' coords='124,59,159,57,165,48,159,36,154,29,148,22,138,26,132,33,124,45' nohref />
                            <area id='MFsuprapubicGroin' shape='Polygon' title='Suprapubic groin' coords='145,138,182,134,196,85,166,79,162,133,165,135,116,139,104,129,98,104,95,88,103,85,119,80,124,79,124,129,125,137' nohref />
                            <area id='MFdorsalPenileShaft' shape='rect' title='Dorsal penile shaft' coords='126,69,160,132' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <!--      ************** Male Front End   *************                -->

                    <!--      ************** Male Back Start   *************                -->
                    <div id="divMaleBackBody" style="display:none">
                        <h2 style="width:352px;margin-left:-80px;">Select Affected Area(s)</h2>
                        <div class="divCounter" style="left:-29px; position: absolute;  top: 25px;  z-index: 9999;">

                        </div>
                        <img src="{{ asset('images/Bodymap/MaleBack.png') }}" usemap="#MB2000" width="149" height="360" alt="click" border="0" class="body" />
                        <map id="MB2000" name="MB2000">
                            <area id='MBHead' data="divMaleBackHead" shape='circle' title='Male Back Head' coords='74,30,28' nohref />
                            <area id='MBBack' data="divMaleBack" shape='rect' title='Male Back' coords='47,62,98,143' nohref />
                            <area id='MBButtocks' data="divMaleButtocks" shape='rect' title='Male Buttocks' coords='46,146,102,194' nohref />
                            <area id='MBlArm' data="divMaleBackLeftArm" shape='rect' title='Male Back LeftArm' coords='10,63,44,166' nohref />
                            <area id='MBrArm' data="divMaleBackRightArm" shape='rect' title='Male Back RightArm' coords='101,61,136,166' nohref />
                            <area id='MBrHand' data="divMaleBackRightHand" shape='rect' title='Male Back RightHand' coords='109,169,149,214' nohref />
                            <area id='MBlHand' data="divMaleBackLeftHand" shape='rect' title='Male Back LeftHand' coords='1,169,42,213' nohref />
                            <area id='MBrLeg' data="divMaleBackRightLeg" shape='rect' title='Male Back Right Leg' coords='75,203,103,323' nohref />
                            <area id='MBlLeg' data="divMaleBackLeftLeg" shape='rect' title='Male Back Left Leg' coords='44,203,72,322' nohref />
                            <area id='MBrFoot' data="divMaleBackRightFoot" shape='rect' title='Male Back Right Foot' coords='76,326,111,355' nohref />
                            <area id='MBlFoot' data="divMaleBackLeftFoot" shape='rect' title='Male Back Left Foot' coords='40,325,73,354' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <h2>
                        <a class="button btnGotoMaleBack icon left mini lfbtys4" data="btnGotoMaleBack" style="display: none" href="javascript:;">Select other area(s)</a>
                    </h2>
                    <div id="divMaleBackHead" style="display: none"> <img src="{{ asset('images/Bodymap/MaleBackHead.png') }}" usemap="#MB2001" width="271" height="300" alt="click map" border="0" class="body" />
                        <map id="MB2001" name="MB2001">
                            <area id='MBscalp' shape='Polygon' title='Scalp' coords='141,18,105,25,73,51,48,110,54,154,94,234,147,226,175,237,200,224,216,179,239,110,223,69,206,43,189,29,173,21' nohref />
                            <area id='MBposteriorNeck' shape='Polygon' title='Posterior Neck' coords='81,249,199,246,204,246,205,283,209,287,213,292,73,292,71,284,73,284' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divMaleBack" style="display: none"> <img src="{{ asset('images/Bodymap/MaleBackBack.png') }}" usemap="#MB2002" width="260" height="300" alt="click map" border="0" class="body" />
                        <map id="MB2002" name="MB2002">
                            <area id='MBupperBack' shape='Polygon' title='Upper back' coords='31,45,27,28,102,-2,183,0,236,32,233,191,215,228,44,232,40,229,25,169,27,27' nohref />
                            <area id='MBlowerBack' shape='Polygon' title='Lower back' coords='45,242,214,241,213,292,214,291,44,294,44,294' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divMaleButtocks" style="display: none"> <img src="{{ asset('images/Bodymap/MaleBackButtock.png') }}" usemap="#MB2003" width="291" height="240" alt="click map" border="0" class="body" />
                        <map id="MB2003" name="MB2003">
                            <area id='MBlButtock' shape='rect' title='L buttock' coords='13,1,136,199' nohref />
                            <area id='MBrButtock' shape='rect' title='R buttock' coords='151,0,264,199' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divMaleBackLeftArm" style="display: none"> <img src="{{ asset('images/Bodymap/MaleBackLeftArm.png') }}" usemap="#MB2004" width="96" height="300" alt="click" border="0" class="body" />
                        <map id="MB2004" name="MB2004">
                            <area id='MBlPosteriorShoulder' shape='Polygon' title='L posterior shoulder' coords='91,2,51,23,43,67,89,49,90,20' nohref />
                            <area id='MBlPosteriorUpperArm' shape='rect' title='L posterior upper arm' coords='51,58,76,107' nohref />
                            <area id='MBlElbow' shape='rect' title='L elbow' coords='48,111,81,136' nohref />
                            <area id='MBlPosteriorForeArm' shape='Polygon' title='L posterior forearm' coords='45,145,31,211,31,211,54,221,76,170,77,148,72,148' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divMaleBackRightArm" style="display: none"> <img src="{{ asset('images/Bodymap/MaleBackRightArm.png') }}" usemap="#MB2005" width="96" height="300" alt="click" border="0" class="body" />
                        <map id="MB2005" name="MB2005">
                            <area id='MBrPosteriorShoulder' shape='Polygon' title='R posterior shoulder' coords='4,5,0,61,49,62,47,35,40,19,40,19' nohref />
                            <area id='MBrPosteriorUpperArm' shape='rect' title='R posterior upper arm' coords='15,63,47,125' nohref />
                            <area id='MBrElbow' shape='rect' title='R elbow' coords='12,130,53,151' nohref />
                            <area id='MBrPosteriorForeArm' shape='Polygon' title='R posterior forearm' coords='20,157,24,183,29,199,38,215,52,231,68,221,55,195,54,165,50,152,46,152' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divMaleBackRightHand" style="display: none"> <img src="{{ asset('images/Bodymap/MaleBackRightHand.png') }}" usemap="#MB2006" width="201" height="300" alt="click" border="0" class="body" />
                        <map id="MB2006" name="MB2006">
                            <area id='MBrDorsalhand' shape='Polygon' title='Rdorsal hand' coords='66,131,100,120,130,124,162,134,181,143,171,242,79,252,48,213,56,178' nohref />
                            <area id='MBrDorsalthumb' shape='Polygon' title='R dorsal thumb' coords='57,168,47,142,37,126,16,114,12,118,5,130,40,204' nohref />
                            <area id='MBrDorsal2ndfinger' shape='Polygon' title='R dorsal 2nd finger' coords='66,131,71,38,83,25,95,35,91,126' nohref />
                            <area id='MBrDorsal3rdfinger' shape='Polygon' title='R dorsal 3rd finger' coords='100,18,98,126,125,124,125,11,111,7' nohref />
                            <area id='MBrDorsal4thfinger' shape='Polygon' title='R dorsal 4th finger' coords='134,34,125,128,153,130,156,30,141,21' nohref />
                            <area id='MBrDorsal5thfinger' shape='Polygon' title='R dorsal 5th finger' coords='166,63,152,130,181,140,179,103,188,72,175,51' nohref />
                            <area id='MBrDorsalwrist' shape='Rect' title='R dorsal wrist' coords='85,257,187,294' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divMaleBackLeftHand" style="display: none"> <img src="{{ asset('images/Bodymap/MaleBackLeftHand.png') }}" usemap="#MB2007" width="201" height="300" alt="click" border="0" class="body" />
                        <map id="MB2007" name="MB2007">
                            <area id='MBlDorsalhand' shape='Polygon' title='L dorsal hand' coords='23,139,47,117,76,123,113,121,134,128,146,191,156,209,125,245,115,258,28,258' nohref />
                            <area id='MBlDorsalthumb' shape='Polygon' title='L dorsal thumb' coords='140,164,156,205,171,178,188,141,195,125,185,116,160,129,144,161' nohref />
                            <area id='MBlDorsal2ndfinger' shape='Polygon' title='L dorsal 2nd finger' coords='135,125,128,57,131,38,121,29,111,25,105,38,105,124' nohref />
                            <area id='MBlDorsal3rdfinger' shape='Polygon' title='L dorsal 3rd finger' coords='104,113,102,21,90,11,78,13,74,21,75,115' nohref />
                            <area id='MBlDorsal4thfinger' shape='Polygon' title='L dorsal 4th finger' coords='76,123,66,31,50,25,45,30,43,39,50,120,50,120' nohref />
                            <area id='MBlDorsal5thfinger' shape='Polygon' title='L dorsal 5th finger' coords='50,128,35,59,19,55,12,74,24,140' nohref />
                            <area id='MBlDorsalwrist' shape='Rect' title='L dorsal wrist' coords='20,254,120,298' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divMaleBackRightFoot" style="display: none"> <img src="{{ asset('images/Bodymap/MaleBackRightFoot.png') }}" usemap="#MB2008" width="122" height="300" alt="click" border="0" class="body" />
                        <map id="MB2008" name="MB2008">
                            <area id='MBrPlantarFoot' shape='Polygon' title='R plantar foot' coords='2,105,35,282,44,289,46,293,53,293,68,294,82,292,95,288,106,269,103,170,103,170,114,120,116,105,116,80,109,65,89,54,64,54,53,56,60,57' nohref />
                            <area id='MBr1stPlantarToe' shape='rect' title='R 1st plantar toe' coords='75,1,115,52' nohref />
                            <area id='MBr2ndPlantarToe' shape='rect' title='R 2nd plantar toe' coords='54,8,76,53' nohref />
                            <area id='MBr3rdPlantarToe' shape='rect' title='R 3rd plantar toe' coords='32,24,55,71' nohref />
                            <area id='MBr4thPlantarToe' shape='rect' title='R 4th plantar toe' coords='18,39,35,82' nohref />
                            <area id='MBr5thPlantarToe' shape='rect' title='R 5th plantar toe' coords='1,56,20,96' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divMaleBackLeftFoot" style="display: none"> <img src="{{ asset('images/Bodymap/MaleBackLeftFoot.png') }}" usemap="#MB2009" width="122" height="300" alt="click" border="0" class="body" />
                        <map id="MB2009" name="MB2009">
                            <area id='MBlPlantarFoot' shape='Polygon' title='L plantar foot' coords='3,77,2,106,20,159,12,217,18,280,31,293,41,294,79,293,92,266,101,225,108,193,116,151,114,100,61,58' nohref />
                            <area id='MBl1stPlantarToe' shape='rect' title='L 1st plantar toe' coords='5,1,44,55' nohref />
                            <area id='MBl2ndPlantarToe' shape='rect' title='L 2nd plantar toe' coords='45,7,70,57' nohref />
                            <area id='MBl3rdPlantarToe' shape='rect' title='L 3rd plantar toe' coords='67,23,88,67' nohref />
                            <area id='MBl4thPlantarToe' shape='rect' title='L 4th plantar toe' coords='84,42,105,79' nohref />
                            <area id='MBl5thPlantarToe' shape='rect' title='L 5th plantar toe' coords='100,58,121,95' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divMaleBackLeftLeg" style="display: none"> <img src="{{ asset('images/Bodymap/MaleBackLeftLeg.png') }}" usemap="#MB2010" width="62" height="300" alt="click" border="0" class="body" />
                        <map id="MB2010" name="MB2010">
                            <area id='MBlPosteriorThigh' shape='rect' title='L posterior thigh' coords='5,1,61,111' nohref />
                            <area id='MBlPoplitealFossa' shape='rect' title='L popliteal fossa' coords='13,118,56,137' nohref />
                            <area id='MBlPosteriorLowerLeg' shape='rect' title='L calf' coords='14,141,61,256' nohref />
                            <area id='MBlPosteriorAnkle' shape='rect' title='L posterior ankle' coords='32,267,56,292' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divMaleBackRightLeg" style="display: none"> <img src="{{ asset('images/Bodymap/MaleBackRightLeg.png') }}" usemap="#MB2011" width="62" height="300" alt="click" border="0" class="body" />
                        <map id="MB2011" name="MB2011">
                            <area id='MBrPosteriorThigh' shape='rect' title='R posterior thigh' coords='2,2,54,103' nohref />
                            <area id='MBrPoplitealFossa' shape='rect' title='R popliteal fossa' coords='6,113,46,136' nohref />
                            <area id='MBrPosteriorLowerLeg' shape='rect' title='R calf' coords='7,143,48,256' nohref />
                            <area id='MBrPosteriorAnkle' shape='rect' title='R posterior ankle' coords='8,263,28,292' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <!--      ************** Male Back End    *************                 -->

                    <!--      ************** Female Front Start   *************             -->
                    <!-- Female Front - Chest & Stomach -->
                    <div id="divFemaleBody" style="display: none">
                        <h2 style="width:352px;margin-left:-80px;">Select Affected Area(s)</h2>
                        <div class="divCounter" style="left:-29px; position: absolute;  top: 25px;  z-index: 9999;">

                        </div>
                        <img src="{{ asset('images/Bodymap/FemaleFrontt.png') }}" usemap="#FF2000" height="360" alt="click area" border="0" class="body" width="151" />

                        <map id="FF2000" name="FF2000">
                            <area id='FFlFoot' data="divFemaleLeftFoot" shape='rect' title='Female Front LeftFoot' coords='74,324,108,358' nohref />
                            <area id='FFrFoot' data="divFemaleRightFoot" shape='rect' title='Female Front RightFoot' coords='40,322,71,358' nohref />
                            <area id='FFlArm' data="divFemaleLeftArm" shape='rect' title='Female Front LeftArm' coords='103,65,139,174' nohref />
                            <area id='FFlLeg' data="divFemaleLeftLeg" shape='rect' title='Female Front LeftLeg' coords='75,192,107,321' nohref />
                            <area id='FFlHand' data="divFemaleLeftHand" shape='rect' title='Female Front LeftHand' coords='109,177,141,221' nohref />
                            <area id='FFrHand' data="divFemaleRightHand" shape='rect' title='Female Front RightHand' coords='13,176,42,217' nohref />
                            <area id='FFGenitalia' data="divFemaleGenitalia" shape='rect' title='Female Genitalia' coords='43,159,106,190' nohref />
                            <area id='FFrLeg' data="divFemaleRightLeg" shape='rect' title='Female Front RightLeg' coords='43,193,71,321' nohref />
                            <area id='FFChestStomach' data="divFemaleChestAndStomach" shape='rect' title='Female Chest & Stomach' coords='46,66,101,156' nohref />
                            <area id='FFrArm' data="divFemaleRightArm" shape='rect' title='Female Front RightArm' coords='14,66,44,174' nohref />
                            <area id='FFFace' data="divFemaleFace" shape='circle' title='Female Face' coords='74,31,27' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <h2>
                        <a class="button btnGotoFemaleFront icon left mini lfbtys4" data="btnGotoFemaleFront" style="display: none" href="javascript:;">Select other area(s)</a>
                    </h2>
                    <div id="divFemaleFace" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleFace.png') }}" usemap="#FF2001" width="317" height="300" alt="click area" border="0" class="body" />
                        <map id="FF2001" name="FF2001">
                            <area id='FFscalp' shape='polygon' title='Scalp' coords='55,34,109,11,155,14,192,37,213,77,180,85,110,85,63,113,58,108,60,106,53,101' nohref />
                            <area id='FFlear' shape='Rect' title='L ear' coords='192,150,215,189' nohref />
                            <area id='FFrear' shape='Rect' title='R ear' coords='40,147,66,193' nohref />
                            <area id='FFforehead' shape='Rect' title='Forehead' coords='66,86,194,126' nohref />
                            <area id='FFlbrow' shape='Rect' title='L brow' coords='138,126,184,142' nohref />
                            <area id='FFrbrow' shape='Rect' title='R brow' coords='68,123,116,142' nohref />
                            <area id='FFlEye' shape='Rect' title='L eye' coords='144,139,188,160' nohref />
                            <area id='FFrEye' shape='Rect' title='R eye' coords='72,139,112,161' nohref />
                            <area id='FFnose' shape='Rect' title='Nose' coords='114,138,144,195' nohref />
                            <area id='FFlcheek' shape='circle' title='L cheek' coords='167,188,20' nohref />
                            <area id='FFrcheek' shape='circle' title='R cheek' coords='91,189,22' nohref />
                            <area id='FFbetweenLipAndNose' shape='Rect' title='Between nose and lips' coords='236,165,310,198' nohref />
                            <area id='FFupperLip' shape='Rect' title='Upper lip' coords='236,206,310,239' nohref />
                            <area id='FFlowerLip' shape='Rect' title='Lower lip' coords='235,247,309,280' nohref />
                            <area id='FFchin' shape='polygon' title='Chin' coords='93,236,160,236,145,249,131,258,120,259,107,250,110,250,110,250,110,250,98,243,98,243,98,243' nohref />
                            <area id='FFneck' shape='polygon' title='Neck' coords='77,219,119,260,180,222,174,284,76,275' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleChestAndStomach" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleFrontChestStomach.png') }}" usemap="#FF2002" width="276" height="300" alt="click map" border="0" class="body" />
                        <map id="FF2002" name="FF2002">
                            <area id='FFlBreast' shape='circle' title='L breast' coords='193,105,51' nohref />
                            <area id='FFrBreast' shape='circle' title='R breast' coords='83,105,51' nohref />
                            <area id='FFlNipple' shape='rect' title='L nipple' coords='224,163,273,199' nohref />
                            <area id='FFrNipple' shape='rect' title='R nipple' coords='6,162,55,198' nohref />
                            <area id='FFAbdomen' shape='rect' title='Abdomen' coords='59,154,215,239' nohref />
                            <area id='FFUmbilicus' shape='rect' title='Belly button' coords='119,232,155,266' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleLeftHand" style="display: none">
                        <img src="{{ asset('images/Bodymap/FemaleFrontLeftHand.png') }}" usemap="#FF2003" width="205" height="300" alt="click map" border="0" class="body" />
                        <map id="FF2003" name="FF2003">
                            <area id='FFlpalm' shape='Rect' title='L palm' coords='61,133,162,243' nohref />
                            <area id='FFlpalmarthumb' shape='Rect' title='L palmar thumb' coords='5,94,53,188' nohref />
                            <area id='FFlpalmar2ndfinger' shape='Rect' title='L palmar 2nd finger' coords='48,15,84,126' nohref />
                            <area id='FFlpalmar3rdfinger' shape='Rect' title='L palmar 3rd finger' coords='87,4,123,123' nohref />
                            <area id='FFlpalmar4thfinger' shape='Rect' title='L palmar 4th finger' coords='126,19,163,125' nohref />
                            <area id='FFlpalmar5thfinger' shape='Rect' title='L palmar 5th finger' coords='163,53,199,140' nohref />
                            <area id='FFlvolarwrist' shape='Rect' title='L volar wrist' coords='75,261,164,299' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divFemaleRightHand" style="display: none">
                        <img src="{{ asset('images/Bodymap/FemaleFrontRightHand.png') }}" usemap="#FF2004" width="204" height="300" alt="click map" border="0" class="body" />
                        <map id="FF2004" name="FF2004">
                            <area id='FFrpalm' shape='Rect' title='R palm' coords='30,132,140,244' nohref />
                            <area id='FFrpalmarthumb' shape='Rect' title='R palmar thumb' coords='146,91,203,177' nohref />
                            <area id='FFrpalmar2ndfinger' shape='Rect' title='R palmar 2nd finger' coords='122,19,160,132' nohref />
                            <area id='FFrpalmar3rdfinger' shape='Rect' title='R palmar 3rd finger' coords='83,4,114,122' nohref />
                            <area id='FFrpalmar4thfinger' shape='Rect' title='R palmar 4th finger' coords='38,9,82,134' nohref />
                            <area id='FFrpalmar5thfinger' shape='Rect' title='R palmar 5th finger' coords='-1,59,42,145' nohref />
                            <area id='FFrvolarwrist' shape='Rect' title='R volar wrist' coords='43,259,137,299' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divFemaleLeftArm" style="display: none">
                        <img src="{{ asset('images/Bodymap/FemaleFrontLeftArm.png') }}" usemap="#FF2005" width="74" height="300" alt="click map" border="0" class="body" />
                        <map id="FF2005" name="FF2005">
                            <area id='FFlShoulder' shape='rect' title='L shoulder' coords='3,1,41,49' nohref />
                            <area id='FFlUpperArm' shape='rect' title='L anterior upper arm' coords='8,53,46,109' nohref />
                            <area id='FFlAntecubitalFossa' shape='rect' title='L antecubital fossa' coords='11,114,46,136' nohref />
                            <area id='FFlForearm' shape='rect' title='L anterior forearm' coords='20,141,63,233' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divFemaleRightArm" style="display: none">
                        <img src="{{ asset('images/Bodymap/FemaleFrontRightArm.png') }}" usemap="#FF2006" width="74" height="300" alt="click map" border="0" class="body" />
                        <map id="FF2006" name="FF2006">
                            <area id='FFrShoulder' shape='rect' title='R shoulder' coords='31,1,76,46' nohref />
                            <area id='FFrUpperArm' shape='rect' title='R anterior upper arm' coords='33,46,66,107' nohref />
                            <area id='FFrAntecubitalFossa' shape='rect' title='R antecubital fossa' coords='32,109,66,128' nohref />
                            <area id='FFrForearm' shape='rect' title='R anterior forearm' coords='16,125,56,225' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divFemaleLeftLeg" style="display: none">
                        <img src="{{ asset('images/Bodymap/FemaleFrontLeftLeg.png') }}" usemap="#FF2007" width="68" height="300" alt="click map" border="0" class="body" />
                        <map id="FF2007" name="FF2007">
                            <area id='FFlanteriorthigh' shape='rect' title='L anterior thigh' coords='9,1,61,90' nohref />
                            <area id='FFlknee' shape='rect' title='L knee' coords='7,93,49,138' nohref />
                            <area id='FFlanteriorlowerleg' shape='rect' title='L shin' coords='6,145,62,246' nohref />
                            <area shape="default" nohref alt="" /></map>

                    </div>
                    <div id="divFemaleRightLeg" style="display: none">
                        <img src="{{ asset('images/Bodymap/FemaleFrontRightLeg.png') }}" usemap="#FF2008" width="68" height="300" alt="click map" border="0" class="body" />
                        <map id="FF2008" name="FF2008">
                            <area id='FFranteriorthigh' shape='rect' title='R anterior thigh' coords='2,1,68,94' nohref />
                            <area id='FFrknee' shape='rect' title='R knee' coords='23,102,63,133' nohref />
                            <area id='FFranteriorlowerleg' shape='rect' title='R shin' coords='8,145,52,249' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>

                    <div id="divFemaleLeftFoot" style="display: none">
                        <img src="{{ asset('images/Bodymap/FemaleFrontLeftFoot.png') }}" usemap="#FF2009" width="155" height="300" alt="click map" border="0" class="body" />
                        <map id="FF2009" name="FF2009">
                            <area id='FFldorsalfoot' shape='rect' title='L dorsal foot' coords='27,161,133,232' nohref />
                            <area id='FFlanteriorankle' shape='rect' title='L anterior ankle' coords='80,100,105,157' nohref />
                            <area id='FFldorsal1sttoe' shape='rect' title='L dorsal 1st toe' coords='20,230,59,293' nohref />
                            <area id='FFldorsal2ndtoe' shape='rect' title='L dorsal 2nd toe' coords='66,235,85,298' nohref />
                            <area id='FFldorsal3rdtoe' shape='rect' title='L dorsal 3rd toe' coords='86,233,107,283' nohref />
                            <area id='FFldorsal4thtoe' shape='rect' title='L dorsal 4th toe' coords='106,229,120,277' nohref />
                            <area id='FFldorsal5thtoe' shape='rect' title='L dorsal 5th toe' coords='120,218,138,250' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>

                    <div id="divFemaleRightFoot" style="display: none">
                        <img src="{{ asset('images/Bodymap/FemaleFrontRightFoot.png') }}" usemap="#FF2010" width="155" height="300" alt="click map" border="0" class="body" />
                        <map id="FF2010" name="FF2010">
                            <area id='FFrdorsalfoot' shape='rect' title='R dorsal foot' coords='23,165,132,229' nohref />
                            <area id='FFranteriorankle' shape='rect' title='R anterior ankle' coords='47,107,79,152' nohref />
                            <area id='FFrdorsal1sttoe' shape='rect' title='R dorsal 1st toe' coords='97,233,136,298' nohref />
                            <area id='FFrdorsal2ndtoe' shape='rect' title='R dorsal 2nd toe' coords='68,233,89,294' nohref />
                            <area id='FFrdorsal3rdtoe' shape='rect' title='R dorsal 3rd toe' coords='45,230,67,283' nohref />
                            <area id='FFrdorsal4thtoe' shape='rect' title='R dorsal 4th toe' coords='29,217,50,276' nohref />
                            <area id='FFrdorsal5thtoe' shape='rect' title='R dorsal 5th toe' coords='14,209,32,254' nohref />
                            <area shape="default" nohref alt="" /></map>
                    </div>
                    <div id="divFemaleGenitalia" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleGenitalia.png') }}" usemap="#FF2011" width="315" height="300" alt="click map" border="0" class="body" />
                        <map id="FF2011" name="FF2011">
                            <area id='FFlButtock' shape='Rect' title='L buttock' coords='171,221,304,286' nohref />
                            <area id='FFrButtock' shape='Rect' title='R buttock' coords='5,238,152,295' nohref />
                            <area id='FFlUpperthigh' shape='polygon' title='L upper thigh' coords='214,119,239,65,286,-2,307,8,306,197,303,187,307,219,300,243,294,236' nohref />
                            <area id='FFrUpperthigh' shape='polygon' title='R upper thigh' coords='87,94,24,6,10,3,3,25,-2,251,6,231' nohref />
                            <area id='FFanus' shape='Rect' title='Anus' coords='144,212,175,247' nohref />
                            <area id='FFlabiaMajora' shape='polygon' title='Labia majora (outer lips)' coords='147,93,123,115,109,141,110,168,125,195,147,220,173,219,172,204,195,185,198,166,206,138,196,118,166,87' nohref />
                            <area id='FFlabiaMinora' shape='Rect' title='Labia minora (inner lips)' coords='69,27,135,68' nohref />
                            <area id='FFsuprapubicGroin' shape='Rect' title='Suprapubic groin' coords='159,27,223,68' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <!--      ************** Female Front End   *************                 -->

                    <!--      ************** Female Back Start   *************                 -->
                    <div id="divFemaleBackBody" style="display:none">
                        <h2 style="width:352px;margin-left:-80px;">Select Affected Area(s)</h2>
                        <div class="divCounter" style="left:-29px; position: absolute;  top: 25px;  z-index: 9999;">

                        </div>
                        <img src="{{ asset('images/Bodymap/FemaleBack.png') }}" usemap="#FB2000" height="360" alt="click" border="0" class="body" width="151" />
                        <map id="FB2000" name="FB2000">
                            <area id='FBHead' data="divFemaleBackHead" shape='circle' title='Female Back Head' coords='61,37,32' nohref />
                            <area id='FBBack' data="divFemaleBack" shape='rect' title='Female Back' coords='36,70,87,140' nohref />
                            <area id='FBButtocks' data="divFemaleButtocks" shape='rect' title='Female Buttocks' coords='29,143,95,191' nohref />
                            <area id='FBlArm' data="divFemaleBackLeftArm" shape='rect' title='Female Back LeftArm' coords='4,68,34,167' nohref />
                            <area id='FBrArm' data="divFemaleBackRightArm" shape='rect' title='Female Back RightArm' coords='90,67,120,167' nohref />
                            <area id='FBrHand' data="divFemaleBackRightHand" shape='rect' title='Female Back RightHand' coords='100,171,121,213' nohref />
                            <area id='FBlHand' data="divFemaleBackLeftHand" shape='rect' title='Female Back LeftHand' coords='3,171,26,215' nohref />
                            <area id='FBrLeg' data="divFemaleBackRightLeg" shape='rect' title='Female Back Right Leg' coords='61,194,93,324' nohref />
                            <area id='FBlLeg' data="divFemaleBackLeftLeg" shape='rect' title='Female Back Left Leg' coords='28,195,60,324' nohref />
                            <area id='FBrFoot' data="divFemaleBackRightFoot" shape='rect' title='Female Back Right Foot' coords='63,326,94,357' nohref />
                            <area id='FBlFoot' data="divFemaleBackLeftFoot" shape='rect' title='Female Back Left Foot' coords='28,327,60,357' nohref />
                            <area shape="default" nohref alt="" />
                        </map>

                    </div>
                    <h2><a class="button btnGotoFemaleBack icon left mini lfbtys4" data="btnGotoFemaleBack" style="display: none" href="javascript:;">Select other area(s)</a></h2>

                    <div id="divFemaleBackHead" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleBackHead.png') }}" usemap="#FB2001" width="266" height="300" alt="click map" border="0" class="body" />
                        <map id="FB2001" name="FB2001">
                            <area id='FBscalp' shape='Polygon' title='Scalp' coords='77,41,51,59,38,120,63,253,105,270,170,272,200,256,210,234,226,162,225,101,209,57,168,17,110,11,95,24' nohref />
                            <area id='FBposteriorNeck' shape='Polygon' title='Posterior Neck' coords='63,273,49,292,221,293,202,268,63,261,60,264' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleBack" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleBackBack.png') }}" usemap="#FB2002" width="298" height="300" alt="click" border="0" class="body" />
                        <map id="FB2002" name="FB2002">
                            <area id='FBupperBack' shape='Polygon' title='Upper back' coords='63,245,243,246,244,209,264,149,265,17,37,20,18,100,33,118,52,176,61,217,61,217' nohref />
                            <area id='FBlowerBack' shape='Polygon' title='Lower back' coords='64,255,243,257,251,284,258,292,52,287,51,290' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleButtocks" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleBackButtock.png') }}" usemap="#FB2003" width="297" height="240" alt="click" border="0" class="body" />
                        <map id="FB2003" name="FB2003">
                            <area id='FBlButtock' shape='Polygon' title='L buttock' coords='139,3,52,4,31,23,19,48,10,64,7,92,1,126,1,158,2,182,2,200,14,204,41,212,76,218,117,217,138,201,145,196,145,196' nohref />
                            <area id='FBrButtock' shape='Polygon' title='R buttock' coords='150,196,150,-1,252,6,285,74,291,118,291,148,290,188,290,209,270,219,217,215,198,217,169,211,169,211' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleBackLeftArm" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleBackLeftArm.png') }}" usemap="#FB2004" width="69" height="300" alt="click" border="0" class="body" />
                        <map id="FB2004" name="FB2004">
                            <area id='FBlPosteriorShoulder' shape='Polygon' title='L posterior shoulder' coords='68,2,36,20,29,63,61,52,61,52' nohref />
                            <area id='FBlPosteriorUpperArm' shape='rect' title='L posterior upper arm' coords='32,61,58,120' nohref />
                            <area id='FBlElbow' shape='rect' title='L elbow' coords='18,124,56,144' nohref />
                            <area id='FBlPosteriorforeArm' shape='Polygon' title='L posterior forearm' coords='19,148,13,223,32,223,52,148,46,148,46,148' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleBackRightArm" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleBackRightArm.png') }}" usemap="#FB2005" width="69" height="300" alt="click" border="0" class="body" />
                        <map id="FB2005" name="FB2005">
                            <area id='FBrPosteriorShoulder' shape='Polygon' title='R posterior shoulder' coords='2,3,28,15,38,39,38,64,-3,54,-3,54' nohref />
                            <area id='FBrPosteriorUpperArm' shape='rect' title='R posterior upper arm' coords='9,63,36,115' nohref />
                            <area id='FBrElbow' shape='rect' title='R elbow' coords='10,121,43,146' nohref />
                            <area id='FBrPosteriorforeArm' shape='Polygon' title='R posterior forearm' coords='17,155,47,150,51,200,55,220,38,220,35,205' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleBackRightHand" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleBackRightHand.png') }}" usemap="#FB2006" width="201" height="300" alt="click" border="0" class="body" />
                        <map id="FB2006" name="FB2006">
                            <area id='FBrDorsalhand' shape='Polygon' title='R dorsal hand' coords='67,131,126,120,164,136,176,141,157,230,141,261,82,263,54,221,54,221' nohref />
                            <area id='FBrDorsalthumb' shape='Polygon' title='R dorsal thumb' coords='58,173,44,141,34,127,20,120,13,120,9,123,9,132,18,148,35,182,38,200,61,228,61,228' nohref />
                            <area id='FBrDorsal2ndfinger' shape='Polygon' title='R dorsal 2nd finger' coords='86,118,70,48,61,33,53,32,50,46,64,127' nohref />
                            <area id='FBrDorsal3rdfinger' shape='Polygon' title='R dorsal 3rd finger' coords='87,19,95,119,115,116,104,20,94,8,94,8' nohref />
                            <area id='FBrDorsal4thfinger' shape='Polygon' title='R dorsal 4th finger' coords='148,24,127,114,149,121,156,45,156,25,156,25' nohref />
                            <area id='FBrDorsal5thfinger' shape='Polygon' title='R dorsal 5th finger' coords='194,72,173,97,190,70,152,141,175,146,194,88,196,75,196,75' nohref />
                            <area id='FBrDorsalwrist' shape='Rect' title='R dorsal wrist' coords='74,263,149,297' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleBackLeftHand" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleBackLeftHand.png') }}" usemap="#FB2007" width="201" height="300" alt="click" border="0" class="body" />
                        <map id="FB2007" name="FB2007">
                            <area id='FBlDorsalhand' shape='Polygon' title='L dorsal hand' coords='140,128,75,123,48,139,29,152,55,238,65,268,123,266,130,239,152,224,165,209,146,208,146,208' nohref />
                            <area id='FBlDorsalthumb' shape='rect' title='L dorsal thumb' coords='147,120,196,198' nohref />
                            <area id='FBlDorsal2ndfinger' shape='Polygon' title='L dorsal 2nd finger' coords='142,117,156,36,145,29,130,61,128,110,127,87,119,120,119,120' nohref />
                            <area id='FBlDorsal3rdfinger' shape='Polygon' title='L dorsal 3rd finger' coords='109,122,117,23,112,14,105,12,96,26,89,116' nohref />
                            <area id='FBlDorsal4thfinger' shape='Polygon' title='L dorsal 4th finger' coords='82,117,62,37,59,22,52,23,47,45,58,128' nohref />
                            <area id='FBlDorsal5thfinger' shape='Polygon' title='L dorsal 5th finger' coords='50,129,24,83,21,75,13,72,8,82,32,148' nohref />
                            <area id='FBlDorsalwrist' shape='Rect' title='L dorsal wrist' coords='55,262,136,301' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleBackRightFoot" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleBackRightFoot.png') }}" usemap="#FB2008" width="122" height="300" alt="click" border="0" class="body" />
                        <map id="FB2008" name="FB2008">
                            <area id='FBrPlantarFoot' shape='Polygon' title='R plantar foot' coords='2,105,35,282,44,289,46,293,53,293,68,294,82,292,95,288,106,269,103,170,103,170,114,120,116,105,116,80,109,65,89,54,64,54,53,56,60,57' nohref />
                            <area id='FBr1stPlantarToe' shape='rect' title='R 1st plantar toe' coords='75,1,115,52' nohref />
                            <area id='FBr2ndPlantarToe' shape='rect' title='R 2nd plantar toe' coords='54,8,76,53' nohref />
                            <area id='FBr3rdPlantarToe' shape='rect' title='R 3rd plantar toe' coords='32,24,55,71' nohref />
                            <area id='FBr4thPlantarToe' shape='rect' title='R 4th plantar toe' coords='18,39,35,82' nohref />
                            <area id='FBr5thPlantarToe' shape='rect' title='R 5th plantar toe' coords='1,56,20,96' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleBackLeftFoot" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleBackLeftFoot.png') }}" usemap="#FB2009" width="122" height="300" alt="click" border="0" class="body" />
                        <map id="FB2009" name="FB2009">
                            <area id='FBlPlantarFoot' shape='Polygon' title='L plantar foot' coords='3,77,2,106,20,159,12,217,18,280,31,293,41,294,79,293,92,266,101,225,108,193,116,151,114,100,61,58' nohref />
                            <area id='FBl1stPlantarToe' shape='rect' title='L 1st plantar toe' coords='5,1,44,55' nohref />
                            <area id='FBl2ndPlantarToe' shape='rect' title='L 2nd plantar toe' coords='45,7,70,57' nohref />
                            <area id='FBl3rdPlantarToe' shape='rect' title='L 3rd plantar toe' coords='67,23,88,67' nohref />
                            <area id='FBl4thPlantarToe' shape='rect' title='L 4th plantar toe' coords='84,42,105,79' nohref />
                            <area id='FBl5thPlantarToe' shape='rect' title='L 5th plantar toe' coords='100,58,121,95' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleBackLeftLeg" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleBackLeftLeg.png') }}" usemap="#FB2010" width="69" height="300" alt="click" border="0" class="body" />
                        <map id="FB2010" name="FB2010">
                            <area id='FBlPosteriorThigh' shape='rect' title='L posterior thigh' coords='11,1,67,102' nohref />
                            <area id='FBlPoplitealFossa' shape='rect' title='L popliteal fossa' coords='22,112,65,143' nohref />
                            <area id='FBlPosteriorLowerLeg' shape='rect' title='L calf' coords='24,147,67,251' nohref />
                            <area id='FBlPosteriorAnkle' shape='rect' title='L posterior ankle' coords='39,261,64,291' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>
                    <div id="divFemaleBackRightLeg" style="display: none"> <img src="{{ asset('images/Bodymap/FemaleBackRightLeg.png') }}" usemap="#MB2011" width="69" height="300" alt="click" border="0" class="body" />
                        <map id="MB2011" name="MB2011">
                            <area id='FBrPosteriorThigh' shape='rect' title='R posterior thigh' coords='3,0,58,104' nohref />
                            <area id='FBrPoplitealFossa' shape='rect' title='R popliteal fossa' coords='2,115,54,144' nohref />
                            <area id='FBrPosteriorLowerLeg' shape='rect' title='R calf' coords='5,149,46,253' nohref />
                            <area id='FBrPosteriorAnkle' shape='rect' title='R posterior ankle' coords='7,259,33,288' nohref />
                            <area shape="default" nohref alt="" />
                        </map>
                    </div>

                    <!--      ************** Female Back End   *************                 -->

                </center>
            </div>
            <div class="affected_area_button" style=" float: left;width: 100%;">
                <span class="phots-01 araebtn1 backButton" style="margin: 0 0 0 130px; position: relative; position: absolute; top:470px; left:50px;"><i style="color:#FFFFFF; font-size: 14px;font-weight: 400; " class="fa fa-angle-left"></i> <a class="iconRight left" style="font-size:14px; padding:8px;">Back</a> </span>

            <span class="phots-02 pageAftdNext" style="position: absolute; margin:0 0 0 130px; z-index: 100;  margin-left:700px; margin-top:410px; cursor: pointer;">
                    <a style="text-decoration: none; font-size:14px; padding:8px;" id="pageAffectedAreaMaleBtnProceed" class="buttonNext  iconRight right mini affctbtn" href="javascript:;">
                        Next&nbsp;&nbsp;
                    </a>
                <i style="color:#FFFFFF; font-size: 14px;font-weight: 400; text-decoration: none; " class="fa fa-angle-right"></i> 
            </span>

            </div>
        </div>

         <div id="pageAnnouncements" class="panel" data-header="custom_header" style="margin: 0px auto 0px 5px;
            overflow: auto;
            display: none;
            padding: 20px;
            box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 10px 0px;
            /* position: absolute;
            top: 0px; */
            width: 1000px;
            margin-bottom: 118px;
            background: rgb(255, 255, 255);
            /* left: -99px;*/"> 
            <p style="padding: 15px">
            <table width="100%" align="center">
               <tr>
                  <td>
                     <div style="width:100px;">
                        <ul class="ped">
                           <li>
                              <div style="width:20px; float:left; height:20px; background:#008F00;"> </div>
                              <span style="float:left;margin-left: 10px;"> Read </span>
                           </li>
                        </ul>
                     </div>
                  </td>
                  <td align="center">
                     <div style="width:400px;">
                        <ul class="ped">
                           <li>
                              <span class="click_note" style="margin-left:30px;">Click on an announcement to view details. </span>
                           </li>
                        </ul>
                     </div>
                  </td>
                  <td>
                     <div style=" float: right;width: 118px;">
                        <ul class="ped">
                           <li>
                              <div style="width:20px; float:left; height:20px; background:#DB0000;"> </div>
                              <span style="float:left;margin-left: 10px;"> Unread </span>
                           </li>
                        </ul>
                     </div>
                  </td>
               </tr>
            </table>
            <div id="announcements_list">
            </div>
            </p>
            <span class="phots-01 backButton" style="margin: 0px;position: absolute;z-index: 999999; cursor: pointer"> <i style="color:#FFFFFF; font-size: 20px;font-weight: 400; " class="fa fa-angle-left"></i> <a class="iconRight left">Back</a> </span>
            <br clear="all"><br clear="all"><br clear="all">
         </div>
         <div id="pageAnnouncementsdetails" class="panel" data-header="custom_header" style="padding:10px;display:none;margin:0 auto;width:625px;overflow:auto;">
            <p style="padding: 15px">
            <div id="announcementsdesc" style="min-height:300px;">
            </div>
            </p>
            <span class="phots-01 backButton" style="margin: 0px;position: relative;z-index: 999999; cursor: pointer"><i style="color:#4482FF; font-size: 20px;font-weight: 400; " class="fa fa-angle-left"></i> <a class="iconRight left">Back</a> </span>
            <span class="phots ps2" style="position: absolute; margin:0 0 0 130px; z-index: 100;" onclick="Delete_ann(announcetodelete)"><a id="Deleteannouncement" class="buttonNext  iconRight right mini affctbtn" href="javascript:;">Delete&nbsp;&nbsp;</a> </span>
            <br clear="all"><br clear="all"><br clear="all">
         </div>
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
               <input type="email" id="txtNewEmail" value="" placeholder="Email" class="jq-ui-forms" />
               <input type="text" id="txtNewUsername" value="" placeholder="Username" class="jq-ui-forms" />
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
                  ">Create New Account</a> <br clear="all" />
               <!--  <br clear="all"  /> -->
               <a href="javascript:;" onClick="cancelAccount()" class="buttonDelete lfbtys3">Cancel</a><br clear="all" />
               <br clear="all" />
            </div>
         </div>
         
         <div data-header="custom_header" class="panel" id="tipsforgood" style="display:none;  box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);height: 464px;
            background: #FFFFFF; margin-top:-15px;">
            <p style="padding: 15px">
            <h2 style="font-size:16px;">Tips</h2>
            <br>
            <div style="text-align:left; width:527px; margin:0 auto;">
               1. Please only use focused photos that are not blurry.<br>
               <br>
               2. For perspective, take 1 photo from afar, and another closer-up.<br>
               <br>
               3. Set camera resolution and picture quality settings to "High." <br>
               <br>
               4. Take photo in bright lighting. Natural light is best. <br>
               <br>
               5. Please don't use the flash because of skin reflection.
            </div>
            </p>
            <span class="phots-01 backButton" style="cursor:pointer;"> <a class="iconRight left">Back</a> </span>
            <a style="position: absolute; margin:80px 0 0 875px;z-index: 100;" id='btnLogin' class='buttonLightColor icon mini scrlog log_button '>Login</a>
         </div>
          <div id="pagePhoto" class="panel" data-footer='none' data-header="custom_header" style="min-height:300px; display:none; background-color:#fff; width:1000px;margin-bottom:80px; padding-bottom:80px;">
            <!-- width:352px;min-height:400px; float:left; margin:50px 0px 80px 310px;display:none -->
            <div id="imageDiv" style="padding-left: 70px;"> </div>
            <br>
            <span id="imageRename" style="display:none;font-size:15px">
               <center>
                  <b>Tap photo to change name.</b></b>
               </center>
            </span>
            <div id="response"></div>
            <div id="main" class="imageuploaddiv" style="visibility:hidden;">
               <form method="post" enctype="multipart/form-data">
                  <h3 style="font-family:'roboto',senserif">Please select photo to upload.</h3>
                  <div id="fUploadDiv">
                    <label for="file-upload" class="custom-file-upload">
                            <i class="fa fa-cloud-upload"></i> Select Files
                    </label>
                  </div>
                  <input id="file-upload" type="file" name="images" class="imagesfromgallery" style="display:none;" />
                  <br />
                  <?php 
                    $value = session('loggedIn');
                    if($value=="true")
                    {
                    ?>
                        <input type="hidden" id="loggedInTemp" name="loggedInTemp" value="true" />
                    <?php } else { ?>
                        <input type="hidden" id="loggedInTemp" name="loggedInTemp" value="false" />
                    <?php } ?>
                    <?php 
                        //$valueIndirectLoginSuccess = session('indirectLoginSucess');
                        //if($valueIndirectLoginSuccess==true)
                        //{
                    ?>
                    @guest
                        <input type="hidden" name="indirectLoginSucess" id="indirectLoginSucess" value="" />    
                    <?php //} else { ?>
                    @else
                        <input type="hidden" name="indirectLoginSucess" id="indirectLoginSucess" value="<?php echo isset($valueIndirectLoginSuccess)?$valueIndirectLoginSuccess:''; ?>" />
                    @endguest
                        <?php //} ?>
                    <input type="hidden" name="loginRedirect" value="" id="loginRedirect"/>
               </form>
               <!-- <div id="response"></div> -->
               <ul id="image-list" style="display:none; min-height:247px; width:500px;margin-left:190px;">
               </ul>
            </div>
            <script>
               jQuery("#image-list .delete").die('click').live("click", function(e) {
               
                   var noi = jQuery(this).attr("title");
               
                   var didConfirm = confirm("Delete this image?");
                   if (didConfirm == true) {
                       jQuery(this).parent().remove();
                       jQuery("img#" + noi).remove();
                       var rmvimg = tempPhotoList.split('|');
                       rmvimg.splice(noi - 1, 1);
                       tempPhotoList = rmvimg.join('|');
                       tempPhotoList = rmving
                   }
                   if (jQuery("#image-list li").length == 0) {
                       jQuery("#image-list").hide();
                   }
               });
               
               
               jQuery("#image-list .ren").die('click').live("click", function(e) {
                   jQuery(this).addClass('rename');
                   var nn = jQuery(this).attr('title');
                   jQuery('#rename' + nn).toggle();
                   jQuery(this).val("OK");
               });
               
               jQuery("#image-list .rename").die('click').live("click", function(e) {
               
                   jQuery(this).val("Rename");
                   var noi = jQuery(this).attr("title");
               
               
                   var new_name = jQuery(this).val();
               
                   var new_name = jQuery("#rename" + noi).val();
                   var didConfirm = confirm("Rename this image?");
                   if (didConfirm == true) {
               
               
                       var rmvimg = tempPhotoList.split('|');
                       var imgname = rmvimg[noi - 1].split('~');
                       imgname[1] = new_name;
               
                       imgname = imgname.join('~');
                       rmvimg[noi - 1] = imgname;
                       tempPhotoList = rmvimg.join('|');
                       jQuery('.label' + noi).text(new_name);
                   }
                   jQuery('#rename' + nn).toggle();
               
               });
               
               temp = [];
               var ArrSelectedGuid = [];
               var arr = [];
               var countarr = [];
               var pictureSource;
               var destinationType;
               var temp;
               
               var input = document.getElementById("images"),
                   formdata = false;
               cntr = 1;
               var imgno = 1;
               
               function showUploadedItem(source) {
               
                   if (source != temp) {
                       var list = document.getElementById("image-list"),
                           li = document.createElement("li"),
                           img = document.createElement("img");
                       img.id = imgno;
                       img.src = source;
                       var rename_img = document.createElement("input");
               
               
                       var rid = "rename" + imgno;
                       rename_img.setAttribute("type", "text");
                       rename_img.setAttribute("value", "Image");
                       rename_img.setAttribute("name", "changename");
                       rename_img.setAttribute("title", imgno);
                       rename_img.setAttribute("class", "newname");
                       rename_img.setAttribute("id", rid);
               
                       var element = document.createElement("input");
               
               
                       element.setAttribute("type", "button");
                       element.setAttribute("value", "Rename");
                       element.setAttribute("name", "Rename");
                       element.setAttribute("title", imgno);
                       element.setAttribute("class", "ren");
                       var element1 = document.createElement("input");
               
               
                       element1.setAttribute("type", "button");
                       element1.setAttribute("value", "Delete");
                       element1.setAttribute("name", "Delete");
                       element1.setAttribute("title", imgno);
                       element1.setAttribute("class", "delete");
                       var br = document.createElement("br");
               
                       var label = document.createElement("Label");
               
                       label.for = img;
                       label.setAttribute("class", "label" + imgno);
                       label.innerHTML = "Image";
                       li.appendChild(label);
                       li.appendChild(img);
                       li.appendChild(rename_img);
                       li.appendChild(br);
                       /* li.appendChild(element); */
                       li.appendChild(element1);
                       list.appendChild(li);
               
                       imgno++;
                   }
                   temp = source;
               
               }
               
               function GUID() {
                   var S4 = function() {
                       return Math.floor(
                           Math.random() * 0x10000 /* 65536 */
                       ).toString(16);
                   };
               
                   return (
                       S4() + S4() + "-" +
                       S4() + "-" +
                       S4() + "-" +
                       S4() + "-" +
                       S4() + S4() + S4()
                   );
               }
               
               if (window.FormData) {
                   formdata.length = 0;
                   formdata = new FormData();
               
               
               }
               
               var docneform;
               var k = 0;
               jQuery(document).ready(function() {
               
                   jQuery("#addimage-list .add_Delete").die('click').live("click", function(e) {
               
                       jQuery(".addimagesfromgallery").val('');
                       var noi = jQuery(this).attr("title");
               
                       var didConfirm = confirm("Delete this image?");
                       if (didConfirm == true) {
               
                           jQuery("#addimage-list").empty();
                           jQuery("#addimage-list").toggle();
                       }
               
                   });
               
                   jQuery("#addimage-list .add_ren").die('click').live("click", function(e) {
                       jQuery(this).addClass('rename');
                       var nn = jQuery(this).attr('title');
                       jQuery('#rename' + nn).toggle();
                       jQuery(this).val("OK");
                   });
               
                   jQuery("#addimage-list .rename").die('click').live("click", function(e) {
               
                       jQuery(this).val("Rename");
                       var noi = jQuery(this).attr("title");
               
               
               
                       var new_name = jQuery(this).val();
               
                       var new_name = jQuery("#rename" + noi).val();
                       var didConfirm = confirm("Rename this image?");
                       if (didConfirm == true) {
                           jQuery('#addimage-list .label' + noi).text(new_name);
                       }
                       jQuery('#rename' + nn).toggle();
               
                   });
               
                   jQuery(".imagesfromgallery").change(function(evt) {
                        var ext = this.value.match(/\.(.+)$/)[1];
                        ext = ext.toLowerCase();
                        var allowExt = ['png', 'jpeg','jpg'];
                        if(!allowExt.includes(ext)){
                            alert("Only 'png', 'jpeg','jpg' format are allowed.");
                            $(this).val(null);
                            return false;
                        }
                    
                        formdata.length = 0;
                        formdata = new FormData();
                       evt.stopImmediatePropagation();
                       jQuery("#image-list").show();
                       jQuery("#response").show();
                       document.getElementById("response").innerHTML = "Uploading . . ."
                      
                       var i = 0,
                           n = 1,
                           len = this.files.length,
                           img, reader, file;
               
               
               
                       for (; i < len; i++) {
                           file = this.files[i];
               
                           if (!!file.type.match(/image.*/)) {
                               if (window.FileReader) {
                                   reader = new FileReader();
                                   reader.onloadend = function(e) {
                                       showUploadedItem(e.target.result, file.fileName);
               
                                   };
                                   reader.readAsDataURL(file);
                               }
                               if (formdata) {
                                   formdata.length = 0;
                                   formdata.append("file", file);
               
                               }
                           }
               
                       }
               
                       function reverse_substring(str, from, to) {
                           var temp = "";
                           var i = 0;
                           var pos = 0;
                           var append;
                           for (i = str.length - 1; i >= 0; i--) {
               
                               if (pos == from) {
                                   append = true;
                               }
               
                               if (pos == 'https') {
                                   append = false;
                                   break;
                               }
                               if (append) {
                                   temp = str[i] + temp;
                               }
                               pos++;
                           }
               
                       }
               
                       if (formdata) {
                            jQuery.ajaxSetup({
                                headers: {
                                'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
                                }
                            });
                           jQuery.ajax({
               
                               url: API_SERVER + "uploadimage",
                               type: "POST",
                               data: formdata,
                               cache: false,
                               processData: false,
                               contentType: false,
                               datatype: "json",
                               success: function(res) {
                                   jQuery("#response").show();
                                   document.getElementById("response").innerHTML = 'Image Uploaded Successfully!';
                                   jQuery("#response").delay(5000).fadeOut("slow");
               
               
                                   jQuery(".imagesfromgallery").val("");
               
                                   var filename = res.substring(res.lastIndexOf(':') + 1);
               
                                   var guid = GUID();
                                   var obj = new Object();
                                   obj.imgSrc = file;
                                   obj.imgName = res;
                                   obj.ImageGuid = guid;
                                   selectedImageArr.push(obj);
                                   ArrSelectedGuid.push(guid);
               
                                   tempPhotoList += filename + "~" + 'Image' + '|';
                                   strPhotoList += filename + ',';
                                   window.localStorage.setItem("strPhotoList", strPhotoList);
               
               
                               }
                           });
               
               
                       }
                   });
               });
            </script>
            <script>
               var ckt = 1;
               var add_img_counter;
               jQuery("#imagetoupload").click(function() {
               
                   jQuery(".imageuploaddiv").css("visibility", "visible");
                   jQuery("#imagetoupload").hide();
               });
               
               
               jQuery("#additionalphotos").click(function() {
                   jQuery("#addimage-list").empty();
                   jQuery(".addimagesfromgallery").val("");
                   jQuery("#addimage-list").hide();
                   jQuery("#add_photo").toggle();
               });
               
               function showaddedItem(source) {
                   add_img_counter = 1;
               
               
                   if (source != temp) {
                       var list = document.getElementById("addimage-list"),
                           li = document.createElement("li"),
                           img = document.createElement("img");
                       img.id = imgno;
                       img.src = source;
               
               
                       imgno++;
               
               
               
                       var addrename_img = document.createElement("input");
               
               
                       var rid = "rename" + imgno;
                       addrename_img.setAttribute("type", "text");
                       addrename_img.setAttribute("value", "Image");
                       addrename_img.setAttribute("name", "changename");
                       addrename_img.setAttribute("title", imgno);
                       addrename_img.setAttribute("class", "newname");
                       addrename_img.setAttribute("id", rid);
                        
               
                       var element = document.createElement("input");
               
                       element.setAttribute("type", "button");
                       element.setAttribute("value", "Rename");
                       element.setAttribute("name", "Rename");
                       element.setAttribute("title", imgno);
                       element.setAttribute("class", "add_ren");
                       var element1 = document.createElement("input");
               
                       element1.setAttribute("type", "button");
                       element1.setAttribute("value", "Delete");
                       element1.setAttribute("name", "add_Delete");
                       element1.setAttribute("title", imgno);
                       element1.setAttribute("class", "add_Delete");
                       var addnewup = document.createElement("input");
               
                       addnewup.setAttribute("type", "button");
                       addnewup.setAttribute("value", "Upload");
                       addnewup.setAttribute("name", "add_new_up");
               
                       addnewup.setAttribute("class", "add_new_up");
                       var br = document.createElement("br");
                       var label = document.createElement("Label");
               
                       label.for = img;
                       label.setAttribute("class", "label" + imgno);
                       label.setAttribute("id", "ren_add_img");
                       label.innerHTML = "Image";
                       li.appendChild(label);
                       li.appendChild(img);
                       list.appendChild(li);
                       list.appendChild(br);
                       list.appendChild(addrename_img);
                       list.appendChild(element1);
                       //list.appendChild(element);
               
                       list.appendChild(addnewup);
               
               
                   }
                   temp = source;
                   $(".addimagesfromgallery").attr("width",0);
                   $(".addimagesfromgallery").attr("height",0);
               }
               jQuery(".addimagesfromgallery").change(function(evt) {
                    var filename = jQuery(this).val();
                    
                    var maxWidth = 100; // Max width for the image
                    var maxHeight = 100;    // Max height for the image
                    var width = $(this).width();    // Current image width
                    var height = $(this).height();  // Current image height
                    // Check if the current width is larger than the max
                    if(width > maxWidth){
                        ratio = maxWidth / width;   // get ratio for scaling image
                        $(this).css("width", maxWidth); // Set new width
                        $(this).css("height", height * ratio);  // Scale height based on ratio
                        height = height * ratio;    // Reset height to match scaled image
                        width = width * ratio;    // Reset width to match scaled image
                    }

                    // Check if current height is larger than max
                    if(height > maxHeight){
                        ratio = maxHeight / height; // get ratio for scaling image
                        $(this).css("height", maxHeight);   // Set new height
                        $(this).css("width", width * ratio);    // Scale width based on ratio
                        width = width * ratio;    // Reset width to match scaled image
                        height = height * ratio;    // Reset height to match scaled image
                    }




                    var extension = filename.replace(/^.*\./, '');
                    extension = extension.toLowerCase();
                    if(extension == 'png' || extension == 'jpeg' || extension == 'jpg'){
                        evt.stopImmediatePropagation();
                        jQuery("#addimage-list").empty();
                        jQuery("#addimage-list").show();
                        jQuery("#addresponse").show();
                        document.getElementById("addresponse").innerHTML = ""
                        var i = 0,
                            n = 1,
                            len = this.files.length,
                            img, reader, file;
                    
                    
                    
                        for (; i < 1; i++) {
                            file = this.files[i];
                    
                            if (!!file.type.match(/image.*/)) {
                                if (window.FileReader) {
                                    reader = new FileReader();
                                    reader.onloadend = function(e) {
                    
                                        
                                        

                                        //define the width to resize e.g 600px
                                        var maxWidth = 170; // Max width for the image
                                        var maxHeight = 170;    // Max height for the image
                                    
                                        var resize_width = 170;//without px
                                        var resize_height = 170;//without px

                                        //get the image selected
                                        var item = document.querySelector('.addimagesfromgallery').files[0];
                                        
                                        //create a FileReader
                                        var reader = new FileReader();

                                        //image turned to base64-encoded Data URI.
                                        reader.readAsDataURL(item);
                                        reader.name = item.name;//get the image's name
                                        reader.size = item.size; //get the image's size
                                        reader.onload = function(event) {
                                            var img = new Image();//create a image
                                            img.src = event.target.result;//result is base64-encoded Data URI
                                            img.name = event.target.name;//set name (optional)
                                            img.size = event.target.size;//set size (optional)
                                            img.onload = function(el) {
                                            var elem = document.createElement('canvas');//create a canvas

                                            //scale the image to 600 (width) and keep aspect ratio
                                            //var scaleFactor = resize_width / el.target.width;
                                            //elem.width = resize_width;
                                            //elem.height = el.target.height * scaleFactor;
                                            
                                            var width = el.target.width;    // Current image width
                                            var height = el.target.height;  // Current image height	
                                            
                                                var newWidth = 0;
                                                var newHeight = 0;	
                                                if(width > maxWidth){
                                                    //scale the image to 600 (width) and keep aspect ratio
                                                    var scaleFactor = resize_width / el.target.width;
                                                    elem.width = resize_width;
                                                    elem.height = el.target.height * scaleFactor;
                                                }
                                                if(height > maxHeight){
                                                    //scale the image to 600 (width) and keep aspect ratio
                                                    var scaleFactor = resize_height / el.target.width;
                                                    elem.width = resize_height;
                                                    elem.height = el.target.width * scaleFactor;
                                                }
                                            

                                                //draw in canvas
                                                var ctx = elem.getContext('2d');
                                                ctx.drawImage(el.target, 0, 0, elem.width, elem.height);

                                                //get the base64-encoded Data URI from the resize image
                                                var targetedResult = ctx.canvas.toDataURL(el.target, 'image/jpeg', 0);

                                                //assign it to thumb src
                                                //document.querySelector('#image').src = srcEncoded;

                                                /*Now you can send "srcEncoded" to the server and
                                                convert it to a png o jpg. Also can send
                                                "el.target.name" that is the file's name.*/
                                                showaddedItem(targetedResult, file.fileName);
                                            }
                                        
                                        }
                    
                                    };
                                    reader.readAsDataURL(file);
                                }
                                if (formdata) {
                                    formdata.length = 0;
                                    formdata.append("file", file);
                                    formdata;
                                }
                            }
                    
                        }
                    
                        function reverse_substring(str, from, to) {
                            var temp = "";
                            var i = 0;
                            var pos = 0;
                            var append;
                            for (i = str.length - 1; i >= 0; i--) {
                    
                                if (pos == from) {
                                    append = true;
                                }
                    
                                if (pos == 'https') {
                                    append = false;
                                    break;
                                }
                                if (append) {
                                    temp = str[i] + temp;
                                }
                                pos++;
                            }
                    
                        }
                    }else{
                        jQuery(this).val("");
                        alert('Only PNG, JPEG and JPG files are allowed.'); return false;
                    }
                    setTimeout(function(){
                        $(".addimagesfromgallery").attr('style','width: 500px');
                        $(".addimagesfromgallery").attr('style','height: 20px');
                    }, 500);
               });
               
               
               jQuery(".add_new_up").live("click", function() {               
                   jQuery('#page_loading1').show();
                   jQuery.ajaxSetup({
                        headers: {
                        'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
                        }
                    });

                    if (add_img_counter == 1) {
                       jQuery.ajax({
                           url: API_SERVER + "uploadimage",
                           type: "POST",
                           data: formdata,
                           cache: false,
                           processData: false,
                           contentType: false,
                           datatype: "json",
                           success: function(res) {
                               jQuery("#addresponse").show();
                               document.getElementById("addresponse").innerHTML = 'Image Uploaded Successfully!';
                               jQuery("#addresponse").delay(5000).fadeOut("slow");
                               jQuery("#addimage-list").delay(5000).fadeOut("slow");
               
                               jQuery(".addimagesfromgallery").val("");
               
                               var filename = res.substring(res.lastIndexOf(':') + 1);
                               var addimgname = jQuery("#ren_add_img").text();
                               filename += "~" + addimgname + '|';
               
                               var addnphotoHelper = {
                                   "guidCaseId": (window.localStorage.getItem("this_case_id")!=null&&window.localStorage.getItem("this_case_id")!="")?window.localStorage.getItem("this_case_id"):window.sessionStorage.getItem("this_case_id"),
                                   "strPhotoList": filename,
                                   "ownerId": (window.localStorage.getItem("add_physician_id")!=null&&window.localStorage.getItem("add_physician_id")!="")?window.localStorage.getItem("add_physician_id"):window.sessionStorage.getItem("add_physician_id")
                               };

                               jQuery.ajax({
                                   url: skinmdserviceURL + "updateCasePhotos",
                                   type: "POST",
                                   data: JSON.stringify(addnphotoHelper),
                                   contentType: "application/json; charset=utf-8",
                                   dataType: "json",
                                   success: function(result) {
                                       jQuery('#page_loading1').hide();
                                       getCaseDetails((window.localStorage.getItem("this_case_id")!=null&&window.localStorage.getItem("this_case_id")!="")?window.localStorage.getItem("this_case_id"):window.sessionStorage.getItem("this_case_id"));
                                   },
                                   error: function error(response) {
                                       jQuery('#page_loading1').hide();
                                       
                                       alert('Error :' + strGlobalErrorMessage);
                                   }
                               });
                           }
                       });
               
                       add_img_counter++;
                   }
               });
            </script>
            <a href="javascript:;" id="imagetoupload" class="button" style="
               cursor: pointer;
               background-color: #312769;
               color: #FFFFFF !important;
               /* float: left; */
               font-family: 'roboto',senserif;
               font-weight: normal !important;
               padding: 8px;
               text-align: center;
               text-decoration: none;
               font-size: 14px;
               width: 115px;
               -moz-border-radius: 7px;
               -webkit-border-radius: 7px;
               border-radius: 7px;
               /* position: absolute; */
               /* left: 43% !important; */
               width: 115px;
               display: inline-block;
               /* bottom: 28%;*/"> Upload Photos </a> <br clear="all"> 
            <br clear="all">
            <span class="tipsfor1 tipsdiv" ><a id="tipsdiv" class="buttonLightColor1 icon info mini" style="color:red; cursor:pointer; font-size:14px; text-align:left !important;">Tips for good clinical photos<hr style="width:185px; color:#a6cd91"></a></Span>
            <div id="selectedImagePopup" data-modal="true" style="display:none"> </div>
            <br clear="all">
            <br clear="all">
            <div class="affected_area_button" style=" float: left;width: 100%;">
            <span class="phots-01 backButton" style="margin-left:190px;float:left;"><i style="color:#FFFFFF; font-size: 14px;font-weight: 400; " class="fa fa-angle-left"></i> <a class="iconRight left" style="font-size:14px; padding:8px;">Back</a> </span>
            <!-- <span class="phots-02 btnProceedAddPhotos"><i style="color:#FFFFFF; font-size: 14px;font-weight: 400; " class="fa fa-angle-right"></i> <a class="iconRight right" style="font-size:14px; padding:8px;">Next</a> </span> -->

            <span class="phots-01 btnProceedAddPhotos" style="float:right; margin-right:190px;"><a style="text-decoration: none; font-size:14px; padding:8px;" id="pageAffectedAreaMaleBtnProceed" class="buttonNext  iconRight right mini affctbtn" href="javascript:;">Next&nbsp;&nbsp;</a><i style="color:#FFFFFF; font-size: 14px;font-weight: 400; text-decoration: none; " class="fa fa-angle-right"></i> </span>

          </div>
         </div>
         <script type="text/javascript">
            var strPhotoList = "";
            var strPhotoName = "";
            var tempPhotoList = [];
            var arrPhotoList = [];
            var arrFilePath = [];
            var temp = [];
            var selectedImageArr = [];
            var selectedImage = "";
            var selectedImageCounter = 0;
            selectedImageArr.length = 0;
            var arrUploadedGuid = [];
            var guid = GUID();
            jQuery('.btnProceedAddPhotos').click(function(e) {
            
                jQuery(".panel").hide();
                jQuery(".backButton").show();
                jQuery("#pageTellUsMore").show();
                jQuery("#pagePhoto").hide();
                curr_div.push("#pageTellUsMore");
                prev_div.push("#pagePhoto");
            
                if (selectedImageArr.length > 0) {
            
                    temp = [];
            
                    for (var i = 0; i < selectedImageArr.length; i++) {
            
                        if (selectedImageArr[i].imgName == "") {
            
                            selectedImageArr[i].imgName = "Photo _" + (i + 1).toString();
            
                            var str = selectedImageArr[i].imgSrc + "~" + selectedImageArr[i].imgName + "~" + selectedImageArr[i].ImageGuid;
                            temp.push(str);
                            tempPhotoList.push(selectedImageArr[i].imgName);
                        } else {
            
                            var str = selectedImageArr[i].imgSrc + "~" + selectedImageArr[i].imgName + "~" + selectedImageArr[i].ImageGuid;
            
                            temp.push(str);
            
                        }
            
                    }
            
                    strLSPhotoList = temp.join('|');
            
                    strPhotoList = tempPhotoList;
                    window.localStorage.setItem("strLSPhotoList", strLSPhotoList);
                    window.localStorage.setItem("strPhotoList", strPhotoList);

                    window.localStorage.setItem("indirectLoginSucess-strLSPhotoList", strLSPhotoList);
                    window.localStorage.setItem("indirectLoginSucess-strPhotoList", strPhotoList);

            
                } else {
                    window.localStorage.setItem("strLSPhotoList", "");
                    window.localStorage.setItem("indirectLoginSucess-strLSPhotoList", "");
                }
            
                if ((window.localStorage.getItem("strLSPhotoList")!=null&&window.localStorage.getItem("strLSPhotoList")!="")?window.localStorage.getItem("strLSPhotoList"):window.sessionStorage.getItem("strLSPhotoList") != null) {
            
                    var strLIST = (window.localStorage.getItem("strPhotoList")!=null&&window.localStorage.getItem("strPhotoList")!="")?window.localStorage.getItem("strPhotoList"):window.sessionStorage.getItem("strPhotoList");
            
                    arrPhotoList = strLIST.split("|");
            
                    for (var j = 0; j < arrPhotoList.length; j++) {
            
                        var arrPhoto = arrPhotoList[j].split("~");
                        var contains = containsObject(arrPhoto[2], arrUploadedGuid);
                        arrUploadedGuid.push(arrPhoto[2]);
                    }
            
            
                }
            
            });
            
            
            function containsObject(obj, list) {
                var i;
                for (i = 0; i < list.length; i++) {
                    if (list[i] === obj) {
                        return true;
                    }
                }
            
                return false;
            }
            var ArrSelectedGuid = [];
            var arr = [];
            var countarr = [];
            var pictureSource;
            var destinationType;
            
            var UpdatedTitle = "";
            
            document.addEventListener("deviceready", onDeviceReady, false);
            
            function onDeviceReady() {
            
                pictureSource = navigator.camera.PictureSourceType;
                destinationType = navigator.camera.DestinationType;
                var myArray = new Array();
            
            }
            
            function onPhotoLoadSuccess(imageData, ImageName) {
            
                var win = function(r) {
            
                    tempPhotoList.push(r.response + "~" + ImageName);
            
                    strPhotoList = tempPhotoList.join('|');
                    window.localStorage.setItem("strPhotoList", strPhotoList);
            
                }
            
                var fail = function(error) {
            
                  
                }
            
                var url = 'https://skinmdnow.nuvolatek.net:8080/UploadHttphandler/UploadHandler.ashx';
                var params = imageData;
            
                var options = [];
                options.fileKey = "file";
                options.fileName = imageData.substr(imageData.lastIndexOf('/') + 1);
            
                options.mimeType = "image/jpeg";
            
                var params = new Object();
                params.value1 = "test";
                params.value2 = "param";
            
                options.params = params;
            
                var ft = new FileTransfer();
                ft.upload(imageData, url, win, fail, options);
            
            }
            
            function captureSuccess(imagedata) {
                var i, len;
            
                var imageData = "data:image/jpeg;base64," + imagedata;
            
                var guid = GUID();
                var obj = new Object();
                obj.imgSrc = imageData;
                obj.imgName = "";
                obj.ImageGuid = guid;
            
                selectedImageArr.push(obj);
            
                if (selectedImageArr.length > 0) {
            
                    selectedImage += "<table border='0' id='" + imageData + "'><tr><td><image guid='" + guid + "' width='100px' id='Photo _" + (selectedImageArr.length) + "'  data='" + jQuery(this).attr('id') + "' class='PhotoOnClick' height='100px' src='" + imageData + "' /> </td><td><p class='labelStyle' >Photo _" + (selectedImageArr.length) + "</p></td></tr></td></table>";
                    jQuery('#imageRename').show();
                } else {
                    selectedImage = "<table id='" + imageData + "'><tr><td><image guid='" + guid + "' width='100px'  height='100px' class='PhotoOnClick' src='" + imageData + "' /> </td><td><p class='labelStyle' >Photo _" + (selectedImageArr.length) + "</p></td></tr></td></table>";
            
                }
            
                jQuery('#imageDiv').html(selectedImage);
                ArrSelectedGuid.push(guid);
            
            
            }
            
            
            function captureError(error) {
                var msg = 'An error occurred during capture: ' + error.code;
            
            }
            
            
            function captureImage() {
            
                navigator.camera.getPicture(captureSuccess, onFail, {
                    limit: 2,
                    quality: 20,
                    destinationType: destinationType.DATA_URL
                });
            }
            
            
            
            function getSavedPhoto() {
                navigator.camera.getPicture(onSuccess, onFail, {
                    quality: 49,
                    destinationType: Camera.DestinationType.FILE_URI,
                    sourceType: Camera.PictureSourceType.PHOTOLIBRARY,
                    encodingType: Camera.EncodingType.JPEG
            
            
            
                });
            
            }
            
            function GUID() {
                var S4 = function() {
                    return Math.floor(
                        Math.random() * 0x10000 /* 65536 */
                    ).toString(16);
                };
            
                return (
                    S4() + S4() + "-" +
                    S4() + "-" +
                    S4() + "-" +
                    S4() + "-" +
                    S4() + S4() + S4()
                );
            }
            
            function onSuccess(imageData) {
                var guid = GUID();
                var obj = new Object();
                obj.imgSrc = imageData;
                obj.imgName = "";
                obj.ImageGuid = guid;
            
                selectedImageArr.push(obj);
            
                if (selectedImageArr.length > 0) {
            
                    selectedImage += "<table border='0' id='" + imageData + "'><tr><td><image guid='" + guid + "' width='100px' id='Photo _" + (selectedImageArr.length) + "'  data='" + jQuery(this).attr('id') + "' class='PhotoOnClick' height='100px' src='" + imageData + "' /> </td><td><p class='labelStyle' >Photo _" + (selectedImageArr.length) + "</p></td></tr></td></table>";
                    $('#imageRename').show();
                } else {
                    selectedImage = "<table id='" + imageData + "'><tr><td><image guid='" + guid + "' width='100px'  height='100px' class='PhotoOnClick' src='" + imageData + "' /> </td><td><p class='labelStyle' >Photo _" + (selectedImageArr.length) + "</p></td></tr></td></table>";
            
                }
            
                jQuery('#imageDiv').html(selectedImage);
                ArrSelectedGuid.push(guid);
            }
            
            
            
            function onFail(message) {
                
            
            }
            
            function uploadFile(mediaFile) {
                var ft = new FileTransfer(),
                    path = mediaFile.fullPath,
                    name = mediaFile.name;
            
                ft.upload(path,
                    "https://skinmdnow.nuvolatek.net:8080/UploadHttphandler/UploadHandler.ashx",
                    function(result) {
                        // alert('Upload success: ' + result.responseCode);
                        //alert(result.bytesSent + ' bytes sent');
                    },
                    function(error) {
                        // alert('Error uploading file ' + path + ': ' + error.code);
                    }, {
                        fileName: name
                    });
            }
            
            
            
            jQuery('.PhotoOnClick').live('click', function() {
            
                var tempGuid = jQuery(this).attr('guid');
                var tempSrc = jQuery(this).attr('src');
                var tempID = jQuery(this).attr('id');
                var PopTable = "<br><center><table border='0' height='350px' width='280px' style='padding:5px;margin-top:20px;'>";
                PopTable += "<tr><td colspan='2' style='padding:5px;'><image width='250px'  height='250px'  src='" + tempSrc + "' /></td></tr>";
                PopTable += "<tr><td colspan='2' style='text-align:center'><input style='width:95%' type='text' id='defaultName' onchange='UpdateImgName()' selectedImageId='" + tempSrc + "' class='jq-ui-forms' value='" + tempID + "'/> </td></tr>";
                PopTable += "<tr><td style='text-align:center'><a href='javascript:;' class='buttonNext'  onclick='OkButtonClick();' style='width:100%'>&nbsp;&nbsp;OK&nbsp;&nbsp;</a> </td><td style='padding-left:10px;text-align:center'><a href='javascript:;' selectedImageId='" + tempSrc + "' selectedImageGuid='" + tempGuid + "' onclick='btnDeleteClick();'  data='" + jQuery(this).attr('selectedImageId') + "' class='buttonDelete'  id='btnDelete' style='width:95%'>Delete</a> </td></tr>";
                PopTable += "</center></table>";
                jQuery('#selectedImagePopup').html(PopTable);
            
            });
            
            function UpdateImgName() {
                var tempValue = jQuery('#defaultName').attr('value');
                var tempID = jQuery('#defaultName').attr('selectedImageId');
            
                for (var i = 0; i < selectedImageArr.length; i++) {
            
                    if (selectedImageArr[i].imgSrc == tempID) {
                        selectedImageArr[i].imgName = tempValue;
                        selectedImage = "";
                    }
                }
            
                for (var j = 0; j < selectedImageArr.length; j++) {
                    if (selectedImageArr.length > 0) {
            
                        if (selectedImageArr[j].imgName == "") {
                            selectedImage += "<table border='0' id='" + selectedImageArr[j].imgSrc + "'><tr><td><image guid='" + selectedImageArr[j].ImageGuid + "'  width='100px' id='Photo _" + ((j + 1).toString()) + "'  data='" + jQuery(this).attr('id') + "' class='PhotoOnClick' height='100px' src='" + selectedImageArr[j].imgSrc + "' /> </td><td><p  class='labelStyle' >Photo _" + ((j + 1).toString()) + "</></td></tr></td></table>";
                        } else {
                            selectedImage += "<table border='0' id='" + selectedImageArr[j].imgSrc + "'><tr><td><image guid='" + selectedImageArr[j].ImageGuid + "'  width='100px' id='" + selectedImageArr[j].imgName + "'  data='" + jQuery(this).attr('id') + "' class='PhotoOnClick' height='100px' src='" + selectedImageArr[j].imgSrc + "' /> </td><td><p class='labelStyle' >" + selectedImageArr[j].imgName + "</p></td></tr></td></table>";
                        }
                    } else {
                        selectedImage = ""; //"<table id='"+imageData+"'><tr><td><image width='100px'  height='100px' class='PhotoOnClick' src='"+imageData+"' /> </td><td><input class='labelStyle' type='label' value='Photo _"+selectedImageArr.length+"'/></td></tr></td></table>";
            
                    }
                }
                jQuery('#imageDiv').html(selectedImage);
            
            }
            
            function OkButtonClick() {
            
                $.ui.hideModal('#selectedImagePopup');
            }
            
            function btnDeleteClick() {
                var tempDeleteElement = jQuery('#btnDelete').attr('selectedImageId');
                var DeleteSelectedImageGuid = jQuery('#btnDelete').attr('selectedImageGuid');
            
                for (var i = 0; i < selectedImageArr.length; i++) {
            
                    if (selectedImageArr[i].imgSrc == tempDeleteElement) {
            
                        selectedImageArr.splice(i, 1);
                        ArrSelectedGuid.splice(i, 1);
                        selectedImage = "";
            
                    }
                }
            
                if (selectedImageArr.length == 0) {
                    jQuery('#imageRename').hide();
                }
                for (var j = 0; j < selectedImageArr.length; j++) {
                    if (selectedImageArr.length > 0) {
            
                        if (selectedImageArr[j].imgName == "") {
                            selectedImage += "<table border='0' id='" + selectedImageArr[j].imgSrc + "'><tr><td><image guid='" + selectedImageArr[j].ImageGuid + "' width='100px' id='Photo _" + ((j + 1).toString()) + "'  data='" + jQuery(this).attr('id') + "' class='PhotoOnClick' height='100px' src='" + selectedImageArr[j].imgSrc + "' /> </td><td><p class='labelStyle' >Photo _" + ((j + 1).toString()) + "</p></td></tr></td></table>";
                            $('#imageRename').show();
                        } else {
                            $('#imageRename').show();
                            selectedImage += "<table border='0' id='" + selectedImageArr[j].imgSrc + "'><tr><td><image guid='" + selectedImageArr[j].ImageGuid + "' width='100px' id='" + selectedImageArr[j].imgName + "'  data='" + jQuery(this).attr('id') + "' class='PhotoOnClick' height='100px' src='" + selectedImageArr[j].imgSrc + "' /> </td><td><p  class='labelStyle' >" + selectedImageArr[j].imgName + "</p></td></tr></td></table>";
                        }
                    } else {
                        jQuery('#imageRename').hide();
                        selectedImage = "";
            
                    }
                }
                jQuery('#imageDiv').html(selectedImage);
            
            }
         </script>
         <div id="pageTellUsMore" class="panel" data-header="custom_header" style="padding:10px;display:none;  box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2); background-color: #FFFFFF;margin-bottom:140px; min-height:300px; padding-bottom:60px;">
            <br>
            <div style="width:352px;margin:30px 0 0 310px;">
                <div style="border:0px solid red; overflow:hidden;clear:both;position: relative;">
                    <label for="drpChiefComplaint" class="label_for" style="font-size: 14px;
                        line-height: 1.4;
                        font-weight: bold;
                        margin: 0 0 .3em;
                        display: block;
                        /* margin-right: 342px; */
                        margin-right: 0px;
                        text-align: center;
                        ">
                        * What do you need help with?
                        <div id="selectedval"></div>
                    </label>
                    <div style="width:352px;" id="helpwithdiv" ;align="left">
                        <select guid="423322FD-92C6-E111-9641-000C298F6AE9" id="drpChiefComplaint" onChange="saveChiefComplaint()" class="jq-ui-forms requiredbtn" style="z-index:9999; color:#000 !important">
                            <option class='ccmp'></option>
                            @foreach ($chief_complaints as $complaint)                            
                                <option class='ccmp' value='{{ $complaint->id }}'>{{ $complaint->name }}</option>
                            @endforeach
                                                    
                        </select>
                        <i class="fa fa-arrow-down" aria-hidden="true" style="position: absolute;
                            top: 34px;
                            right: 10px;
                            color: #FFFFFF;
                            font-size: 15px;"></i>
                    </div>
                    <br clear="all">
                </div>
                <br clear="all">
                <div style="position:relative;">
                    <label for="drpHowLong1" class="label_for" style="font-size: 14px;line-height: 1.4;font-weight: bold;margin: 0 0 .3em; display: block; margin-right: 0px; text-align: left;"> How long have you had this issue? </label>
                    <select id="drpHowLong1" guid="how_long_1" class="jq-ui-forms1" style="width:120px; tex-align:center; " data-native-menu="false">
                        
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                    <i class="fa fa-arrow-down" aria-hidden="true" style="position: absolute; top: 35px; right: 10px; color: #FFFFFF; font-size: 15px;"></i> 
                    <br clear="all">
                    <div style="width:352px; float:left;" data-native-menu="false">
                        <select id="drpHowLong2" guid="how_long_2" class="jq-ui-forms" style="" data-native-menu="false">
                            <option value="">Days, Weeks, Months or Years</option>
                            <option value="1">Days</option>
                            <option value="2">Weeks</option>
                            <option value="3">Months</option>
                            <option value="4">Years</option>
                        </select>
                        <i class="fa fa-arrow-down" aria-hidden="true" style="position: absolute;
                            top: 89px;
                            right: 10px;
                            color: #FFFFFF;
                            font-size: 15px;"></i>
                        <br clear="all">
                    </div>
                    <br clear="all">
                    <label for="drpDescribeProblem1" style="width:352px;font-size: 14px;line-height: 1.4;font-weight: bold;margin: 0 0 .3em; display: block; margin-right: 0px;text-align: center;" class="label_for">Please describe your problem.(Select one or more) </label>
                    <div style="width:352px; float:left;">
                        <select id="drpDescribeProblem1" guid="describe_1" multiple="multiple" data-native-menu="false">
                            <option value=""></option>
                            <option value="1">Very Itchy</option>
                            <option value="2">Mildly Itchy</option>
                            <option value="3">Not Itchy</option>
                            <option value="4">Bleeding</option>
                            <option value="5">Painful</option>
                            <option value="6">Red</option>
                            <option value="7">Burning</option>
                            <option value="8">No symptoms</option>
                        </select>
                        <i class="fa fa-arrow-down" aria-hidden="true" style="position: absolute;
                            top: 165px;
                            right: 10px;
                            color: #FFFFFFFF;
                            font-size: 15px;"></i>
                    </div>
                    <br clear="all">
                    <br clear="all">
                    <div style="width:352px; ">
                        <select id="drpDescribeProblem2" guid="describe_2" data-native-menu="false">
                            <option value=""></option>
                            <option value="1">Worsening</option>
                            <option value="2">Stable</option>
                            <option value="3">Improving</option>
                            <option value="4">Recurring</option>
                        </select>
                        <i class="fa fa-arrow-down" aria-hidden="true" style="    position: absolute;
                            top: 216px;
                            right: 10px;
                            color: #FFFFFFFF;
                            font-size: 15px;"></i>
                    </div>
                    <br clear="all">
                    <label for="drpBiopsied" style="width:352px;font-size: 14px;
                        line-height: 1.4;
                        font-weight: bold;
                        margin: 0 0 .3em;
                        display: block;
                        /* margin-right: 342px; */
                        margin-right: 0px;
                        text-align: center;" class="label_for">Has this condition been biopsied or excised before?</label>
                    <select id="drpBiopsied" guid="biopsied_or_excised" data-native-menu="false">
                        <option value=""></option>
                        <option value="1">Yes</option>
                        <option value="0">No</option>
                    </select>
                    <i class="fa fa-arrow-down" aria-hidden="true" style="    position: absolute;
                        top: 290px;
                        right: 10px;
                        color: #FFFFFFFF;
                        font-size: 15px;"></i>
                    <br clear="all">
                </div>
                <div style="width:350px; float:left;">
                    <span class="phots-01 backButton" style="cursor: pointer;margin-left:-120px;float:left;"><i style="color:#FFFFFF; font-size: 14px;font-weight: 400;padding-right: 5px;" class="fa fa-angle-left"></i><a class="iconRight left">Back</a></span>
                    <span class="phots-01 pageTellUsMoreBtnProceed" style=" float:right; margin-right:-110px;text-decoration: none; cursor: pointer;"> <a id="pageTellUsMoreBtnProceed" class="buttonNext iconRight right mini " href="javascript:;">Next</a><i style="color:#FFFFFF; font-size: 14px; font-weight: 400;padding-left: 5px; " class="fa fa-angle-right" sty></i> </span>
                </div>
            </div>
        </div>
        <div id="pageDoctorSelectionSearch" class="panel" data-header="custom_header" style="padding:10px;display:none;  box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2); background-color: #FFFFFF; margin-bottom:130px;" data-load="pageDoctorSelectionSearchOnLoad">
            <div style="width:352px; float:left; margin:30px 0 0 310px;">
                <span id="divFavorites" style="display:none; "> <br>
                    <label for="drpselectfavoritesDoctor" class="label_for" style="font-size: 14px;
                    line-height: 1.4;
                    font-weight: bold;
                    margin: 0 0 .3em;
                    display: block;
                    /* margin-right: 342px; */
                    text-align: center;">List of Your Preferred Providers</label><i class="fa fa-arrow-down" aria-hidden="true" style="position: absolute;
                    top: 90px;
                    right: 337px;
                    color: #FFFFFFFF; 
                    font-size: 15px;
                    z-index: 9;"></i>
                    <select id="drpselectfavoritesDoctor" class="jq-ui-forms">
                    </select>
                    <br clear="all" />
                    <a id="btnProceed2PatientInfoPage" class="buttonNext iconRight right mini" style="
                    background-color: #312769;
                    color: #FFFFFF;
                    float: left;
                    font-family: 'roboto',senserif;
                    font-weight: normal !important;
                    text-decoration: none !important;
                    font-size: 14px;
                    padding: 10px 20px;
                    top: 179px;
                    left: 175px;
                    width: 315px;
                    /* margin: 0px 7px; */
                    margin-top: 0px;
                    -webkit-border-radius: 5px;
                    -moz-border-radius: 5px;
                    -webkit-border-radius: 5px;
                    border-radius: 5px;" href="javascript:;">Select this Provider and Enter Patient Info</a><br>
                    <br>
                    <br clear="all">
                </span>
                <br clear="all">
                <div id="search_doc_form">
                    <span style="font-size:18px;margin:10px">
                        <center>
                            <h3 style="font-family: 'roboto',senseerif;font-size:16px;margin-top:-46px;">Search Providers</h3>
                        </center>
                    </span>
                    <div style="position:relative;">
                        <select id="drpDoctorSearchState" class="jq-ui-forms" data-native-menu="true">
                            <option value="XX">* Select State [Required]</option>
                            @foreach ($state as $itemSt)                            
                                <option value='{{ $itemSt->id }}'>{{ $itemSt->name }}</option>
                            @endforeach
                        </select>
                        <i class="fa fa-arrow-down" aria-hidden="true" style="    position: absolute;
                            top: 12px;
                            right: 10px;
                            color: #FFFFFF;
                            font-size: 15px;"></i>
                        <br clear="all" />
                        <select id="drpSearchDoctorSpecialty" class="jq-ui-forms" data-native-menu="true">
                            <option value="All">Select Skin Specialty</option>
                            <option value="All">All Subspecialties</option>
                            @foreach ($specilities as $spec)
                                <option value="{{ $spec->id }}">{{ $spec->name }}</option>
                            @endforeach
                        </select>
                        <i class="fa fa-arrow-down" aria-hidden="true" style="position: absolute;top: 66px; right: 10px; color: #FFFFFF; font-size: 15px;"></i>
                    </div>
                    <br clear="all">
                    <input type="text" id="txtSearchDoctorNameField" placeholder="Last Name of Provider or Practice Name" class="jq-ui-forms" />
                    <div style="width:350px; float:left;">
                        <span onClick="SearchPhysician()" style="cursor:pointer; float:right;border: black solid 1px;
                            padding: 8px; background-color: #312769;border-radius:5px;"><i style="color:#FFFFFF;float:left;margin-top: 4px;font-size:14px;" class="fa fa-search" aria-hidden="true"></i> <a style="margin-left:10px;text-decoration: none;color:#FFFFFF;font-size: 14px;" class="buttonNext icon magnifier1 mini" href="javascript:;" >Search</a> </span>
                        <span class="phots-01 backButton" style="cursor: pointer;float:left;margin-left:-120px;"><i style="color:#FFFFFF; font-size: 14px;font-weight: 400; " class="fa fa-angle-left"></i> <a class="iconRight left">Back</a></span>
                        <br clear="all">
                    </div>
                </div>
            </div>
            <div id="default_doc_list">
                <div id="fill_default_doc_list"></div>
                <span class="phots-01 backButton " style=" margin: 20px 0 20px 148px;cursor: pointer;"> <i style="color:#4482FF; font-size: 20px;font-weight: 400; " class="fa fa-angle-left"></i> <a class="iconRight left">Back</a></span>
            </div>
            <br clear="all"><br clear="all"><br clear="all"><br clear="all">
        </div>
        <div id="pageDoctorSearch" class="panel" data-header="custom_header" style="padding: 10px; box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 10px 0px; background-color: rgb(255, 255, 255); display: none; margin-bottom: 150px; padding-bottom:100px;">
            <div id="divDoctorSearchResults" style="margin-top: 86px;"></div>
            <br clear="all"> <span class="phots-11 backButton"> <i class="fa fa-angle-left" aria-hidden="true" style="    position: absolute;
            top: 9px;
            right: 59px;
            color: #FFFFFF;
            font-size: 19px;;"></i> <a class="iconRight left ui-link">Back</a></span>
      </div>
      <div id="pagePatientInfo" class="panel" data-header="custom_header" style="padding: 10px; box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 10px 0px; background-color: rgb(255, 255, 255); display: none; margin-bottom:130px;" data-load="pagePatientInfoOnLoad">
         <div style="width:355px; margin:50px auto 0 auto">
            <span id="divExistingPatients" style="">
               <label for="drpExistingPatients" class="label_for" style="font-size: 14px;
                  line-height: 1.4;
                  font-weight: bold;
                  margin: 0 0 .3em;
                  display: block;
                  /* margin-right: 342px; */
                  margin-right: 0px;
                  text-align: center;">* Who is the patient?</label>
               <div style="width:350px !important;">
                  <select id="drpExistingPatients" onChange="fillExistingPatientDetails()">
                  </select>
                  <i class="fa fa-arrow-down" aria-hidden="true" style=" 
                     position: absolute;
                     top: 94px;
                     right: 335px;
                     color: #FFFFFF;
                     font-size: 15px;"></i>
               </div>
               <br>
            </span>
            <input type="text" id="txtFirstName" value="" placeholder="* Patient's First Name" class="jq-ui-forms" />
            <input type="text" id="txtMiddleName" value="" placeholder="Patient's Middle Name" class="jq-ui-forms" />
            <input type="text" id="txtLastName" value="" placeholder="Patient's Last Name" class="jq-ui-forms" />
            <table width="420">
               <tr>
                  <td valign="top">
                     <select id="drpGender" placeholder="* gender" style="width:158px!important;">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                     </select>
                     <i class="fa fa-arrow-down" aria-hidden="true" style="   
                        position: absolute;
                        top: 302px;
                        right: 551px;
                        color: #FFFFFF;
                        font-size: 15px;"></i>
                  </td>
                  <td valign="top"><span style="padding:7px 0px 0px 10px; display:block; text-align:right !important;">* DOB: </span></td>
                  <td valign="top">
                     <div style="width:150px !important;">
                        <input style="width:120px!important; margin:0px;" id="txtDateOfBirth" onClick="GetDate(this);" type='text' readonly value="" class="jq-ui-forms" />
                     </div>
                  </td>
               </tr>
            </table>
            <hr color="purple">
            <span id="divWhoisEnteringRequest">
            <label for="drpWhoIsEnteringRequest" style="font-size: 14px;
               line-height: 1.4;
               font-weight: bold;
               margin: 0 0 .3em;
               display: block;
               /* margin-right: 342px; */
               margin-right: 0px !important;
               text-align: center;" class="">* What is your relationship to the above patient?</label>
            <br clear="all">
            <select id="drpWhoIsEnteringRequest" onChange="updateBillingInfoScreen()">
                <option value=''>Select</option>
                @foreach ($relation as $rl)                            
                    <option value='{{ $rl->id }}'>{{ $rl->relation_name }}</option>
                @endforeach
            </select><i class="fa fa-arrow-down" aria-hidden="true" style=" 
               position: absolute;
               top: 395px;
               right: 332px;
               color: #FFFFFF;
               font-size: 15px;"></i>
            <br clear="all">
            </span>
            <table table width="100%">
               <tr>
                  <td><input type="email" id="txtEmail" value="" placeholder="* Email where Provider's reply will be sent" class="jq-ui-forms" /></td>
               </tr>
               <tr>
                  <td><input type="tel" name="tel" id="txtPhone" value="" maxlength="10" placeholder="* Best Phone # (with area code)" class="jq-ui-forms" /></td>
               </tr>
            </table>
            <div style="width:350px; float:left;">
               <span class="phots-01 backButton" style="cursor: pointer;float:left;margin-left:-120px;"><i style="color:#FFFFFF; font-size: 14px;font-weight: 400; " class="fa fa-angle-left"></i> <a class="iconRight left">Back</a></span>
               <span class="phots-01 btnPatientProceed" style="float: right;text-decoration: none;cursor: pointer;margin-right:-120px;"> <a id="btnPatientProceed" class="buttonNext iconRight right mini" href="javascript:;">Next</a><i style="color:#FFFFFF; font-size: 14px;font-weight: 400; margin-left:10px;text-decoration: none!important;" class="fa fa-angle-right"></i> </span>
            </div>
         </div>
      </div>

      <div id="pageBillingInfo" class="panel" data-header="custom_header" style="padding: 10px; display: none;" data-load="pageBillingInfoOnLoad">
         <div>
            <dl id="dlBillingInfo" style="">
               <dt id="divReferralCodeDT" class="add_min" style="display:none;opacity:0.8!important;">
                  <div style="border: 0px solid red;height: 42px;margin: -16px;padding: 11px;position: absolute;width: 33%;">&nbsp;</div>
                  <p id="divReferralCode" class="icon add mini" style="z-index:-1!important;">Referral code</p>
               </dt>
               <dd class="showrd">
                  <div id="divReferralCodedddiv" class="dddiv"><br clear="all">
                     <br clear="all">
                     <input type="text" id="txtReferralCode" value="" placeholder="Referral code" class="jq-ui-forms" style="margin:0px !important" />
                     <br> <i class="divSubmitToDoctor" style="float:right;margin-bottom:5px;"></i>
                     <br clear="all">
                  </div>
                  <div style="width:350px; float:left;">
                     <span class="phots-01 backButton " style="cursor: pointer"> <a class="iconRight left">Back</a></span>
                     <span class="phots" style=" float:right"> <a id="btnBillingProceedReferral" class="buttonNext mini" href="javascript:;">Submit</a> </span>
                  </div>
               </dd>
               <!--   credit card  -->
               <!-- <dt id="divCreditCard" class="add_min" style="opacity:0.8!important;">
                  <div style="border: 0px solid red;height: 42px;margin: -16px;padding: 11px;position: absolute;width: 33%;">&nbsp;</div>
                  <p id="divcc" class="off icon add mini" style="z-index:-1!important; color:black;  position: absolute; left: 301px;  top: 68px;
                     z-index: 111111;">Credit Card</p>
               </dt> -->
               <!--   rizwan css -->
               <dd class="showccdv" style="
               /* padding: 23px; */
                  /* padding-left: 279px; */
                  display: block;
                  box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
                  /* position: absolute; */
                  /* top: 10px; */
                  width: 1000px;
                  min-height: 880px;
                  margin-top: -10px;
                  /* margin-left: 5px; */
                  background: #FFFFFF;
                  /* left: 10px;*/
                  /* margin-left:-333px; */
                   margin-top:-25px;
                   padding-bottom:70px; "> 
                  <div id="divCreditCarddddiv" class="dddiv" style="margin-left:320px;">
                     <div class="info-inner" style="position: absolute;">
                        <h3 class="text-center" style="margin-left: 132px; font-size:16px;">Credit card</h3>
                     </div>
                     <br />
                     <br />
                     <div style="border:0px solid red; overflow:hidden;clear:both; width:360px;">
                        <a style="color:#311D68;text-decoration:none"> <br clear="all">
                        <span id="divCreditCardHeading"></span></a> <br><br>
                        <div id="divcouponCodenew" style="display:none;margin-bottom:95px;"> <input type="text" id="txtcouponCode" value="" placeholder="Promo Code" class="jq-ui-forms" style="margin:0px !important" />
                           <a id="btnBillingProceedCoupon" class="buttonNext iconRight right mini" href="javascript:;" style="   background-color: #312769;
                              color: #FFFFFF;
                              float: left;
                              font-family: 'roboto',senserif;
                              font-weight: normal !important;
                              text-decoration: none !important;
                              font-size: 17px;
                              position: absolute;
                              padding: 10px 29px;
                              top: 143px;
                              left: 571px;
                              margin: 0px 7px;
                              -webkit-border-radius: 7px;">Apply</a> <br clear="all" />
                        </div>
                        <div style="width:348px;">
                           <select id="drpCardType">
                              <option value="0">Visa</option>
                              <option value="1">MasterCard</option>
                              <option value="2">American Express</option>
                              <option value="3">Discover</option>
                           </select>
                           <i class="fa fa-arrow-down" aria-hidden="true" style="    position: absolute;
                              top: 114px;
                              right: 331px;
                              color: #FFFFFFFF;
                              font-size: 15px;"></i>
                        </div>
                        <br clear="all" />
                     </div>
                     <input type="tel" id="txtCreditCardNumber" value="" maxlength="16" placeholder="* Credit card #" class="jq-ui-forms" />
                     <input type="tel" id="txtVerifyCode" value="" placeholder="Verification Code" class="jq-ui-forms" />
                     <label for="drpCardExpiryMonth" class="label_for" style="">* Exp Date:</label>
                     <table>
                        <tr>
                           <td width="100">
                              <select id="drpCardExpiryMonth">
                                 <option value="">Month</option>
                                 <option value="01">January</option>
                                 <option value="02">February</option>
                                 <option value="03">March</option>
                                 <option value="04">April</option>
                                 <option value="05">May</option>
                                 <option value="06">June</option>
                                 <option value="07">July</option>
                                 <option value="08">August</option>
                                 <option value="09">September</option>
                                 <option value="10">October</option>
                                 <option value="11">November</option>
                                 <option value="12" selected>December</option>
                              </select>
                              <i class="fa fa-arrow-down" aria-hidden="true" style="    position: absolute;
                                 top: 294px;
                                 right: 540px;
                                 color: #FFFFFF;
                                 font-size: 15px;"></i>
                           </td>
                           <td width="100" style="  float:right;padding-left:27px;width:165px;">
                              <select id="drpCardExpiryYear">
                                 <option value="">Year</option>
                                 <option value="2019" selected>2019</option>
                                 <option value="2020" >2020</option>
                                 <option value="2021">2021</option>
                                 <option value="2022">2022</option>
                                 <option value="2023">2023</option>
                                 <option value="2024">2024</option>
                                 <option value="2025">2025</option>
                                 <option value="2026">2026</option>
                                 <option value="2027">2027</option>
                                 <option value="2028">2028</option>
                                 <option value="2029">2029</option>
                                 <option value="2030">2030</option>
                              </select>
                              <i class="fa fa-arrow-down" aria-hidden="true" style="    position: absolute;
                                 top: 294px;
                                 right: 345px;
                                 color: #FFFFFFFF;
                                 font-size: 15px;"></i>
                           </td>
                        </tr>
                     </table>
                     <br>
                     <h3 style="text-align: left;margin-left: 112px; font-size:16px; margin-top:0px;">Billing Info</h3>
                     <input type="text" id="txtBillingFirstName" value="" placeholder="* First Name" class="jq-ui-forms" />
                     <input type="text" id="txtBillingLastName" value="" placeholder="* Last Name" class="jq-ui-forms" />
                     <input type="text" id="txtBillingStreetAddress" value="" placeholder="* Street Address" class="jq-ui-forms" />
                     <div style="border:0px solid red; overflow:hidden;clear:both; width:360px;">
                        <input type="text" id="txtBillingCity" value="" placeholder="* City" class="jq-ui-forms" />
                        <div style="width:348px;">
                           <select id="drpBillingState" onChange="comparewithdoctorstate()" data-native-menu="true">
                              <option value="XX">* State</option>
                                @foreach ($state as $itemSt)                            
                                    <option value='{{ $itemSt->id }}' attr-code='{{ $itemSt->code }}'>{{ $itemSt->name }}</option>
                                @endforeach
                           </select>
                           <i class="fa fa-arrow-down" aria-hidden="true" style="position: absolute;
                              bottom: 467px;
                              right: 331px;
                              color: #FFFFFFFF;
                              font-size: 15px;"></i>
                        </div>
                     </div>
                     <br clear="all" />
                     <input type="tel" id="txtBillingZipcode" value="" placeholder="* Zip Code" class="" />
                     <div id="divStateAgree" style="display:none;min-height:100px!important;">
                            <input type="checkbox" id="chkStateAgree" class="jq-ui-forms" />
                            <label style="background:none !important; vertical-align:top; border:0;word-wrap:break-word;  padding: 0px 300px;
                        margin-left: -340px; margin-top:30px; font-size:15px; text-align:justify; font-weight:bold; cursor:pointer" for="chkStateAgree">Please confirm Location. I confirm that the Patient is either a resident of, or currently present in, the Selected Provider's State, or the Patient is outside the United States.</label>                        
                     </div>
                   
                     <input type="checkbox" id="chkIAgree" class="jq-ui-forms" />
                     <label style="background:none !important; vertical-align:top; border:0;word-wrap:break-word;  padding: 0px 300px;
                        margin-left: -340px;" for="chkIAgree">I have read, and agree with the Terms of Service and I provide my consent.</label>
                    
                    
                        <!-- <a id="terms_link" style="float: left;margin-left: 88px;margin-top: -44px;position: relative; color:#83C341;margin-top: 0px;" class="ui-link" href="/term" target="blank">Read Terms of Service</a> -->
                        <a id="terms_link" style="float: left;margin-left: 88px;margin-top: -44px;position: relative; color:#83C341;margin-top: 0px;" class="ui-link" href="https://www.skinmdnow.com/terms.html" target="blank">Read Terms of Service</a>
                     
                     <!--    <i class="divSubmitToDoctor" style="float:right;margin-bottom:5px;font-size: 22px;"> Submit request to George Verghese,MD</i> -->
                     <div style="width:350px; float:left;">
                        <span class="phots-01 backButton " style="cursor: pointer;float:left;margin-top:50px;margin-left:-350px;"> <i style="color:#FFFFFF; font-size: 14px;font-weight: 400; " class="fa fa-angle-left"></i> <a class="iconRight left">Back</a></span>
                        <span class="phots" style=" float:right"> <a id="btnBillingProceed" class="buttonNext mini" style="    background-color: #312769;
                           color: #FFFFFF;
                           /* float: left; */
                           font-family: 'roboto',senserif;
                           font-weight: normal !important;
                           text-decoration: none !important;
                           font-size: 14px;
                           /* position: absolute;
                           padding: 8px;
                           top: 1000px; */
                           /* bottom: 1px; */
                           /* left: 695px; */
                           /* margin: 0px 7px; */
                           -webkit-border-radius: 7px;
                           /* margin-bottom: 200px;*/
                           margin-top:52px;" href="javascript:;">Submit</a></span> 
                     </div>
                     <br>
                     <br>
                  </div>
               </dd>
            </dl>
         </div>
      </div>
      
      <!-- rizwan css to view apply display block -->
      <div id="pagePharmacy" class="panel" data-header="custom_header" style="padding: 10px; box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 10px 0px; background-color: rgb(255, 255, 255); display: none; min-height:810px; margin-bottom:140px; padding-bottom:100px;" data-load="pagePharmacyOnLoad">
         <div style="width:351px;margin-top: 41px;padding-left:40px;">
            <div id="divPagePharmacyTitle"></div>
            <dl id="dlPharmacy" style="margin-top: 35px;">
               <!--<dt style="margin-left: 45px;font-size: 17px;">
                  <p id="dtPharmacy" class="icon add mini"> <b>Pharmacy (to which any prescriptions for medications will be faxed)</b></p>
               </dt>
               <dd style="display: block !important">
                  <div class="dddiv">
                     <div id="divSelectedPharmacy"></div>
                     <div id="divExistingPharmacy">
                        <select id="drpPharmacy" onChange="selectPharmacy()" class="jq-ui-forms">
                        </select><i class="fa fa-arrow-down" aria-hidden="true" style="position: absolute;
                           top: 327px;
                           right: 334px;
                           color: #FFFFFFFF;
                           font-size: 15px;"></i>
                        <br>
                        <br>
                        <hr color='#312769;' />
                        <br>
                     </div>
                     <input id="txtPharmacyName" style="margin-left: 0px;" type="text" placeholder="Pharmacy Name" class="jq-ui-forms" />
                     <br>
                  </div>
               </dd>-->
               <dt style="margin-left: 0px;font-size: 17px;">
                  <p class="icon add mini"><span style="margin-left:-145px"><b>* Patient’s Drug Allergies</b></span></p>
               </dt>
               <dd>
                  <div class="dddiv">
                     <table id="tblAllergies" border="0" style="margin-left:30px; float:laft; text-align:left;">
                     </table>
                     <br>
                     <input id="txtAllergies" type="text" class="jq-ui-forms infotabb" placeholder="If no allergies then type No Allergies" title="Enter allergies">
                     <a href="javascript:;" class="button infotabbadd" onClick="createMe('tblAllergies',document.getElementById('txtAllergies').value);document.getElementById('txtAllergies').value='';" width="95%" style="color:#000"><b>Add</b></a>
                  </div>
                  <br clear="all">
               </dd>
               <dt style="margin-left:0px;font-size: 17px;">
                  <p class="icon add mini"><span style="margin-left:-145px"><b>Patient’s Medical History</b></span></p>
               </dt>
               <dd>
                  <div class="dddiv">
                     <table id="tblPatientMedicalHistory" style="margin-left: 0px; float:left; text-align:left;">
                     </table>
                     <br>
                     <input id="txtPatientMedicalHistory" style="margin-left: 1px;" type="text" class="jq-ui-forms infotabb" placeholder="Enter patient's medical history, especially any history of skin disease or skin cancer" title="Enter patient's medical history, especially any history of skin disease or skin cancer">
                     <a href="javascript:;" class="button infotabbadd" style="color: #333" onClick="createMe('tblPatientMedicalHistory',document.getElementById('txtPatientMedicalHistory').value);document.getElementById('txtPatientMedicalHistory').value='';" width="95%"><b>Add</b></a>
                  </div>
                  <br clear="all">
               </dd>
               <dt style="margin-left: 0px;font-size: 17px;">
                  <p class="icon add mini"><span style="margin-left:-160px"><b>Family Medical History</b></span></p>
               </dt>
               <dd>
                  <div class="dddiv">
                     <table id="tblFamilyMedicalHistory" style="margin-left: 0px; float:left; text-align:left;">
                     </table>
                     <br>
                     <input id="txtFamilyMedicalHistory" style="margin-left: 1px;" type="text" class="jq-ui-forms infotabb" placeholder="Enter family medical history, especially any history of skin disease or skin cancer (including, melanoma)" title="Enter family medical history, especially any history of skin disease or skin cancer (including, melanoma)">
                     <a href="javascript:;" class="button infotabbadd" onClick="createMe('tblFamilyMedicalHistory',document.getElementById('txtFamilyMedicalHistory').value);document.getElementById('txtFamilyMedicalHistory').value='';" width="95%" style="color:#000;"><b>Add</b></a>
                  </div>
                  <br clear="all">
               </dd>
               <dt style="margin-left: 0px; font-size: 17px;">
                  <p class="icon add mini"><span style="margin-left:-110px;"><b>Patient's Current Medications</b></span></p>
               </dt>
               <dd>
                  <div class="dddiv">
                     <table id="tblCurrentMedicine" style="margin-left: 0px; float:left; text-align:left;">
                     </table>
                     <br>
                     <input id="txtCurrentMedicine" style="margin-left: 1px;" type="text" class="jq-ui-forms infotabb" placeholder="Enter a medication being taken" title="Enter a medication being taken">
                     <a href="javascript:;" class="button infotabbadd" onClick="createMe('tblCurrentMedicine',document.getElementById('txtCurrentMedicine').value);document.getElementById('txtCurrentMedicine').value='';" width="95%" style="color:#000;"><b>Add</b></a>
                  </div>
                  <br clear="all">
               </dd>
            </dl>
            
            <br>
            <a id="btnPharmacyProceed" class="buttonNext iconRight right mini lfbtys" href="javascript:;" style="width: 238px; font-size: 17px; margin-right: 50px; margin-top:6px;">Additional Information </a>
         </div>
                  
      </div>
      <div id="pageChiefComplaint" class="panel " data-header="custom_header" style="padding: 10px; box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 10px 0px; background-color: rgb(255, 255, 255); display: none; height:700px; margin-bottom:230px;" data-load="pageChiefComplaintOnLoad">
         <div id="ChiefcomplaintCollapsableBox" style="/*display: block;*/
            margin-left: 203px;
            margin-top: 120px;
            margin-right: 111px; text-align:left; " class="panel"></div>
         <div style='width:350px; float:left;'><span class='phots-01 backButton' style="cursor: pointer"> <i style="color:#FFFFFF; font-size: 20px;top:9px; left: 7px;font-weight: 400; " class="fa fa-angle-left"></i> <a class='iconRight left'>Back</a></span> <span style='float:right;' class=""> <i style="color: #ececec;
            font-size: 20px;
            font-weight: 400;
            position: absolute;
            top: 71px;
            left: 211px;
            z-index: 999; "> </i></span></div>

            

            <div><i style="color:#FFFFFF; font-size: 20px;top:9px; left: 7px;font-weight: 400; class="fa fa-angle-right"> <a href='javascript:;' class="buttonNext mini iconRight right" onclick='SaveChiefComplaintData();' id="ChiefComplaintbtnProceed" style="
            background-color: #312769;
            color: #FFFFFF;
            /* float: left; */
            
            font-family: 'roboto',senserif;
            /* font-weight: normal !important; */
            text-decoration: none !important;
            font-size: 14px;
            /* position: absolute; */
            padding: 9px 21px;
            /* top: 611px; */
            /* left: 740px; */
            /* margin: 0px 7px; */
            -webkit-border-radius: 7px;
            font-style:normal;">Next</a></i> </span> </div>
      </div>
      <div id="pageThanks" class="panel" data-header="custom_header" data-load="pageThanksOnLoad" style="padding: 10px; box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 10px 0px; background-color: rgb(255, 255, 255); display: none; height:600px; margin-bottom:190px">
         <br />
         <center style="margin-top:52px;">
            <b>
               <div id="divThanks" style="margin-left:-392px;"></div>
               <br />
               <br />
            </b>
            <div style="text-align:justify;text-justify:auto;">
               <ul class="thank_ul>" style="margin: 0;
                  padding: 0 0 0 15px;
                  /* margin-top: 35px; */
                  line-height: 14px;
                  letter-spacing: 0px; padding-left:50px; padding-right: 110px;">
                  <li> When the Provider has finished reviewing your case, you will receive an email at - <span id="spanPageThanksEmailID"></span>.</li>
                  <br>
                  <li> You can then see the Request Summary in the "Old Request" section using the website or the free app.</li>
                  <br>
                  <li> If you have any other useful photos, you can upload them in the "Old Request" section as well.</li>
                  <br>
                  <br>
               </ul>
               <span style="color:#312769;font-weight: 600;margin-left: 338px;"> Thank you, and we look forward to helping you.</span>
            </div>
            <br>
            <br>
            <div style="width:350px; float:left; margin-left:435px;">
               <span style=" float:right;margin-right:100px;background-color: #312769;
                  color: #FFFFFF;
                  float: left;
                  font-family: 'roboto',senserif;
                  font-weight: normal !important;
                  text-decoration: none !important;
                  font-size: 15px;
                  /* position: absolute; */
                  padding: 10px 20px;
                  /* top: 438px;
                  left: 454px; */
                  margin: 0px 7px;
                  -webkit-border-radius: 7px;
                  "> <a id='btnThanksOK' href="javascript:;" onClick="gotoIndex()" class="buttonNext mini">Done</a> </span><br clear="all">
            </div>
         </center>
         <br />
      </div>
      <div id="pageOldRequest" class="panel" data-header="custom_header" style="padding: 10px; box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 10px 0px; background-color: rgb(255, 255, 255); display: none; min-height:700px; margin-bottom:230px; width:1000px;" data-load="pageOldRequestOnLoad">
         <table width="70%" align="center">
            <tr>
               <td>
                  <div style="width:100px;">
                     <ul class="ped">
                        <li>
                           <div style="width:20px; float:left; height:20px; background:#DB0000;"> </div>
                           <span style="float:left;margin-left: 10px;"> Pending </span>
                        </li>
                     </ul>
                  </div>
               </td>
               <td align="center">
                  <div style="width:300px;">
                     <ul class="ped">
                        <li>
                           <span class="click_note" style="margin-left:30px;">Click on a request to view details. </span>
                        </li>
                     </ul>
                  </div>
               </td>
               <td>
                  <div style=" float: right;width: 118px;">
                     <ul class="ped">
                        <li>
                           <div style="width:20px; float:left; height:20px; background:#008F00;"> </div>
                           <span style="float:left;margin-left: 10px;"> Completed </span>
                        </li>
                     </ul>
                  </div>
               </td>
            </tr>
         </table>
            <div id="divExistingCaseData">
                <center>
                <br>
                No Old Request(s)
                </center>
            </div>
         <span class="phots araebtn1 backButton" style="margin: 60px 0 0 100px;position: relative; cursor: pointer"> <a class="buttonLightColor icon mini hmlog ui-link">Back</a> </span><br clear="all"><br clear="all"><br clear="all"><br clear="all"><br clear="all">
        </div>
        <div id="pageOldRequestDetail" class="panel" data-header="custom_header" style="padding: 10px; box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 10px 0px; background-color: rgb(255, 255, 255); display: none; min-height:300px; margin-bottom:230px; text-align:left; padding-left:80px; padding-bottom:50px;">
         <center>
            <b style="font-size:16px;">Request Summary<br>
            </b>
         </center>
         <br>
            <div class="rockon">
                <table>
                    <tr>
                        <td style="width:100px;"><span class='reportLabel'><b>Patient:</b>&nbsp;</span></td>
                        <td><span id="spanLastFirstName">#LastName, #FirstName</span></td>
                    </tr>
                    <tr>
                        <td style="width:100px;"><span class='reportLabel'><b>DOB:</b></span></td>
                        <td><span id="spanDOB"></span>&nbsp;-&nbsp;<span id="spanGender"></span></td>
                    </tr>
                    <tr>
                        <td style="width:100px;"><span class='reportLabel'><b>Submitted by:</b>&nbsp;</span></td>
                        <td><span id="spanSubmittedBy"></span></td>
                    </tr>
                </table>
            </div>
            <div class="rockon">
                <table style="margin-left:340px;">
                    <tr>
                        <td style="width:100px;"><span class='reportLabel'><b>Submitted on:</b>&nbsp;</span></td>
                        <td><span id="spanCaseDate"></span></td>
                    </tr>
                    <tr>
                        <td style="width:100px;"><b>Billing Method:</b></span></td>
                        <td><span id="spanBillingMethod"></span></span></td>
                    </tr>
                    <tr>
                        <td style="width:100px;"><b>Billing Amount:</b></td>
                        <td><span id="spanBillingAmount"></td>
                    </tr>
                </table>
            </div>
            

<br>





         <!-- <div style="height:20px;"><span class='reportLabel'><b>Patient:</b>&nbsp;</span><span id="spanLastFirstName">#LastName, #FirstName</span></div>
         <div style="height:20px;"><span class='reportLabel'><b>DOB:</b></span><span id="spanDOB"></span>&nbsp;-&nbsp;<span id="spanGender"></span></div>
         <div style="height:20px;"><span class='reportLabel'><b>Submitted by:</b>&nbsp;</span><span id="spanSubmittedBy"></span></div>
         <div style="height:20px;"><span class='reportLabel'><b>Submitted on:</b>&nbsp;</span><span id="spanCaseDate"></span></div>
         <span id="spanCompletedOn"></span> <div style="height:20px;"><span id="spanBillingAmount"></span></div> <span id="spanBillingMethod"></span> -->
         <hr width="100%">
         <br>
         <div style="height:20px;"><span class='reportLabel'><b>Provider:</b>&nbsp;</span><span id="spanDoctorName">#ProviderName</span></div> 
       
         <span class='reportLabel'><b>Diagnosis, Impression &#38; Patient Instructions:</b></span><br clear="all">
         <br clear="all">
         <span id="spanPatientInfo">
            <ol><i style="padding:0px; margin:0px;">None</i> </ol>
         </span>
         <br>
         <br>
         <span class='reportLabel'><b>Prescriptions(Rx):</b></span><br clear="all">
         <br clear="all">
         <ol id="listTreatment" class="bullet" style="padding:0px; margin:0px 0 0 0px;">
            <li>None</li>
         </ol>
         <hr width="100%">
         <span class='reportLabel'>
            <center>
               <b style="font-size:16px;">Request Submitted</b>
            </center>
         </span>
         <br>
         <span class='reportLabel' style="font-weight:bold;">Where is it?&nbsp;</span><br clear="all">
         <br clear="all">
         <ol id="listBodyParts" class="bullet" style="padding-left:30px; margin:0px 0 0 0px;">
            <li><i>None</i></li>
         </ol>
         <br>
         <span class='reportLabel' style="font-weight:bold;">Photos:</span>
         <span id="additionalphotos">Upload Photos</span><br clear="all">
         <div id="page_loading1" style="display:none;width:100%;height:100%; z-index:9999;margin: 0 auto;position:fixed;left:0;text-align:center;top:0px;">
            <div style="position: relative;text-align: center;top: 279px;"><img src="{{ asset('images/loading.gif') }}"></div>
         </div>
         <div id="add_photo" class="addimageuploaddiv" style="display:none;">
            <form method="post" enctype="multipart/form-data">
               <h3>Please select photo to upload.</h3>
               <input type="file" name="images" id="admimages" class="addimagesfromgallery" />
               <br />
            </form>
            <div id="addresponse"></div>
            <ul id="addimage-list" style="display:none;position:relative;height:200px;">
            </ul>
         </div>
         <br clear="all">
         <ol id="listPhotos" class="bullet" style="padding:0px; margin:0px 0 0 0px;">
            <li><i>None</i></li>
         </ol>
         <div id="divReportImagePopup" data-modal="true" style="display:none;">
            <div id="divReportImagePopupInner" style="padding:10px;margin-top:30px;"></div>
         </div>
         <br>
         <span id="spanChiefComplaint"></span> <span id="spanQuestionAnswer"></span> <span id="spanPharmacy"></span> <span class='reportLabel'><b style="font-weight:bold;">Patient’s Drug Allergies:</b></span><br clear="all">
         <br clear="all">
         <ol id="listAllergies" class="bullet" style="padding:0px; margin:0px 0 0 47px;">
            <li><i>None</i></li>
         </ol>
         <br>
         <span class='reportLabel'><b>Patient’s Medical History:</b></span><br clear="all">
         <br clear="all">
         <ol id="listPatientMedicalHistory" class="bullet" style="padding:0px; margin:0px 0 0 47px;">
            <li><i>None</i></li>
         </ol>
         <br>
         <span class='reportLabel'><b>Family Medical History:</b></span><br clear="all">
         <br clear="all">
         <ol id="listFamilyMedicalHistory" class="bullet" style="padding:0px; margin:0px 0 0 47px;">
            <li><i>None</i></li>
         </ol>
         <br>
         <span class='reportLabel'><b>Current Medicine:</b></span><br clear="all">
         <br clear="all">
         <ol id="listCurrentMedicine" class="bullet" style="padding:0px; margin:0px 0 0 47px;">
            <li><i>None</i></li>
         </ol>
            <br>
         <div style="width:350px; float:left;">
            <span class="phots-08 backButton" style="cursor: pointer;"> <i style="color:#fff; font-size: 14px; " class="fa fa-angle-left"></i> <a class="iconRight left">Back</a></span>
         </div>
      </div>
        <div id="pageDoctorFeesInfo" data-modal="true" style="display:none;padding:10px">
            <br>
            <br>
            <br>
            <div style="padding:10px"> 1. The standard fee for this Provider is listed.<br>
                <br>
                2. Each Provider decides their own fee.<br>
                <br>
                3. The Provider may charge a lower fee than what is listed depending on your request.<br>
                <br>
                4. The Provider cannot charge a higher fee than what is listed. 
            </div>
            <br>
            <br>
            <a href="javascript:;" onClick="closePageDoctorFeesInfo()" style="width:95%" class="button">OK</a>
        </div>
      <div id="pagePharmacySearchResults" class="panel" data-header="custom_header" style="padding:10px;display:none">
         <div id="divPharmacySearchResults"></div>
      </div>
      <div id="pageTempQuestion" class="panel" data-header="custom_header" style="padding: 10px; box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 10px 0px; background-color: rgb(255, 255, 255); display: none; padding-bottom: 150px;">
         <div id="divTempQuestion" style="margin-top: 55px;"></div>
         <span class='phots-01 backButton' style='padding: 10px 22px;float:left; cursor: pointer'> <i style="color:#FFFFFF; font-size: 20px;font-weight: 400; " class="fa fa-angle-left"></i> <a class='iconRight left'>Back</a></span>
         <span style='float:right;' class=""> <i style="color: #ececec;
            font-size: 20px;
            font-weight: 400;
            position: absolute;
            top: 71px;
            left: 211px;
            z-index: 999; " class="fa fa-angle-right"></i> 
            <a href='javascript:;' class='buttonNext mini iconRight right' onclick='goBackToPatientScreen(true);' style="background-color: #312769; color: #FFFFFF; float: left; font-weight: 600; font-family: 'roboto',senserif; text-decoration: none !important; font-size: 15px; padding: 12px 30px; top: 60px; left: 145px;margin-right: 0px; margin: 0px 7px; -webkit-border-radius: 7px;">Next</a> </span>
      </div>
      <div id="pageForgotPassword" class="panel" data-header="custom_header" style="display:none; 
         position: absolute;
         top: 151px;
         left: 302px;
         padding-right: 296px;-webkit-box-shadow:0px 0px 10px 0px rgba(0,0,0,0.1);
         box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1); background-color: #FFFFFF">
         <div style="margin:146px 0 0 328px; float:left;">
            <h3 style="text-align: center; font-family: 'roboto',senserif;">Re-enter</h3>
            <input id="txtForgotUsername" type="text" placeholder="Enter Registered Email" class="jq-ui-forms" />
            <div style="width:350px;">
               <a href="javascript:;" onClick="forgotPassword()" class="button forpast" style="float:right; padding:9px 15px !important; color: black;display:border;
                  border: 1px solid #312769; background-color: #312769; color: #FFFFFF; font-size: 17px;margin-right:85px;">Reset my password</a>
               <span class="phots-01 backButton " style="width:57px!important; cursor: pointer"><i style="color:#FFFFFF; font-size: 20px;font-weight: 400; " class="fa fa-angle-left"></i> <a class="iconRight left">Back</a></span>
            </div>
         </div>
      </div>
</div>

<?php if(isset($loginResponse) && !empty($loginResponse)) { ?>
    <?php  $loginResponse = json_encode($loginResponse); ?>
    <input type="hidden" value='<?php echo $loginResponse; ?>' id="loginResponse" />
<?php } ?>

<script>
    var url = window.location.href;
    var newUrl = url.replace('/login','/home');
    var cssD = jQuery('#pageIndex').css('display');
    
    var loginRes = {};
    <?php if(isset($loginResponse) && !empty($loginResponse)) { ?>
        loginRes = JSON.parse(jQuery('#loginResponse').val());
        
    <?php } ?>

    if(url.includes('/login') && cssD == 'block'){
        window.location.href = newUrl;            
        
    }        

    if(Object.keys(loginRes).length !== 0) {
        if((window.localStorage.getItem("isLoggedIn")!=null&&window.localStorage.getItem("isLoggedIn")!="")?window.localStorage.getItem("isLoggedIn"):window.sessionStorage.getItem("isLoggedIn") != "true" && (loginRes.strErrorMessage == "" || loginRes.strErrorMessage == null) ){
            
            window.localStorage.setItem("loggedInUserEmail", "<?php echo !empty($currentUser['email'])?$currentUser['email']:''; ?>");
            window.localStorage.setItem("strUserName", "<?php echo !empty($currentUser['username'])?$currentUser['username']:''; ?>");
            window.localStorage.setItem("strCareGiverDOB", "<?php echo !empty($currentUser['dob'])?$currentUser['dob']:''; ?>");
            window.localStorage.setItem("guidCareGiverId", loginRes.guidCareGiverId);
            window.localStorage.setItem("intNumberOfRequests", loginRes.intNumberOfRequests);
            window.localStorage.setItem("strCareGiverFullName", loginRes.strCareGiverFullName);
            window.localStorage.setItem("strFavDocList", loginRes.strFavDocList);
            window.localStorage.setItem("strPatientList", JSON.stringify(loginRes.listPatients));
            window.localStorage.setItem("strExistingCasesList", loginRes.strExistingCasesList);
            window.localStorage.setItem("isLoggedIn", "true");
            window.localStorage.setItem("strListPatientCareGiverRelation", JSON.stringify(loginRes.listPatientCareGiverRelation));
            window.localStorage.setItem("strQuestionTemplate", JSON.stringify(loginRes.questionTemplate));
            window.localStorage.setItem("strCareGiverFirstName", loginRes.strCareGiverFirstName);
            window.localStorage.setItem("strCareGiverLastName", loginRes.strCareGiverLastName);
            window.localStorage.setItem("strCareGiverMiddleName", loginRes.strCareGiverMiddleName);
            window.localStorage.setItem("strCareGiverGender", loginRes.intGender);
            window.localStorage.setItem("strCareGiverPhone", loginRes.strCareGiverPhone);
            window.localStorage.setItem("codeType", "DISCOUNT");
            window.localStorage.setItem("txtReferralCode", "");




            window.sessionStorage.setItem("loggedInUserEmail", "<?php echo !empty($currentUser['email'])?$currentUser['email']:''; ?>");
            window.sessionStorage.setItem("strUserName", "<?php echo !empty($currentUser['username'])?$currentUser['username']:''; ?>");
            window.sessionStorage.setItem("strCareGiverDOB", "<?php echo !empty($currentUser['dob'])?$currentUser['dob']:''; ?>");
            window.sessionStorage.setItem("guidCareGiverId", loginRes.guidCareGiverId);
            window.sessionStorage.setItem("intNumberOfRequests", loginRes.intNumberOfRequests);
            window.sessionStorage.setItem("strCareGiverFullName", loginRes.strCareGiverFullName);
            window.sessionStorage.setItem("strFavDocList", loginRes.strFavDocList);
            window.sessionStorage.setItem("strPatientList", JSON.stringify(loginRes.listPatients));
            window.sessionStorage.setItem("strExistingCasesList", loginRes.strExistingCasesList);
            window.sessionStorage.setItem("isLoggedIn", "true");
            window.sessionStorage.setItem("strListPatientCareGiverRelation", JSON.stringify(loginRes.listPatientCareGiverRelation));
            window.sessionStorage.setItem("strQuestionTemplate", JSON.stringify(loginRes.questionTemplate));
            window.sessionStorage.setItem("strCareGiverFirstName", loginRes.strCareGiverFirstName);
            window.sessionStorage.setItem("strCareGiverLastName", loginRes.strCareGiverLastName);
            window.sessionStorage.setItem("strCareGiverMiddleName", loginRes.strCareGiverMiddleName);
            window.sessionStorage.setItem("strCareGiverGender", loginRes.intGender);
            window.sessionStorage.setItem("strCareGiverPhone", loginRes.strCareGiverPhone);
            window.sessionStorage.setItem("codeType", "DISCOUNT");
            window.sessionStorage.setItem("txtReferralCode", "");

            
            
            var annarr = loginRes.strAppFeatures;
            var annft = annarr.split("~");
            
            if (annft[0] == "1" && annft[1] == "Announcement") {
                window.localStorage.setItem("hideannouncement", 'show');
            } else {
                window.localStorage.setItem("hideannouncement", '');
            }

        } else {
            jQuery('#page_loading').hide();
        }
    }
</script>
<script>
jQuery(document).ready(function(){
    jQuery('#file-upload').change(function() {
        var i = $(this).prev('label').clone();
        var file = $('#file-upload')[0].files[0].name;
        jQuery(this).prev('label').text(file);
    });
});
</script>
@endsection
<!-- <script type="text/javascript">
var i=1;
if(i==1)
    {
        location.reload(true);
        i=2;
        return false;
    }
</script> -->
<style>
.custom-file-upload {
  /* border: 1px solid #ccc;
  display: inline-block;
  padding: 6px 12px;
  cursor: pointer; */
}
div#fUploadDiv {
    margin-left: 25%;
    text-align: left;
    height: 100px;
    margin-top: 35px;
}
.custom-file-upload {
    display: inline-block;
    background: linear-gradient(top, #f9f9f9, #e3e3e3);
    background: -webkit-linear-gradient(top, #f9f9f9, #e3e3e3);
    border: 1px solid #999;
    border-radius: 3px;
    padding: 5px 8px;
    outline: none;
    white-space: nowrap;
    -webkit-user-select: none;
    cursor: pointer;
    text-shadow: 1px 1px #fff;
    font-weight: 700;
    font-size: 10pt;
}
</style>
<?php 
    // $valueIndirectLoginSuccess = session('indirectLoginSucess');
    // if($valueIndirectLoginSuccess==true)
    // {
?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script>
    var curr_div = [];
    var prev_div = [];
setTimeout(function(){
            
            
            if(sessionStorage.getItem('directLogin')!=undefined && typeof sessionStorage.getItem('directLogin')!==undefined){
                localStorage.setItem('directLogin','false');
                

                for (var i = 0; i < sessionStorage.length; i++){
                    window.localStorage.setItem(sessionStorage.key(i), sessionStorage.getItem(sessionStorage.key(i)));
                }
                
                if (window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == null ||
                    window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "" ||
                    window.sessionStorage.getItem("indirectLoginSucess-drpChiefComplaintID") == "undefined") {
                    alert("Please answer - 'What do you need help with?'");
                } else
                {
            
                    jQuery("#pageTellUsMore").hide();
                    jQuery("#pageIndex").hide();
                    jQuery("#pageAffectedArea").hide();
                    jQuery("#pagePhoto").hide();
                    
                    jQuery("#pageDoctorSelectionSearch").show();
                    
                    curr_div.push("#pageDoctorSelectionSearch");
                    prev_div.push("#pageTellUsMore");
                }
            }
    }, 1500);
</script>
<?php        
    //}
?>