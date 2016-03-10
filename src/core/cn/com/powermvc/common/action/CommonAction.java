package cn.com.powermvc.common.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 通用页面跳转,资源加载Action
 * @author 熊颀
 *2015年12月15日 上午9:43:54
 */

@Controller
public class CommonAction {

	@RequestMapping("/page/{root}/{page}")
	public String toPage(@PathVariable String root, @PathVariable String page){
		
		
		return root+"/"+page;
	}
	
	@RequestMapping("/page/{root}/{page}/{page1}")
	public String toPage(@PathVariable String root, @PathVariable String page,@PathVariable String page1){
		
		
		return root+"/"+page+"/"+page1;
	}
	
	
	@RequestMapping("/stream")
	public void getStream(HttpServletResponse response,String filePath){
		if(filePath==null||filePath==""){
			return;
		}
		FileInputStream fis = null;
		 response.setContentType("application/octet-stream");
		 try {
		        OutputStream out = response.getOutputStream();
		        File file = new File(filePath);
		        fis = new FileInputStream(file);
		        byte[] b = new byte[fis.available()];
		        fis.read(b);
		        out.write(b);
		        out.flush();
		    } catch (Exception e) {
		         e.printStackTrace();
		    } finally {
		        if (fis != null) {
		            try {
		               fis.close();
		            } catch (IOException e) {
		            e.printStackTrace();
		        }   
		          }
		    }
	}
}
