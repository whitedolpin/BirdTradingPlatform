<%-- 
    Document   : help
    Created on : Jul 11, 2023, 11:26:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>

    <!-- remix icon cdn link  -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/help.css">

</head>

<body>


      <!-- header section starts  -->

        <jsp:include page="pageHeader.jsp"></jsp:include>

            <!-- header section ends  -->


    <!-- heading section start -->

    <section class="heading">
        <h3>Help</h3>
       
    </section>

    <!-- heading section end -->
    <!-- help section end -->
    <!-- có cả js -->
   
  </head>
  <body>
    <section class="question">
      <h1></h1>

  
      <div class="question">
        <p><strong onclick="toggleAnswer(2)">[Tax & Invoice] Issuing Electronic Invoices/VAT invoices for Pet Hello orders:</strong></p>
        <ul id="answer-2" class="answer">
          <li>When making a successful purchase on the Pet Hello platform, Buyers can request the issuance of an Electronic Invoice/VAT invoice (in one of two forms: Personal or Company) as follows:</li>
          <li>If you are unable to directly request the issuance of a VAT electronic invoice on the Pet Hello application (the system does not display this option).</li>
          <li>If the information on the VAT invoice is incorrect and needs adjustment, please contact us directly.</li>
        </ul>
      </div>

      <div class="question">
        <p><strong onclick="toggleAnswer(3)">[Shipping] Compilation of questions about Shipping Methods</strong></p>
        <ul id="answer-3" class="answer">
          <li>Currently, Buyers can choose one of three new Shipping Methods: Express - Fast - Economy when purchasing certain products on Pet Hello, instead of having to select a fixed Shipping Provider.</li>
        </ul>
      </div>


      
<div class="question">
  <p><strong onclick="toggleAnswer(4)">[Voucher/Discount Code] What are Vouchers/Discount Codes on Pet Hello?</strong></p>
  <ul id="answer-4" class="answer">
    <li>Special offers for Members:</li>
    <li>Vouchers (Discount Codes) on Pet Hello are a string of characters and numbers that you can use to receive certain discounts during the shopping process on Pet Hello. Some discount codes that have been saved in your Voucher Wallet will be automatically displayed for easy selection during the order checkout process in the Pet Hello Voucher section. Some other codes are shared by Sellers or Pet Hello's partner entities, which you need to remember and manually enter to use.</li>
    <li>All Vouchers can only be used ONCE.</li>
  </ul>
</div>


<div class="question">
  <p><strong onclick="toggleAnswer(5)">[Returns] What criteria does Pet Hello evaluate returns based on?</strong></p>
  <ul id="answer-5" class="answer">
    <li>The 3rd party service will assess the condition of the return based on the reason for the Return/Refund request and the evidence provided.</li>
  </ul>
</div>


      
<div class="question">
  <p><strong onclick="toggleAnswer(6)">[Returns] How long does it take to inspect returns?</strong></p>
  <ul id="answer-6" class="answer">
    <li>Pet Hello will inspect and provide you with the processing result within 3-5 days.</li>
    <li>If your Return/Refund request is valid: Pet Hello will refund you.</li>
    <li>If your Return/Refund request is not valid: The product will be returned to you, and the payment will not be refunded.</li>
  </ul>
</div>


<div class="question">
  <p><strong onclick="toggleAnswer(7)">[Returns] How to package a return order.</strong></p>
  <ul id="answer-7" class="answer">
    <li>Package all the products that need to be returned along with all the accessories/gifts that were delivered to you previously, such as: the product's bag/box, accompanying gifts, warranty documents, product labels/tags, user manuals, and any other accompanying accessories.</li>
  </ul>
</div>






      <div class="question">
        <p><strong onclick="toggleAnswer(8)">[Product Review] Frequently Asked Questions</strong></p>
        <ul id="answer-8" class="answer">
          <li>You can review each product only once per order. To be able to review, the product needs to meet the following criteria:</li>
          <li>The product has been updated with a successful delivery status.</li>
          <li>The product does not have any pending Return/Refund requests or has been processed or canceled.</li>
        </ul>
      </div>
      



  </div>
  </section>


         <!-- footer section end  -->

                                    <jsp:include page="pageFooter.jsp"></jsp:include>

                                    <!-- custom js file link  -->


    <!-- footer section end  -->

    <!-- custom js file link  -->
    <script src="js/help.js"></script>

</body>

</html>