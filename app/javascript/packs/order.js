$(document).ready(function(){
  var form = $("#submit-form");
  var formData = new FormData($('form#submit-form')[0]);

  $('#button_order').on('click', function(e){
    $('.order-list').empty();
    var ordersLength = $('.order-card-item').length;
    if (ordersLength == 0)
    {
      e.stopPropagation();
      return;
    }

    for(var i=0; i < ordersLength;i++){
      var dishId = $('.name-order')[i].dataset.id;
      var numberOrder = $('.number-order')[i].textContent;

      formData.append('order[order_details_attributes][' + i + '][order_detailable_type]', 'Dish');
      formData.append('order[order_details_attributes][' + i + '][amount]', parseInt($('.price-order')[i].textContent));
      formData.append('order[order_details_attributes][' + i + '][count]', numberOrder);
      formData.append('order[order_details_attributes][' + i + '][order_detailable_id]', dishId.split('-')[1]);

      var nameOrder = $('.name-order')[i].textContent;
      var priceOrder = $('.price-order')[i].textContent;

      var render = `<div class='order-item'><span class='order-item-number'>\
      ${numberOrder}\
      </span><div class='order-item-info'><div class='order-item-name'><span class='txt-bold'>\
      ${nameOrder}\
      &nbsp;</span></div><div class='order-item-note'></div></div><div class='order-item-price'><span>\
      ${priceOrder}\
      </span></div></div>`
      $('.order-list').append(render);
    }

    render1 = $('.total-amount')[0].textContent;
    $('#total_amount').text(render1);
    formData.append('order[total_money]', render1);

    render2 = $('#total-order-number')[0].textContent;
    $('#number_set').text(render2);

    render3 = $('.fa-check-circle')[0].dataset.id;
    formData.append('order[restaurant_id]', render3);
  });

  $(document).on('click', '#btn-submit-form', function(e){
    e.preventDefault();
    formData.append('order[address]', $('#input-address').val());
    $.ajax({
      type: "POST",
      url: "/orders",
      data: formData,
      processData: false,
      contentType: false,
    });
    sessionStorage.clear();
  });
});
