
jQuery(document).ready(function($) {
  $('.last-li').each(function() {
      $('ul.review-ul').hide();

      $(this).click(function() {
         $(this).parent().next('ul.review-ul').fadeToggle();
         return false;
      });
   });
});
