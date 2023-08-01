<%-- 
    Document   : ChangePass
    Created on : Jun 4, 2023, 4:51:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Suggest for Re_Open account</title>

        <!-- custom css file link  -->
        <link rel="stylesheet" href="./css/changePass.css">

    </head>

    <body>

        <!-- header section starts  -->

        <jsp:include page="pageHeader.jsp"></jsp:include>

        <!-- header section ends  -->


        <!-- closer btn  -->

        <div id="closer" class="ri-close-line"></div>




        <!-- Send code section start -->
        <div class="wrapper">
            <div class= "container">
                <div class = "title-section">
                    <h2 class = "title">Suggest for re_open account</h2>
                    <p class = "para">Enter information so admin can review and re open your account </p>
                    
                <c:if test="${not empty requestScope.SuggesstOK}">
                    <p style="color: red" class = "para">Suggest successfully, please wait for Admin!  </p>

                </c:if>
                <c:if test="${not empty requestScope.SPAMCHECK}">
                    <p style="color: red" class = "para">Already suggest, Do not spam please!  </p>

                </c:if>

                </div>
                <form action="DispatcherServlet" class="from" method="POST">
                    <div class ="input-group">
                        <label for ="" class="label-title">Enter your mail</label>
                        <input required="" type = "email" name="UserGmail" placeholder ="gmail">
                        <span class="icon">&#128274;</span>
                       
                    </div>
                    <div class ="input-group">
                        <label for ="" class="label-title">Do you know why your account is blocked? Why? </label>
                        <textarea required="" style="border: 1px solid black;" name="DoUserKnow"  cols="65" rows="4"></textarea>
                                
                    </div>
                    <div class ="input-group">
                        <label for ="" class="label-title">
                            Why do you want to re open your account? </label>
                        <textarea required="" style="border: 1px solid black;" name="ReaseonToReopen" cols="65" rows="4"></textarea>
                                
                    </div>
                    <div class="only">
                        <input style="margin-top: 30px"  class="submit-btn" type="submit" name="MAIN" value="Suggest request">
                    </div>
                </form>

            </div>
        </div>
        <!-- send code section end -->




        <!-- footer section start  -->
  <jsp:include page="pageFooter.jsp"></jsp:include>
        <!-- footer section end  -->

        <!-- custom js file link  -->
        <script src="js/script.js"></script>

    </body>

</html>