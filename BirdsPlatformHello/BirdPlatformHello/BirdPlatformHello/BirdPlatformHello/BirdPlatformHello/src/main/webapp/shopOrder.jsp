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
                        <h3 style=" margin-bottom: 2%; color: #000">Orders Management</h3>
                        <div class="container product-box">
                            <div class="row">
                                <div class="col"></div>
                                <div class="col-10">
                                    <form id="product-search" action="shopSearchOrderController" method="POST" >
                                        <input type="search" name="txtSearch" id="search" placeholder="Search Username" value="${txtSearch}"/>
                                    <button type="submit">
                                        Search
                                    </button>
                                    <a style="margin-left: 20px; text-decoration: none;padding: 5px; color: White; background-color: black " href="shopOrdersController">
                                        Reset
                                    </a>
                                </form>
                            </div>
                            <div class="list table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="text-center" scope="col">No.</th>
                                            <th class="text-center" scope="col">Customer</th>
                                            <th class="text-center" scope="col">Total ($)</th>
                                            <th class="text-center" scope="col">Order day</th>
                                            <th class="text-center" scope="col">Status</th>
                                            <th class="text-center" scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="orderList" value="${ORDERS}"/>
                                        <c:set var="customerList" value="${USERNAMELIST}"/>
                                        <c:if test="${not empty customerList}">
                                            <c:forEach var="order" items="${orderList}" varStatus="counter">
                                            <form action="shopSaveOrderController" method="POST">
                                                <tr>                    
                                                    <td class="text-center">
                                                        <input type="hidden" name="orderID" value="${order.orderID}">
                                                        <a href="shopOrderDetailsController?orderID=${order.orderID}&status=${order.status}&totsal=${order.total}">
                                                            ${counter.count}
                                                        </a>
                                                    </td>
                                                    <td class="text-center">
                                                        <c:forEach var="entry" items="${customerList}">
                                                            <c:if test="${entry.key eq order.orderID}">                                              
                                                                ${entry.value}
                                                            </c:if>
                                                        </c:forEach> 
                                                    </td>
                                                    <td class="text-center">
                                                        ${order.total}
                                                    </td>

                                                    <td class="text-center">
                                                        ${order.orderDate}
                                                    </td>
                                                    <td class="text-center">      
                                                        <input type="hidden" name="orderID" value="${order.orderID}">
                                                        <select class="input-edit" name="status">
                                                            <c:if test="${order.status} eq 'Processing' ">
                                                                <option value="Completed" ${order.status eq 'Completed' ? 'selected' : ''}>Completed</option>
                                                                <option value="Cancel" ${order.status eq 'Cancel' ? 'selected' : ''}>Cancel</option>
                                                            </c:if>
                                                            <option value="Processing" ${order.status eq 'Processing' ? 'selected' : ''}>Pending</option>
                                                            <option value="Confirmed" ${order.status eq 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                                                            <option value="Completed" ${order.status eq 'Completed' ? 'selected' : ''}>Completed</option>
                                                            <option value="Cancel" ${order.status eq 'Cancel' ? 'selected' : ''}>Cancel</option>
                                                        </select>     
                                                        <input type="hidden" name="status" value="${order.status}">
                                                    </td>
                                                    <c:set var="Allow1" value="Confirmed" />
                                                    <c:set var="Allow2" value="Pending" />
                                                    
                                                    <c:set var="Block1" value="Completed" />
                                                    <c:set var="Block2" value="Cancel" />
                                                    <td class="text-center">
                                                        <c:if test="${order.status eq Allow1 or order.status eq Allow2  }">
                                                            <button type="submit" class="btn btn-sm btn-neutral">
                                                            <span class="material-symbols-outlined">
                                                                sync
                                                            </span></button>
                                                        </c:if>
                                                        
                                                        <c:if test="${order.status eq Block1 or order.status eq Block2  }">
                                                           
                                                            <span>
                                                                N/A
                                                            </span>
                                                        </c:if>
                                                        
                                                        
                                                    </td>
                                            </form> 
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

</html>