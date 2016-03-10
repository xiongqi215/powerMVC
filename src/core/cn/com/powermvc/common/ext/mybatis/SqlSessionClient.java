package cn.com.powermvc.common.ext.mybatis;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.support.PersistenceExceptionTranslator;
import org.springframework.jdbc.support.incrementer.AbstractSequenceMaxValueIncrementer;

import cn.com.powermvc.bo.OrganInfo;
/**
 * 封装 org.mybatis.spring.SqlSessionTemplate 提供增强功能
 * @author 熊颀
 *2015年12月22日 下午3:22:58
 */
public class SqlSessionClient extends SqlSessionTemplate{
    //主键生成器
	private AbstractSequenceMaxValueIncrementer sequenceIncrementer;
	
	public AbstractSequenceMaxValueIncrementer getSequenceIncrementer() {
		return sequenceIncrementer;
	}

	public void setSequenceIncrementer(
			AbstractSequenceMaxValueIncrementer sequenceIncrementer) {
		this.sequenceIncrementer = sequenceIncrementer;
	}

	public SqlSessionClient(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
	}

	public SqlSessionClient(SqlSessionFactory sqlSessionFactory,
			ExecutorType executorType,
			PersistenceExceptionTranslator exceptionTranslator) {
		super(sqlSessionFactory, executorType, exceptionTranslator);
	}

	public SqlSessionClient(SqlSessionFactory sqlSessionFactory,
			ExecutorType executorType) {
		super(sqlSessionFactory, executorType);
	}
    /**
     * 分页查询 无参数
     * @param page
     * @param statement
     * @return
     */
	public Page<?>  selectPage(Page<?> page,String statement) {
//		Map mapper=this.getMapper(OrganInfo)
		PageHelper.startPage(page);  
		super.selectList(statement);
		return  PageHelper.endPage();  
	}
	  /**
     * 分页查询 含参数
     * @param page
     * @param statement
     * @param parameter
     * @return
     */
	public Page<?> selectPage(Page<?> page,String statement, Object parameter) {
		PageHelper.startPage(page);  
		super.selectList(statement,parameter);
		return  PageHelper.endPage();  
	}

	@Override
	public int insert(String statement, Object parameter) {
		if(this.sequenceIncrementer!=null){
			try {
				this.setId(parameter);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return super.insert(statement, parameter);
	}

	private void setId(Object obj) throws Exception{
		if(obj instanceof Map){
			((Map) obj).put("id", sequenceIncrementer.nextIntValue());
		}else{
			Field f=obj.getClass().getField("id");
			 PropertyDescriptor pd = new PropertyDescriptor(f.getName(), obj.getClass());
			   Method wM = pd.getWriteMethod();//获得写方法
			   wM.invoke(obj, sequenceIncrementer.nextIntValue());
		}
	}
 
	
	
	
}
