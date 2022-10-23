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

app.controller('myCtrl', function($scope, $location, $http) {
    $scope.id = 5;
    var url = "http://localhost:8080/api/user/"+$scope.id;
    $scope.items = {};
    $scope.userdata = {};

    $http.get(url).then(resp => {
        $scope.items = resp.data;
        $scope.userdata = $scope.items;
    });

    $scope.update = function () {
        var item = angular.copy($scope.userdata);
        $http.put(`${url}/${item.id}`, item).then(resp => {
            $scope.items = item;
            $location.path('my-account.html');
        }).catch(error => {
            console.log("Error", error);
        });
    }
});