import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

const UsersModel = sequelize.define('UsersModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: 'Primary key id'
	},
	username: {
		type: DataTypes.STRING,
		allowNull: false,
		comment: 'user name'
	},
	password: {
		type: DataTypes.STRING,
		allowNull: false,
		comment: 'User Password'
	},
	role: {
		type: DataTypes.STRING,
		allowNull: true,
		comment: 'User role'
	},
	addtime: {
  		type: DataTypes.DATE,
  		defaultValue: DataTypes.NOW,
    	allowNull: false,
    	get() {
            return moment(this.getDataValue('addtime')).format('YYYY-MM-DD HH:mm:ss')
        },
		comment: 'Add time'
	}
}, {
	timestamps: false,
	freezeTableName: true,
	tableName: 'users'
})

export default UsersModel
