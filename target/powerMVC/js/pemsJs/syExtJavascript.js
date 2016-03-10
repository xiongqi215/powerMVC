var sy = sy || {};

/**
 * 去字符串空格
 * 
 * @author 孙宇
 */
sy.trim = function(str) {
	return str.replace(/(^\s*)|(\s*$)/g, '');
};
sy.ltrim = function(str) {
	return str.replace(/(^\s*)/g, '');
};
sy.rtrim = function(str) {
	return str.replace(/(\s*$)/g, '');
};

/**
 * 判断开始字符是否是XX
 * 
 * @author 孙宇
 */
sy.startWith = function(source, str) {
	var reg = new RegExp("^" + str);
	return reg.test(source);
};
/**
 * 判断结束字符是否是XX
 * 
 * @author 孙宇
 */
sy.endWith = function(source, str) {
	var reg = new RegExp(str + "$");
	return reg.test(source);
};

/**
 * iframe自适应高度
 * 
 * @author 孙宇
 * 
 * @param iframe
 */
sy.autoIframeHeight = function(iframe) {
	iframe.style.height = iframe.contentWindow.document.body.scrollHeight + "px";
};

/**
 * 设置iframe高度
 * 
 * @author 孙宇
 * 
 * @param iframe
 */
sy.setIframeHeight = function(iframe, height) {
	iframe.height = height;
};

/*
 * 包含iframe子窗口的父窗口，显示弹出框 
 * 参数1:父窗口的jquery对象   parent.$
 * 参数2：提示信息
 * @author youlan 2014-10-17
 */
sy.showMsg = function(parentObj,msg,timeout){
	if(timeout == undefined){
		timeout = 5000;
	};
	parentObj.messager.show(
	{
	    title: '提示信息！',
	    msg:msg,
	    timeout: timeout,
	    showType: 'slide'
    });
};

/**
 * 弹出窗口 提示信息.
 * @param msgString
 * @param msgType info,error,question,warning
 */
sy.showAlertMsg = function (parentObj,msgString, msgType) {
	parentObj.messager.alert('提示信息！', msgString, msgType);
}


/**
 * 得到字符串长度
 * @param {Object} str
 * @return {TypeName} 
 */
sy.getStrLength = function(str) {
    var len = str.length;
    var n = 0;
    for (var i = 0; i < len; i++) {
        if (str.charCodeAt(i) < 0 || str.charCodeAt(i) > 255)
            n += 2;
        else
            n++;
    }
    return n;
};

/**
 * 只匹配正整数
 * @param {Object} str
 */

sy.matchOnlyForInt = function(source){
	var reg = new RegExp("^[0-9]+$");
	return reg.test(source);
	
};
/**
 * 只匹配正浮点数
 * @param {Object} str
 */
sy.matchOnlyForFloat = function(source){
	var reg = new RegExp("^[0-9][0-9]*\\.[0-9]+$");
	return reg.test(source);
	
};
/**
 * 只匹配由数字、26个英文字母或者下划线组成的字符串
 */
sy.matchOnlyForNumOrEnglishOrLine =function(source){
	var reg = new RegExp("^\\w+$");
	return reg.test(source);
};

/**
 * 只匹配汉字
 */
sy.matchOnlyForChinese =function(str){
	var reg =new RegExp("^[\\u4E00-\\u9FA5]+$");
	return reg.test(str);
};

/**
 * 匹配全角的
 */
sy.matchForFullWidth=function(source){
	var reg = new RegExp("[\\uFF00-\\uFFFF]");
	return reg.test(source);
};
/**
 * 只匹配字母和数字的
 */
sy.matchOnlyForNumAndEnglish = function(str){
	var reg = new RegExp("^[0-9a-zA-Z]+$");
	return reg.test(str);
	
}












