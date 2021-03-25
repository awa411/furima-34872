if ((document.URL.match( /new/ ) || document.URL.match( /edit/ ))&&!(document.URL.match( /cards/ ))) {
  function calc (){
    const item_price = document.getElementById("item-price");
      item_price.addEventListener('input', function (){
        const price_value = item_price.value;
        const add_tax_price = document.getElementById("add-tax-price");
        const profit = document.getElementById("profit");
        function calc_tax (p) {
          return p * 0.1;
        } 
        add_tax_price.innerHTML = `${calc_tax(price_value)}`;
        profit.innerHTML = `${price_value - calc_tax(price_value)}`;
      
      } )

    
    
  };

  window.addEventListener('load', calc);
}