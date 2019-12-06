package fproject.app.fproject.Util;

import java.util.List;

public class ChatUtil {
	String type;
	String message;
	String list;
	public ChatUtil(){}
	public String split(List<String> mem){
		String list="";
		for(int i=0; i<mem.size();++i){
			list+=mem.get(i)+"(ChatUtil_split)";
		}
		return "";
	}
}
