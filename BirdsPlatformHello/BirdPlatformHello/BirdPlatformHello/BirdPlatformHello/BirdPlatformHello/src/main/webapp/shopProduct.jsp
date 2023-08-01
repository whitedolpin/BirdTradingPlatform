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
        <link rel='stylesheet' type='text/css' media='screen' href='css/admin.css'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src='js/script.js'></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    </head>

    <body class="db-shop">
        <div class="grid-container"> 
            <header class="header">
                <jsp:include page="shopHeader.jsp"></jsp:include>
                </header>
                <!-- End Header -->

                <!-- Sidebar -->
                <aside id="sidebar">
                <jsp:include page="shopSidebar.jsp"></jsp:include>
                </aside>
                <main class="main-container">
                    <div class="col-sm-12" id="main" style="padding: 3%; width: 100%">
                        <h3 style=" margin-bottom: 2%; color: #000">Products Management</h3>
                        <div class="container product-box">
                            <div class="row">
                                <div class="col"></div>
                                <div class="col-10">
                                    <form id="product-search" action="shopSearchProductController" method="POST" >
                                        <input type="search" name="txtSearch" id="search" placeholder="Search Product" value="${txtSearch}"/>
                                    <button type="submit">
                                        Search
                                    </button>
                                    <a style="margin-left: 20px;text-decoration: none;padding: 5px; color: White; background-color: black " href="shopProductController">
                                        Reset
                                    </a>
                                </form>
                            </div>
                            <div class="list table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="text-center" scope="col">No.</th>
                                            <th class="text-center" scope="col">Name</th>
                                            <th class="text-center" scope="col">Image</th>
                                            <th class="text-center" scope="col">Price</th>
                                            <th class="text-center" scope="col">Quantity</th>
                                            <th class="text-center" scope="col">Status</th>
                                            <th class="text-center" scope="col">Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:set var="productList" value="${requestScope.PRODUCTS}"/>
                                        <c:if test="${not empty productList}">
                                            <c:forEach var="product" items="${productList}" varStatus="counter">
                                            <form action="GetDataforUpdateProduct" method="POST">
                                                <tr>
                                                    <td class="text-center">
                                                        ${counter.count}
                                                    </td>
                                                    <td style="margin-left: 30px;">${product.productName}</td>
                                                    <td class="text-center">
                                                        <img
                                                            alt="..."
                                                            src="${product.img}"                      
                                                            class="rounded-circle img-table"
                                                            />
                                                    </td>
                                                    <td class="text-center">
                                                       ${product.priceOut}
                                                    </td>

                                                    <td class="text-center">
                                                        ${product.quantity}
                                                    </td>
                                                    <td class="text-center">${product.status}</td>
                                                    <td class="text-center">
                                                        <input type="hidden" name="ProductID" value="${product.productID}"/>
                                                        <button style="background-color: transparent;">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                                                                 class="bi bi-arrow-repeat" viewBox="0 0 16 16">
                                                            <path
                                                                d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z" />
                                                            <path fill-rule="evenodd"
                                                                  d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z" />
                                                            </svg>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </form>
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

</html>