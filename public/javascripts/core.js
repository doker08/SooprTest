var app = angular.module('shopApp', ['ngMaterial']);

app.controller('shopController', function ($scope, $http, $mdDialog) {
    $scope.sum = 0;
    $scope.products = [];
    $scope.basket = [];

    $scope.sortType = [
        {"name": "От А до Я", "type": "title"},
        {"name": "От Я до А", "type": "-title"},
        {"name": "От дешевых к дорогим", "type": "price"},
        {"name": "От дорогих в дешевым", "type": "-price"}
    ];

    $http.get('/api/items').then(function (response) {
        $scope.products=  response.data.body;
    });

    getStats();

    $scope.getSortText = function() {
        if ($scope.selectedSort !== undefined) {
            return $scope.selectedSort.name;
        } else {
            return "Выберите сортировку";
        }
    };

    $scope.buy = function (ev) {
        $http.post('/api/buy', {"totalPrice" : $scope.sum, "items" : $scope.basket}).then(
            getStats(),

        $mdDialog.show(
            $mdDialog.alert()
                .clickOutsideToClose(true)
                .title('Поздравляем!')
                .textContent('Вы сделали заказ на ' + $scope.sum + ' грн.')
                .ok('Ok!')
                .targetEvent(ev)
        )

        );

        $scope.basket = [];
        $scope.sum = 0;
    };

    $scope.addToBasket = function (product) {
        if($scope.basket.indexOf(product) < 0){
            $scope.basket.push(product);
            product.count = 1;
        }else{
            $scope.basket.forEach(function (item) {
                if(item.id == product.id)
                    item.count++;
            });
        }

        $scope.sum += +product.price;
    };

    $scope.plusCount = function (item) {
        item.count++;
        $scope.sum += +item.price;
    };

    $scope.minusCount = function (item) {
        item.count--;
        $scope.sum -= +item.price;

         if(item.count == 0){
             let index = $scope.basket.indexOf(item);
             $scope.basket.splice(index, 1);
         }

    };

    function getStats() {
        $http.get('/api/stats').then(function (response) {
            $scope.stats = response.data.body;
        });
    }
});