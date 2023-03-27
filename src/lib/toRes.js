
export default {

	session (res, code=0, msg='operate success！', token='', status=200) {

		let result = {
			code,
			msg
		}

		if (token !== '') result.token = token

		res.status(status).json(result)
	},
	file (res, code=0, file='', msg='upload success！', status=200) {

		res.status(status).json({
			code,
			file,
			msg
		})
	},
	count (res, code=0, count='', msg='ask success！', status=200) {

		res.status(status).json({
			code,
			count,
			msg
		})
	},
	record (res, code=0, data={}, msg='ask success！', status=200) {

		res.status(status).json({
			code,
			msg,
			data
		})
	},
	page (res, code=0, result={}, msg='ask success！', status=200) {

		res.status(status).json({
			code,
			msg,
			data: {
				total: result.count,
				pageSize: result.pageSize,
				totalPage: result.count % result.pageSize == 0 ? result.count / result.pageSize : Math.ceil(result.count / result.pageSize) ,
				currPage: result.currPage,
				list: result.rows
			}
		})
	},
	auth (req, res, role) {

		if (req.session.userinfo && !role.split(',').find(item => {return item === req.session.userinfo.role})) {
			res.status(200).json({
				code: 401,
				msg: 'No permission'
			})

			return false
		}

		return true
	}
}
