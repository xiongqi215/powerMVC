package cn.com.powermvc.bo;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.ibatis.type.Alias;
@Alias("DocInfo")
public class TDocument  {
	private static final long serialVersionUID = 1L;
	private Long Id; 
	private String docAuthor;
	private String docContent;
	private String docName;
	private String docPath;
	private String docPicture;
	private String docPreview;
	private String docType;
	private Timestamp lastModify;
	private Date publishDate;
	private String isOpen;
	private String isRecommend;
	//带后缀的文件名=文章标题+原始上传文件名后缀
	private String fullFileName;
//    private TLakeInfo lake;
    private Long lakeId;
    
    private String docKeyword;
    
	public TDocument() {
	}


	public String getDocAuthor() {
		return this.docAuthor;
	}

	public void setDocAuthor(String docAuthor) {
		this.docAuthor = docAuthor;
	}


	public String getDocContent() {
		return this.docContent;
	}

	public void setDocContent(String docContent) {
		this.docContent = docContent;
	}


	public String getDocName() {
		return this.docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}


	public String getDocPath() {
		return this.docPath;
	}

	public void setDocPath(String docPath) {
		this.docPath = docPath;
	}


	public String getDocPicture() {
		return this.docPicture;
	}

	public void setDocPicture(String docPicture) {
		this.docPicture = docPicture;
	}


	public String getDocPreview() {
		return this.docPreview;
	}

	public void setDocPreview(String docPreview) {
		this.docPreview = docPreview;
	}


	public String getDocType() {
		return this.docType;
	}

	public void setDocType(String docType) {
		this.docType = docType;
	}


	public Timestamp getLastModify() {
		return this.lastModify;
	}

	public void setLastModify(Timestamp lastModify) {
		this.lastModify = lastModify;
	}


	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public Long getLakeId() {
		return lakeId;
	}


	public void setLakeId(Long lakeId) {
		this.lakeId = lakeId;
	}

	public String getIsOpen() {
		return isOpen;
	}


	public void setIsOpen(String isOpen) {
		this.isOpen = isOpen;
	}


	public String getIsRecommend() {
		return isRecommend;
	}


	public void setIsRecommend(String isRecommend) {
		this.isRecommend = isRecommend;
	}

	public String getFullFileName() {
    	if(this.docPath!=null){
    		fullFileName=docName+(docPath.substring(docPath.lastIndexOf(".")).toLowerCase());
    	}
		return fullFileName;
	}


	public void setFullFileName(String fullFileName) {
		this.fullFileName = fullFileName;
	}


	public Long getId() {
		return Id;
	}


	public void setId(Long id) {
		Id = id;
	}


	public String getDocKeyword() {
		return docKeyword;
	}


	public void setDocKeyword(String docKeyword) {
		this.docKeyword = docKeyword;
	}

  
	


	

}