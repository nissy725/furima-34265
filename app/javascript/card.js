const pay = () => {
  Payjp.setPublicKey("pk_test_c61b7bd1add41d6058686afc");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_history_address[number]"),
      exp_month: formData.get("purchase_history_address[exp_month]"),
      exp_year: `20${formData.get("purchase_history_address[exp_year]")}`,
      cvc: formData.get("purchase_history_address[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("purchase_history_address_number").removeAttribute("name");
      document.getElementById("purchase_history_address_month").removeAttribute("name");
      document.getElementById("purchase_history_address_year").removeAttribute("name");
      document.getElementById("purchase_history_address_cvc").removeAttribute("name");
    });
  });
};

window.addEventListener("load", pay);