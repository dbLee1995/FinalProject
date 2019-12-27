package fproject.app.fproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.EmogroupDao;

@Service
public class EmogroupService {
	@Autowired private EmogroupDao eDao;
	public List<HashMap<String, Object>> getmyemo(int num){
		return eDao.getmyemo(num);
	}
	public List<HashMap<String, Object>> getmyemogro(int num){
		return eDao.getmyemogro(num);
	}
}
