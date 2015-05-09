$(document).ready(function(){
  $('#button').on("click", function(){
    console.log("hello");
    $.ajax({
      type: "POST", 
      url: "/sms", 
      dataType: 'json',
      data: {
        phone_number: document.getElementById('number').value,
        number_of_texts: document.getElementById('amount').value, 
        name: document.getElementById('name').value
      }
    }).done(function(data){
      $("body").append("<p>Samuel has been sent, motherf***a</p>");
    });
  }); 
});
       
