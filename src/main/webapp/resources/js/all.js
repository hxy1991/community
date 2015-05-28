/**
 * 去除空格
 * 
 * @returns
 */
String.prototype.Trim = function() { 
	return this.replace(/(^\s*)|(\s*$)/g, ""); 
};
/**
 * 定义验证各种格式类型的正则表达式对象
 */
var Regexs={
		email:(/^[0-9a-z][0-9a-z\-\_\.]*@([0-9a-z][0-9a-z\-]*\.)+[a-z]{2,}$/i),// 邮箱
		phone:(/^0[0-9]{2,3}[2-9][0-9]{6,7}$/),// 座机手机号码
		ydphpne:(/^((13[4-9])|(15[012789])|147|182|187|188)[0-9]{8}$/),// 移动手机号码
		allphpne:(/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/),// 所有手机号码
		ltphpne:(/^((13[0-2])|(15[56])|(186)|(145))[0-9]{8}$/),// 联通手机号码
		dxphpne:(/^((133)|(153)|(180)|(189))[0-9]{8}$/),// 电信手机号码
		url:(/^http:\/\/([0-9a-z][0-9a-z\-]*\.)+[a-z]{2,}(:\d+)?\/[0-9a-z%\-_\/\.]+/i),// 网址
		num:(/[^0-9]/),// 数字
		cnum:(/[^0-9a-zA-Z_.-]/),
		photo:(/\.jpg$|\.jpeg$|\.gif$/i),// 图片格式
		row:(/\n/ig)
};
/**
 * @return若符合对应的格式，返回true，否则返回false
 */
function chkFormat(str,ftype){
	var nReg=Regexs[ftype];
	if(str==null||str=="")return false;// 输入为空，认为是验证通过
	if(ftype=='num'){
		if(!nReg.test(str)&&!chkChinese(str)){// 必须为数字且不能有中文
			return true;
		}else{
			return false;
		}
	}
	return nReg.test(str);
};
function chkChinese(s){
	for(var i=0;i<s.length;i++){
		if(s.charCodeAt(i)>255) {
			return true;
		}
	}
	return false;
};

/**
 * 去除空格
 * 
 * @returns
 */
String.prototype.Trim = function() { 
	return this.replace(/(^\s*)|(\s*$)/g, ""); 
};
/**
 * 点击页码数时的判断函数
 */
$('.pagination li').click(function(event){
	if($(this).hasClass('active')){
		event.preventDefault();
	}
});

/**
 * 分解参数
 * 
 * @param params
 * @returns {Array}
 */
function getActionData(params){
	var map = new Array(); // 定义一数组
	var first = new Array(); // 定义一数组
	first = params.split("&"); // 字符分割
	var second = new Array();
	for(var i=0;i < first.length ; ++i){
		second = first[i].split("=");
		map[second[0]] = second[1];
	}
	return map;
}