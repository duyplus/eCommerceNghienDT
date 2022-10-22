app.controller("user-ctrl", function ($scope, $rootScope, $http, $compile) {
    var url = "http://localhost:8080/api/user";
    $rootScope.items = [];
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

    $scope.initialize = function () {
        //load data
        $http.get(url).then(resp => {
            $rootScope.items = resp.data;

            // paginate
            $scope.curPage = 1;
            $rootScope.itemsPerPage = 10;
            $scope.maxSize = 5;
            this.items = $rootScope.items;
            $scope.numOfPages = function () {
                return Math.ceil($rootScope.items.length / $rootScope.itemsPerPage);
            };
            $scope.$watch('curPage + numPerPage', function () {
                var begin = (($scope.curPage - 1) * $rootScope.itemsPerPage);
                var end = begin + $rootScope.itemsPerPage;
                $scope.filteredItems = $rootScope.items.slice(begin, end);
            });
        });

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

    //khoi dau
    $scope.initialize();

    //xoa form
    $scope.reset = function () {
        $scope.form = {};
    }

    //hien thi len form
    $scope.edit = function (item) {
        $scope.form = angular.copy(item);
        $("#edit").modal('show');
    }

    //them sp moi
    $scope.create = function () {
        var item = angular.copy($scope.form);
        $http.post(`${url}`, item).then(resp => {
            resp.data.birthday = new Date(resp.data.birthday);
            resp.data.token = "null";
            $rootScope.items.push(resp.data);
            $scope.reset();
            sweetalert("Thêm mới thành công!");
            $("#edit").modal('hide');
        }).catch(error => {
            sweetalert("Lỗi thêm mới tài khoản!");
            console.log("Error", error);
        });
    }

    //cap nhat sp
    $scope.update = function () {
        var item = angular.copy($scope.form);
        $http.put(`${url}/${item.username}`, item).then(resp => {
            var index = $rootScope.items.findIndex(p => p.username == item.username);
            $rootScope.items[index] = item;
            $scope.reset();
            sweetalert("Cập nhật tài khoản thành công!");
            $("#edit").modal('hide');
        }).catch(error => {
            sweetalert("Lỗi cập nhật tài khoản!");
            console.log("Error", error);
        });
    }

    //xoa sp
    $scope.delete = function (item) {
        $http.delete(`${url}/${item.username}`).then(resp => {
            var index = $rootScope.items.findIndex(p => p.username == item.username);
            $rootScope.items.splice(index, 1);
            $scope.reset();
            sweetalert("Xóa tài khoản thành công!");
            $("#edit").modal('hide');
        }).catch(error => {
            sweetalert("Lỗi xóa tài khoản!");
            console.log("Error", error);
        });
    }

    //phan trang
    // $scope.pager = {
    //     page: 0,
    //     size: 10,
    //     get items() {
    //         var start = this.page * this.size;
    //         return $rootScope.items.slice(start, start + this.size);
    //     },
    //     get count() {
    //         return Math.ceil(1.0 * $rootScope.items.length / this.size)
    //     },
    //     first() {
    //         this.page = 0;
    //     },
    //     prev() {
    //         this.page--;
    //         if (this.page < 0) {
    //             this.last();
    //         }
    //     },
    //     next() {
    //         this.page++;
    //         if (this.page >= this.count) {
    //             this.first();
    //         }
    //     },
    //     last() {
    //         this.page = this.count - 1;
    //     }
    // }
});
app.directive('firebaseDate', function () {
    return {
        require: 'ngModel',
        link: function (scope, element, attrs, ngModel) {
            ngModel.$formatters.push(function (fromModel) {
                fromModel = new Date(fromModel);
                return fromModel;
            });
            ngModel.$parsers.push(function (fromField) {
                fromField = fromField.getTime();
                return fromField;
            });
        }
    }
});