package fproject.app.fproject.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fproject.app.fproject.dao.EmoticonShopDao;
import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.EmoticonVo;
import fproject.app.fproject.vo.EmoticongroupVo;
import fproject.app.fproject.vo.PurchaseVo;

/**
 * @author JHTA
 *
 */
/**
 * @author JHTA
 *
 */
/**
 * @author JHTA
 *
 */
@Service
public class EmoShopService {
	@Autowired 
	private EmoticonShopDao dao;
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
	
	/**
	 * <p>DB emoticon에 이모티콘 파일 정보를 저장합니다.
	 * @param vo
	 * @return int
	 */
	public int saveEmoticonFile(EmoticonVo vo) {
		return dao.insertEmoticonFile(vo);
	}
	
	/**
	 * <p>DB emoticonShop에 이모티콘 정보를 저장합니다.<p>
	 * @param vo
	 * @return int
	 */
	public int saveEmoticon(EmoshopVo vo) {
		return dao.insertEmoticonShop(vo);
	}
	
	public int getEmognum(String name) {
		return dao.selectOneEmognum(name);
	}
	
	@Transactional(rollbackFor=Exception.class)  // 분리 방법 생각할 것
	public void savePurchaseList(List<PurchaseVo> list) throws Exception {  // 이러면 뜨는지?
		for(PurchaseVo i : list) {
			dao.insertPurchase(i);
		}
		for(PurchaseVo i : list) {
			dao.insertEmoticonGroup(new EmoticongroupVo(i.getEmognum(), i.getNum()));
		}
	}
}
