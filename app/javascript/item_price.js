window.addEventListener('load', function(){

const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    console.log(inputValue);

  const priceTax = document.getElementById("add-tax-price");
  priceTax.innerHTML = Math.floor(priceInput.value * 0.1)
  console.log(priceInput);

  const priceProfit = document.getElementById("profit");
  priceProfit.innerHTML = Math.floor(priceInput.value * 0.9)
  console.log(priceTax);
  })
})