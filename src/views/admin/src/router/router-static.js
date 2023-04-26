import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
    import news from '@/views/modules/news/list'
    import techanxinxi from '@/views/modules/techanxinxi/list'
    import discussjiaotongxinxi from '@/views/modules/discussjiaotongxinxi/list'
    import jingdianxinxi from '@/views/modules/jingdianxinxi/list'
    import discussjiudianxinxi from '@/views/modules/discussjiudianxinxi/list'
    import jiudianxinxi from '@/views/modules/jiudianxinxi/list'
    import discussmeishixinxi from '@/views/modules/discussmeishixinxi/list'
    import discusstechanxinxi from '@/views/modules/discusstechanxinxi/list'
    import jiaotongxinxi from '@/views/modules/jiaotongxinxi/list'
    import yonghu from '@/views/modules/yonghu/list'
    import discussjingdianxinxi from '@/views/modules/discussjingdianxinxi/list'
    import meishixinxi from '@/views/modules/meishixinxi/list'
    import messages from '@/views/modules/messages/list'
    import config from '@/views/modules/config/list'


//2.配置路由   注意：名字
const routes = [{
    path: '/index',
    name: 'home page',
    component: Index,
    children: [{
      // 这里不设置value，Yes把main作为默认页面
      path: '/',
      name: 'home page',
      component: Home,
      meta: {icon:'', title:'center'}
    }, {
      path: '/updatePassword',
      name: 'Change Password',
      component: UpdatePassword,
      meta: {icon:'', title:'updatePassword'}
    }, {
      path: '/pay',
      name: 'pay',
      component: pay,
      meta: {icon:'', title:'pay'}
    }, {
      path: '/center',
      name: 'personal information',
      component: center,
      meta: {icon:'', title:'center'}
    }
      ,{
	path: '/news',
        name: 'Announcement information',
        component: news
      }
      ,{
	path: '/techanxinxi',
        name: 'Specialty information',
        component: techanxinxi
      }
      ,{
	path: '/discussjiaotongxinxi',
        name: 'Traffic informationcomment on',
        component: discussjiaotongxinxi
      }
      ,{
	path: '/jingdianxinxi',
        name: 'Attraction information',
        component: jingdianxinxi
      }
      ,{
	path: '/discussjiudianxinxi',
        name: 'Hotel informationcomment on',
        component: discussjiudianxinxi
      }
      ,{
	path: '/jiudianxinxi',
        name: 'Hotel information',
        component: jiudianxinxi
      }
      ,{
	path: '/discussmeishixinxi',
        name: 'Food informationcomment on',
        component: discussmeishixinxi
      }
      ,{
	path: '/discusstechanxinxi',
        name: 'Specialty informationcomment on',
        component: discusstechanxinxi
      }
      ,{
	path: '/jiaotongxinxi',
        name: 'Traffic information',
        component: jiaotongxinxi
      }
      ,{
	path: '/yonghu',
        name: 'user',
        component: yonghu
      }
      ,{
	path: '/discussjingdianxinxi',
        name: 'Attraction information comment',
        component: discussjingdianxinxi
      }
      ,{
	path: '/meishixinxi',
        name: 'Food information',
        component: meishixinxi
      }
      ,{
	path: '/messages',
        name: 'Message feedback',
        component: messages
      }
      ,{
	path: '/config',
        name: 'Rotation chart management',
        component: config
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {icon:'', title:'login'}
  },
  {
    path: '/register',
    name: 'register',
    component: register,
    meta: {icon:'', title:'register'}
  },
  {
    path: '/',
    name: 'home page',
    redirect: '/index'
  }, /*默认跳转路由*/
  {
    path: '*',
    component: NotFound
  }
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
  mode: 'hash',
  /*hash模式改为history*/
  routes // （缩写）相当于 routes: routes
})

export default router;
