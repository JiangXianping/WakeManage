/**
 * Created by jiang on 2017/5/12.
 */
function update(id) {

}
function del(id) {
    alert("确定删除吗？" + id);
}
function show() {
    alert("aaa");
}
function getCurDate(){
    var oDate = new Date(); //实例一个时间对象；
    oDate.getFullYear();   //获取系统的年；
    oDate.getMonth()+1;   //获取系统月份，由于月份是从0开始计算，所以要加1
    oDate.getDate(); // 获取系统日，
    oDate.getHours(); //获取系统时，
    oDate.getMinutes(); //分
    oDate.getSeconds(); //秒
    alert(oDate);
}