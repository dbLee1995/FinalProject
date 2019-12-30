window.onload=function(){
	setInterval(function (){	
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
		$.ajax({
            type: "post",
            url: "http://localhost:9090/fproject/calendar/list",
            data: {
            	num:"${sessionScope.num}"
            },
            success: function (response) {
            	$(response).each(function(){
            		var alarmdate = this.start.split('-');
            		var alarm="";
            	      for ( var i =0; alarmdate.length>i;i++ ) {
            	    	  if(i==2){
            	    		  alarm=alarm+ alarmdate[i].split(" ")[0];
            	    	  }else{
            	    		  alarm=alarm+ alarmdate[i];
            	    	  }
            	      }
            	
            		if(this.alarm==1){
            			alarm=alarm+"09000";
            		
            			if(today==alarm){
            				showAlarm(this.title);            				
            			}
            		}else if(this.alarm==2){
            			alarm=alarm+"12000";
            			
            			if(today==alarm){
            				showAlarm(this.title);   
            			}
            		}else if(this.alarm==3){
            			alarm=alarm+"10110";
            			
            			if(today==alarm){
            				showAlarm(this.title);   
            			}
            		}
            		
            	});
            }
		});
		
	},1000);

}
function showAlarm(title){
	window.open("showalarm?title="+title, '[알람]', 'width=250, height=150, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no' );
}