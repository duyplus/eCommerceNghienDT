var app = angular.module('myApp', []);

app.factory('myService', function () {
    var savedData = {}
    function set(data) {
        savedData = data;
    }
    function get() {
        return savedData;
    }
    return {
        set: set,
        get: get
    }
});

app.controller('myCtrl', function($scope, $location, $http, myService) {
    var url = "http://localhost:8080/api/user";
    $scope.items = [];
    $scope.userdata = {};
    $scope.id = 4;

    $http.get(url).then(resp => {
        $scope.items = resp.data;
        $scope.userdata = $scope.items[$scope.id];
    });

    $scope.update = function () {
        var item = angular.copy($scope.userdata);
        $http.put(`${url}/${item.id}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            $scope.reset();
            $location.path('my-account.html');
        }).catch(error => {
            console.log("Error", error);
        });
    }
});