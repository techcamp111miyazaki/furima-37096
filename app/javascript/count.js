window.addEventListener('load', () => {
  if ( document.getElementById('item-price')){
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
      const addProfitDom = document.getElementById("profit");
      addProfitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
    });
  }
});
