package cn.com.powermvc.common;

/**
 * 系统常量类
 * @author 熊颀
 *2015年7月28日
 *
 */
public class Publish {
	
	public static final String CALLREPLY_SUCCESS = "success";//接口调用状态：成功
	public static final String CALLREPLY_FAILURE = "failure"; //接口调用状态：失败
	public static final String DATA_STATUS_NORMAL = "0";//有效数据
	public static final String DATA_STATUS_DELETE = "1";//逻辑删除数据
	public static final String SJSMHP_ORG_CONTEXT = "研究湖泊：";//机构数据库默认查询3条记录
	public static final Integer SJSMHP_ORG_PAGECOUNT = 3;//机构数据库默认查询3条记录
	public static final Integer SJSMHP_PAGECOUNT = 6;//数据库列表查询默认查询6条记录
	public static final Integer SJSMHP_PAGENUM = 1; //数据库类型为生态监测
	public static final Integer SJSMHP_STDATABASETYPE = 1; //数据库类型为生态监测
	public static final Integer SJSMHP_SZDATABASETYPE = 2; //数据库类型为水质监测
	public static final Integer SJSMHP_HOT = 1; //数据状态为热门
	public static final Integer SJSMHP_RECOMMEND = 2;//数据状态为推荐
	public static final Integer SJSMHP_LATESTDATASETCOUNT = 3;//最新数据集个数
	public static final Integer SJSMHP_RECOMMENDDATASETCOUNT = 3; //推荐数据集个数
	public static final Integer SJSMHP_HOTDATASETCOUNT = 4; //热门数据集个数
	public static final String SJSMHP_DOC_OPEN="1";   //公开文档
	public static final String SJSMHP_DOC_PRIVATE="0";  //非公开文档
	public static final String SJSMHP_OPERATE_STATE_SUCCESS="1";  //成功
	public static final String SJSMHP_OPERATE_STATE_FAIL="0";  //失败
	
	public static final String FUN_TYPE_WEB="web";//菜单类型-前台
	public static final String FUN_TYPE_MGMT="manage";//菜单类型-后台管理端
	public static final String NORMAL_USER="member";//用户
	public static final String ADMIN_USER="admin";//管理员
	public static final String NORMAL = "0"; //状态-正常
	public static final String LOGICDELETE = "1";//状态-逻辑删除
	public static final String OPERATETYPE_ADD = "add";//前端对数据请求的操作类型：新增	
	public static final String OPERATETYPE_MODIFY = "edit";//前端对数据请求的操作类型：修改
	public static final String OPERATETYPE_DELETE = "del";//前端对数据请求的操作类型：删除
	public static final String SESSION_USER= "loginUser"; //session用户key
	public static final String SELECTTYPE_ALL="全部" ;   //combobox默认显示-全部
	public static final String SELECTTYPE_SELECT="请选择" ;//combobox默认显示-请选择
	public static final String ORGAN_TYPE_FINC="FINC" ;//机构类型--财政机构
	public static final String ORGAN_TYPE_BANK="BANK"; //机构类型--银行	
	
	public static final String TEXT_TYPE = "text/plain";  //MIME类型 text/plain
	public static final String JSON_TYPE = "application/json"; //MIME类型application/json
	public static final String XML_TYPE = "text/xml"; //MIME类型 text/xml
	public static final String HTML_TYPE = "text/html"; //MIME类型text/html
	public static final String JS_TYPE = "text/javascript"; //MIME类型 text/javascript
	public static final String EXCEL_TYPE = "application/vnd.ms-excel"; //MIME类型application/vnd.ms-excel
	public static final String OCP_FILE_CODING="GBK"; //一卡通文件编码
	
	//数据分发统计涉及到的交易
	//国库集中支付的交易
	public static final String TRAN_PAYMENT_AMOUNT ="00"; //授权支付额度交易
	public static final String TRAN_PAYMENT_VOUCHER ="01";//授权支付凭证交易
	public static final String TRAN_DIRECT_PAYMENT_VOUCHER="02";//直接支付凭证交易
	public static final String TRAN_CENTRAL_PAYMENT_VOUCHER="03";//中央专项支付凭证交易
	public static final String TRAN_PAY_VOUCHER_RECON = "09";//支付凭证对账交易
	public static final String TRAN_CARD_ACCOUNT = "04"; //公务卡账户信息
	public static final String TRAN_CARD_TRAN_DETAILS = "05"; //公务卡交易明细
	public static final String TRAN_CARD_PAYMENTS_SUMMARY = "06";//公务卡还款汇总信息
	public static final String TRAN_CARD_BALANCE_ACCOUNT = "07";//公务卡结算账户信息
	public static final String TRAN_PAYROLL = "08";//工资统发交易
	
	public static final String NAME_PAYMENT_AMOUNT = "授权支付额度交易";
	public static final String NAME_PAYMENT_VOUCHER ="授权支付凭证交易";
	public static final String NAME_DIRECT_PAYMENT_VOUCHER="直接支付凭证交易";
	public static final String NAME_CENTRAL_PAYMENT_VOUCHER="中央专项支付凭证交易";
	public static final String NAME_PAY_VOUCHER_RECON="支付凭证对账交易";
	public static final String NAME_CARD_ACCOUNT = "公务卡账户信息交易"; 
	public static final String NAME_CARD_TRAN_DETAILS = "公务卡交易明细交易"; 
	public static final String NAME_CARD_PAYMENTS_SUMMARY = "公务卡还款汇总信息交易";
	public static final String NAME_CARD_BALANCE_ACCOUNT = "公务卡结算账户信息交易";
	public static final String NAME_PAYROLL = "工资统发交易";//工资统发交易
	//一卡通
	public static final String TRAN_SUBSIDY_PAYMENT = "30";//补贴发放
	public static final String NAME_SUBSIDY_PAYMENT ="补贴发放交易";
	
	//错误码
	public static final String CODE_DATA_EXSITS = "000001";//有数据
	public static final String CODE_PAY_AMOUNT_CONFIRM_SUCC = "000002";//额度数据确认成功
	public static final String CODE_PAY_VOUCHER_SUCC = "000003";//支付凭证确认成功
	public static final String CODE_CARD_ACCOUNT_SUCC ="000004";//公务卡账户交易成功
	public static final String CODE_CARD_BALANCE_SUCC ="000005";//公务卡结算账户交易成功
	public static final String CODE_CARD_PAYMENTS_SUMMARY_SUCC ="000006";//公务卡还款确认交易成功
	public static final String CODE_PAY_VOUCHER_CANCEL_SUCC ="000007";//支付凭证作废成功
	public static final String CODE_PAYROLL_SUCC ="000008";//工资数据确认成功
	//826-支付凭证对账交易成功，对应应答报文中Flag值
	public static final String CODE_PAY_VOUCHER_RECON_SUCC ="1";
	
	//消息占位中文参数
	public static final String MSG_PLACEHOLD_USER="用户"; 
	public static final String MSG_PLACEHOLD_LOGINNAME="帐号";
	public static final String MSG_PLACEHOLD_IDCARD="身份证号";
	
	public static final String MSG_PLACEHOLD_ROLE="角色"; 
	
	public static final String MSG_PLACEHOLD_DICTIONARY_TYPE="字典类型";
	
	public static final String MSG_PLACEHOLD_DICTIONARY_TYPE_NAME="字典类型名称";
	public static final String MSG_PLACEHOLD_DICTIONARY_TYPE_CODE="字典类型编码";
	
	public static final String MSG_PLACEHOLD_APP="应用系统";
	
	public static final String MSG_PLACEHOLD_APPTYPE="业务类型";
	public static final String MSG_PLACEHOLD_APPTYPENAME="业务类型名称";
	public static final String MSG_PLACEHOLD_APPTYPESNAME="业务类型简称";
	
	public static final String MSG_PLACEHOLD_COMPANY="厂商";
	public static final String MSG_PLACEHOLD_COMPANYNAME="厂商名称";
	public static final String MSG_PLACEHOLD_COMSHORTNAME="厂商简称";
	
	public static final String MSG_PLACEHOLD_PACKAGETYPE="报文类型";
	public static final String MSG_PLACEHOLD_PACKAGETYPENAME="报文类型名称";
	public static final String MSG_PLACEHOLD_PACKAGETYPECODE="报文类型编号";
	
	public static final String MSG_PLACEHOLD_PACKAGERULES="交易规则";
	public static final String MSG_PLACEHOLD_PACKAGERULESCODE="交易规则编号";
	
	public static final String MSG_PLACEHOLD_HUINONG="惠农补贴项目";
	public static final String MSG_PLACEHOLD_HUINONGNAME="项目名称";
	public static final String MSG_PLACEHOLD_HUINONGCODE="项目代码";
	public static final String MSG_PLACEHOLD_HNBT="大类项目";
	
	public static final String MSG_PLACEHOLD_ORGAN="机构";
	public static final String MSG_PLACEHOLD_ENV="正式环境";
	public static final String MSG_PLACEHOLD_BATCH_ENV="批量正式环境";
	public static final String MSG_PLACEHOLD_DICT="数据字典";
	public static final String MSG_PLACEHOLD_DICTTYPE="字典类型";
	public static final String MSG_PLACEHOLD_DICT_NAME="字典名称";
	public static final String MSG_PLACEHOLD_DICT_CODE="字典编码";
	public static final String MSG_PLACEHOLD_DICT_CODEVALUE="字典参数值";
	public static final String MSG_PLACEHOLD_DICT_REMARK="字段备注";
	
	public static final String MSG_PLACEHOLD_ORGAN_CODE="机构代码";
	public static final String MSG_PLACEHOLD_ORGAN_NAME="机构名称";
	public static final String MSG_PLACEHOLD_ORGAN_TYPE="机构类型";
	
	public static final String MSG_PLACEHOLD_BASEINDEX="指标";
	public static final String MSG_PLACEHOLD_BASEINDEXCODE="指标代码";
	
	public static final String SYSTEM_USER_BACKSTAGE="1";//后台用户
	public static final String SYSTEM_USER_WEB="2";//前台用户
	public static final String SYSTEM_USER_NONE="0";//游客
	
}
