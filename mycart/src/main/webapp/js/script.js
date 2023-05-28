function add_to_cart(pid, pname, price)
{

    let cart = localStorage.getItem("cart");
    if (cart == null)
    {

        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Product is added for first time")
        showToast("Item is added to cart")

    } else
    {

        //cart is  already present
        let pcart = JSON.parse(cart);///parse an array

        //below is callback function
        let oldProduct = pcart.find((item) => item.productId == pid)

        if (oldProduct) {

            // We have to increase the quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            pcart.map((item) => {

                if (item.productId == oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })

            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Producy Quanity increased");
            showToast(" Product Quantity is increased, Quantity: " + oldProduct.productQuantity)

        } else
        {

            //we have to add product    
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added");
            showToast("Product is added to cart")

        }

    }

    updateCart();


}

function updateCart() {
    let cartString = localStorage.getItem("cart");//This is string
    let cart = JSON.parse(cartString);//creating JSON object from string

    if (cart == null || cart.length == 0) {
        console.log("cart is empty..!");

        //Using JQuery to set class "cart-items" in navbar.jsp to zero
        $(".cart-items").html("( 0 )");

        //Using Jquery to set message for class "cart-body" in common_modals.jsp
        $(".cart-body").html("<h3>Cart does not have any items</h3>");

        //Using Jquery to disable checkout button
        //$(".checkout-btn").addClass('disabled');
        $(".checkout-btn").attr("disabled", true)

    } else {

        //There is something in cart to show
        console.log(cart);
        $(".cart-items").html("( " + $(cart).length + " )");

        let table = `
                    <table class = 'table'>
                    <thead class='thead-light'>
    
                    <tr>
    
                    <th>Item name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Action</th>
    
                    </tr>   
    
                    </thead>
                    `;
        
        let totalPrice = 0;
        cart.map((item) => {


            table += `
                       <tr>
                        <td> ${item.productName} </td>
                        <td> ${item.productPrice} </td>
                        <td> ${item.productQuantity} </td>
                        <td> ${item.productQuantity * item.productPrice} </td>
                        <td> <button onclick = 'deleteItemFromCart(${item.productId})'  class='btn btn-danger btn-sm'>Remove</button></td>
                       </tr>
                        `
            totalPrice += item.productPrice * item.productQuantity;

        })

        table = table + `
        <tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price: ${totalPrice}</td></tr>
        </table>`
        $(".cart-body").html(table);
        
        
        //Using Jquery to disable checkout button
        //$(".checkout-btn").removeClass('disabled');
        $(".checkout-btn").attr("disabled", false)


    }
}


//delete item
function deleteItemFromCart(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));
    
    let newcart = cart.filter((item) => item.productId != pid)
    
    localStorage.setItem('cart', JSON.stringify(newcart))
    
    updateCart();
    
    showToast("Item removed from cart")
    
}

$(document).ready(function () {
    updateCart()
})

function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    
    //Arrow function
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}


function goToCheckout(){
    
    window.location="checkout.jsp";  
}

function getValue(uemail, uname, uphone, uaddress)
{

document.getElementById('inputemail1').value = uemail;

document.getElementById('name').value = uname;

document.getElementById('phone1').value = uphone;

document.getElementById('textarea1').textContent= uaddress;

}