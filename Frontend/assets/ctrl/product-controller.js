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

    // Flash sale active
    var flash_sale = $('.flash-sale-active');
    flash_sale.owlCarousel({
        loop: true,
        margin: 30,
        dots: false,
        autoplay: false,
        nav: true,
        navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1
            },
            480: {
                items: 2
            },
            768: {
                items: 3
            },
            992: {
                items: 1
            },
            1100: {
                items: 1
            }
        }
    });

    // owl carousel active
    var flash_sale = $('.flash-sale-active4');
    flash_sale.owlCarousel({
        loop: true,
        margin: 30,
        dots: false,
        autoplay: false,
        nav: true,
        navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1
            },
            480: {
                items: 2
            },
            768: {
                items: 3
            },
            992: {
                items: 4
            },
            1024: {
                items: 5
            },
            1600: {
                items: 6
            }
        }
    });

    // latest product slider
    var latest_pro = $('.latest-slide-active');
    latest_pro.owlCarousel({
        margin: 30,
        loop: true,
        dots: false,
        autoplay: false,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1
            },

            480: {
                items: 1
            },

            576: {
                items: 2
            },

            768: {
                items: 2
            },

            992: {
                items: 1
            },

            1100: {
                items: 1
            }
        }

    });
});