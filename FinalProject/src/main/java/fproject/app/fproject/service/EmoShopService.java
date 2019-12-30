package fproject.app.fproject.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fproject.app.fproject.dao.EmoticonShopDao;
import fproject.app.fproject.dao.FavorListDao;
import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.EmoticonVo;
import fproject.app.fproject.vo.EmoticongroupVo;
import fproject.app.fproject.vo.PurchaseVo;

@Service
public class EmoShopService {
	@Autowired 
	private EmoticonShopDao dao;
	@Autowired
	private FavorListDao fDao;
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
	
	/**
	 * <p>이모티콘 구매 처리를 합니다. DB Purchase에 구매 정보를 저장하고 Emoticongroup에도 구매한 이모티콘을 추가합니다.<p>
	 * @param list - List(Purchase)
	 */
	@Transactional(rollbackFor=Exception.class)
	public void savePurchaseList(List<PurchaseVo> list) {
		for(PurchaseVo i : list) {
			dao.insertPurchase(i);
		}
		for(PurchaseVo i : list) {
			dao.insertEmoticonGroup(new EmoticongroupVo(i.getEmognum(), i.getNum()));
		}
	}
	
	@Transactional(rollbackFor=Exception.class)
	public void savePurchaseOne(PurchaseVo vo, HashMap<String, Integer> map) {
		dao.insertPurchase(vo);
		dao.insertEmoticonGroup(new EmoticongroupVo(vo.getEmognum(), vo.getNum()));
		fDao.delUserWishItem(map);
	}
	
	public int getEmognum(String name) {
		return dao.selectOneEmognum(name);
	}
	
	public EmoshopVo getEmogInfo(int emognum) {
		return dao.selectOneEmogInfo(emognum);
	}
	
	public List<EmoshopVo> getNewEmoList() {
		return dao.selectNewEmoList();
	}
	
	/**
	 * <p>주의: 반환된 emoticongroupVo에 담겨있는 num은 회원번호가 아니라 해당 이모티콘의 판매횟수입니다.<p>
	 */
	public List<EmoticongroupVo> getPopulEmoList() {
		return dao.selectPopulEmoList();
	}
	
	public List<EmoshopVo> getCategoryEmoList(String emoCategory) {
		return dao.selectCatogoryEmoList(emoCategory);
	}
	
	public List<EmoticonVo> getEmoticonList(int emognum) {
		return dao.selectEmoticonList(emognum);
	}
	
	public int getNewEmoTotalCount() {
		return dao.selectNewEmoticonTotalCount();
	}
	
	public List<EmoshopVo> getNewEmoPagingList(HashMap<String, Integer> map) {
		return dao.selectNewEmoticonPagingList(map);
	}
	
	public List<EmoshopVo> getUserEmoList(int userNum) {
		List<EmoticongroupVo> glist = dao.selectUserEmoList(userNum);
		List<EmoshopVo> userEmoList = new ArrayList<EmoshopVo>();
		for(EmoticongroupVo v : glist) {
			userEmoList.add(getEmogInfo(v.getEmognum()));
		}
		return userEmoList;
	}
	
	public int getPopularEmoListTotalCount() {
		return dao.selectPopulEmoListTotalCount();
	}
	
	public List<EmoshopVo> getPopularEmoPagingList(HashMap<String, Integer> map) {
		List<EmoticongroupVo> gvoList = dao.selectPopulEmoPagingList(map);
		List<EmoshopVo> populList = new ArrayList<EmoshopVo>();
		for(EmoticongroupVo gvo : gvoList) {
			populList.add(getEmogInfo(gvo.getEmognum()));
		}
		return populList;
	}
	
	public int getCateEmoTotalCount(String c) {
		return dao.selectCateEmoticonTotalCount(c);
	}
	
	public List<EmoshopVo> getCateEmoPagingList(HashMap<String, Object> map) {
		return dao.getCateEmoticonPagingList(map);
	}
	
	public List<EmoshopVo> getCategoryList() {
		return dao.getCategoryList();
	}
}
