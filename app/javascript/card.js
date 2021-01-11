const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);            //PAY.JPの公開鍵
  const form = document.getElementById("charge-form");         //form_withのidの取得
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_street[number]"),   //カード情報のname属性を取得
      cvc: formData.get("order_street[cvc]"),   //セキュリティコードのname属性を取得
      exp_month: formData.get("order_street[exp_month]"),   //有効期限(月)のname属性を取得
      exp_year: `20${formData.get("order_street[exp_year]")}`   //有効期限(年)のname属性を取得
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        console.log(token)
      }

      document.getElementById("card-number").removeAttribute("name");   //カード番号の情報を削除
      document.getElementById("card-cvc").removeAttribute("name");      //セキュリティコードの情報を削除
      document.getElementById("card-exp-month").removeAttribute("name");   //有効期限(月)の情報を削除
      document.getElementById("card-exp-year").removeAttribute("name");   //有効期限(年)の情報を削除

      document.getElementById("charge-form").submit();   //フォームの情報をサーバーサイドに送信

    });
  });
};
window.addEventListener("load", pay);   //ページが読み込まれた時にイベントを発火

