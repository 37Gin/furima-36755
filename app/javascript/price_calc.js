function price_calc () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const inputValueTax = Math.floor(inputValue * 0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValueTax;
    const saleProfit = document.getElementById("profit");
    saleProfit.innerHTML = inputValue - inputValueTax;
  });
};

window.addEventListener('load', price_calc);