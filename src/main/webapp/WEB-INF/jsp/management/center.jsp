<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
var layout_center_tabs;
var layout_center_tabsMenu;
$(function() {
	layout_center_tabs = $('#layout_center_tabs').tabs();
	layout_center_tabsMenu = $('#layout_center_tabsMenu').menu( {
		onClick : function(item) {
			var curTabTitle = $(this).data('tabTitle');
			var type = $(item.target).attr('type');
			//刷新
			if (type === 'refresh') {
				refresh(layout_center_tabs.tabs('getTab', curTabTitle));
				return;
			}
			//关闭
			if (type === 'close') {
				cancel();
				return;
			}
            //获取所有页签
			var allTabs = layout_center_tabs.tabs('tabs');
			var closeTabsTitle = [];

			$.each(allTabs, function() {
				var opt = $(this).panel('options');
				if (opt.closable && opt.title != curTabTitle
						&& type === 'closeOther') {
					closeTabsTitle.push(opt.title);
				} else if (opt.closable && type === 'closeAll') {
					closeTabsTitle.push(opt.title);
				}
			});

			for ( var i = 0; i < closeTabsTitle.length; i++) {
				layout_center_tabs.tabs('close', closeTabsTitle[i]);
			}
		}
	});

	layout_center_tabs.tabs( {
		fit : true,
		border : false,
		onContextMenu : function(e, title) {
			e.preventDefault();
			layout_center_tabsMenu.menu('show', {
				left : e.pageX,
				top : e.pageY
			}).data('tabTitle', title);
		}
	});
});
//刷新
function refresh(selectedTab) {
	var tab;
	if (selectedTab) {
		tab = selectedTab;
	} else {
		tab = layout_center_tabs.tabs('getSelected');
	}
	var href = tab.panel('options').href;
	if (href) {/*说明tab是以href方式引入的目标页面*/
		var index = layout_center_tabs.tabs('getTabIndex', tab);
		layout_center_tabs.tabs('getTab', index).panel('refresh');
	} else {/*说明tab是以content方式引入的目标页面*/
		var panel = tab.panel('panel');
		var iframe = panel.find('iframe');
		layout_center_tabs.tabs('updateIframeTab', {
			which : tab.panel('options').title,
			iframe : {
				src : iframe[0].src
			}
		});
	}
}
//关闭
function cancel() {
	var index = layout_center_tabs.tabs('getTabIndex', layout_center_tabs  //当前展示页签
			.tabs('getSelected'));
	var tab = layout_center_tabs.tabs('getTab', index);
	if (tab.panel('options').closable) {
		layout_center_tabs.tabs('close', index);
	} else {
		showAlertMsg('[' + tab.panel('options').title + ']不可以被关闭.', 'error');
	}
}
</script>
<div id="layout_center_tabs"
	data-options="tools:'#layout_center_tabs-tools'"
	style="overflow: hidden;">
		<div title="首页" data-options="href:'${ctx }/page/management/portal.do'">
		</div>  
</div>
<div id="layout_center_tabsMenu" style="width: 120px; display: none;">
	<div type="refresh" data-options="iconCls:'icon-reload'">
		刷新
	</div>
	<div class="menu-sep"></div>
	<div type="close" data-options="iconCls:'icon-cancel'">
		关闭
	</div>
	<div type="closeOther">
		关闭其他
	</div>
	<div type="closeAll">
		关闭所有
	</div>
</div>
<div id="layout_center_tabs-tools">
<!-- 刷新按钮 -->
	<a href="#" class="easyui-linkbutton"
		data-options="iconCls:'icon-reload',plain:true"  
		onclick="javascript:refresh();"></a>
		<!-- 关闭按钮 -->
	<a href="#" class="easyui-linkbutton"
		data-options="iconCls:'icon-cancel',plain:true"
		onclick="javascript:cancel();"></a>
</div>

