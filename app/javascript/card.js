const pay = () => {
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("購入時にイベント発火")
  });
};

window.addEventListener("load", pay);