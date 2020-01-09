function addDishToCombo(div) {
  var dishName = $(div).find('.dishes-table-col1')[0].textContent;
  var dishImageSrc = $(div).find('.dishes-table-col2 img').attr('src');
  var dishPrice = ($(div).find('.dishes-table-col3'))[0].textContent;
  var dishId = div.dataset.id;

  var dishRow = `<div class='dishes-table-row dishes-table-item' data-id='\
  ${dishId}\
  '>
  <div class='dishes-table-cell dishes-table-col1'>\
  ${dishName}\
  </div>
  <div class='dishes-table-cell dishes-table-col2'>
  <img src='\
  ${dishImageSrc}\
  '>
  </div>
  <div class='dishes-table-cell dishes-table-col3'>\
  ${dishPrice}\
  </div>
  <div class='dishes-table-cell dishes-table-col4'>
  <input type='number', min='0', step='1', value='1', required='true'/>
  </div>
  <div class='dishes-table-cell dishes-table-col5'>
  <button type = "button" class="del-dish-from-cb">
  <i class="fas fa-times"></i>
  </button>
  </div>
  </div>`;
  $('#dishes-group').append(dishRow);

  deleteBtns = $('.del-dish-from-cb');
  deleteBtns[deleteBtns.length-1].addEventListener('click', function() {
    delDishFromCb(this);
  });
  $(div).remove();
}

function delDishFromCb(btn) {
  console.log('click');
  var dishName = $(btn).parent().parent().find('.dishes-table-col1')[0].textContent;
  var dishImageSrc = $(btn).parent().parent().find('.dishes-table-col2 img').attr('src');
  var dishPrice = $(btn).parent().parent().find('.dishes-table-col3')[0].textContent;
  var dishId = $(btn).parent().parent().attr('data-id');

  var dishRow = `<div class='dishes-table-row dishes-table-item' data-id='\
  ${dishId}\
  '>
  <div class='dishes-table-cell dishes-table-col1'>\
  ${dishName}\
  </div>
  <div class='dishes-table-cell dishes-table-col2'>
  <img src='\
  ${dishImageSrc}\
  '>
  </div>
  <div class='dishes-table-cell dishes-table-col3'>\
  ${dishPrice}\
  </div>
  </div>`;
  $('#dishes-list').append(dishRow);

  dishes = $('#dishes-list').find('.dishes-table-item');
  dishes[dishes.length-1].addEventListener('click', function() {
    addDishToCombo(this);
  });

  $(btn).parent().parent().remove();
}
