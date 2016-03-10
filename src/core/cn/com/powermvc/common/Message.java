package cn.com.powermvc.common;

import java.util.Locale;
import javax.annotation.Resource;
import org.springframework.context.support.ResourceBundleMessageSource;

public class Message {
	
	@Resource
    private static ResourceBundleMessageSource messageSource;
	
	public static final int MESSAGE_TYPE_ERROR = 0;
	public static final int  MESSAGE_TYPE_INFO= 1;
	public static final int MESSAGE_TYPE_WARNING = 2;
	public static final int MESSAGE_TYPE_CONFIRM = 3;
	private String code;
	private String content;
	private int type;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Message(String code, int type, String content) {
		setCode(code);
		this.type = type;
		this.content = content;
	}

	public Message() {
	}
	
	/**
	 * 成功消息
	 * @return
	 */
	public static Message successMsg(){
		Message msg=new Message();
		msg.setType(Message.MESSAGE_TYPE_INFO);
		msg.setCode("Success");
		msg.setContent("Success");
		return msg;
	}
	
	/**
	 * 成功消息
	 * @return
	 */
	public static Message successMsg(String code,Object[] arg){
		Message msg=new Message();
		msg.setType(Message.MESSAGE_TYPE_INFO);
		msg.setCode(code);
		msg.setContent(messageSource.getMessage(code,arg,null));
		return msg;
	}
	
	/**
	 * 成功消息
	 * @return
	 */
	public static Message successMsg(String code,Object[] arg,Locale locale){
		Message msg=new Message();
		msg.setType(Message.MESSAGE_TYPE_INFO);
		msg.setCode(code);
		msg.setContent(messageSource.getMessage(code,arg,locale));
		return msg;
	}
}
