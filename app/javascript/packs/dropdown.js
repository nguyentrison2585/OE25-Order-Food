$(document).ready(function() {
  $(document).on("click","#user-dropdown",function() {
    dropdown();
  });

  function dropdown() {
    $('#drop-menu').toggleClass('show');
  }

  window.onclick = function(event) {
    if (!event.target.matches('.dropdown')) {
      var dropdowns = $('.dropdown-menu');
      for (let i = 0; i < dropdowns.length; i++) {
        var openDropdown = $(dropdowns[i]);
        openDropdown.removeClass('show');
      }
    }
  }

  $('.item-navigation').on('click', function(){
    shownav(this);
  });

  function shownav(nav) {
    $(nav).toggleClass('active');
    $(nav).find('.sub-navigation').toggleClass('show');
    $(nav).siblings().find('.sub-navigation').removeClass('show');
    $(nav).siblings().removeClass('active');
  }
});
