import { version } from '../../package.json'
import { Router } from 'express'
import { Sequelize, Op, QueryTypes } from 'sequelize'
import sequelize from '../models/sequelize'
import toRes from '../lib/toRes'
import YonghuModel from '../models/YonghuModel'
import jwt from 'jsonwebtoken'
import moment from 'moment'

export default ({ config, db }) => {
	let api = Router()

	// userLogin接口
	api.all('/login', async (req, res) => {

		try {

			let userinfo = await YonghuModel.findOne({ where: { yonghuming: req.query.username, mima: req.query.password } })
			if (userinfo === null) {
				toRes.session(res, -1, 'User name or password error')
				return
			}


			const token = jwt.sign(
				{
					id: userinfo.dataValues.id,
					username: userinfo.dataValues.yonghuming,
					role: 'user',
                    loginUserColumn: 'yonghuming',
                    tableName: 'yonghu'
				},
				config.jwtSecret,
				{
					expiresIn: 60 * 60 * 24 * 1
				}
			)

			userinfo.dataValues.token = token
			userinfo.dataValues.role = 'user'
			userinfo.dataValues.loginUserColumn = 'yonghuming'
			userinfo.dataValues.tableName = 'yonghu'
			delete userinfo.dataValues.mima
			req.session.userinfo = userinfo

			toRes.session(res, 0, 'Login succeeded', token)
		} catch(err) {

			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	// user退出接口
	api.all('/logout', (req, res) => {
		
		req.session.destroy(err => {
			toRes.session(res, 0, 'Exit successfully')
		})
	})

	// Register接口
	api.post('/register', async (req, res) => {

		try {

			Object.keys(req.body).forEach(item=>{
				if(req.body[item] == '')  delete req.body[item]
			})


			const userinfo = await YonghuModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, 'Registration failed')
			} else {

				toRes.session(res, 0, 'Registration succeeded')
			}
		} catch(err) {
			
			toRes.session(res, -2, 'Please check whether the input is correct or the user name is duplicate', '', 200)
		}
	})

	// 获取session接口
	api.all('/session', async (req, res) => {

		try {

			toRes.record(res, 0, await YonghuModel.findOne({ where: { id: req.session.userinfo === undefined ? jwt.decode(req.headers.token).id : req.session.userinfo.id } }))
		} catch(err) {
			
			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	// 忘记password（找回password）
	api.all('/resetPass', async (req, res) => {

		try {

			await YonghuModel.update({
				mima: '123456'
			}, {
				where: {
				  yonghuming: req.query.username
				}
			})

			toRes.session(res, 0, 'Password has been reset to: 123456')
		} catch(err) {
			
			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	// 分页接口（后端）
	api.get('/page', async (req, res) => {

		try {

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 10
			let sort = req.query.sort || 'id'
			let order = req.query.order || 'asc'

			let where = {}
			var yonghuming = req.query.yonghuming
			if (yonghuming) {

				if (yonghuming.indexOf('%') != -1) {
					where.yonghuming = {
						[Op.like]: yonghuming
					}
				} else {
					where.yonghuming = {
						[Op.eq]: yonghuming
					}
				}
			}
			var xingming = req.query.xingming
			if (xingming) {

				if (xingming.indexOf('%') != -1) {
					where.xingming = {
						[Op.like]: xingming
					}
				} else {
					where.xingming = {
						[Op.eq]: xingming
					}
				}
			}
			var xingbie = req.query.xingbie
			if (xingbie) {

				if (xingbie.indexOf('%') != -1) {
					where.xingbie = {
						[Op.like]: xingbie
					}
				} else {
					where.xingbie = {
						[Op.eq]: xingbie
					}
				}
			}

			let result = await YonghuModel.findAndCountAll({
				order: [[sort, order]],
				where,
				offset: (page - 1) * limit,
				limit
			})
			
			result.currPage = page
			result.pageSize = limit

			toRes.page(res, 0, result)
		} catch(err) {

			toRes.session(res, 500, 'server error', '', 500)
		}
	})

    // 分页接口（前端）
	api.get('/list', async (req, res) => {

		try {

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 10
			let sort = req.query.sort || 'id'
			let order = req.query.order || 'asc'

			let where = {}
			var yonghuming = req.query.yonghuming
			if (yonghuming) {

				if (yonghuming.indexOf('%') != -1) {
					where.yonghuming = {
						[Op.like]: yonghuming
					}
				} else {
					where.yonghuming = {
						[Op.eq]: yonghuming
					}
				}
			}
			var xingming = req.query.xingming
			if (xingming) {

				if (xingming.indexOf('%') != -1) {
					where.xingming = {
						[Op.like]: xingming
					}
				} else {
					where.xingming = {
						[Op.eq]: xingming
					}
				}
			}
			var xingbie = req.query.xingbie
			if (xingbie) {

				if (xingbie.indexOf('%') != -1) {
					where.xingbie = {
						[Op.like]: xingbie
					}
				} else {
					where.xingbie = {
						[Op.eq]: xingbie
					}
				}
			}

			let result = await YonghuModel.findAndCountAll({
				order: [[sort, order]],
				where,
				offset: (page - 1) * limit,
				limit
			})
			
			result.currPage = page
			result.pageSize = limit

			toRes.page(res, 0, result)
		} catch(err) {
			
			toRes.session(res, 401, 'No permission', '', 200)
		}
	})


	// save接口（后端）
	api.post('/save', async (req, res) => {

		try {

			Object.keys(req.body).forEach(item=>{
				if(req.body[item] == '')  delete req.body[item]
			})


			const userinfo = await YonghuModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, 'add fail')
			} else {

				toRes.session(res, 0, 'Added successfully')
			}
		} catch(err) {
			
			toRes.session(res, 500, 'server error', '', 500)
		}
	})

    // save接口（前端）
	api.post('/add', async (req, res) => {

		try {

			Object.keys(req.body).forEach(item=>{
				if(req.body[item] == '')  delete req.body[item]
			})


			const userinfo = await YonghuModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, 'add fail')
			} else {

				toRes.session(res, 0, 'Added successfully')
			}
		} catch(err) {
			
			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	// 更新接口
	api.post('/update', async (req, res) => {

		try {

			await YonghuModel.update(req.body, {
				where: {
				  id: req.body.id
				}
			})

			toRes.session(res, 0, 'Edit succeeded')
		} catch(err) {
			
			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	// delete接口
	api.post('/delete', async (req, res) => {

		try {

			await YonghuModel.destroy({
				where: {
				  id: {
					[Op.in]: req.body
				  }
				}
			})

			toRes.session(res, 0, 'Delete succeeded')
		} catch(err) {

			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	// details接口（后端）
	api.all('/info/:id', async (req, res) => {

		try {


			toRes.record(res, 0, await YonghuModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, 'server error', '', 500)
		}
	})

    // details接口（前端）
	api.all('/detail/:id', async (req, res) => {

		try {


			toRes.record(res, 0, await YonghuModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	// 获取需要提醒的记录数接口
	api.get('/remind/:columnName/:type', async (req, res) => {

		try {

			let sql = 'SELECT 0 AS count'
			
			if (req.params.type == 1) {
				if (req.query.remindstart) sql = "SELECT COUNT(*) AS count FROM yonghu WHERE " + req.params.columnName + " >= '" + req.query.remindstart + "'"
				if (req.query.remindend) sql = "SELECT COUNT(*) AS count FROM yonghu WHERE " + req.params.columnName + " <= '" + req.query.remindend + "'"

				if (req.query.remindstart && req.query.remindend) {
					sql = "SELECT COUNT(*) AS count FROM yonghu WHERE " + req.params.columnName + " >= '" + req.query.remindstart + "' AND " + req.params.columnName + " <= '" + req.query.remindend + "'"
				}
			}

			if (req.params.type == 2) {
				if (req.query.remindstart) {
					let remindStart = util.getDateTimeFormat(0 - req.query.remindstart, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM yonghu WHERE " + req.params.columnName + " >= '" + remindStart + "'"
				}
				if (req.query.remindend) {
					let remindEnd = util.getDateTimeFormat(req.query.remindend, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM yonghu WHERE " + req.params.columnName + " <= '" + remindEnd + "'"
				}

				if (req.query.remindstart && req.query.remindend) {
					let remindStart = util.getDateTimeFormat(0 - req.query.remindstart, "yyyy-MM-dd")
					let remindEnd = util.getDateTimeFormat(req.query.remindend, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM yonghu WHERE " + req.params.columnName + " >= '" + remindStart + "' AND " + req.params.columnName + " <= '" + remindEnd + "'"
				}
			}

			const results = await sequelize.query(sql, {
				plain: true,
				raw: true,
				type: QueryTypes.SELECT
			})

			toRes.count(res, 0, results.count)
		} catch(err) {
			
			toRes.session(res, 500, 'server error', '', 500)
		}
	})










	api.get('/group/:columnName', async (req, res) => {

		try {

			let sql = ""
			let columnName = req.params.columnName
			let tableName = "yonghu"
			let where = " WHERE 1 = 1 "
			sql = "SELECT COUNT(*) AS total, " + columnName + " FROM " + tableName + where + " GROUP BY " + columnName
			toRes.record(res, 0, await sequelize.query(sql, {
				plain: false,
				raw: true,
				type: QueryTypes.SELECT
			}))
		} catch(err) {

			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	api.get('/value/:xColumnName/:yColumnName', async (req, res) => {

		try {

			let sql = ""
			let xColumnName = req.params.xColumnName
			let yColumnName = req.params.yColumnName
			let tableName = "yonghu"
			let where = " WHERE 1 = 1 "
			if ("yonghu" == "orders") {
				where += " AND status IN ('Paid', 'Shipped', 'Completed') ";
			}

			sql = "SELECT " + xColumnName + ", SUM(" + yColumnName + ") AS total FROM " + tableName + where + " GROUP BY " + xColumnName + " DESC"
			
			toRes.record(res, 0, await sequelize.query(sql, {
				plain: false,
				raw: true,
				type: QueryTypes.SELECT
			}))
		} catch(err) {

			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	api.get('/value/:xColumnName/:yColumnName/:timeStatType', async (req, res) => {

		try {
			
			let sql = ""
			let xColumnName = req.params.xColumnName
			let yColumnName = req.params.yColumnName
			let timeStatType = req.params.timeStatType
			let tableName = "yonghu"
			let where = " WHERE 1 = 1 "
			if ("yonghu" == "orders") {
				where += " AND status IN ('Paid', 'Shipped', 'Completed') ";
			}

            if (config.dbConnection.dbtype.toLowerCase() == "mysql") {
                if (timeStatType == "日")
                    sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y-%m-%d') " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y-%m-%d')";
                if (timeStatType == "month")
                    sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y-%m') " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y-%m')";
                if (timeStatType == "年")
                    sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y') " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y')";
            } else {
                if (timeStatType == "日")
                    sql = "SELECT DATE_FORMAT(VARCHAR(10)," + xColumnName + ", 120) " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(10)," + xColumnName + ", 120)";
                if (timeStatType == "month")
                    sql = "SELECT DATE_FORMAT(VARCHAR(7)," + xColumnName + ", 120) " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(7)," + xColumnName + ", 120)";
                if (timeStatType == "年")
                    sql = "SELECT DATE_FORMAT(VARCHAR(4)," + xColumnName + ", 120) " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(4)," + xColumnName + ", 120)";
            }
			toRes.record(res, 0, await sequelize.query(sql, {
				plain: false,
				raw: true,
				type: QueryTypes.SELECT
			}))
		} catch(err) {

			toRes.session(res, 500, 'server error', '', 500)
		}
	})


	return api
}
