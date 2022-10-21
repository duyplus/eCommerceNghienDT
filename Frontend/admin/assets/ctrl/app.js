const app = angular.module("myApp", ['ngRoute', 'ui.bootstrap']);
app.config(function ($routeProvider, $locationProvider) {
    // route
    $routeProvider
        .when("/category-list", { templateUrl: "admin/pages/category-list.html", controller: "category-ctrl" })
        .when("/category-form", { templateUrl: "admin/pages/category-form.html", controller: "category-ctrl" })

        .when("/company-list", { templateUrl: "admin/pages/company-list.html", controller: "company-ctrl" })
        .when("/company-form", { templateUrl: "admin/pages/company-form.html", controller: "company-ctrl" })

        .when("/product-list", { templateUrl: "admin/pages/product-list.html", controller: "product-ctrl" })
        .when("/product-form", { templateUrl: "admin/pages/product-form.html", controller: "product-ctrl" })

        .when("/order-approval", { templateUrl: "admin/pages/order-approval.html", controller: "order-ctrl" })
        .when("/order-cancel", { templateUrl: "admin/pages/order-cancel.html", controller: "order-ctrl" })
        .when("/order-form", { templateUrl: "admin/pages/order-form.html", controller: "order-ctrl" })
        .when("/order-list", { templateUrl: "admin/pages/order-list.html", controller: "order-ctrl" })
        .when("/orderdetail", { templateUrl: "admin/pages/orderdetail.html", controller: "order-ctrl" })

        .when("/review-list", { templateUrl: "admin/pages/review-list.html", controller: "review-ctrl" })
        .when("/review-form", { templateUrl: "admin/pages/review-form.html", controller: "review-ctrl" })

        .when("/user-list", { templateUrl: "admin/pages/user-list.html", controller: "user-ctrl" })
        .when("/user-form", { templateUrl: "admin/pages/user-form.html", controller: "user-ctrl" })

        .when("/statistic", { templateUrl: "admin/pages/statistic.html", controller: "statistic-ctrl" })
        .when("/setting", { templateUrl: "admin/pages/setting.html", controller: "setting-ctrl" })

        .when("/login", { templateUrl: "admin/pages/login.html" })
        .when("/404", { templateUrl: "admin/pages/404.html" })
        .when('/', { templateUrl: 'admin/pages/home.html', })
        .otherwise({ redirectTo: '/' });
});