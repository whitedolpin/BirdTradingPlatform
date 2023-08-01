/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */






function showDeleteAccForm() {
    var addFBForm = document.getElementById("AddFBform");
    addFBForm.style.display = "block";
    
  }
  function Hidden() {
    var addFBForm = document.getElementById("AddFBform");
    addFBForm.style = "display: none";
    
  }


  function HiddenDeleteAccForm(id) {
      var name = "detail" +id;
    var addFBForm = document.getElementById(name);
    addFBForm.style.display = "none";
  }


