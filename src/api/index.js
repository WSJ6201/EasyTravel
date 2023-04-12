import { Router } from 'express'
import UsersController from './Users'
import FileController from './File'
import ConfigController from './Config'
import CommonController from './Common'
import YonghuController from './Yonghu'
import JingdianxinxiController from './Jingdianxinxi'
import MeishixinxiController from './Meishixinxi'
import TechanxinxiController from './Techanxinxi'
import JiudianxinxiController from './Jiudianxinxi'
import JiaotongxinxiController from './Jiaotongxinxi'
import StoreupController from './Storeup'
import NewsController from './News'
import MessagesController from './Messages'
import DiscussjingdianxinxiController from './Discussjingdianxinxi'
import DiscussmeishixinxiController from './Discussmeishixinxi'
import DiscusstechanxinxiController from './Discusstechanxinxi'
import DiscussjiudianxinxiController from './Discussjiudianxinxi'
import DiscussjiaotongxinxiController from './Discussjiaotongxinxi'

export default ({ config, db }) => {
	let api = Router()

	api.use('/users', UsersController({ config, db }))

	api.use('/file', FileController({ config, db }))

	api.use('/config', ConfigController({ config, db }))

	api.use('/', CommonController({ config, db }))

	api.use('/yonghu', YonghuController({ config, db }))

	api.use('/jingdianxinxi', JingdianxinxiController({ config, db }))

	api.use('/meishixinxi', MeishixinxiController({ config, db }))

	api.use('/techanxinxi', TechanxinxiController({ config, db }))

	api.use('/jiudianxinxi', JiudianxinxiController({ config, db }))

	api.use('/jiaotongxinxi', JiaotongxinxiController({ config, db }))

	api.use('/storeup', StoreupController({ config, db }))

	api.use('/news', NewsController({ config, db }))

	api.use('/messages', MessagesController({ config, db }))

	api.use('/discussjingdianxinxi', DiscussjingdianxinxiController({ config, db }))

	api.use('/discussmeishixinxi', DiscussmeishixinxiController({ config, db }))

	api.use('/discusstechanxinxi', DiscusstechanxinxiController({ config, db }))

	api.use('/discussjiudianxinxi', DiscussjiudianxinxiController({ config, db }))

	api.use('/discussjiaotongxinxi', DiscussjiaotongxinxiController({ config, db }))

	return api
}
