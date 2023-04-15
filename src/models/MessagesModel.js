import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// Message feedback
const MessagesModel = sequelize.define('MessagesModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: 'Primary key id'
	},
	userid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: 'Message ID'
	},
	username: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'user name'
	},
	content: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: 'Message content'
	},
	cpicture: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Message picture'
	},
	reply: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: 'Reply content'
	},
	rpicture: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: 'Reply to picture'
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
	tableName: 'messages'
})

export default MessagesModel
