<%-- 
    Document   : shopProfile
    Created on : Jun 3, 2023, 11:01:05 AM
    Author     : Minh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User's Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/base.css"/>
        <link rel="stylesheet" href="css/userProfile.css"/>

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

                <!-- Main -->
                <main class="main-container">
                    <div class="container-xl px-4 mt-4">
                        <hr class="mt-0 mb-4">
                        <div class="row">
                            <div class="col-xl-4">
                                <!-- Profile picture card-->
                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header">Profile Picture</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <img class="img-account-profile rounded-circle mb-2" src="${sessionScope.dto.avatar}" alt="">
                                    <!-- Profile picture help block-->
                                    <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                    <!-- Profile picture upload button-->
                                    <div class="form-inline col-md-10 col-sm-9 col-xs-12">
                                        <input style="margin-left: 10px;" id="photo" type="file" class="file-uploader pull-left">
                                        <button id="upload" onclick="uploadImage()" type="see-update " class="button-img-see">See</button>
                                        <form action="DispatcherServlet">
                                            <input id="inputTag" type="hidden" value="" name="imageInput" >
                                            <input type="hidden" value="${dto.accountID}" name="ID" >
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <!-- Account details card-->
                            <div class="card mb-4">
                                <div class="card-header">Account Details</div>
                                <div class="card-body">
                                    <form action="shopUpdateProfile" method="POST">
                                        <!-- Form Group (username)-->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputUsername">Username (how your name will appear to other users on the site)</label>
                                            <input class="form-control" id="inputUsername" name="txtUsername" type="text" placeholder="Enter your username" value="${sessionScope.dto.username}">
                                        </div>

                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (organization name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputOrgName">Organization name</label>
                                                <input class="form-control" id="inputOrgName" name="txtShopName" type="text" placeholder="Enter your organization name" value="${sessionScope.shop.shopName}">
                                            </div>
                                            <!-- Form Group (location)-->
                                        </div>
                                        <div class="row gx-3 mb-3">
                                            <label class="small mb-1" for="inputLocation">Location</label>
                                            <div class="col-md-3">
                                                <c:forEach var="address" items="${requestScope.addressMap}">
                                                    <c:if test="${sessionScope.shop.shopID eq address.key}">
                                                        <input class="form-control" id="inputLocation" name="txtAddressDetail" type="text" placeholder="Enter your location" value="${address.value.detail}">
                                                    </div>
                                                    <div class="col-md-3">
                                                        <input class="form-control" id="inputLocation" name="txtAddressDistrict" type="text" placeholder="Enter your location" value="${address.value.district}">
                                                    </div>
                                                    <div class="col-md-3">
                                                        <input class="form-control" id="inputLocation" name="txtAddressProvice" type="text" placeholder="Enter your location" value="${address.value.provice}">
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>                          
                                        <!-- Form Group (email address)-->
                                        <div class="mb-3">

                                            <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                            <input class="form-control" id="inputEmailAddress" name="txtEmail" type="email" placeholder="Enter your email address" value="${sessionScope.dto.email}">
                                        </div>
                                        <!-- Form Row-->
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (phone number)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputPhone">Phone number</label>
                                                <input  minlength="10" maxlength="11" class="form-control" id="inputPhone" name="txtPhoneNumber" type="text" placeholder="Enter your phone number" value="${sessionScope.shop.contact}">
                                            </div>
                                        </div>
                                        <input class="btn btn-primary" type="submit" value="Save Changes">
                                        </div>
                                        <!-- Save changes button-->

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>


    <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>
    <script>

                                            //paste here your copied configuration code
                                            // For Firebase JS SDK v7.20.0 and later, measurementId is optional
                                            const firebaseConfig = {
                                                apiKey: "AIzaSyAPxUPHQ097kVS0w7d75aTDgSrw2x8h_A4",
                                                authDomain: "test-a702c.firebaseapp.com",
                                                projectId: "test-a702c",
                                                storageBucket: "test-a702c.appspot.com",
                                                messagingSenderId: "223272196716",
                                                appId: "1:223272196716:web:1981304529652ea90e5649",
                                                measurementId: "G-JYVDGB4N0T"
                                            };

                                            // Initialize Firebase
                                            firebase.initializeApp(firebaseConfig);
                                            console.log(firebase);
                                            function uploadImage() {
                                                const ref = firebase.storage().ref();
                                                const file = document.querySelector("#photo").files[0];
                                                const name = +new Date() + "-" + file.name;
                                                const metadata = {
                                                    contentType: file.type
                                                };
                                                const task = ref.child(name).put(file, metadata);
                                                task
                                                        .then(snapshot => snapshot.ref.getDownloadURL())
                                                        .then(url => {
                                                            console.log(url);
                                                            alert('image uploaded successfully');
                                                            document.querySelector("#image").src = url;

                                                            if (url != "") {
                                                                document.querySelector("#inputTag").value = url;

                                                            }

                                                            var element = document.querySelector("#NeedHide");
                                                            element.style.display = "none";


                                                        })
                                                        .catch(console.error);
                                            }
                                            const errorMsgElement = document.querySelector('span#errorMsg');
    </script>

</html>
