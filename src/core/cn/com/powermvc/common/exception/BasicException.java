package cn.com.powermvc.common.exception;

import java.io.Serializable;

public class BasicException extends Exception implements Serializable{

	private String code;
	private Object arg[];
	private Throwable cause;
	public  BasicException(String code,Object arg[]){
		this.code=code;
		this.arg=arg;
	}
   
	
	public  BasicException(String code,Object arg[],Throwable cause){
		this.code=code;
		this.arg=arg;
		this.cause=cause;
	}


	@Override
	public String getMessage() {
				StringBuffer msg=new StringBuffer(this.code);
		       
				msg.append(" arg:[");
		        if(this.arg==null||arg.length==0){
		        	msg.append("null]");
		        }else{
		        	for(int i=0;i<arg.length;i++){
		        		msg.append(arg[1].toString());
		        		if(i!=arg.length-1){
		        			msg.append(",");
		        		}
		        		
		        	}
		        	msg.append("]");
		        }
		        		
		return msg.toString();
	}



	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Object[] getArg() {
		return arg;
	}

	public void setArg(Object[] arg) {
		this.arg = arg;
	}
	
	
}
