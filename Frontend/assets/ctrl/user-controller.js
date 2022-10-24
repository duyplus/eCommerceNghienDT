app.controller('user-ctrl', function ($scope, $http) {
    var url = "http://localhost:8080/api/user";
    $scope.items = [];
    $scope.userdata = {};
    $scope.id = 4;

    $http.get(url).then(resp => {
        $scope.items = resp.data;
        $scope.userdata = $scope.items[$scope.id];
    });

    $scope.reset = function () {
        $scope.userdata = {};
    }

    $scope.update = function () {
        var item = angular.copy($scope.userdata);
        $http.put(`${url}/${item.id}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            $scope.reset();
        }).catch(error => {
            console.log("Error", error);
        });
    }
});