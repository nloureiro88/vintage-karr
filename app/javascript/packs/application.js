import "bootstrap";
//import "bookings_pack.js";



// ************* Bookings review / description function *********************

jQuery(document).ready(function($) {
  $('.last-li').each(function() {
      $('ul.review-ul').hide();

      $(this).hover(function() {
         $(this).parent().next('ul.review-ul').fadeToggle();
         return false;
      });
   });
});

// ************* =//= *********************
