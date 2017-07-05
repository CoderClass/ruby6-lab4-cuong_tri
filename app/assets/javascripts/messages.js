// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
window.updateMessagesViaJSON = function() {
  console.log("inside updateMessagesViaJSON");
  $.getJSON("http://localhost:3000/rooms/1/messages.json", function(data) {
    // this is the data you receive from http://localhost:3000/rooms/1/messages.json
    // loop through the messages and render them
    // you can use $(".messages").append("blah") 
    // to add blah to the <div class="messages">...</div> element
    $('.messages').html('');
    $.each(data['messages'], function(key, value) {
      console.log(value);
      $('.messages').append('<li>'+value.content+'</li>');
    })  

    console.log('debug');
  })
}