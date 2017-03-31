var app = angular.module('myApp', ['ngMaterial']);

app.controller('myController', function ($scope, $http, $mdDialog) {
    $scope.sum = 0;
    $scope.products = [];
    $scope.basket = [];

    $scope.sortType = [
        "От А до Я",
        "От Я до А",
        "От дешевых к дорогим",
        "От дорогих в дешевым"
    ];

    $http.get('/api/items').then(function (response) {
        $scope.products=  response.data.body;
    });

    getStats();

    $scope.getSelectedText = function() {
        if ($scope.selectedItem !== undefined) {
            switch($scope.selectedItem)
            {
                case $scope.sortType[0]:
                    $scope.products.sort(sortByTitleASC);
                    break;
                case $scope.sortType[1]:
                    $scope.products.sort(sortByTitleASC).reverse();
                    break;
                case $scope.sortType[2]:
                    $scope.products.sort(sortByPriceASC);
                    break;
                case $scope.sortType[3]:
                    $scope.products.sort(sortByPriceASC).reverse();
                    break;
            }

            return $scope.selectedItem;
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

function sortByTitleASC(a, b) {
    if (a.title > b.title) {
        return 1;
    }
    if (a.title < b.title) {
        return -1;
    }

    return 0;
}

function sortByPriceASC(a, b) {
    if (a.price > b.price) {
        return 1;
    }
    if (a.price < b.price) {
        return -1;
    }

    return 0;
}