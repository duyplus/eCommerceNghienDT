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
app.controller("user-ctrl", function ($scope, $http) {
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
        angular.element(document).ready(function () {
            $('#datatable').DataTable();
            var table = $('#datatable-buttons').DataTable({
                "pagingType": 'full_numbers',
                "paging": true,
                "pageLength": 10,
                "responsive": true,
                "lengthChange": false,
                "buttons": ['excel', 'pdf', 'csv', 'print']
            });
            table.page.len(10).draw();
            table.buttons().container().appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
            $('#row_callback').DataTable({
                "createdRow": function (row, data, index) {
                    if (data[5].replace(/[\$,]/g, '') * 1 > 150000) {
                        $('td', row).eq(5).addClass('highlight');
                    }
                }
            });
        });
        $http.get(url).then(resp => {
            $scope.items = resp.data;
        });
    }

    //khoi dau
    $scope.initialize();
    $scope.initUtils();

    //xoa form
    $scope.reset = function () {
        $scope.form = {
            image: 'cloud-upload.jpg',
        };
    }

    //hien thi len form
    $scope.edit = function (item) {
        $scope.form = angular.copy(item);
        $(".nav-tabs a:eq(0)").tab('show');
    }

    //them sp moi
    $scope.create = function () {
        var item = angular.copy($scope.form);
        $http.post(`${url} `, item).then(resp => {
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
        $http.put(`${url} /${item.id}`, item).then(resp => {
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

});