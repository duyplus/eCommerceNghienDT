app.controller('product-ctrl', function ($scope, $location, $http) {
    // product view mode change js
    $('.product-view-mode a').on('click', function (e) {
        e.preventDefault();

        var shopProductWrap = $('.shop-product-wrap');
        var viewMode = $(this).data('target');

        $('.product-view-mode a').removeClass('active');
        $(this).addClass('active');
        shopProductWrap.removeClass('grid list column_3').addClass(viewMode);
    })

    // product details slider active
    $('.product-large-slider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        fade: true,
        arrows: false,
        asNavFor: '.pro-nav'
    });

    // slick carousel active
    $('.pro-nav').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        prevArrow: '<button type="button" class="arrow-prev"><i class="fa fa-long-arrow-left"></i></button>',
        nextArrow: '<button type="button" class="arrow-next"><i class="fa fa-long-arrow-right"></i></button>',
        asNavFor: '.product-large-slider',
        centerMode: true,
        arrows: true,
        centerPadding: 0,
        focusOnSelect: true
    });

    // product details vertical slider active
    $('.product-large-slider1').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        fade: true,
        arrows: false,
        asNavFor: '.pro-nav1'
    });

    // slick carousel active
    $('.pro-nav1').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        prevArrow: '<button type="button" class="arrow-prev"><i class="fa fa-long-arrow-up"></i></button>',
        nextArrow: '<button type="button" class="arrow-next"><i class="fa fa-long-arrow-down"></i></button>',
        asNavFor: '.product-large-slider1',
        centerMode: true,
        arrows: true,
        vertical: true,
        centerPadding: 0,
        focusOnSelect: true
    });

    // modal fix
    $('.modal').on('shown.bs.modal', function (e) {
        $('.pro-nav').resize();
    });
});