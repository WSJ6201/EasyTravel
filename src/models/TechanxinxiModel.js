import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// Specialty information
const TechanxinxiModel = sequelize.define('TechanxinxiModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: 'Primary key id'
	},
	techanmingcheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Specialty name'
	},
	techanleixing: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Specialty type'
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
	techanjieshao: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: 'Specialty introduction'
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
	tableName: 'techanxinxi'
})

export default TechanxinxiModel
