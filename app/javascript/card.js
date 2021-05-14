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
  });
};

window.addEventListener("load", pay);