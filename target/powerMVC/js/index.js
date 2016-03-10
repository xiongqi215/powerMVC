/**
 * Created by Administrator on 2015/10/10.
 */
///*数据滑动 */
//$(function(){
//    $('.data-nav li').each(function(i){
//        $(this).hover(function(){
//            $(this).addClass('active').siblings().removeClass('active');//选中样式
//            $('.data-wrap:eq('+i+')').show().siblings('.data-wrap').hide();
//            $('.more:eq('+i+')').show().siblings('.more').hide();
//        })
//    })
//})

/*首页登录*/

$(function(){

   /* $('.login-btn').click(function(){
        var userVal = $('#userName').val();
        var passwordVal = $('#password').val();
        if(userVal == ""){
            alert('请输入用户名！')
        }else if(passwordVal == ""){
            alert('请输入密码！')
        }else{
            $('.loginA').text(userVal);
            $('.loginA').css({color:'#f37d26',fontWeight:'bold'});
            $('.index-login').hide();
            $('.out').show();
        }
    })*/
    $('.out').click(function(){
        $('.user-info').hide();
        $('.loginA').text('登录');
        $('.loginA').css({color:'#39abf3',fontWeight:'normal'});
    })

    $('.loginA').click(function() {
        var loginAtext = $('.loginA').text().trim();
        //alert("|"+loginAtext+"|");
        if(loginAtext == "登录"){
            $('.index-login').show();
        } else if(loginAtext != "登录"){
            $('.user-info').show();
        }
    });
    
    $(document).click(function(e) {
		var $menu = $('.top-login');
        if(!(e.target == $menu[0] || $.contains($menu[0], e.target))) {
            $('.panelHide').hide();
        }
    });
})




//弹出层
function opendiv(param){
    $('#'+param).show();
}
//关闭层
function closediv(param){
    $('#'+param).hide();
}


function dialog(title,form,submitFunction){
	
	$('#dialogForm').load(form);
	$('.openTitle').text(title);
	
	$('#dialog').show('fast',function(){
		if(submitFunction!=undefined&&submitFunction!=null){
			$('#submit').unbind('click');
			$('#submit').bind('click',submitFunction);
		}
	});
	
//	$('#submit').unbind('click');
//	$('#submit').one('click',submitFunction);
//	,closediv('dialog')
//	$('#lakeForm').submit();
}

function closeDialog(){
	closediv('dialog')
	$('#dialogForm').empty();
	
}
