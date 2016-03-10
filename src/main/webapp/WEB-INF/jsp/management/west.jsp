<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	$(function() {
		//初始化导航菜单
		initMenu();
	});
	
	/*  初始化导航菜单 */
    /* 调用后台，获取菜单树 */	
	function initMenu(){
    	$.post("${ctx}/mgmt/initMenu.do", function(data) {
    		var tree=data;
    	    $.each(tree, function(i, n) {
    			var menulist = "<div class='easyui-panel' data-options='fit:true,border:false' style='overflow-y:auto;overflow-X: hidden;'><ul>";
    	        $.each(n.children, function(j, o) {//依赖于center界面选项卡layout_center_tabs对象
    	        	menulist += "<li><div><strong><a onClick='javascript:addTab(layout_center_tabs,\""
        			    + o.text+"\",\"${ctx}" + o.attributes.url+ "\",true)' style='font-size:11pt;' >" + o.text + "</a></strong></div></li> ";
    	        });
    	        menulist += '</ul></div>';
    	        /* 伸缩版 */
    	        $(".easyui-accordion").accordion('add', {
        			title : n.text,
        			content : menulist
        		});
    	        
    	    });
    	    /*绑定方法*/
    	    $('.easyui-accordion div li div strong a').click(function(){
    			$('.easyui-accordion li div').removeClass("selected");
    			$(this).parent().parent().addClass("selected");
    		}).hover(function(){  /*鼠标悬停样式 */
    			$(this).parent().parent().addClass("hover");
    		},function(){
    			$(this).parent().parent().removeClass("hover");
    		});
    	    
    	},"json"); 
    }
</script>
<!-- 导航菜单 -->
<div class="easyui-accordion" data-options="animate:false,fit:true,border:true">
</div>