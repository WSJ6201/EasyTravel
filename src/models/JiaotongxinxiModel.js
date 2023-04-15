import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// Traffic information
const JiaotongxinxiModel = sequelize.define('JiaotongxinxiModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: 'Primary key id'
	},
	mingcheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'name'
	},
	fangshi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'way'
	},
	tupian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'picture'
	},
	chengshi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'city'
	},
	dianhua: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'phone num'
	},
	wangzhi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'URL'
	},
	jiaotongjieshao: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: 'Traffic introduction'
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
	tableName: 'jiaotongxinxi'
})

export default JiaotongxinxiModel
