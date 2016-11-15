/**
 * Created by macbook on 2016-11-10.
 */

var DOMAIN = "http://localhost:3000";
// $.ajax({
//     url: DOMAIN+"/products.json",
//     type: "get",
//     data: {},
//     success: function (products) {
//         console.table(products);
//
//     }
//
// });

// $.ajax({
//     url: DOMAIN+"/products/1.json",
//     type: "get",
//     data: {},
//     success: function (product) {
//         console.table(product);
//
//     }
//
// });

$(document).ready(function () {
    getProductsHtml();
    $('#products').on('click', 'li a', function () {
        var id = $(this).parents().attr("data-id");

        $('#products').fadeOut(300, function () {

            $('#product').fadeIn(getProduct(id));

        });
    });

    $('#richard').on('click', '.btn-go-back', function () {


        $('#product').fadeOut(100, function () {

            $('#products').fadeIn(100);

        });
    })

});


function renderProducts(products) {
    // console.log('products',products);
    // console.log('template', products_template);
    var productsList = $("#products");
    var products_template = $('#products-template').html();
    productsList.html(Mustache.render(products_template, products))


}

function getProductsHtml() {
    $.ajax({
        url: DOMAIN + "/products.json",
        type: "get",
        data: {},
        success: function (products) {
            // console.table(products);
            renderProducts(products)
        }

    });


}

function renderProduct(product) {
    var productList = $("#product");
    var product_template = $('#product-template').html();
    console.log(product_template);
    productList.html(Mustache.render(product_template, product));

}

function getProduct(id) {
    console.log(id);
    $.ajax({
        url: DOMAIN + "/products/" + id + ".json",
        type: "get",
        data: {},
        success: function (product) {
            console.log(product);

            renderProduct(product);

        }

    })

}
