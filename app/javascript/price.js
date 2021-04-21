function price () {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("keyup", () =>{
    addTaxPrice.innerHTML = `${itemPrice.value * 0.1}`;
    profit.innerHTML = `${itemPrice.value * 0.9}`;
  });

}

window.addEventListener('load', price)