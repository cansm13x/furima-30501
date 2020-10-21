window.addEventListener('load', () =>{
  const priceInput = document.getElementById("price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  })
  const priceTax = document.getElementById("add-tax-price");
  priceTax.addEventListener("input", () => {
    console.log(priceTax);
  })
  const priceProfit = document.getElementById("profit");
  priceProfit.addEventListener("input", () => {
    console.log(priceProfit);
  })
})