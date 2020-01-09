$(document).ready(function(){
  if ($('#restaurant_image').length > 0) {
    $('#restaurant_image').on('change', function() {
      var reader = new FileReader();

      reader.onloadend = function() {
        $('#load_res_image').prop('src', reader.result)
      }
      reader.readAsDataURL(this.files[0]);
    });
  }
  if ($('#user_image').length > 0) {
    $('#user_image').on('change', function() {
      var reader = new FileReader();

      reader.onloadend = function() {
        $('#load_user_image').prop('src', reader.result)
      }
      reader.readAsDataURL(this.files[0]);
    });
  }
  if ($('#dish_image').length > 0) {
    $('#dish_image').on('change', function() {
      var reader = new FileReader();

      reader.onloadend = function() {
        $('#load_dish_image').prop('src', reader.result)
      }
      reader.readAsDataURL(this.files[0]);
    });
  }
  if ($('#combo_image').length > 0) {
    $('#combo_image').on('change', function() {
      var reader = new FileReader();

      reader.onloadend = function() {
        $('#load_combo_image').prop('src', reader.result)
      }
      reader.readAsDataURL(this.files[0]);
    });
  }
  if ($('#new_restaurant_image').length > 0) {
    $('#new_restaurant_image').on('change', function() {
      var reader = new FileReader();

      reader.onloadend = function() {
        $('#load_create_res_image').prop('src', reader.result)
      }
      reader.readAsDataURL(this.files[0]);
    });
  }
});
