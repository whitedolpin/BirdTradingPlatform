<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User profile</title>
        <link rel="stylesheet" href="./css/user.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">


    </head>
    <body>

        <c:if test="${not empty requestScope.UPDATE_ERROR}">
            <h3 style="color: red;"> Nothing to update, please check your information</h3>
        </c:if>


        <div class="main-content">

            <!-- Top navbar -->
            <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">

                <div class="container-fluid">

                    <!-- Brand -->
                    <a style="font-size: 26px; font-weight: 700; font-family: monospace;" class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="GetDataForHomepage">Pet Hello</a>
                    <!-- Form -->

                    <!-- User -->
                    <ul class="navbar-nav align-items-center d-none d-md-flex">
                        <li class="nav-item dropdown">
                            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="media align-items-center">
                                    <span class="avatar avatar-sm rounded-circle">
                                        <img class="rounded-circle" alt="Image placeholder" src="${sessionScope.dto.avatar}">
                                    </span>
                                    <div class="media-body ml-2 d-none d-lg-block">
                                        <span class="mb-0 text-sm  font-weight-bold">${sessionScope.dto.username}</span>
                                    </div>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                                <div class=" dropdown-header noti-title">
                                    <h6 class="text-overflow m-0">Welcome!</h6>
                                </div>
                                <a href="../examples/profile.html" class="dropdown-item">
                                    <i class="ni ni-single-02"></i>
                                    <span>My profile</span>
                                </a>
                                <a href="../examples/profile.html" class="dropdown-item">
                                    <i class="ni ni-settings-gear-65"></i>
                                    <span>Settings</span>
                                </a>
                                <a href="../examples/profile.html" class="dropdown-item">
                                    <i class="ni ni-calendar-grid-58"></i>
                                    <span>Activity</span>
                                </a>
                                <a href="../examples/profile.html" class="dropdown-item">
                                    <i class="ni ni-support-16"></i>
                                    <span>Support</span>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="#!" class="dropdown-item">
                                    <i class="ni ni-user-run"></i>
                                    <span>Logout</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- Header -->
            <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 600px;
                 background-image: url(https://i.pinimg.com/564x/b7/77/00/b7770014caa3eaf3db1a12a50a7fce1f.jpg);
                 background-size: cover; background-position: center top;

                 ">
                <!-- Mask -->
                <span class="mask bg-gradient-default opacity-8"></span>
                <!-- Header container -->
                <div class="container-fluid d-flex align-items-center">
                    <div class="row">
                        <div class="col-lg-7 col-md-10">
                            <h1 class="display-2 text-white">Hello ${sessionScope.dto.username}</h1>
                            <p class="text-white mt-0 mb-5">This is your profile page. You can see the information you've save with your profile and manage your profile </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Page content -->
            <div class="container-fluid mt--7">
                <div class="row">
                    <div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
                        <div class="card card-profile shadow">
                            <div class="row justify-content-center">
                                <div class="col-lg-3 order-lg-2">
                                    <div class="card-profile-image">
                                        <img class="rounded-circle" id="image" src="" alt="">

                                        <img id="NeedHide" class="rounded-circle" src="${sessionScope.dto.avatar}" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                                <div class="d-flex justify-content-between">
                                </div>
                            </div>
                            <div class="card-body pt-0 pt-md-4">
                                <div class="row">
                                    <div class="col">
                                        <div  style="display: flex; margin-top: 10px;" class="card-profile-stats d-flex justify-content-center mt-md-5">


                                            <div class="avatar-form-change">
                                                <input style="width: 100px;padding: 0; line-height: 28px;" type="file" id="photo" placeholder="Up"/>


                                                <button id="upload" onclick="uploadImage()">Upload Image</button>


                                            </div>
                                            
                                             <div >
                                        
                                    </div>
                                            
                                            <form action="DispatcherServlet" method="Post">
                                                <input id="inputTag" type="hidden" value="" name="imageInput" >
                                                <input style="margin-top: 38%; line-height: 28px; border-radius: 4px; margin-left:-20px ; border: 1.5px solid #767676;"
                                                       type="Submit" name="MAIN" value="Save Profile" />


                                        </div>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <h3>
                                        ${sessionScope.dto.username}
                                    </h3>

                                    <hr class="my-4">
                                    <p>Usually update your profile so we can get your newest information</p>
                                    <a href="help.jsp">Help</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 order-xl-1">
                        <div class="card bg-secondary shadow">
                            <div class="card-header bg-white border-0">
                                <div class="row align-items-center" style="justify-content: space-between; padding: 0 30px;">
                                    <div>
                                        <h3 class="mb-0">My account</h3>
                                    </div>

                                   

                                </div>
                            </div>
                            <div class="card-body">

                                <h6 class="heading-small text-muted mb-4">User information</h6>
                                <div class="pl-lg-4">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group focused">
                                                <label class="form-control-label" for="input-username">Username</label>
                                                <input name="Name" type="text" id="input-username" class="form-control form-control-alternative" placeholder="Username" value="${sessionScope.dto.username}">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label" for="input-email">Email address</label>
                                                <input name="Gmail" type="email" id="input-email" class="form-control form-control-alternative"
                                                       placeholder="${sessionScope.dto.email}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="col-lg-6">
                                            <div class="form-group focused">
                                                <label class="form-control-label" for="input-last-name">Phone Number</label>
                                                <input minlength="10" maxlength="11"  name="PhoneNumber" type="text" id="input-last-name" class="form-control form-control-alternative" placeholder="Phone Number" value="${sessionScope.CUSTOMERDTO.phonenumber}">
                                            </div>
                                        </div>
                                        </form>

                                        <div class="col-lg-6">
                                            <div class="form-group focused">
                                                <label class="form-control-label" for="input-first-name">Password :  </label>
                                                <a href="Checkmail.jsp" style="padding-top: 10px;">
                                                    <br> Change?
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <hr class="my-4">


                                
                                
                                <form action="BlockAccController"style="    position: absolute;
    right: 24px;
    bottom: 8px;"> 
                                            <input style="background-color: red;" type="submit" name="MAIN" value="Block Account" /> 
                                        </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer section start  -->
        <section class="footer">
            <div  style="color:black; display: flex; justify-content: space-around; zoom: 1.2 " class="box">
                <a style="color:black" href="https://www.facebook.com/Suongmai0/"> <i class="ri-facebook-fill"></i> Facebook </a>
                <a style="color:black" href="https://www.facebook.com/Suongmai0/"> <i class="ri-twitter-fill"></i> Twitter </a>
                <a style="color:black" href="https://www.facebook.com/Suongmai0/"> <i class="ri-instagram-fill"></i> Instagram </a>
                <a style="color:black" href="https://www.pinterest.com/pethellopage/"> <i class="ri-pinterest-fill"></i> Pinterest </a>
            </div>
        </section>

        <!-- footer section end  -->
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
                                                            document.querySelector("#inputTag").placeholder = url;
                                                        }


                                                                    var element = document.querySelector("#NeedHide");
                                                                    element.style = "display: none";


                                                                })
                                                                .catch(console.error);
                                                    }
                                                    const errorMsgElement = document.querySelector('span#errorMsg');
    </script>
</html>