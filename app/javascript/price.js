window.addEventListener('load', () =>{
  const priceInput = document.getElementById("price");
  priceInput.addEventListener("input", () => {
    const inputValue = document.getElementById("price").value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const priceProfit = document.getElementById("profit");
    priceProfit.innerHTML = Math.floor(inputValue * 0.9);
    console.log(inputValue);
  })
})