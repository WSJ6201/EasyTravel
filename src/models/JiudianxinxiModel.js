import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// Hotel information
const JiudianxinxiModel = sequelize.define('JiudianxinxiModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: 'Primary key id'
	},
	jiudianmingcheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Hotel name'
	},
	jiudianleixing: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Hotel type'
	},
	tupian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'picture'
	},
	junjia: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: 'average price'
	},
	chengshi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'city'
	},
	jiudianweizhi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Hotel location'
	},
	jiudianxiangqing: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: 'Hotel details'
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
	tableName: 'jiudianxinxi'
})

export default JiudianxinxiModel
