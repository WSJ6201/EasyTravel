import { version } from '../../package.json'
import { Router } from 'express'
import { Op } from 'sequelize'
import toRes from '../lib/toRes'
import UsersModel from '../models/UsersModel'
import jwt from 'jsonwebtoken'

export default ({ config, db }) => {
	let api = Router()

	// userLogin接口
	api.post('/login', async (req, res) => {

		try {

			let userinfo = await UsersModel.findOne({ where: { username: req.query.username, password: req.query.password } })
			if (userinfo === null) {
				toRes.session(res, -1, 'User name or password error')
				return;
			}

			const token = jwt.sign(
				{
					id: userinfo.dataValues.id,
					username: userinfo.dataValues.username,
					role: userinfo.dataValues.role
				},
				config.jwtSecret,
				{
					expiresIn: 60 * 60 * 24 * 1
				}
			)

			userinfo.dataValues.token = token
			delete userinfo.dataValues.password
			req.session.userinfo = userinfo

			toRes.session(res, 0, 'Login succeeded', token)
		} catch(err) {

			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	// user退出接口
	api.all('/logout', (req, res) => {

		if (!toRes.auth(req, res, 'administrators')) return
		
		req.session.destroy(err => {
			toRes.session(res, 0, 'Exit successfully')
		})
	})

	// Register接口
	api.post('/register', async (req, res) => {

		try {

			const userinfo = await UsersModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, 'Registration failed')
			} else {

				toRes.session(res, 0, 'Registration succeeded')
			}
		} catch(err) {
			
			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	// 获取session的接口
	api.all('/session', async (req, res) => {

		try {

			if (!toRes.auth(req, res, 'administrators')) return
			
			toRes.record(res, 0, await UsersModel.findOne({ where: { id: req.session.userinfo.id } }))
		} catch(err) {
			
			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	// 分页接口（后端）
	api.get('/page', async (req, res) => {

		try {

			if (!toRes.auth(req, res, 'administrators')) return

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 10
			let sort = req.query.sort || 'id'
			let order = req.query.order || 'asc'

			let result = await UsersModel.findAndCountAll({
				order: [[sort, order]],
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

	// save接口
	api.post('/save', async (req, res) => {

		try {

			if (!toRes.auth(req, res, 'administrators')) return

			const userinfo = await UsersModel.create(req.body)

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

			if (!toRes.auth(req, res, 'administrators')) return

			await UsersModel.update(req.body, {
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

			if (!toRes.auth(req, res, 'administrators')) return

			await UsersModel.destroy({
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

	// details接口
	api.get('/info/:id', async (req, res) => {

		try {

			if (!toRes.auth(req, res, 'administrators')) return

			toRes.record(res, 0, await UsersModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, 'server error', '', 500)
		}
	})

	return api
}
