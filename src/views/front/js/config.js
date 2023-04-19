
var projectName = 'Easy travel';
/**
 * 轮播图配置
 */
var swiper = {
	// 设定轮播容器宽度，支持像素和百分比
	width: '100%',
	height: '400px',
	// hover（悬停显示）
	// always（始终显示）
	// none（始终不显示）
	arrow: 'none',
	// default（左右切换）
	// updown（上下切换）
	// fade（渐隐渐显切换）
	anim: 'default',
	// 自动切换的时间间隔
	// 默认3000
	interval: 2000,
	// 指示器位置
	// inside（容器内部）
	// outside（容器外部）
	// none（不显示）
	indicator: 'outside'
}

/**
 * Personal Center菜单
 */
var centerMenu = [{
	name: 'Personal Center',
	url: '../' + localStorage.getItem('userTable') + '/center.html'
}, 
{
        name: 'My collection',
        url: '../storeup/list.html'
}
]


var indexNav = [

{
	name: 'Attraction information',
	url: './pages/jingdianxinxi/list.html'
}, 
{
	name: 'Food information',
	url: './pages/meishixinxi/list.html'
}, 
{
	name: 'Specialty information',
	url: './pages/techanxinxi/list.html'
}, 
{
	name: 'Hotel information',
	url: './pages/jiudianxinxi/list.html'
}, 
{
	name: 'Traffic information',
	url: './pages/jiaotongxinxi/list.html'
}, 

{
	name: 'Announcement information',
	url: './pages/news/list.html'
},
{
	name: 'Message feedback',
	url: './pages/messages/list.html'
}
]

var adminurl =  "http://localhost:8080/easytravel/admin/dist/index.html";

var cartFlag = false

var chatFlag = false




var menu = [{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-list","buttons":["check","update","delete"],"menu":"user","menuJump":"list","tableName":"yonghu"}],"menu":"user management"},{"child":[{"appFrontIcon":"cuIcon-keyboard","buttons":["newly increased","check","update","delete","checkcomment on"],"menu":"Attraction information","menuJump":"list","tableName":"jingdianxinxi"}],"menu":"Attachment information management"},{"child":[{"appFrontIcon":"cuIcon-cardboard","buttons":["newly increased","check","update","delete","checkcomment on"],"menu":"Food information","menuJump":"list","tableName":"meishixinxi"}],"menu":"Food information management"},{"child":[{"appFrontIcon":"cuIcon-form","buttons":["newly increased","check","update","delete","checkcomment on"],"menu":"Specialty information","menuJump":"list","tableName":"techanxinxi"}],"menu":"Special information management"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["newly increased","check","update","delete","checkcomment on"],"menu":"Hotel information","menuJump":"list","tableName":"jiudianxinxi"}],"menu":"Hotel information management"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["newly increased","check","update","delete","checkcomment on"],"menu":"Traffic information","menuJump":"list","tableName":"jiaotongxinxi"}],"menu":"Traffic information management"},{"child":[{"appFrontIcon":"cuIcon-message","buttons":["check","update","reply","delete"],"menu":"Message feedback","tableName":"messages"}],"menu":"Message feedback"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["check","update"],"menu":"Rotation chart management","tableName":"config"},{"appFrontIcon":"cuIcon-news","buttons":["newly increased","check","update","delete"],"menu":"Announcement information","tableName":"news"}],"menu":"system management"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-phone","buttons":["check"],"menu":"Attraction informationlist","menuJump":"list","tableName":"jingdianxinxi"}],"menu":"Attachment information module"},{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["check"],"menu":"Food informationlist","menuJump":"list","tableName":"meishixinxi"}],"menu":"Food information module"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["check"],"menu":"Specialty informationlist","menuJump":"list","tableName":"techanxinxi"}],"menu":"Special information module"},{"child":[{"appFrontIcon":"cuIcon-goodsnew","buttons":["check"],"menu":"Hotel informationlist","menuJump":"list","tableName":"jiudianxinxi"}],"menu":"Hotel information module"},{"child":[{"appFrontIcon":"cuIcon-shop","buttons":["check"],"menu":"Traffic informationlist","menuJump":"list","tableName":"jiaotongxinxi"}],"menu":"Traffic information module"}],"hasBackLogin":"Yes","hasBackRegister":"No","hasFrontLogin":"No","hasFrontRegister":"No","roleName":"administrators","tableName":"users"},{"backMenu":[],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-phone","buttons":["check"],"menu":"Attraction informationlist","menuJump":"list","tableName":"jingdianxinxi"}],"menu":"Attachment information module"},{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["check"],"menu":"Food informationlist","menuJump":"list","tableName":"meishixinxi"}],"menu":"Food information module"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["check"],"menu":"Specialty informationlist","menuJump":"list","tableName":"techanxinxi"}],"menu":"Special information module"},{"child":[{"appFrontIcon":"cuIcon-goodsnew","buttons":["check"],"menu":"Hotel informationlist","menuJump":"list","tableName":"jiudianxinxi"}],"menu":"Hotel information module"},{"child":[{"appFrontIcon":"cuIcon-shop","buttons":["check"],"menu":"Traffic informationlist","menuJump":"list","tableName":"jiaotongxinxi"}],"menu":"Traffic information module"}],"hasBackLogin":"No","hasBackRegister":"No","hasFrontLogin":"Yes","hasFrontRegister":"Yes","roleName":"user","tableName":"yonghu"}]


var isAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].backMenu.length;j++){
                for(let k=0;k<menus[i].backMenu[j].child.length;k++){
                    if(tableName==menus[i].backMenu[j].child[k].tableName){
                        let buttons = menus[i].backMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}

var isFrontAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].frontMenu.length;j++){
                for(let k=0;k<menus[i].frontMenu[j].child.length;k++){
                    if(tableName==menus[i].frontMenu[j].child[k].tableName){
                        let buttons = menus[i].frontMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}
