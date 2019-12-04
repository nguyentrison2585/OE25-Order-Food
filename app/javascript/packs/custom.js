$(document).ready(function() {
  if (typeof(Storage) !== "undefined") {
    var addButtons = $('.btn-adding');
    var resetButton = $('#btn-reset');
    var dishNames = $('.item-restaurant-name');
    var dishPrices = $('.current-price');
    var totalOrderNumber = $('#total-order-number');
    var orderCardGroup = $('#now-order-card-group');
    var totalAmounts = $('.total-amount');
    var orderNumbers, billDishNames, billDishPrices, plusButtons, minusButtons;

    checkToStartSession();
    totalOrderNumber.text(sessionStorage['total-order-number']);

    for (let i = 0;i < sessionStorage['storage-lenght'];i++) {
      addSessionItem(i);
      totalAmounts[0].textContent = sessionStorage['total-amount'];
      totalAmounts[1].textContent = sessionStorage['total-amount'];
      plusButtons = $('.fa-plus-square');
      minusButtons = $('.fa-minus-square');
      let num = plusButtons.length-1;
      plusButtons[num].addEventListener('click', function(){plusItem(this);});
      minusButtons[num].addEventListener('click', function(){minusItem(this);});
    }

    orderNumbers = $('.number-order');
    billDishNames = $('.name-order');
    billDishPrices = $('.price-order');

    _.forEach(addButtons, function(button, index) {
      button.addEventListener('click', function(){ addItem(index, this); });
    });

    resetButton.on('click', resetOrder);

    $('#dropbtn').on('click', dropdown);

    function dropdown() {
      $('#myDropdown').toggleClass('show');
    }

    window.onclick = function(event) {
      if (!event.target.matches('.dropbtn')) {
        var dropdowns = $('.dropdown-content');
        for (let i = 0; i < dropdowns.length; i++) {
          var openDropdown = $(dropdowns[i]);
          openDropdown.removeClass('show');
        }
      }
    }

    function checkToStartSession() {
      if (sessionStorage.getItem('storage-lenght') === null) {
        sessionStorage['storage-lenght'] = 0;
      }

      if (sessionStorage.getItem('total-order-number') === null) {
        sessionStorage['total-order-number'] = 0;
      }
    }

    function resetOrder() {
      totalOrderNumber.text(0);
      resetTotalAmount();
      sessionStorage.clear();
      orderCardGroup.empty();
      billDishNames = $('.name-order');
    }

    function resetTotalAmount() {
      totalAmounts[0].textContent = 0;
      totalAmounts[1].textContent = 0;
    }

    function increaseTotalNumber() {
      var number = totalOrderNumber.text();
      totalOrderNumber.text(parseInt(number) + 1);
      sessionStorage['total-order-number'] = parseInt(number) + 1;
    }

    function decreaseTotalNumber() {
      var number = totalOrderNumber.text();
      totalOrderNumber.text(parseInt(number) - 1);
      sessionStorage['total-order-number'] = parseInt(number) - 1;
    }

    function increaseNumber(j) {
      var orderNumber = parseInt(orderNumbers[j].textContent);
      orderNumber++;
      orderNumbers[j].textContent = orderNumber;
    }

    function decreaseNumber(j) {
      var orderNumber = parseInt(orderNumbers[j].textContent);
      orderNumber--;
      orderNumbers[j].textContent = orderNumber;
    }

    function increaseAmount(index) {
      var totalAmount = parseInt(totalAmounts[0].textContent);
      var dishPrice = parseInt(dishPrices[index].textContent);
      totalAmount += dishPrice;

      totalAmounts[0].textContent = totalAmount;
      totalAmounts[1].textContent = totalAmount;
    }

    function increaseItemAndTotal(i, j) {
      increaseAmount(i);
      var dishPrice = parseInt(dishPrices[i].textContent);
      var itemAmount = parseInt(billDishPrices[j].textContent);

      itemAmount += dishPrice;
      billDishPrices[j].textContent = itemAmount + " đ";
    }

    function decreaseTotal(i) {
      var totalAmount = parseInt(totalAmounts[0].textContent);
      var dishPrice = parseInt(dishPrices[i].textContent);
      totalAmount -= dishPrice;
      totalAmounts[0].textContent = totalAmount;
      totalAmounts[1].textContent = totalAmount;
    }

    function decreaseItemAndTotal(i, j) {
      var totalAmount = parseInt(totalAmounts[0].textContent);
      var dishPrice = parseInt(dishPrices[i].textContent);
      itemAmount = parseInt(billDishPrices[j].textContent);
      itemAmount -= dishPrice;
      totalAmount -= dishPrice;
      totalAmounts[0].textContent = totalAmount;
      totalAmounts[1].textContent = totalAmount;
      billDishPrices[j].textContent = itemAmount + " đ";
    }

    function addItem(index, btn) {
      checkToStartSession();
      var j, check = false;
      for (j = 0;j < billDishNames.length; j++) {
        if (billDishNames[j].textContent == dishNames[index].textContent)
        {
          check = true;
          break;
        }
      }

      if (check == true) {
        increaseNumber(j);
        increaseItemAndTotal(index, j);

        sessionStorage['order-number-' + j] = parseInt(orderNumbers[j].
          textContent);
        sessionStorage['order-price-' + j] = parseInt(billDishPrices[j].
          textContent);
        sessionStorage['order-id-' + j] = $(btn).attr('data-id');
        sessionStorage['total-amount'] = parseInt(totalAmounts[0].textContent);

      }
      else {
        addOrderItem(index, $(btn).attr('data-id'));
        increaseAmount(index);

        orderNumbers = $('.number-order');
        billDishNames = $('.name-order');
        billDishPrices = $('.price-order');
        plusButtons = $('.fa-plus-square');
        minusButtons = $('.fa-minus-square');

        let num = plusButtons.length-1;

        plusButtons[num].addEventListener('click', function(){
          plusItem(this);
        });
        minusButtons[num].addEventListener('click', function(){
          minusItem(this);
        });

        sessionStorage['order-id-' + sessionStorage['storage-lenght']] = $(btn).attr('data-id');
        sessionStorage['order-name-' + sessionStorage['storage-lenght']] =
          billDishNames[sessionStorage['storage-lenght']].textContent;
        sessionStorage['order-number-' + sessionStorage['storage-lenght']] =
          parseInt(orderNumbers[sessionStorage['storage-lenght']].textContent);
        sessionStorage['order-price-' + sessionStorage['storage-lenght']] =
          parseInt(billDishPrices[sessionStorage['storage-lenght']].textContent);
        sessionStorage['total-amount'] = parseInt(totalAmounts[0].textContent);
        sessionStorage['storage-lenght']++;
      }
      increaseTotalNumber();
    }

    function addSessionItem(index) {
      var orderItem = document.createElement('div');
      orderItem.classList.add('order-card-item');

      var clearfix = document.createElement('div');
      clearfix.classList.add('clearfix');

      var plusButton = document.createElement('button');
      plusButton.classList.add('fas');
      plusButton.classList.add('fa-plus-square');
      clearfix.appendChild(plusButton);

      var numberOrder = document.createElement('span');
      numberOrder.classList.add('number-order');
      var txtNumber = document.createTextNode(sessionStorage['order-number-' +
        index]);
      numberOrder.appendChild(txtNumber);
      clearfix.appendChild(numberOrder);

      var minusButton = document.createElement('button');
      minusButton.classList.add('fas');
      minusButton.classList.add('fa-minus-square');
      clearfix.appendChild(minusButton);

      var nameOrder = document.createElement('span');
      nameOrder.classList.add('name-order');
      var txtName = document.createTextNode(sessionStorage['order-name-' +
        index]);
      nameOrder.setAttribute('data-id', 'pick-' + sessionStorage['order-id-' + index].split('-')[0]);
      nameOrder.appendChild(txtName);
      clearfix.appendChild(nameOrder);

      var priceOrder = document.createElement('span');
      priceOrder.classList.add('price-order');
      var txtPrice = document.createTextNode(sessionStorage['order-price-' +
        index] + " đ");
      priceOrder.appendChild(txtPrice);
      clearfix.appendChild(priceOrder);

      orderItem.appendChild(clearfix);
      orderCardGroup.append(orderItem);
    }

    function addOrderItem(index, dishId) {
      var orderItem = document.createElement('div');
      orderItem.classList.add('order-card-item');

      var clearfix = document.createElement('div');
      clearfix.classList.add('clearfix');

      var plusButton = document.createElement('button');
      plusButton.classList.add('fas');
      plusButton.classList.add('fa-plus-square');
      clearfix.appendChild(plusButton);

      var numberOrder = document.createElement('span');
      numberOrder.classList.add('number-order');
      var txtNumber = document.createTextNode('1');
      numberOrder.appendChild(txtNumber);
      clearfix.appendChild(numberOrder);

      var minusButton = document.createElement('button');
      minusButton.classList.add('fas');
      minusButton.classList.add('fa-minus-square');
      clearfix.appendChild(minusButton);

      var nameOrder = document.createElement('span');
      nameOrder.classList.add('name-order');
      nameOrder.setAttribute('data-id', 'pick-' + dishId);
      var txtName = document.createTextNode(dishNames[index].innerHTML);
      nameOrder.appendChild(txtName);
      clearfix.appendChild(nameOrder);

      var priceOrder = document.createElement('span');
      priceOrder.classList.add('price-order');
      var txtPrice = document.createTextNode(dishPrices[index].textContent);
      priceOrder.appendChild(txtPrice);
      clearfix.appendChild(priceOrder);

      orderItem.appendChild(clearfix);
      orderCardGroup.append(orderItem);
    }

    function plusItem(button) {
      var dishName = button.parentNode.getElementsByClassName('name-order')[0].
        textContent;

      var i;
      for (i = 0;i < dishNames.length; i++) {
        if (dishNames[i].textContent == dishName){
          break;
        }
      }

      var j;
      for (j = 0;j < plusButtons.length;j++) {
        if (plusButtons[j] == button) {
          break;
        }
      }

      increaseNumber(j);
      increaseItemAndTotal(i, j);
      increaseTotalNumber();

      sessionStorage['order-number-' + j] = parseInt(orderNumbers[j].
        textContent);
      sessionStorage['order-price-' + j] = parseInt(billDishPrices[j].
        textContent);
      sessionStorage['total-amount'] = parseInt(totalAmounts[0].textContent);
    }

    function minusItem(button) {
      var parent = button.parentNode;
      var number = parseInt(parent.getElementsByClassName('number-order')[0].
        textContent);
      var dishName = parent.getElementsByClassName('name-order')[0].textContent;

      var i;
      for (i = 0;i < dishNames.length; i++) {
        if (dishNames[i].textContent == dishName)
          break;
      }

      var j;
      for (j = 0;j < minusButtons.length;j++) {
        if (minusButtons[j] == button) {
          break;
        }
      }

      if (number == 1) {
        var grandparent = parent.parentElement;
        grandparent.remove();

        var orderItems = $('.order-card-item');
        if (orderItems.length == 0) {
          totalAmounts[0].textContent = 0;
          totalAmounts[1].textContent = 0;
        }
        else {
          decreaseTotal(i)
          for (let index = j;index < sessionStorage['storage-lenght'];index++) {
            sessionStorage['order-name-' + index] =
              sessionStorage['order-name-' + (index+1)];
            sessionStorage['order-number-' + index] =
              sessionStorage['order-number-' + (index+1)];
            sessionStorage['order-price-' + index] =
              sessionStorage['order-price-' + (index+1)];
            sessionStorage['total-amount'] = parseInt(totalAmounts[0].
              textContent);
          }
        }
        billDishNames = $('.name-order');
        sessionStorage['storage-lenght']--;
      }
      else {
        decreaseNumber(j);
        decreaseItemAndTotal(i, j);
        sessionStorage['order-number-' + j] = parseInt(orderNumbers[j].
          textContent);
        sessionStorage['order-price-' + j] = parseInt(billDishPrices[j].
          textContent);
        sessionStorage['total-amount'] = parseInt(totalAmounts[0].
          textContent);
      }
      decreaseTotalNumber();
    }
  }
});
