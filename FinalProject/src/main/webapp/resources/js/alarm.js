window.onload=function(){
	setInterval(function (){
		var date1="20191224173020"
		var date2="20191224173040"
		var date3="20191224173055"
		var now = new Date();   //현재시간
	   
		year = now.getFullYear();   //현재시간 중 4자리 연도
		month = now.getMonth()+1;   //현재시간 중 달. 달은 0부터 시작하기 때문에 +1 
		if((month+"").length < 2){
		    month="0"+month;   //달의 숫자가 1자리면 앞에 0을 붙임.
		}
		date = now.getDate();      //현재 시간 중 날짜.
		if((date+"").length < 2){
		    date="0"+date;      
		}
		hour = now.getHours();   //현재 시간 중 시간.
		if((hour+"").length < 2){
		hour="0"+hour;      
		}
		min=now.getMinutes();
		sec=now.getSeconds();
		var today = year + "" + month + "" + date+ "" +hour+""+min+""+sec;      //오늘 날짜 완성.
		// 시간비교
		 console.log(today);
		if(today==date1){
			alert("20ch");
			
		}
		if(today==date2){
			alert("2");
			
		}
		if(today==date3){
			alert("34");
			
		}
	},1000);
	
}