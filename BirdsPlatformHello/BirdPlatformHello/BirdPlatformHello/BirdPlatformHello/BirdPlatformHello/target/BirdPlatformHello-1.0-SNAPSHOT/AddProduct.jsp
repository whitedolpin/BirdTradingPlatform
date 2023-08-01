<%-- 
    Document   : updateProduct
    Created on : Jun 5, 2023, 12:45:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add product</title>
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css"
      rel="stylesheet"
    />

    <!-- font awesome cdn link  -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
 <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/updateproduct.css" />
  </head>
  <body>
    <header class="header">
      <a href="shopDashboardController" class="logo">
          <i class="ri-store-2-line"></i> Pet.Hello | ${sessionScope.SHOPEDITPRODUCT.shopName}
      </a>

   

    
       <div class="header-right">
                    <div class="profile-user" onclick="menuToggle();">
                        <img src="${sessionScope.dto.avatar}" alt="">
                    </div> 
                    <div  class="account-menu">
                        <ul class="navbar-list">
                            <li>
                                <h3 class="user-name">Hey, ${sessionScope.dto.username}</h3>
                            </li>
                            <li>
                                <span class="material-icons-outlined">account_circle</span>
                                <a href="shopGetDataForProfile" style="text-decoration: none">My profile</a>
                            </li>
                            <li>
                                <span class="material-symbols-outlined">
                                    logout
                                </span>
                                <a href="LogOutServlet" style="text-decoration: none">Log out</a>
                            </li>
                        </ul>
                    </div>
                </div>
    </header>

    <div id="closer" class="ri-close-line"></div>

    <!-- navbar start  -->

    <nav class="navbar">
      <a href="home.html">home</a>
      <a href="shop.html">shop</a>
      <a href="about.html">view sale</a>
      <a href="blog.html">blog</a>
      <a href="contact.html">contact for client</a>
    </nav>

    <!-- navbar end  -->

    <!-- login form start  -->

    <div class="login-form">
      <form action="#">
        <h3>login form</h3>
        <input type="email" placeholder="enter your email" class="box" />
        <input type="password" placeholder="enter your password" class="box" />
        <div class="remember">
          <input type="checkbox" name="" id="remember-me" />
          <label for="remember-me">remember me</label>
        </div>
        <input type="submit" value="login now" class="btn" />
        <input type="submit" value="Use google" class="btn" />
        <p>forget password? <a href="#">click here</a></p>
        <p>don't have an account? <a href="#">create now</a></p>
      </form>
    </div>

    <!-- heading section start -->
    <section class="heading" style="color:#faf8f6; background-color: #faf8f6; ; padding: 2px;">
    </section>
  

    <!-- heading section end -->

     <!-- img product start -->
    <section class="userInfo">
     
      <div class="form-group product">
          <figure class="form-product-img">
              <img class="img-product"  id="image" src="https://static.vecteezy.com/system/resources/previews/000/583/100/original/vector-button-plus-icon.jpg" alt="">
                  
          </figure>
          <div class="form-inline col-md-10 col-sm-9 col-xs-12">
              <input style="margin-left: 10px;" id="photo" type="file" class="file-uploader pull-left">
              <button id="upload" onclick="uploadImage()" type="see-update " class="button-img-see">See</button>


              <form action="DispatcherServlet">
              <input id="inputTag" type="hidden" value="" name="imageInput" >
           
              
            
          </div>
      </div>
      <!-- img product end -->

          
      
    <!-- update info -->

    <section class="userInfo">
        <h3>Update product ${requestScope.ExistErr}</h3>
	<div class="user__details">
		<div class="input__box">
		  <span class="details">Product name</span>
                  <input name="productname" type="text" placeholder=""  >
		</div>
	
    <div class="input__box">
		  <span class="details">Category</span>
      <select style="padding: 10px;"  class="details" name="category" >
        <option style="padding: 10px;" value="Bird"> Bird</option>
        <option value="Food"> Food</option>
        <option value="Bird toy"> Bird toy</option>
      </select>
		</div>

	
    <div class="input__box">
		  <span class="details"> Species  </span>
                  <input name="type" type="text" placeholder=""  >
		</div>

    <div class="input__box">
		  <span class="details"> Quantity  </span>
                  <input name="quantity" type="number"  min="0" placeholder=""  >
		</div>
	      </div>
  
    </section>

    <!-- update info end -->
    
     <!-- update info -->

     <section class="userInfo">
      <h3>Details</h3>
      <div class="user__details">
        <div class="input__box">
          <span class="details">Description </span>
         <!-- <input name="description" type="text" placeholder=""  >-->
         <textarea style="width: 500px; height: 300px;" name="description" type="text" placeholder=""  >
              
          </textarea>
        </div>
      
        <div class="input__box">
          <span class="details">Price</span>
          <input name="price" type="text" placeholder="" min="0"  >
        </div>
            </div>
        </section>
    
        <!-- update info end -->
         <!-- update info -->

     <section class="userInfo">
      <h3>Other information</h3>
      <div class="user__details">
        
        <div class="input__box">
          <span  class="details">Sale</span>
          <input name="sale" type="text" placeholder="" pattern="[0-9]{1,2}(\.[0-9]{1,2})?%?" title="Enter a value between 0 and 1"  >
          <div class="error-message">Please enter a valid value between 0% and 90%.</div>
        </div>
        
        <div class="input__box">
          <span class="details">Status </span>
          <select  style="padding: 10px;"  class="details" name="status" >
            <option style="padding: 10px;" value="Available"> Available</option>
            <option value="Not Available"> Not available</option>
          </select>
        </div>
            </div>
        </section>
    
        <!-- update info end -->



           <section class="check-out">

	<div class="confirm-box">
            
		<div class="line"></div>
                <a class="check-out__delete" href="shopDashboardController">Cancel</a>
		<div class="ip-checkout">
                    <input name="MAIN" type="submit" value="Add product">
      </a>
		</div>
	</div>
    </section>
        <!-- insert productID here  -->
        <input type="hidden" name="productID" value="1" />
        </form>

    <section class="credit">
        shopemail@gmail.com | +84 123456789
    </section>
    <!-- footer section end  -->
     <%@include file="LoadingAnimationCover.jsp" %>

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
                                            var waiting = document.getElementById("waiting");
                                            waiting.style.display = "block";
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
                                                        
                                                        document.querySelector("#image").src = url;

                                                        if (url != "") {
                                                            document.querySelector("#inputTag").value = url;
                                                            document.querySelector("#inputTag").placeholder = url;
                                                        }

                                                        var element = document.querySelector("#NeedHide");
                                                        element.style.display = "none";


                                                    })
                                                    .catch((err) => console.log(err))
                                                    .finally(() => {
                                                        // Hoàn thành quá trình upload ảnh
                                                        waiting.style.display = "none"; // Ẩn loading animation
                                                    });
                                        }
                                                    const errorMsgElement = document.querySelector('span#errorMsg');
    </script>
  
    <script src="js/addProductHeader.js"></script>
</html>
