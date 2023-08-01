function sendMailRegister() {
    
    var params = {
      name: document.getElementById("name").value,
      email: document.getElementById("email").value,
      message: document.getElementById("message").value,
    };
  
    const serviceID = "service_06udlkn";
    const templateID = "template_iqgvq9b";
  
      emailjs.send(serviceID, templateID, params)
      .then(res=>{
          document.getElementById("name").value = "";
          document.getElementById("email").value = "";
          document.getElementById("message").value = "";
          console.log(res);
          alert("Your message sent successfully!!")
  
      })
      .catch(err=>console.log(err));
  
  }
  
 function sendMailChangeProfile() {
  var waiting = document.getElementById("waiting");
  waiting.style.display = "block";

  var params = {
    email: document.getElementById("email").value,
    message: document.getElementById("message").value,
  };

  const serviceID = "service_06udlkn";
  const templateID = "template_eztolvz";

  emailjs
    .send(serviceID, templateID, params)
    .then((res) => {
      document.getElementById("email").value = "";
      document.getElementById("message").value = "";
      console.log(res);
      alert("Your message sent successfully!!");
    })
    .catch((err) => console.log(err))
    .finally(() => {
      // Hoàn thành quá trình gửi mail
      waiting.style.display = "none"; // Ẩn loading animation
    });
}

  