package fproject.app.fproject.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.dao.EmoticonShopDao;
import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.EmoticonVo;

@Repository
public class EmoShopService {
	@Autowired 
	private EmoticonShopDao dao;
	public void setDao(EmoticonShopDao dao) {
		this.dao = dao;
	}
	private static final String PrefixUrl = "/emoticon/";
	
	// 경로에 들어가는 폴더 유무를 검사 후 생성하는 메소드(이모티콘 카테고리나 그룹을 신규 생성해야 하는 경우)
	public boolean pathFolderCheck(String folderPath) { 
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
	public String createSaveFileName(int num, String extName) {
		String fileName = num + extName;
		return fileName;
	}
	
	// 이모티콘 파일 가상주소 생성(나중에 저장소 분리시)
	public String getUrl() {
		String url = PrefixUrl;
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
