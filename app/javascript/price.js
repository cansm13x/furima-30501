window.addEventListener('load', () =>{
  const priceInput = document.getElementById("price");
  priceInput.addEventListener("input", () => {
    console.log("イベント発火");
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