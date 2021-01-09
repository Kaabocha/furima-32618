const pay = () => {
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_street[number]"),
      cvc: formData.get("order_street[cvc]"),
      exp_month: formData.get("order_street[exp_month]"),
      exp_year: `20${formData.get("order_street[exp_year]")}`,
    };
    console.log("フォーム送信時にイベント発火")
    console.log(card)
  });
};
window.addEventListener("load", pay);

    // const numberInput = document.getElementById("card-number");
    // numberInput.addEventListener("input", () => {

    // const monthInput = document.getElementById("card-exp-month");
    // monthInput.addEventListener("input", () => {

    // const yearInput = document.getElementById("card-exp-year");
    // yearInput.addEventListener("input", () => {
  
    // const cvcInput = document.getElementById("card-cvc");
    // cvcInput.addEventListener("input", () => {
  
