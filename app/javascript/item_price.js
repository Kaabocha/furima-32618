window.addEventListener('load', function(){

const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value

  const priceTax = document.getElementById("add-tax-price");
  priceTax.innerHTML = Math.floor(priceInput.value * 0.1)

  const priceProfit = document.getElementById("profit");
  priceProfit.innerHTML = Math.floor(priceInput.value * 0.9)
  })
})