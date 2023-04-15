import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// Food information
const MeishixinxiModel = sequelize.define('MeishixinxiModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: 'Primary key id'
	},
	meishimingcheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Food name'
	},
	meishileixing: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Food type'
	},
	tupian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'picture'
	},
	suozaichengshi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'City'
	},
	xiangxidizhi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Detailed address'
	},
	meishixiangqing: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: 'Food info'
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
	tableName: 'meishixinxi'
})

export default MeishixinxiModel
