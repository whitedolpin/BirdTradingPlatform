<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title></title>
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/shopFeedback.css" />
    </head>
    <body>
        <div class="grid-container"> 
            <!-- Header -->
            <header class="header">
                <jsp:include page="shopHeader.jsp"></jsp:include>
                </header>
                <!-- End Header -->

                <!-- Sidebar -->
                <aside id="sidebar">
                <jsp:include page="shopSidebar.jsp"></jsp:include>
                </aside>
                <!-- End Sidebar -->

                <main class="main-container">
                    <div style="background-color: inherit;
                         color: black;" class="cart-head">
                        <p class="name-product">Feedback</p>
                        <div class="cart-head_description">

                        </div>
                    </div>

                    <section style="    margin-left: 20px;" class="userInfo">
                        <h3>Rate Shope </h3>
                        <p>See all comment rate shop</p>
                        <form action="ShopFilterFeedbackInBox" method="POST">
                            <div class="user__details">
                                <div class="input__box">
                                    <span class="details">Name </span>
                                    <input name="productname" type="text" placeholder="Product name" >
                                </div>
                                <div class="input__box">
                                    <span class="details">Category</span>
                                    <input name="category" type="text" placeholder="Category of product" >
                                </div>
                                <div class="input__box">
                                    <span class="details">Type</span>
                                    <input name="type" type="text"  placeholder="A part of feedback detail">
                                </div>
                                <div class="input__box">
                                    <span class="details">Time/Date rate</span>
                                    <input name="date" type="date" placeholder="DD\MM\YYYY" >
                                </div>
                            </div>
                            <button name="MAIN" value="ShopFindFeedBack" type="submit">Find</button>
                            <button type="reset">Reset</button>
                        </form>
                    </section>
                    <section style="    margin-left: 20px;" class="tagBar">
                        <h3>Feedback Review:

                        <c:set var="saveReply" value="${requestScope.SAVEREPLY}" />
                        <c:if test="${ not empty saveReply}">
                            Save reply successfully!
                        </c:if>
                    </h3> 
                    <div class="tags">

                        <form action="ShopFilterFeedbackController" method="POST">
                            <input type="submit" name="all" value="All comment" > 
                            <input type="submit" name="all" value="Not response" >  
                            <input type="submit" name="star" value="5 stars" > 
                            <input type="submit" name="star" value="4 stars" > 
                            <input type="submit" name="star" value="3 stars" > 
                            <input type="submit" name="star" value="2 stars" > 
                            <input type="submit" name="star" value="1 star" > 
                        </form>


                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Product Information</th>
                                <th>Comment and Product Rating</th>
                                <th>Reply detail</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:set var="FBLIST"  value="${requestScope.FBLIST}"  />  
                            <c:set var="ReplyLIST"  value="${requestScope.ReplyLIST}"  />  

                            <c:forEach var="dto" items="${requestScope.FBLIST}" varStatus="counter">


                                <tr>
                                    <td>
                                        <div class="customerInfo">
                                            <c:if test="${ empty dto.img}">
                                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG4SWIzqPgJF1v3j1Udwh6LSGmHFLUfhz-Fw&usqp=CAU" alt="">
                                            </c:if>
                                            <c:if test="${ not empty dto.img}">
                                                <img src="${dto.img}" alt="">
                                            </c:if>
                                            
                                            <div class="productCategory">${dto.publishedDate}</div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="rating">
                                            ${dto.star}
                                            <span class="fa fa-star checked"> </span>

                                        </div>
                                        <div class="comment"> <p>
                                                ${dto.detail}
                                            </p>  </div>
                                    </td>
                                    <td>
                                        <c:if test="${not empty requestScope.ReplyLIST}">
                                             <c:set var="FedID" value="${dto.feedbackID}"/>
                                            ${ReplyLIST.get(FedID)}
                                        </c:if>
                                    </td>
                                    <td>
                                        <div class="commentWrapper">
                                            <button id="${counter.count}" class="myDiv  replyBtn" >Reply</button>
                                            <div id="detail${counter.count}" class="replyContainer">
                                                <form action="ShopSaveReplyController" method="post">
                                                    Reply to feedback of ${dto.publishedDate}
                                                    <input required="" name="detail" type="text" class="replyInput" placeholder="Write a reply...">
                                                    <div class="replyActions">


                                                        <input type="hidden" name="ID" value="${dto.feedbackID}" /> 
                                                        <button class="replyBtn" onclick="HiddenReplyForm('${counter.count}')">Cancel</button>
                                                        <button type="submit" class="deleteBtn">Reply</button>


                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                </tr>


                            </c:forEach>





                            <!-- -->


                        </tbody>
                    </table>
                </section>

                <!-- footer section end  -->
                <script src="js/shopFeedback.js"></script>
            </main>   
        </div>
    </body>


    <script>
                                                            const divElements = document.getElementsByClassName('myDiv');

                                                            for (let i = 0; i < divElements.length; i++) {
                                                                const divElement = divElements[i];

                                                                // Sử dụng closure để giữ giá trị của i
                                                                (function (index) {
                                                                    divElement.addEventListener('click', function () {
                                                                        const id = divElement.id;


                                                                        const detail = "detail" + id;
                                                                        var addFBForm = document.getElementById(detail);
                                                                        addFBForm.style.display = "block";
                                                                    });
                                                                })(i);
                                                            }
    </script>
</html>
