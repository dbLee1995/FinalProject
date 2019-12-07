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
	
	// ��ο� ���� ���� ������ �˻� �� �����ϴ� �޼ҵ�(�̸�Ƽ�� ī�װ��� �׷��� �ű� �����ؾ� �ϴ� ���)
	public boolean pathFolderCheck(String folderPath) { 
		try {
			File f = new File(folderPath);
			if(!f.exists()) f.mkdirs();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("�̸�Ƽ�� ���ε� ���� �� ��� ���� ���� ���� �߻�");
			return false;
		}
	}
	
	// �̸�Ƽ�� ������ �׷� �̸� �������� 1, 2.. .Ȯ���ڷ� ����ȴ�.
	public String createSaveFileName(int num, String extName) {
		String fileName = num + extName;
		return fileName;
	}
	
	// �̸�Ƽ�� ���� �����ּ� ����(���߿� ����� �и���)
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
