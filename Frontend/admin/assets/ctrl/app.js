const app = angular.module("myApp", ['ngRoute']);
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

var dataTable = {
    vi: {
        "sProcessing": "Đang xử lý...",
        "sLengthMenu": "Xem _MENU_ mục",
        "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
        "sInfo": "Đang xem <b>_START_</b> đến <b>_END_</b> trong tổng số <b>_TOTAL_</b> mục",
        "sInfoEmpty": "Đang xem <b>0</b> đến <b>0</b> trong tổng số <b>0</b> mục",
        "sInfoFiltered": "(được lọc trong <b>_MAX_</b> mục)",
        "sInfoPostFix": "",
        "sSearch": "Tìm kiếm:",
        "searchPlaceholder": "Nhập tìm kiếm...",
        "sUrl": "",
        "oPaginate": {
            "sFirst": "Đầu",
            "sPrevious": "Trước",
            "sNext": "Sau",
            "sLast": "Cuối"
        }
    },
    en: {
        records: {
            processing: 'Please wait...',
            noRecords: 'No records found'
        },
        toolbar: {
            pagination: {
                items: {
                    default: {
                        first: 'First',
                        prev: 'Previous',
                        next: 'Next',
                        last: 'Last',
                        more: 'More pages',
                        input: 'Page number',
                        select: 'Select page size'
                    },
                    info: 'Displaying {{start}} - {{end}} of {{total}} records'
                }
            }
        }
    }
};