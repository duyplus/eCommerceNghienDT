app.controller('home-ctrl', function ($scope, $location, $http) {
    // home slider
    var heroSlider = $('.hero-slider-active');
    heroSlider.slick({
        arrows: true,
        autoplay: false,
        autoplaySpeed: 5000,
        dots: true,
        pauseOnFocus: false,
        pauseOnHover: false,
        fade: true,
        infinite: true,
        prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
        nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
        slidesToShow: 1,
        responsive: [
            {
                breakpoint: 767,
                settings: {
                    dots: true,
                }
            }
        ]
    });

    // product slider
    var product = $('.product-gallary-active');
    product.owlCarousel({
        loop: true,
        dots: false,
        margin: 30,
        nav: true,
        navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
        autoplay: false,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            480: {
                items: 2,
                nav: false
            },
            768: {
                items: 3
            },
            992: {
                items: 4
            },
            1024: {
                items: 4
            },
            1600: {
                items: 7
            }

        }
    });

    // product slider
    var product2 = $('.product-gallary-active2');
    product2.owlCarousel({
        items: 5,
        loop: true,
        dots: false,
        margin: 30,
        nav: true,
        navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
        autoplay: false,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            480: {
                items: 2,
                nav: false
            },
            768: {
                items: 3
            },

            992: {
                items: 3
            },

            1024: {
                items: 4
            },
            1600: {
                items: 6
            }
        }
    });

    // owl carousel active
    var product = $('.product-gallary-active3');
    product.owlCarousel({
        loop: true,
        dots: false,
        margin: 30,
        nav: true,
        navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
        autoplay: false,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            480: {
                items: 2,
                nav: false
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
            1024: {
                items: 3
            },
            1600: {
                items: 5
            }
        }
    });

    // owl carousel active
    var featured = $('.pro-module-four-active');
    featured.owlCarousel({
        items: 3,
        loop: true,
        dots: false,
        margin: 30,
        nav: true,
        navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
        autoplay: false,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            480: {
                items: 1,
                nav: false
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
            1024: {
                items: 3
            },
            1600: {
                items: 4
            }
        }
    });

    // owl carousel active
    var featured = $('.pro-module-four-active4');
    featured.owlCarousel({
        items: 3,
        loop: true,
        dots: false,
        margin: 30,
        nav: true,
        navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
        autoplay: false,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            480: {
                items: 1,
                nav: false
            },
            576: {
                items: 2,
            },
            768: {
                items: 2
            },
            992: {
                items: 2
            },
            1024: {
                items: 3
            },
            1600: {
                items: 4
            }
        }
    });

    // owl carousel active
    var featured = $('.pro-module-four-active2');
    featured.owlCarousel({
        items: 3,
        loop: true,
        dots: false,
        margin: 30,
        nav: true,
        navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
        autoplay: false,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            480: {
                items: 1,
                nav: false
            },
            768: {
                items: 2
            },
            992: {
                items: 2
            },
            1024: {
                items: 3
            },
            1600: {
                items: 4
            }
        }
    });

    // owl carousel active
    var module_four = $('.featured-cat-active');
    module_four.owlCarousel({
        items: 4,
        loop: true,
        margin: 30,
        dots: false,
        nav: true,
        navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
        autoplay: false,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            480: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
            1200: {
                items: 3
            },
            1600: {
                items: 4
            }
        }
    });

    // owl carousel active
    var product3 = $('.pro-module3-active');
    product3.owlCarousel({
        items: 5,
        loop: true,
        dots: false,
        margin: 30,
        nav: true,
        navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
        autoplay: false,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            480: {
                items: 2,
                nav: false
            },
            768: {
                items: 3
            },
            992: {
                items: 3
            },
            1024: {
                items: 4
            },
            1600: {
                items: 6
            }
        }
    });

    // owl carousel active
    var featured_2 = $('.featured-home2-active');
    featured_2.owlCarousel({
        items: 5,
        loop: true,
        margin: 30,
        dots: false,
        nav: true,
        navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
        autoplay: false,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            480: {
                items: 2,
                nav: false
            },
            768: {
                items: 3
            },
            992: {
                items: 3
            },
            1024: {
                items: 4
            },
            1600: {
                items: 7
            }
        }
    });

    // product slider
    var brand = $('.brand-active');
    brand.owlCarousel({
        items: 6,
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
                items: 3
            },
            768: {
                items: 4
            },
            992: {
                items: 4
            },
            1100: {
                items: 6
            }
        }
    });

    // brand slider 2
    var brand2 = $('.brand2-slider-active');
    brand2.owlCarousel({
        items: 6,
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
                items: 3
            },
            768: {
                items: 4
            },
            992: {
                items: 4
            },
            1100: {
                items: 6
            }
        }
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

    // Latest blog
    var latest_news = $('.latest-blog-active');
    latest_news.owlCarousel({
        items: 1,
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

    // owl carousel active
    var latest_news = $('.latest-blog-active4');
    latest_news.owlCarousel({
        items: 1,
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

    // owl carousel active
    $('.blog-thumb-active').owlCarousel({
        autoplay: true,
        loop: true,
        nav: true,
        autoplayTimeout: 8000,
        items: 1,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        dots: false,
    });

    // Testimonial active
    var testimonial = $('.testimonial-active');
    testimonial.owlCarousel({
        loop: true,
        margin: 30,
        autoplay: false,
        dots: true,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1
            },

            480: {
                items: 2,
                dots: false
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

    // Testimonial active
    var pro_gallery = $('.product-gallery-active');
    pro_gallery.owlCarousel({
        loop: true,
        margin: 30,
        autoplay: false,
        stagePadding: 0,
        smartSpeed: 700,
        responsive: {
            0: {
                items: 1
            },

            480: {
                items: 2,
                dots: false
            },

            768: {
                items: 3
            },

            992: {
                items: 3
            },

            1100: {
                items: 4
            }
        }
    });
});