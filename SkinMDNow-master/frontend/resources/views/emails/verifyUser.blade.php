<!DOCTYPE html>
<html>
   <head>
      <title></title>
      <style>
         .header{
         width: 100%  !important;
         height: 100px  !important;
         background-color: #312769;
         padding: 10px !important;
         }
         html {
         height: 100%  !important;
         box-sizing: border-box  !important;
         }
         body {
         position: relative !important;
         margin: 0  !important;
         overflow-x: hidden !important;
         height: 100% !important;
         font-family: "Times New Roman", Times, serif;
         font-size: 16px !important;
         }
         .demo {
         margin: 0 auto  !important;
         padding-top: 64px  !important;
         max-width: 640px  !important;
         width: 94%  !important;
         min-height: 200px  !important;
         padding: 30px  !important;
         padding-bottom: 30px  !important;
         }
         .demo h1 {
         margin-top: 0  !important;
         }
         .footer {
         width: 100% !important;
         height: 100px  !important;
         background-color: #312769  !important;
         padding: 10px  !important;
         text-align: center  !important;
         color: #ffffff  !important;
         font-size: 16px !important;
         }
         .footer p{ 
            color: #ffffff  !important;
            font-size: 16px !important;
         }
      </style>
   </head>
   <body>
        <header>
            <div class="header">
                <!-- <center><img src="http://34.235.116.137:8080/frontend/public/images/logo.png" width="300px; height:200px;"></center> -->
                <center><img src="https://skinmdnow.nuvolatek.net/server/public/images/logo.png" width="300px; height:200px;"></center>
            </div>
        </header>
        <section>
            <div class="demo">
                <?php echo html_entity_decode($registerContentValue); ?>
            </div>
        </section>
        <footer>
            <div class="footer">
                <p>Safe. Private. Secure.</p>
                <p>Web app is supported on IE10+, Firefox 22+, Chrome 28+, Safari 15+ at 1024 x 768 pixels resolution.</p>
            </div>
        </footer>
   </body>
</html>