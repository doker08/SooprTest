var express = require('express');
var path = require('path');
var pool = require(path.join(__dirname, '../', 'lib', 'db'));

var router = express.Router();

router.get('/items', function (req, res) {
    var result = [];

    pool.connect(function (err, client, done) {
        var query = client.query("SELECT * FROM task.items");
        query.on('row', function (row) {
            result.push(row);
        });

        query.on('end', function () {
            res.json({
                "body" : result
            });
        });
    });
});

router.get('/stats', function (req, res) {
    pool.query("SELECT  (SELECT COUNT(*) FROM   task.orders) AS totalOrders, (SELECT COUNT(*) FROM   task.order_items) AS totalItems",
                null, function (err, result) {

        res.json({
            "body" : result.rows[0]
        });
    });
});

router.post('/buy', function (req, res) {
    pool.connect(function (err, client, done) {
        let query = client.query("SELECT nextval('task.orders_id_seq');", function(err, result) {
            //get next value in table 'orders'
            var nextValue = result.rows[0].nextval;

            //insert new order to table 'orders'
            client.query("INSERT INTO task.orders (id, sum) VALUES (" + nextValue +", " + req.body.totalPrice + ");");

            //insert new items to table 'order_items'
            req.body.items.forEach(function (item) {
                var query = client.query("INSERT INTO task.order_items" +
                    " (item_id, count, order_id) " +
                    "VALUES (" + item.id + ", " + item.count + ", " + nextValue + ");")
            });
        });
    });
});

module.exports = router;