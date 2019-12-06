package fproject.app.fproject.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import fproject.app.fproject.service.EmoticonShopService;
import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.EmoticonVo;

@Controller
public class EmoticonShopController {
	@Autowired
	private EmoticonShopService service;
	public void setService(EmoticonShopService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/emoticonShop/uploadEmoFile", method=RequestMethod.GET)
	public String moveUploadPage() {
		return "emoticonShop/upload";
	}
	
	@RequestMapping(value="/emoticonShop/uploadEmoFile", method=RequestMethod.POST)
	public String uploadEmoticonFile(Model model, MultipartHttpServletRequest req, EmoshopVo vo) {
		model.addAttribute("feature", "이모티콘 파일 업로드");
		int fileNum = 1;
		// boolean emoSaveResult = true;
		// boolean dbSaveResult = false;
		String savePath = req.getSession().getServletContext().getRealPath("/resources/uploadImage/admin/emoticon");
		System.out.println(savePath);
		try {
			List<MultipartFile> emoticonList = req.getFiles("file");
			service.insertEmoticonGroup(vo);
			for(MultipartFile mf : emoticonList) {
				String saveFileName = service.saveEmoticonFile(mf, fileNum, savePath, vo.getCategory(), vo.getName()).get(1);
				int emognum = service.selectOneEmognum(vo.getName());
				service.insertEmoticonFile(new EmoticonVo(0, emognum, mf.getOriginalFilename(), saveFileName, mf.getSize()));
				fileNum++;
			}
			return "test/success";
		} catch(Exception e) {
			e.printStackTrace();
			return "test/error";
		}
	}
}
