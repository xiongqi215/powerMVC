package cn.com.powermvc.common.ui.tag;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * jsp分页标签
 * 
 * @author 熊颀 2015年12月28日 上午11:25:55
 */
public class PaginationTag extends SimpleTagSupport {
	// -- 分页参数 --//
	// 当前页码
	protected int pageNo;
	// 每页最大显示数
	protected int pageSize;
	private int defaultPageSize = 10;
	protected int totalCount;
	
	protected int toalPage;
	protected String action;

	protected String tableId;

	@Override
	public void doTag() throws JspException, IOException {
		if(pageSize==0){
			pageSize=defaultPageSize;
		}
        //计算总页数
		toalPage=((totalCount + pageSize - 1) / pageSize);
		StringBuffer sb=new StringBuffer("<div class=\"pageChange\">");

		
		sb.append("<table><tr><td>");
		//如果为第一页，则上一页按钮置灰
		if(pageNo==1){
			sb.append("<a href=\"\" class=\"grayA\">上一页</a>");
		}else{
			sb.append("<a href=\"\" class=\"textA\">上一页</a>");
		}
		
		for(int i=1;i<=toalPage;i++){
			String noClaz="numA";
			if(i==pageNo){
				noClaz="numAOn";
			}
			sb.append("<a href=\"\" class=").append(noClaz).append(">").append(i).append("</a>");
		}
		//如果为最后一页，则下一页按钮置灰
				if(pageNo==toalPage){
					sb.append("<a href=\"\" class=\"grayA\">下一页</a>");
				}else{
					sb.append("<a href=\"\" class=\"textA\">下一页</a>");
				}
				
		sb.append("<span class=\"dny\">共").append(toalPage).append("页</span>");
		sb.append("</td></tr></table></div>");
		 JspContext ctx = getJspContext();  
	        JspWriter out = ctx.getOut();  
	        out.print(sb.toString());  
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getToalPage() {
		return toalPage;
	}

	public void setToalPage(int toalPage) {
		this.toalPage = toalPage;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}
	
	
}
