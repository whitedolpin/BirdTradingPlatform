
    // product detail

    const bigImg = document.querySelector('.img-big')
    const smallImg = document.querySelectorAll('.small-img')
    if(smallImg){
        smallImg.forEach(item => {
            item.addEventListener('mouseover',()=>{
                console.log(item.getAttribute('src'))
                bigImg.setAttribute('src', item.getAttribute('src'))
            })
        });
    }
    
    // delete confrim 

    function showDeleteConfirm(){
        let confirm = document.querySelector(".confirm-delete")
        let bg = document.querySelector(".bg")
        confirm.classList.add('active')
        bg.classList.add('active')
    }

    function closeDeleteConfirm(){
        let confirm = document.querySelector(".confirm-delete")
        let bg = document.querySelector(".bg")
        confirm.classList.remove('active')
        bg.classList.remove('active')
    }

   const checkOutDel =  document.querySelector('.check-out__delete')
   if(checkOutDel){
    checkOutDel.addEventListener("click",()=>{
        
        showDeleteConfirm()
    })
   }
   

    const closeDelete = document.querySelector('.btn-back')

    if(closeDelete){
        closeDelete.addEventListener("click",()=>{
            closeDeleteConfirm()
        })
    }
    


    const add = document.querySelectorAll('.add')
    if(add){
        add.forEach((item)=>{
            item.addEventListener("click",()=>{
                const quantityWrap = item.parentNode.parentNode
                const input = quantityWrap.querySelector('input')
                let value = parseInt(input.value) + 1
                input.value = value
            })
        })
    }

    const minus = document.querySelectorAll('.minus')
    if(minus){
        minus.forEach((item)=>{
            item.addEventListener("click",()=>{
                const quantityWrap = item.parentNode.parentNode
                const input = quantityWrap.querySelector('input')
                let value = parseInt(input.value) - 1
                if(value > 0){
                    input.value = value
                }
                else{
                    showDeleteConfirm()
                }
            })
        })
    
    }
   
   


document.addEventListener("scroll", ()=>{
    const checkOut = document.querySelector('.check-out')
    if(checkOut){
        if(window.scrollY < checkOut.offsetTop + checkOut.offsetHeight){
            checkOut.classList.add('active')
        }
        if(window.scrollY > checkOut.offsetTop + checkOut.offsetHeight){
            checkOut.classList.remove('active')
        }
    }
    
});

let closer = document.querySelector('#closer');

closer.onclick = () => {
    closer.style.display = 'none';
    navbar.classList.remove('active');
    cart.classList.remove('active');
    loginForm.classList.remove('active');
}

let navbar = document.querySelector('.navbar');

document.querySelector('#menu-btn').onclick = () => {
    closer.style.display = "block";
    navbar.classList.toggle('active');
}

let cart = document.querySelector('.shopping-cart');

document.querySelector('#cart-btn').onclick = () => {
    closer.style.display = "block";
    cart.classList.toggle('active');
}

let loginForm = document.querySelector('.login-form');

document.querySelector('#login-btn').onclick = () => {
    closer.style.display = "block";
    loginForm.classList.toggle('active');
}

let searchForm = document.querySelector('.header .search-form');

document.querySelector('#search-btn').onclick = () => {
    searchForm.classList.toggle('active');
}

var slides = document.querySelectorAll('.slide');
var currentSlide = 0;
var slideInterval = setInterval(nextSlide, 5500); // Tự động chuyển slide sau  giây

function nextSlide() {
    slides[currentSlide].className = 'slide';
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].className = 'slide active';
}
function next() {
    slides[index].classList.remove('active');
    index = (index + 1) % slides.length;
    slides[index].classList.add('active');
}

function prev() {
    slides[index].classList.remove('active');
    index = (index - 1 + slides.length) % slides.length;
    slides[index].classList.add('active');
}
const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});
/* sort section  */
    // Get the select element
    const sortSelect = document.getElementById("sort-select");

    // Add event listener to the select element
    sortSelect.addEventListener("change", function() {
        const sortValue = this.value; // Get the selected value

        // Get the box container element
        const boxContainer = document.querySelector(".box-container");

        // Get all the box elements
        const boxes = boxContainer.querySelectorAll(".box");

        // Convert the NodeList to an array for easier sorting
        const boxesArray = Array.from(boxes);

        // Sort the boxes based on the selected value
        switch (sortValue) {
            case "default":
                // Do nothing (retain the default order)
                break;
            case "price-asc":
                boxesArray.sort((a, b) => {
                    const priceA = parseFloat(a.querySelector(".price").textContent.replace("$", ""));
                    const priceB = parseFloat(b.querySelector(".price").textContent.replace("$", ""));
                    return priceA - priceB;
                });
                break;
            case "price-desc":
                boxesArray.sort((a, b) => {
                    const priceA = parseFloat(a.querySelector(".price").textContent.replace("$", ""));
                    const priceB = parseFloat(b.querySelector(".price").textContent.replace("$", ""));
                    return priceB - priceA;
                });
                break;
            case "name-asc":
                boxesArray.sort((a, b) => {
                    const nameA = a.querySelector("h3").textContent.toLowerCase();
                    const nameB = b.querySelector("h3").textContent.toLowerCase();
                    return nameA.localeCompare(nameB);
                });
                break;
            case "name-desc":
                boxesArray.sort((a, b) => {
                    const nameA = a.querySelector("h3").textContent.toLowerCase();
                    const nameB = b.querySelector("h3").textContent.toLowerCase();
                    return nameB.localeCompare(nameA);
                });
                break;
        }

        // Re-append the sorted boxes to the box container
        boxContainer.innerHTML = "";
        boxesArray.forEach(box => {
            boxContainer.appendChild(box);
        });
    });




    /*search*/
    
    let list = document.getElementById('list');
    let filter = document.querySelector('.filter');
    let count = document.getElementById('count');
    
    let productFilter = listProducts;
    showProduct(productFilter);
    function showProduct(productFilter){
        count.innerText = productFilter.length;
        list.innerHTML = '';
        productFilter.forEach(item => {
            let newItem = document.createElement('div');
            newItem.classList.add('item');
    
            // create image
            let newImage = new Image();
            newImage.src = item.image;
            newItem.appendChild(newImage);
            // create name product
            let newTitle = document.createElement('div');
            newTitle.classList.add('title');
            newTitle.innerText = item.name;
            newItem.appendChild(newTitle);
            // create price
            let newPrice = document.createElement('div');
            newPrice.classList.add('price');
            newPrice.innerText = item.price.toLocaleString() + ' đ';
            newItem.appendChild(newPrice);
    
            list.appendChild(newItem);
        });
    }
    filter.addEventListener('submit', function(event){
        event.preventDefault();
        let valueFilter = event.target.elements;
        productFilter = listProducts.filter(item => {
            // check category
            if(valueFilter.category.value != ''){
                if(item.nature.type != valueFilter.category.value){
                    return false;
                }
            }
            // check color
            if(valueFilter.color.value != ''){
                if(!item.nature.color.includes(valueFilter.color.value)){
                    return false;
                }
            }
            // check name
            if(valueFilter.name.value != ''){
                if(!item.name.includes(valueFilter.name.value)){
                    return false;
                }
            }
            // check min price
            if(valueFilter.minPrice.value != ''){
                if(item.price < valueFilter.minPrice.value){
                    return false;
                }
            }
            //  check max price
            if(valueFilter.maxPrice.value != ''){
                if(item.price > valueFilter.maxPrice.value){
                    return false;
                }
            }
    
    
            return true;
        })
        showProduct(productFilter);
    })



    /**/ 
    

    // function showEditModal() {
    //     const modal = document.getElementById('editModal');
    //     modal.style.display = 'block';
        
    //     // Fill the input fields with current values
    //     const username = document.getElementById('username');
    //     const phone = document.getElementById('phone');
    //     const address = document.getElementById('address');
        
    //     document.getElementById('editUsername').value = username.textContent;
    //     document.getElementById('editPhone').value = phone.textContent;
    //     document.getElementById('editAddress').value = address.textContent;
    //   }
      
    //   function hideEditModal() {
    //     const modal = document.getElementById('editModal');
    //     modal.style.display = 'none';
    //   }
      
    //   function updateUserInfo() {
    //     const username = document.getElementById('username');
    //     const phone = document.getElementById('phone');
    //     const address = document.getElementById('address');
        
    //     const editedUsername = document.getElementById('editUsername').value;
    //     const editedPhone = document.getElementById('editPhone').value;
    //     const editedAddress = document.getElementById('editAddress').value;
        
    //     username.textContent = editedUsername;
    //     phone.textContent = editedPhone;
    //     address.textContent = editedAddress;
        
    //     hideEditModal();
    //   }
      
    //   function saveChanges() {
    //     const modal = document.getElementById('editModal');
    //     const editBtn = document.querySelector('.edit-btn');
    //     const saveBtn = document.querySelector('.save-btn');
        
    //     modal.style.display = 'none';
    //     editBtn.style.display = 'block';
    //     saveBtn.style.display = 'none';
    //   }
      

    function showAddressModal() {
        const addressModal = document.getElementById('addressModal');
        addressModal.style.display = 'block';
        
        // Fill the user information in the address modal
        const username = document.getElementById('userInfoUsername').textContent;
        const phone = document.getElementById('userInfoPhone').textContent;
        const address = document.getElementById('userInfoAddress').textContent;
        
        document.getElementById('username').textContent = username;
        document.getElementById('phone').textContent = phone;
        document.getElementById('address').textContent = address;
        
        // Clear the address list
        const addressList = document.getElementById('addressList');
        addressList.innerHTML = '';
        
        // Display the addresses
        const savedAddresses = getUserAddresses();
        savedAddresses.forEach((address) => {
          const listItem = document.createElement('li');
          listItem.textContent = address;
          addressList.appendChild(listItem);
        });
      }

      function AddAddressModal() {
        const addModal = document.getElementById('addModal');
        addModal.style.display = 'block';
        
        // Fill the user information in the address modal
        const username = document.getElementById('userInfoUsername').textContent;
        const phone = document.getElementById('userInfoPhone').textContent;
        const address = document.getElementById('userInfoAddress').textContent;
        
        document.getElementById('addUsername').textContent = username;
        document.getElementById('addPhone').textContent = phone;
        document.getElementById('addAddress').textContent = address;
        
        // Clear the address list
      }
      function hideAddAddressModal() {
        const addModal = document.getElementById('addModal');
        addModal.style.display = 'none';
      }
      
      
      function showEditModal() {
        const editModal = document.getElementById('editModal');
        editModal.style.display = 'block';
        
        // Fill the input fields with current values
        const username = document.getElementById('userInfoUsername').textContent;
        const phone = document.getElementById('userInfoPhone').textContent;
        const address = document.getElementById('userInfoAddress').textContent;
        
        document.getElementById('editUsername').value = username;
        document.getElementById('editPhone').value = phone;
        document.getElementById('editAddress').value = address;
      }
      
      function hideEditModal() {
        const editModal = document.getElementById('editModal');
        editModal.style.display = 'none';
      }

      //

      //
      
      function updateUserInfo() {
        const username = document.getElementById('userInfoUsername');
        const phone = document.getElementById('userInfoPhone');
        const address = document.getElementById('userInfoAddress');
        
        const editedUsername = document.getElementById('editUsername').value;
        const editedPhone = document.getElementById('editPhone').value;
        const editedAddress = document.getElementById('editAddress').value;

        const addUsername = document.getElementById('addUsername').value;
        const addPhone = document.getElementById('addPhone').value;
        const addAddress = document.getElementById('addAddress').value;
        
        username.textContent = editedUsername;
        phone.textContent = editedPhone;
        address.textContent = editedAddress;

        username.textContent = addUsername;
        phone.textContent = addPhone;
        address.textContent = addAddress;
        
        hideEditModal();
      }
      
      function saveUserInfo() {
        const addressModal = document.getElementById('addressModal');
        addressModal.style.display = 'none';
        
        // Save the updated user information
        const username = document.getElementById('userInfoUsername').textContent;
        const phone = document.getElementById('userInfoPhone').textContent;
        const address = document.getElementById('userInfoAddress').textContent;
        
        // Save the address to the list
        const addressList = document.getElementById('addressList');
        const newAddress = document.createElement('li');
        newAddress.textContent = address;
        addressList.appendChild(newAddress);
        
        // Clear the input fields
        document.getElementById('editUsername').value = '';
        document.getElementById('editPhone').value = '';
        document.getElementById('editAddress').value = '';

        // Clear the input fields
        document.getElementById('addUsername').value = '';
        document.getElementById('addPhone').value = '';
        document.getElementById('addAddress').value = '';
      }
      
      function getUserAddresses() {
        // In this example, we use a hardcoded array as a placeholder
        // You can replace this with your own logic to fetch the addresses from a database or an API
        return [
          
        ];
      }

        /*reply*/
        function toggleReplyContainer() {
            var replyContainer = document.querySelector('.replyContainer');
            replyContainer.style.display = replyContainer.style.display === 'none' ? 'block' : 'none';
        }
      