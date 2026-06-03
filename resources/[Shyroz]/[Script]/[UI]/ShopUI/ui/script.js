document.addEventListener("DOMContentLoaded", () => {
    const shop = document.querySelector(".shop");
    const nameShopShop = document.querySelector(".name-shop");
    const nameShopPlayer = document.querySelector(".name-identity");
    const imageShop = document.querySelector(".header-img-shop");
    const itemContainerShop = document.querySelector(".itemContaineshop");
    const orderContainer = document.querySelector(".olderContaineshop");
    const totalPriceShop = document.querySelector(".shop-all-item-price");
    let selectedItems = {};
    let totalPrice = 0;

    function closeShop() {
        shop.style.display = "none";
        fetch(`https://${GetParentResourceName()}/closeShopNui`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
        });
    }

    function updateOrderUI() {
        orderContainer.innerHTML = "";
        totalPrice = 0;

        if (Object.keys(selectedItems).length === 0) {
            totalPriceShop.textContent = "0$";
            return;
        }

        Object.keys(selectedItems).forEach((key) => {
            const item = selectedItems[key];
            totalPrice += item.price * item.quantity;

            const orderItem = document.createElement("div");
            orderItem.className = "item-oder";
            orderItem.innerHTML = `
                <div class="div-wrapper">
                    <div class="numberSelectedShop">${item.quantity}</div>
                </div>
                <div class="frame-2">
                    <div class="nameItemSelectedShop">${item.name}</div>
                    <div class="priceItemSelectedShop">${item.price * item.quantity}$</div>
                </div>
                <div class="multiply-wrapper" data-item="${key}">
                    <img class="multiplyShop" src="/ui/img/multiply.png" />
                </div>
            `;

            orderContainer.appendChild(orderItem);
        });

        totalPriceShop.textContent = `${totalPrice}$`;

        document.querySelectorAll(".multiply-wrapper").forEach((btn) => {
            btn.addEventListener("click", (e) => {
                const itemKey = e.currentTarget.getAttribute("data-item");
                if (selectedItems[itemKey].quantity > 1) {
                    selectedItems[itemKey].quantity--;
                } else {
                    delete selectedItems[itemKey];
                }
                updateOrderUI();
            });
        });
    }

    function createItemsShop(items) {
        itemContainerShop.innerHTML = "";

        Object.keys(items).forEach((key) => {
            const item = items[key];
            const itemElement = document.createElement("div");
            itemElement.className = "item";
            itemElement.innerHTML = `
                <div class="frame-3">
                    <div class="priceItemShop">${item.price}$</div>
                </div>
                <div class="buttonDeleteOlderShop" data-item="${key}">
                    <img class="imgItemShop" src="${item.img}" />
                    <div class="frame-5">
                        <div class="nameItemShop">${item.name}</div>
                    </div>
                </div>
            `;

            itemContainerShop.appendChild(itemElement);
        });

        document.querySelectorAll(".buttonDeleteOlderShop").forEach((btn) => {
            btn.addEventListener("click", (e) => {
                const itemKey = e.currentTarget.getAttribute("data-item");
                if (!selectedItems[itemKey]) {
                    selectedItems[itemKey] = { ...items[itemKey], quantity: 1 };
                } else {
                    selectedItems[itemKey].quantity++;
                }
                updateOrderUI();
            });
        });
    }

    document.querySelector(".buttonShop").addEventListener("click", () => {
        if (Object.keys(selectedItems).length === 0) return;

        fetch(`https://${GetParentResourceName()}/processOrder`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ items: selectedItems, total: totalPrice }),
        }).then((response) => response.json()).then((data) => {
            if (data.success) {
                selectedItems = {};
                updateOrderUI();
            }
        });
    });

    window.addEventListener("message", (event) => {
        const { type, state, nameShop, namePlayer, img, item } = event.data;

        if (type === "shop") {
            if (state) {
                shop.style.display = "flex";
                nameShopShop.textContent = nameShop;
                nameShopPlayer.textContent = namePlayer;
                imageShop.src = img;
                selectedItems = {};
                createItemsShop(item);
                updateOrderUI();
            } else {
                closeShop();
            }
        }
    });

    document.addEventListener("keydown", (event) => {
        if (event.key === "Escape") {
            closeShop();
        }
    });
});
