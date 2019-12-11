package fproject.app.fproject.Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import fproject.app.fproject.service.EmoShopService;
import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.EmoticonVo;

@Controller
public class EmoticonUploadController {
	@Autowired
	private EmoShopService service;

	public void setService(EmoShopService service) {
		this.service = service;
	}

	@RequestMapping(value = "/emoShop/uploadEmoFile", method = RequestMethod.GET)
	public String moveUploadPage() {
		return "emoticonShop/upload";
	}

	@RequestMapping(value = "/emoShop/uploadEmoFile", method = RequestMethod.POST)
	public String uploadEmoticonFile(Model model, MultipartHttpServletRequest req, EmoshopVo vo) {
		model.addAttribute("feature", "�̸�Ƽ�� ���� ���ε�");
		int fileNum = 1;
		List<String> saveNameList = new ArrayList<String>();
		List<String> orgNameList = new ArrayList<String>();
		List<Long> fileSizeList = new ArrayList<Long>();
		String savePath = req.getSession().getServletContext().getRealPath("/resources/uploadImage/admin/emoticon");
		System.out.println("�̸�Ƽ�� ���� ���: " + savePath);
		try {
			String path = savePath + "\\" + vo.getCategory() + "\\" + vo.getName();
			if(service.pathFolderCheck(path)) {
				for (MultipartFile mf : req.getFiles("file")) {
					String originalFileName = mf.getOriginalFilename();
					String extName = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
					String saveName = fileNum + extName;
					System.out.println(saveName);
					String fullPath = savePath + "\\" + vo.getCategory() + "\\" + vo.getName() + "\\" + saveName;  // admin/emoticon ���� ���� ī�װ����׷���1.png, 2.jpg.. ������ ����
					saveNameList.add(saveName);
					orgNameList.add(originalFileName);
					fileSizeList.add(mf.getSize());
					mf.transferTo(new File(fullPath));  // �� �࿡�� ���� ����
					fileNum++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�̸�Ƽ�� ���ε� ���� �� �������� ����");
			return "test/error";
		}
		try {  // ��� try�� ���� for���� �������� ������ DB���� ����
			   // ������ Ʈ����� ó�� ����
			service.insertEmoticonGroup(vo);
			for (int i=0; i<fileNum-1; i++) { // for(mf : req.getFiles)�� ���ư� ����ŭ �ݺ�
				service.insertEmoticonFile(new EmoticonVo(0, service.selectOneEmognum(vo.getName()), orgNameList.get(i), saveNameList.get(i), fileSizeList.get(i)));
			}
			return "test/success";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�̸�Ƽ�� ���ε� ���� �� DB���� ����");
			return "test/error";
		}
	}
}