module.exports = (sequelize, DataType) => {
    var Order_Items = sequelize.define('Order_Items', {
        item_id: {type: DataType.INTEGER},
        count: {type: DataType.INTEGER},
        order_id: {type: DataType.INTEGER}
    }, {
        timestamps: false
    });

    return Order_Items;
};