package fproject.app.fproject.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fproject.app.fproject.service.MemberService;
import fproject.app.fproject.vo.FavorlistVo;

@Controller
public class EmoShopBasketController {
	@Autowired
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	@RequestMapping(value="/emoShop/buyList", method=RequestMethod.GET)
	public String pageMove(Model model, HttpServletRequest req) {
		String userID = (String)req.getSession().getAttribute("id"); // ����� ���̵� �޾ƿ���
		int userNum = memberService. getUserAccountInfo(userID).getNum(); // ����� ��ȣ �޾ƿ���
		
		int thisPage = 1; // ����ڰ� ���� �����ִ� ������ ��ȣ(�⺻ 1)
		//int totalCount = favorListService.getTotalCount(userNum); // �����׸��
		//int totalPageCount = totalNum; // ��ü ������ ��
		
		int pageListNum = 7; // ��������� ����
		//List<FavorlistVo> list = favorListService.selectList(userNum);
		return "emoticonShop/emoBasket";
	}
}
