const app = angular.module("myApp", ['ngRoute']);
app.config(function ($routeProvider, $locationProvider) {
    // route
    $routeProvider
        .when('/', {
            templateUrl: 'home.html',
        })
        .when("/user-list", {
            templateUrl: "user-list.html",
            controller: "user-ctrl"
        })
        .when("/user-form", {
            templateUrl: "user-form.html",
            controller: "user-ctrl"
        })
        .otherwise({ redirectTo: '/' });
});
app.controller("user-ctrl", function ($scope, $http, $compile) {
    var url = "http://localhost:8080/api/user";
    $scope.items = [];
    $scope.form = {};

    var sweetalert = function (text) {
        Swal.fire({
            icon: "success",
            title: text,
            showConfirmButton: false,
            timer: 2000,
        });
    }
    var sweetalert_error = function (text) {
        Swal.fire({
            icon: "error",
            title: text,
            showConfirmButton: false,
            timer: 2000,
        });
    }

    $scope.initUtils = function () {
        // Summernote
        $('#summernote').summernote({
            height: 200,
            placeholder: 'Nhập thông tin sản phẩm..',
            toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['view', ['codeview']],
            ]
        });

        // Dropify
        $('.dropify').dropify();
        var drEvent = $('.dropify-event').dropify();
        drEvent.on('dropify.beforeClear', function (event, element) {
            return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
        });
        drEvent.on('dropify.afterClear', function (event, element) {
            sweetalert("File deleted!");
        });
        drEvent.on('dropify.errors', function (event, element) {
            sweetalert_error("Has Errors!");
        });
    }

    $scope.initialize = function () {
        //load user data
        $http.get(url).then(resp => {
            var table = $('#datatable').DataTable({
                data: resp.data,
                columns: [
                    { data: 'username' },
                    { data: 'password' },
                    { data: 'fullname' },
                    { data: 'phone' },
                    { data: 'birthday' },
                    { data: 'email' },
                    { data: 'address' },
                    { data: 'createdat' },
                    { data: 'updatedat' },
                    { data: null },
                ],
                columnDefs: [
                    {
                        targets: -1,
                        data: null,
                        defaultContent: '<div class="text-center"><a href="#!user-form" ng-click="edit(item)"><i class="las la-pen text-info font-18"></i></a></div>',
                    }
                ],
                responsive: true,
                lengthChange: false,
                buttons: ['excel', 'pdf', 'csv', 'print']
            });
            table.buttons().container().appendTo('#datatable_wrapper .col-md-6:eq(0)');
            $('#row_callback').DataTable({
                "createdRow": function (row, data, index) {
                    if (data[5].replace(/[\$,]/g, '') * 1 > 150000) {
                        $('td', row).eq(5).addClass('highlight');
                    }
                    if (!row.compiled) {
                        $compile(angular.element(row))($scope);
                        row.compiled = true;
                    }
                }
            });
        });
    }

    //khoi dau
    $scope.initialize();
    $scope.initUtils();

    //xoa form
    $scope.reset = function () {
        $scope.form = {
            username: '',
        };
    }

    //hien thi len form
    $scope.edit = function (item) {
        $scope.form = angular.copy(item);
    }

    //them sp moi
    $scope.create = function () {
        var item = angular.copy($scope.form);
        $http.post(`${url}`, item).then(resp => {
            resp.data.token = "null";
            $scope.items.push(resp.data);
            $scope.reset();
            sweetalert("Thêm mới thành công!");
        }).catch(error => {
            sweetalert("Lỗi thêm mới tài khoản!");
            console.log("Error", error);
        });
    }

    //cap nhat sp
    $scope.update = function () {
        var item = angular.copy($scope.form);
        $http.put(`${url}/${item.id}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            $scope.reset();
            sweetalert("Cập nhật tài khoản thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật tài khoản!");
            console.log("Error", error);
        });
    }

    //xoa sp
    $scope.delete = function (item) {
        $http.delete(`${url}/${item.id}`).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items.splice(index, 1);
            $scope.reset();
            sweetalert("Xóa tài khoản thành công!");
        }).catch(error => {
            sweetalert("Lỗi xóa tài khoản!");
            console.log("Error", error);
        });
    }

    //phan trang
    $scope.pager = {
        page: 0,
        size: 10,
        get items() {
            var start = this.page * this.size;
            return $scope.items.slice(start, start + this.size);
        },
        get count() {
            return Math.ceil(1.0 * $scope.items.length / this.size)
        },
        first() {
            this.page = 0;
        },
        prev() {
            this.page--;
            if (this.page < 0) {
                this.last();
            }
        },
        next() {
            this.page++;
            if (this.page >= this.count) {
                this.first();
            }
        },
        last() {
            this.page = this.count - 1;
        }
    }

});