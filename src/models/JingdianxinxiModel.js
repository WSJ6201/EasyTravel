import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// Attraction information
const JingdianxinxiModel = sequelize.define('JingdianxinxiModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: 'Primary key id'
	},
	jingdianmingcheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Attraction name'
	},
	jingdianleixing: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Attraction type'
	},
	tupian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'picture'
	},
	jingdianshipin: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Attraction video'
	},
	kaifangshijian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'start time'
	},
	fuwudianhua: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Service phone num'
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
	jingdianjieshao: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: 'Attractions introduction '
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
	tableName: 'jingdianxinxi'
})

export default JingdianxinxiModel
