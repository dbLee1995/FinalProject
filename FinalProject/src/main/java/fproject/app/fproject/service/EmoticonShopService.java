package fproject.app.fproject.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import fproject.app.fproject.dao.EmoticonShopDao;
import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.EmoticonVo;

@Repository
public class EmoticonShopService {
	@Autowired
	private EmoticonShopDao dao;
	public void setDao(EmoticonShopDao dao) {
		this.dao = dao;
	}
	private static final String PrefixUrl = "/emoticon/";
	private String saveFileName;
	
	public List<String> saveEmoticonFile(MultipartFile mf, int fileNum, String savePath,String category, String emoticonGroup) {
		String result = "false";
		List<String> list = new ArrayList<String>();
		try {
			String originalFileName = mf.getOriginalFilename();
			String extName = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
			this.saveFileName = createSaveFileName(fileNum, extName);
			String fullPath = savePath + "\\" + category + "\\" + emoticonGroup + "\\" + saveFileName;
			String path = fullPath.substring(0, fullPath.lastIndexOf(File.separator));
			if(pathFolderCheck(path)) {
				mf.transferTo(new File(fullPath));
				result = "true";
			}
			list.add(result);
			list.add(saveFileName);
			return list;
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("이모티콘 업로드 과정 중 저장 오류");
			list.add(result);
			return list;
		}
	}
	
	// 경로에 들어가는 폴더 유무를 검사 후 생성하는 메소드(이모티콘 카테고리나 그룹을 신규 생성해야 하는 경우)
	private boolean pathFolderCheck(String folderPath) { 
		try {
			File f = new File(folderPath);
			if(!f.exists()) f.mkdirs();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("이모티콘 업로드 과정 중 경로 폴더 생성 오류 발생");
			return false;
		}
	}
	
	// 이모티콘 파일은 그룹 이름 폴더마다 1, 2.. .확장자로 저장된다.
	private String createSaveFileName(int num, String extName) {
		String fileName = num + extName;
		return fileName;
	}
	
	// 이모티콘 파일 가상주소 생성(나중에 저장소 분리시)
	public String getUrl() {
		String url = PrefixUrl + this.saveFileName;
		return url;
	}
	
	public int insertEmoticonFile(EmoticonVo vo) {
		return dao.insertEmoticonFile(vo);
	}
	
	public int insertEmoticonGroup(EmoshopVo vo) {
		return dao.insertEmoticonGroup(vo);
	}
	
	public int selectOneEmognum(String name) {
		return dao.selectOneEmognum(name);
	}
}
