window.addEventListener('load', function(){

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    console.log(inputValue);
})

const pricetaxInput = document.getElementById("add-tax-price");
addTaxPrice.innerHTML = "入力した金額をもとに販売手数料を計算する処理"
console.log(pricetaxInput);


const priceprofitInput = document.getElementById("profit");
console.log(priceprofitInput);
})