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

    var dataTable = {
        vi: {
            "sProcessing": "Đang xử lý...",
            "sLengthMenu": "Xem _MENU_ mục",
            "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
            "sInfo": "Đang xem <b>_START_</b> đến <b>_END_</b> trong tổng số <b>_TOTAL_</b> mục",
            "sInfoEmpty": "Đang xem <b>0</b> đến <b>0</b> trong tổng số <b>0</b> mục",
            "sInfoFiltered": "(được lọc từ <b>_MAX_</b> mục)",
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

    $scope.initialize = function () {
        //load data
        $http.get(url).then(resp => {
            var table = $('#datatable').DataTable({
                data: resp.data,
                dom: `<'row'<'col-sm-2 text-left'f><'col-sm-10 text-right'B>>
                      <'row'<'col-sm-12'tr>>
                      <'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7 dataTables_pager'lp>>`,
                columns: [
                    { data: 'username' },
                    { data: 'password' },
                    { data: 'fullname' },
                    { data: 'phone' },
                    { data: 'birthday', render: DataTable.render.datetime('DD/MM/yyyy') },
                    { data: 'email' },
                    { data: 'address' },
                    { data: 'createdat', render: DataTable.render.datetime('HH:mm - DD/MM/yyyy') },
                    { data: 'updatedat', render: DataTable.render.datetime('HH:mm - DD/MM/yyyy') },
                    { data: null },
                ],
                columnDefs: [
                    {
                        targets: -1,
                        data: null,
                        defaultContent: '<a href="#!user-form" ng-click="edit(item)"><i class="las la-pen text-info"></i></a>',
                    }
                ],
                responsive: true,
                lengthChange: false,
                language: dataTable.vi,
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
        });
    }

    //khoi dau
    $scope.initialize();

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
});