package cn.com.powermvc.common.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.com.powermvc.common.util.CommonUtil;

/**
 * 文件上传、下载服务类， 提供将文件保存到系统指定位置（由配置file.save.path决定）的方法
 * 提供从系统指定位置（由配置file.save.path决定）下载文件的方法
 * 
 * @author 熊颀 2016年2月23日 下午1:56:53
 */
//@Service
public class FileTransportService {
	protected static final Logger logger = LoggerFactory.getLogger(FileTransportService.class);
	
	// 文件上传路径 sysconfig.properties中配置
//	@Value("${file.save.path}")
	private  String fileSavePath;
	

	/**
	 * 上传文件 ,支持多个文件，返回文件表单域名称 与上传后文件名称的映射 如表单域为<input type=file name=file1>
	 * 返回数据结构为file1=新文件名
	 * @author 熊颀
	 * @param request
	 * @return Map <String,String>
	 * @throws Exception
	 * 2016-02-23
	 */
	public Map<String, String> uploadMultiFile(HttpServletRequest request)
			throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = mRequest.getFileMap();
		String fileName;
		FileOutputStream fos = null;
		//循环获取请求中所有文件
		for (Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet()
				.iterator(); it.hasNext();) {
			try {
				Map.Entry<String, MultipartFile> entry = it.next();
				MultipartFile mFile = entry.getValue();

				fileName = mFile.getOriginalFilename();
				// 获取文件后缀，生成随机文件名
				String ext = fileName.substring(fileName.lastIndexOf(".") + 1)
						.toLowerCase();
				String newFileName = CommonUtil.randomFileName(ext);

				fos = new FileOutputStream(fileSavePath + "/" + newFileName);
				// 利用spring的文件工具上传
				FileCopyUtils.copy(mFile.getInputStream(), fos);
				fos.flush();
				if(logger.isDebugEnabled()){
					logger.debug("文件已上传:" + fileSavePath + "/" + newFileName);
				}
				map.put(entry.getKey(), newFileName);

			} catch (Exception e) {
				logger.error("文件上传失败!", e);
				throw e;
			} finally {
				if (fos != null) {
					fos.close();
				}
			}
		}
		return map;
	}

	/**
	 * 上传单个文件到指定路径,返回上传后的文件名
	 * @author 熊颀 
	 * @param request
	 * @param field 文件表单域名称
	 * @return String
	 * @throws Exception
	 * 2016-02-23
	 */
	public String uploadFile(HttpServletRequest request, String field)
			throws Exception {

		MultipartHttpServletRequest mhr = (MultipartHttpServletRequest) request;
		MultipartFile mFile = mhr.getFile(field);
		String fileName;
		FileOutputStream fos = null;
		fileName = mFile.getOriginalFilename();
		// 获取文件后缀，生成随机文件名
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1)
				.toLowerCase();
		String newFileName = CommonUtil.randomFileName(ext);
		try {
			fos = new FileOutputStream(fileSavePath + "/" + newFileName);
			// 利用spring的文件工具上传
			FileCopyUtils.copy(mFile.getInputStream(), fos);
			fos.flush();
			if(logger.isDebugEnabled()){
				logger.debug("文件已上传:" + fileSavePath + "/" + newFileName);
			}
			
		} catch (Exception e) {
			logger.error("文件上传失败!", e);
			throw e;
		} finally {
			if (fos != null) {
				fos.close();
			}
		}
		return newFileName;
	}
    /**
     * 文件下载
     * @author 熊颀
     * @param request
     * @param response
     * @param targetFileName   需下载的文件名 ，默认从${file.save.path}路径下获取
     * @param realName         下载后重命名的文件名
     * @throws Exception
     * 2016年2月23日
     */
	public void download(HttpServletRequest request,
			HttpServletResponse response, String targetFileName, String realName)
			throws Exception {

		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String downLoadPath = fileSavePath + "/" + targetFileName;

		long fileLength = new File(downLoadPath).length();
		
		if(realName==null){
			realName=targetFileName;
		}else{
		// 防止中文文件名出现乱码
		realName = new String(realName.getBytes("utf-8"), "ISO8859-1");
		}
		
		// 设置http响应头
		response.setHeader("Content-disposition", "attachment; filename="
				+ realName);
		response.setHeader("Content-Length", String.valueOf(fileLength));

		bis = new BufferedInputStream(new FileInputStream(downLoadPath));
		bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		bis.close();
		bos.flush();
		bos.close();
	}
	
	/**
	 * 从${file.save.path}路径下获取指定文件，并输出文件字节流到HttpServletResponse中
	 * @author 熊颀
	 * @param response
	 * @param targetFileName
	 * 2016年2月23日
	 */
	public void getSteam(HttpServletResponse response, String targetFileName) {
		if (targetFileName == null || targetFileName == "") {
			return;
		}
		FileInputStream fis = null;
		response.setContentType("application/octet-stream");
		try {
			OutputStream out = response.getOutputStream();
			File file = new File(this.fileSavePath + "/" + targetFileName);
			fis = new FileInputStream(file);
			byte[] b = new byte[fis.available()];
			fis.read(b);
			out.write(b);
			out.flush();
		} catch (Exception e) {
			logger.error("文件获取失败！", e);
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
    /**
     * 创建文件路径
     * @author 熊颀
     * @param path
     * @return
     * 2016年2月23日
     */
	public boolean createUploadDir(String path) {
		if (!new File(path).exists()) {
			String[] paths = path.split("/");
			StringBuffer fullPath = new StringBuffer();
			for (int i = 0; i < paths.length; i++) {
				fullPath.append(paths[i]).append("/");
				File file = new File(fullPath.toString());
				if (!file.exists()) {
					file.mkdir();
					if(logger.isDebugEnabled()){
					logger.debug("创建目录为：" + fullPath.toString());
					}
				}
			}
			File file = new File(fullPath.toString());// 目录全路径
			if (!file.exists()) {
				return false;
			} else {
				return true;
			}

		}
		return true;
	}

	public String getFileSavePath() {
		return fileSavePath;
	}

	public void setFileSavePath(String fileSavePath) {
		this.fileSavePath = fileSavePath;
	}

}
