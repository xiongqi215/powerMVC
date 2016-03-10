package cn.com.powermvc.common.exception;

public class DataBaseException extends BasicException{

	public DataBaseException(String code, Object[] arg) {
		super(code, arg);
	}
    
	public DataBaseException() {
		super("dataBase_error", null);
	}
}
