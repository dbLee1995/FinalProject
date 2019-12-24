package zoo.racoon.crontab;

import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import fproject.app.fproject.Controller.FriendsController;
import fproject.app.fproject.service.FriendsService;

@Component
	public class Scheduler {
	@Autowired private FriendsService Fservice;
	// crontab 을 이용한 스케쥴러
	 @Scheduled(cron = "0 0 0 * * *")
	 public void crontest1(){
		 Fservice.setnewfri();
	 }
	
	 	
}

