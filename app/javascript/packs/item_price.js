window.addEventListener('load', () => {
 const priceInput = document.getElementById("item-price");
 priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const tax = 0.1;
  const addTax = Math.floor(inputValue * tax);
  const profit = Math.floor(inputValue - addTax)

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = addTax;

  const profitDom = document.getElementById("profit");
  profitDom.innerHTML = profit;
});
})

