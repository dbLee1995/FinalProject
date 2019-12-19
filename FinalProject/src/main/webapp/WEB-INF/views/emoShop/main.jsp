<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코코아톡:: 이모티콘</title>
<style type="text/css">
	footer {
		position: absolute;
		bottom: 0;
		width: 100%;
		background: gray;
	}
</style>
</head>
<body>
	<section title="navigationBar">
		<a href="${cp}/emoShop/wishList">좋아요</a>
		<a href="${cp}/emoShop/basket">바구니</a>
	</section>
	
	<section title="emoList" id="emoList">
		<div style="height: 600px;">a</div>
		<div style="height: 600px;">a</div>
	</section>
    
    <!--
	<footer>
		<ul class="article-list__pagination article-list__pagination--inactive" id="article-list-pagination"></ul>
	</footer>
	-->




<script type="text/javascript">


/**
 * Implement infinite scrolling
 * - Inspired by: http://ravikiranj.net/drupal/201106/code/javascript/how-implement-infinite-scrolling-using-native-javascript-and-yui3
 */
 
 var count = 1;
 
 var options = {
		  distance: 50,
		  callback: function(done) {
		    // 1. fetch data from the server
		    // 2. insert it into the document
		    // 3. call done when we are done
			var xhr = new XMLHttpRequest();
			xhr.open('post', '${cp}/emoShop/main');
			xhr.onreadystatechange = function() {
				if(xhr.status === 200 && xhr.readyState === 4) {
					var data = JSON.parse(xhr.responseText);
					console.log(data);
					count += 5;
				}
			}
			xhr.send(count);
		    done();
		  }
		};
 
 
(function() {
  var isIE = /msie/gi.test(navigator.userAgent); // http://pipwerks.com/2011/05/18/sniffing-internet-explorer-via-javascript/
  
  this.infiniteScroll = function(options) {
    var defaults = {
      callback: function() {},
      distance: 50
    }
    // Populate defaults
    for (var key in defaults) {
      if(typeof options[key] == 'undefined') options[key] = defaults[key];
    }
    
    var scroller = {
      options: options,
      updateInitiated: false
    }
    
    window.onscroll = function(event) {
      handleScroll(scroller, event);  
    }
    // For touch devices, try to detect scrolling by touching
    document.ontouchmove = function(event) {
      handleScroll(scroller, event);
    }
  }
  
  function getScrollPos() {
    // Handle scroll position in case of IE differently
    if (isIE) {
      return document.documentElement.scrollTop;
    } else {
      return window.pageYOffset;
    }
  }
  
  var prevScrollPos = getScrollPos();
  
  // Respond to scroll events
  function handleScroll(scroller, event) {
    if (scroller.updateInitiated) {
      return;
    }   
    var scrollPos = getScrollPos();
    if (scrollPos == prevScrollPos) {
      return; // nothing to do
    }
    
    // Find the pageHeight and clientHeight(the no. of pixels to scroll to make the scrollbar reach max pos)
    var pageHeight = document.documentElement.scrollHeight;
    var clientHeight = document.documentElement.clientHeight;
    
    // Check if scroll bar position is just 50px above the max, if yes, initiate an update
    if (pageHeight - (scrollPos + clientHeight) < scroller.options.distance) {
      scroller.updateInitiated = true;
  
      scroller.options.callback(function() {
        scroller.updateInitiated = false;
      });
    }
    
    prevScrollPos = scrollPos;  
  }
})();

		
// setup infinite scroll
infiniteScroll(options);

</script>

</body>
</html>