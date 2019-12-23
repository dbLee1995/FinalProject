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

@Service
public class EmoShopService {
	@Autowired 
	private EmoticonShopDao dao;
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
	
	/**
	 * <p>DB emoticon�� �̸�Ƽ�� ���� ������ �����մϴ�.
	 * @param vo
	 * @return int
	 */
	public int saveEmoticonFile(EmoticonVo vo) {
		return dao.insertEmoticonFile(vo);
	}
	
	/**
	 * <p>DB emoticonShop�� �̸�Ƽ�� ������ �����մϴ�.<p>
	 * @param vo
	 * @return int
	 */
	public int saveEmoticon(EmoshopVo vo) {
		return dao.insertEmoticonShop(vo);
	}
	
	/**
	 * <p>�̸�Ƽ�� ���� ó���� �մϴ�. DB Purchase�� ���� ������ �����ϰ� Emoticongroup���� ������ �̸�Ƽ���� �߰��մϴ�.<p>
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
	 * <p>����: ��ȯ�� emoticongroupVo�� ����ִ� num�� ȸ����ȣ�� �ƴ϶� �ش� �̸�Ƽ���� �Ǹ�Ƚ���Դϴ�.<p>
	 */
	public List<EmoticongroupVo> getPopulEmoList() {
		return dao.selectPopulEmoList();
	}
}
