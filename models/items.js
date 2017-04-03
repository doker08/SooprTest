module.exports = (sequelize, DataType) => {
    var Items = sequelize.define('Items', {
        title: { type: DataType.STRING, allowNull: false},
        price: DataType.DOUBLE
    }, {
        timestamps: false
    });

    return Items;
};