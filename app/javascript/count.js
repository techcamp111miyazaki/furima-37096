// const tax = 0.1;
// function count (){
//   const numPrice = Number(document.getElementById("item-price").price);
//     function add_tax_price(numPrice,tax){
//       return numPrice * tax
//     };
//     function profit(numPrice,add_tax_price){
//       return numPrice - add_tax_price
//     };
//     document.getElementById("add_tax_price").innerHTML = add_tax_price(numPrice,tax);
//     document.getElementById("profit").innerHTML = add_tax_price(numPrice,add_tax_price);
//   }

// window.addEventListener('load', count);

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
     const addProfitDom = document.getElementById("profit");
     addProfitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
 })
});
