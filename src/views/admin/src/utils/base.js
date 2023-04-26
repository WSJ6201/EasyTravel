const base = {
    get() {
        return {
            url : "http://localhost:8080/easytravel/",
            name: "easytravel",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/easytravel/front/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "Easy travel"
        } 
    }
}
export default base
