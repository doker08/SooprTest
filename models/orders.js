module.exports = (sequelize, DataType) => {
    var Orders = sequelize.define('Orders', {
        sum: {type: DataType.DOUBLE}
    }, {
        timestamps: false,           // this will deactivate the timestamp columns
        indexes: [
            // A BTREE index with a ordered field
            {
                name: 'Orders',
                method: 'BTREE',
            }
        ]
    });

    return Orders;
};