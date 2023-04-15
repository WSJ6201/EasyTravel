import { DataTypes } from 'sequelize'
import sequelize from './sequelize'

const ConfigModel = sequelize.define('ConfigModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: 'Primary key id'
	},
	name: {
		type: DataTypes.STRING,
		allowNull: false,
		comment: 'Configuration parameter name'
	},
	value: {
		type: DataTypes.STRING,
		allowNull: true,
		comment: 'Configuration parameter value'
	}
}, {
	timestamps: false,
	freezeTableName: true,
	tableName: 'config'
})

export default ConfigModel
