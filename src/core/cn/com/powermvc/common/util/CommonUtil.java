package cn.com.powermvc.common.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collection;
import java.util.UUID;
import java.util.regex.Pattern;

import org.codehaus.jackson.map.ObjectMapper;

/**
 * 一般工具类.
 * @author 熊颀
 * 
 */
public class CommonUtil {
   
	/**
	 * 判断对象是否为空
	 * @param obj
	 * @return
	 */
	public static boolean isNullOrEmpty(Object obj) {
		if (obj instanceof Object[]) {
			Object[] o = (Object[]) obj;
			for (int i = 0; i < o.length; i++) {
				Object object = o[i];
				if ((object == null) || (("").equals(object))) {
					return true;
				}
			}
		}else if(obj instanceof Collection){
			if(obj==null||((Collection)obj).size()==0){
				return true;
			}
		}else {
			if ((obj == null) || (("").equals(obj))) {
				return true;
			}
		}

		return false;
	}
	
	
    /**
     * 获取文件名后缀
     * @param path
     * @author 熊颀
     * @return
     */
    public static String getPostfix(String path) {
        if (isNullOrEmpty(path.trim())) {
            return null;
        }
        if (path.contains(".")) {
            return path.substring(path.lastIndexOf(".") + 1, path.length());
        }
		return null;
    }
    
    
    /**
    * 根据字符编码得到字符串实际占用长度
    * @param str
    * @param encoding
    * @return 
    * @throws UnsupportedEncodingException 
    * @author 熊颀
    */
    public static int getStringLength(String str,String encoding) throws UnsupportedEncodingException{
    if(isNullOrEmpty(str)){
    return 0;}
    else{
    return str.getBytes(encoding).length;
    }
    }
     
    
    /**
     * 正则表达式匹配字符串
     * @param str
     * @param regex
     * @return
     */
    public static boolean matchByRegex(String str,String regex){
    	Pattern pattern=Pattern.compile(regex);
    	return pattern.matcher(str).matches();
    }
    /**
     * 判断是否是汉字
     * @param str      
     * @param bigRange 是否大范围（包含生僻字与标点）
     * @return
     */
    public static boolean isCHN(String str,boolean bigRange){
    	if(bigRange){
    		return matchByRegex(str,"^[\u0391-\uFFE5]+$");
    	}else{
    		return matchByRegex(str,"^[\u4E00-\u9FA5]+$");
    	}
    	
    }
    
    /**
     * 判断是否是数字与字母
     * @param str      
     * @return
     */
    public static boolean isLetterNumber(String str){
    	return matchByRegex(str,"^[a-zA-Z0-9]+$");
    }
    
    /**
     * 判断是否是数字
     * @param str      
     * @return
     */
    public static boolean isNumber(String str){
    	return matchByRegex(str,"^[0-9]+$");
    }
   
    
    /**
     * 获取项目路径
     */
    
    public static String getWebInfPath()  
    {  
        //file:/D:/JavaWeb/.metadata/.me_tcat/webapps/TestBeanUtils/WEB-INF/classes/   
        String path=Thread.currentThread().getContextClassLoader().getResource("").toString();  
        path=path.replace('/', '\\'); // 将/换成\  
        path=path.replace("file:", ""); //去掉file:  
        path=path.replace("classes\\", ""); //去掉class\  
        path=path.substring(1); //去掉第一个\,如 \D:\JavaWeb...  
        System.out.println(path);  
        return path;  
    }  
    
    /**
     * 生成随机文件名
     * @param fileExt
     * @return
     */
    public static String randomFileName(String fileExt){
    	String newFileName = UUID.randomUUID().toString().replaceAll("-", "") + "." + fileExt;// 新的文件名称
    	return newFileName;
    }
    
    public static void main(String[] args) {
    	getWebInfPath();
	}
    /**
     * JavaBean转换成Json字符串
     * @param obj
     * @return
     */
    public static String ObjectToJson(Object obj){
    	ObjectMapper mapper = new ObjectMapper();
    	String json = "";
    	if(!CommonUtil.isNullOrEmpty(obj)){
    		try {
				json = mapper.writeValueAsString(obj);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	}
    	return json;
    	
    }
}
