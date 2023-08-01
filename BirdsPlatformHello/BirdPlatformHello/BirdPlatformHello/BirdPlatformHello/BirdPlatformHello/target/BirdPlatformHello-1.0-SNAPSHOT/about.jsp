<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='css/Admin.css'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src='js/script.js'></script>
        <script src='js/DeleteAcc.js'></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    </head>

    <body class="db-shop">
        <div class="grid-container"> 
            <header class="header">
                <jsp:include page="header.jsp"></jsp:include>
                </header>
                <!-- End Header -->

                <!-- Sidebar -->
                <aside id="sidebar">
                <jsp:include page="sidebar.jsp"></jsp:include>
                </aside>
                <main class="main-container">
                    <div class="col-md-10 col-sm-12" id="main" style="padding: 3%; width: 100%">
                        <h3 style=" margin-bottom: 2%; color: #000">Accounts Management</h3>
                        <div class="container product-box">
                            <div class="row">
                                <div class="col"></div>
                                <div class="col-10">
                                    <form id="product-search" action="adminAccountSearchController" method="POST" >
                                        <input type="search" name="txtSearch" id="search" placeholder="Search Product" value="${txtSearch}"/>
                                    <button type="submit">
                                        Search
                                    </button>
                                </form>
                            </div>
                            <div class="list table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="text-center" scope="col">ID</th>
                                            <th class="text-center" scope="col">Email</th>
                                            <th class="text-center" scope="col">Full Name</th>
                                            <th class="text-center" scope="col">Registered Date</th>
                                            <th class="text-center" scope="col">Role</th>
                                            <th class="text-center" scope="col">Update</th>
                                            <th class="text-center" scope="col">Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="userList" value="${requestScope.USER}"/>
                                        <c:set var="roleList" value="${requestScope.ROLES}" />
                                        <c:if test="${not empty userList}">
                                            <c:forEach var="user" items="${userList}" varStatus="counter">
                                            <form action="UpdateAccountServlet" method="POST">


                                                <tr  >
                                                    <td class="text-right" >
                                                        ${user.accountID}
                                                    </td>
                                                    <td class="text-left" >${user.email}
                                                        <input type="hidden" name="email" value="${user.email}"/>
                                                    </td>
                                                    <td class="text-left" >${user.username}</td>
                                                    <td class="text-center" >                            
                                                        ${user.regisDate}
                                                    </td>
                                                    <td class="text-right">
                                                        <c:if test="${not empty roleList}">
                                                            <select  name="roleId">
                                                                <c:forEach var="role" items="${roleList}" varStatus="Counter">
                                                                    <option value="${Counter.count}"
                                                                            <c:if test="${role.role == user.role}">
                                                                                selected="selected"
                                                                            </c:if> >                                                                    
                                                                        ${role.roleName}</option>
                                                                    </c:forEach>                                                                                                             
                                                            </select>
                                                        </c:if>
                                                    </td>
                                                    <td class="text-center">
                                                        <button type="submit" class="btn btn-sm btn-neutral">
                                                            <span class="material-symbols-outlined">
                                                                sync
                                                            </span></button>
                                                    </td>
                                                <input type="hidden" name="AccID" value="${user.accountID}"/>
                                            </form>
                                            <td class="text-center"> 

                                                <form action="DeleteAccountController" method="get">
                                                    <input type="hidden" name="AccID" value="${user.accountID}"/>

                                                    <span id="${user.accountID}" onclick="showDeleteAccForm()" class=" myDiv material-symbols-outlined">
                                                        delete
                                                    </span>

                                                    <div class="AddFBform" id="detail${user.accountID}"> <!-- comment -->
                                                        <h2>
                                                            Do you want to delete account ${user.username}  ?
                                                        </h2>
                                                        <span class="Buton" onclick="HiddenDeleteAccForm('${user.accountID}')">
                                                            Cancel
                                                        </span>

                                                        <button class="Buton"  type="submit">
                                                            Delete 
                                                        </button>


                                                    </div>

                                                </form>


                                            </td>
                                            </tr>


                                        </c:forEach>  

                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
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