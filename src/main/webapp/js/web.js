/* 
   前台页面通用JS
 create by xiongqi 2016-01-06
*/

/*将jsp页面加载到指定ID容器中
 * page页面路径
 * param 传递参数
 * container 容器ID，默认为main
 * add by xiongqi 2016-01-06
 */
function loadPage(page,param,container){
	    if(container==null || container==""){
	    	container="main";
	    }
    	$.ajaxSetup({cache:false});
    	if(param==null){
    		$("#"+container).load("page/"+page);
    	}else{
    	$("#"+container).load("page/"+page,param);
    	}
    }
    
/*调用控制层将返回页面加载到指定ID容器中
 * action 请求 URL
 * param 传递参数
 * container 容器ID，默认为main
 * add by xiongqi 2016-01-06
 */
 function loadAction(action,param,container){
    	$.ajaxSetup({cache:false});
    	if(container==null || container==""){
	    	container="main";
	    }
  	if(param==null){
  		$("#"+container).load(action);
	}else{
		$("#"+container).load(action,param);
	}
    }
 
 