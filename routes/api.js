var express = require('express');
var path = require('path');
var models = require('../models/index');

var router = express.Router();

router.get('/items', function (req, res) {
    models.Items.findAll({}).then(function (items) {
        res.json({
            "body" : items
        });
    });
});

router.get('/stats', function (req, res) {
    //Получить количество заказов
    models.Orders.count().then(function(totalOrders) {

        //Получить количество проданых товаров
        models.Order_Items.count().then(function(totalItems) {
            res.json({
                body : {"totalorders" : totalOrders, "totalitems" : totalItems}
            });
        });
    });
});

router.post('/buy', function (req, res) {
    //Создание заказа
    models.Orders.create({
        sum : req.body.totalPrice
    })
        .then(function (result) {
            //Добавление группы товаров в БД
            req.body.items.forEach(function (item)
            {
                models.Order_Items.create({
                    item_id: item.id,
                    count: item.count,
                    order_id: result.dataValues.id
                });
            });
    });
});

module.exports = router;