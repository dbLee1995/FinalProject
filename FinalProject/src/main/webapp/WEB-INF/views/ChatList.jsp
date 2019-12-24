<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery.timepicker.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet' type='text/css'>
	<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'><link rel='stylesheet prefetch' 
			href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
<%-- 	<link rel="stylesheet" type="text/css" href='${cp }/resources/css/jquery-ui.css'> --%>
	
	<script src="${pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script>
  	<script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
  	<script src="${pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
  	<script src="${pageContext.request.contextPath }/resources/js/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/aos.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.animateNumber.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${pageContext.request.contextPath }/resources/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

	<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/sockjs.js"></script>
	<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/animateScroll/animatescroll.js"></script> --%>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/animateScroll/tagging.min.js"></script> --%>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script>try{Typekit.load({ async: true });}catch(e){}</script>
	<style class="cp-pen-styles">body {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  background: #ffffff;
  font-family: "proxima-nova", "Source Sans Pro", sans-serif;
  font-size: 1em;
  letter-spacing: 0.1px;
  color: #32465a;
  text-rendering: optimizeLegibility;
  text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.004);
  -webkit-font-smoothing: antialiased;
  position: relative;
}
#searchChat{
	margin-left: 50px;
}
.colorlib-page{

}
.frame{

}
.badge-notify{
   background:#4CD964;
   position:relative;
   top: -12px;
   left: -16px;
  }
.btn-countUp{
	display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #2c3e50;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
  margin-left: 10px;
}
.btn-countDown{
	display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #2c3e50;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
  margin-left: 5px;
}
.btn-Search{
	display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #2c3e50;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
  margin-left: 10px;
}
.searchcount{
	margin-left: 10px;
}

*{
	margin:0px;
	padding: 0px;
}
.messages{
	position: relative;
}
.pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #2c3e50;
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #2c3e50;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}
a.btn-RoomClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #32465a;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}
a.btn-layerMake {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #2c3e50;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}
a.btn-layerMake:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}

#frame {
  width: 100%;
  min-width: 360px;
  max-width: 1000px;
  height: 92vh;
  min-height: 300px;
  max-height: 720px;
  background: #ffffff;
}
@media screen and (max-width: 360px) {
  #frame {
    width: 100%;
    height: 100vh;
  }
}
#frame #sidepanel {
  float: left;
  min-width: 280px;
  max-width: 340px;
  width: 40%;
  height: 100%;
  background: #2c3e50;
  color: #f5f5f5;
  overflow: hidden;
  position: relative;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel {
    width: 58px;
    min-width: 58px;
  }
}
#frame #sidepanel #profile {
  width: 80%;
  margin: 25px auto;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile {
    width: 100%;
    margin: 0 auto;
    padding: 5px 0 0 0;
    background: #32465a;
  }
}
#frame #sidepanel #profile.expanded .wrap {
  height: 210px;
  line-height: initial;
}
#frame #sidepanel #profile.expanded .wrap p {
  margin-top: 20px;
}
#frame #sidepanel #profile.expanded .wrap i.expand-button {
  -moz-transform: scaleY(-1);
  -o-transform: scaleY(-1);
  -webkit-transform: scaleY(-1);
  transform: scaleY(-1);
  filter: FlipH;
  -ms-filter: "FlipH";
}
#frame #sidepanel #profile .wrap {
  height: 60px;
  line-height: 60px;
  overflow: hidden;
  -moz-transition: 0.3s height ease;
  -o-transition: 0.3s height ease;
  -webkit-transition: 0.3s height ease;
  transition: 0.3s height ease;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile .wrap {
    height: 55px;
  }
}
#frame #sidepanel #profile .wrap img {
  width: 50px;
  border-radius: 50%;
  padding: 3px;
  border: 2px solid #e74c3c;
  height: auto;
  float: left;
  cursor: pointer;
  -moz-transition: 0.3s border ease;
  -o-transition: 0.3s border ease;
  -webkit-transition: 0.3s border ease;
  transition: 0.3s border ease;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile .wrap img {
    width: 40px;
    margin-left: 4px;
  }
}
#frame #sidepanel #profile .wrap img.online {
  border: 2px solid #2ecc71;
}
#frame #sidepanel #profile .wrap img.away {
  border: 2px solid #f1c40f;
}
#frame #sidepanel #profile .wrap img.busy {
  border: 2px solid #e74c3c;
}
#frame #sidepanel #profile .wrap img.offline {
  border: 2px solid #95a5a6;
}
#frame #sidepanel #profile .wrap p {
  float: left;
  margin-left: 15px;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile .wrap p {
    display: none;
  }
}
#frame #sidepanel #profile .wrap i.expand-button {
  float: right;
  margin-top: 23px;
  font-size: 0.8em;
  cursor: pointer;
  color: #435f7a;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile .wrap i.expand-button {
    display: none;
  }
}
#frame #sidepanel #profile .wrap #status-options {
  opacity: 0;
  visibility: hidden;
  width: 150px;
  margin: 70px 0 0 0;
  border-radius: 6px;
  z-index: 99;
  line-height: initial;
  background: #435f7a;
  -moz-transition: 0.3s all ease;
  -o-transition: 0.3s all ease;
  -webkit-transition: 0.3s all ease;
  transition: 0.3s all ease;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile .wrap #status-options {
    width: 58px;
    margin-top: 57px;
  }
}
#frame #sidepanel #profile .wrap #status-options.active {
  opacity: 1;
  visibility: visible;
  margin: 75px 0 0 0;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile .wrap #status-options.active {
    margin-top: 62px;
  }
}
#frame #sidepanel #profile .wrap #status-options:before {
  content: '';
  position: absolute;
  width: 0;
  height: 0;
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-bottom: 8px solid #435f7a;
  margin: -8px 0 0 24px;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile .wrap #status-options:before {
    margin-left: 23px;
  }
}
#frame #sidepanel #profile .wrap #status-options ul {
  overflow: hidden;
  border-radius: 6px;
}
#frame #sidepanel #profile .wrap #status-options ul li {
  padding: 15px 0 30px 18px;
  display: block;
  cursor: pointer;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile .wrap #status-options ul li {
    padding: 15px 0 35px 22px;
  }
}
#frame #sidepanel #profile .wrap #status-options ul li:hover {
  background: #496886;
}
#frame #sidepanel #profile .wrap #status-options ul li span.status-circle {
  position: absolute;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  margin: 5px 0 0 0;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile .wrap #status-options ul li span.status-circle {
    width: 14px;
    height: 14px;
  }
}
#frame #sidepanel #profile .wrap #status-options ul li span.status-circle:before {
  content: '';
  position: absolute;
  width: 14px;
  height: 14px;
  margin: -3px 0 0 -3px;
  background: transparent;
  border-radius: 50%;
  z-index: 0;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile .wrap #status-options ul li span.status-circle:before {
    height: 18px;
    width: 18px;
  }
}
#frame #sidepanel #profile .wrap #status-options ul li p {
  padding-left: 12px;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #profile .wrap #status-options ul li p {
    display: none;
  }
}
#frame #sidepanel #profile .wrap #status-options ul li#status-online span.status-circle {
  background: #2ecc71;
}
#frame #sidepanel #profile .wrap #status-options ul li#status-online.active span.status-circle:before {
  border: 1px solid #2ecc71;
}
#frame #sidepanel #profile .wrap #status-options ul li#status-away span.status-circle {
  background: #f1c40f;
}
#frame #sidepanel #profile .wrap #status-options ul li#status-away.active span.status-circle:before {
  border: 1px solid #f1c40f;
}
#frame #sidepanel #profile .wrap #status-options ul li#status-busy span.status-circle {
  background: #e74c3c;
}
#frame #sidepanel #profile .wrap #status-options ul li#status-busy.active span.status-circle:before {
  border: 1px solid #e74c3c;
}
#frame #sidepanel #profile .wrap #status-options ul li#status-offline span.status-circle {
  background: #95a5a6;
}
#frame #sidepanel #profile .wrap #status-options ul li#status-offline.active span.status-circle:before {
  border: 1px solid #95a5a6;
}
#frame #sidepanel #profile .wrap #expanded {
  padding: 100px 0 0 0;
  display: block;
  line-height: initial !important;
}
#frame #sidepanel #profile .wrap #expanded label {
  float: left;
  clear: both;
  margin: 0 8px 5px 0;
  padding: 5px 0;
}
#frame #sidepanel #profile .wrap #expanded input {
  border: none;
  margin-bottom: 6px;
  background: #32465a;
  border-radius: 3px;
  color: #f5f5f5;
  padding: 7px;
  width: calc(100% - 43px);
}
#frame #sidepanel #profile .wrap #expanded input:focus {
  outline: none;
  background: #435f7a;
}
#frame #sidepanel #search {
  border-top: 1px solid #32465a;
  border-bottom: 1px solid #32465a;
  font-weight: 300;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #search {
    display: none;
  }
}
#frame #sidepanel #search label {
  position: absolute;
  margin: 10px 0 0 20px;
}
#frame #sidepanel #search input {
  font-family: "proxima-nova",  "Source Sans Pro", sans-serif;
  padding: 10px 0 10px 46px;
  width: calc(100% - 25px);
  border: none;
  background: #32465a;
  color: #f5f5f5;
}
#frame #sidepanel #search input:focus {
  outline: none;
  background: #435f7a;
}
#frame #sidepanel #search input::-webkit-input-placeholder {
  color: #f5f5f5;
}
#frame #sidepanel #search input::-moz-placeholder {
  color: #f5f5f5;
}
#frame #sidepanel #search input:-ms-input-placeholder {
  color: #f5f5f5;
}
#frame #sidepanel #search input:-moz-placeholder {
  color: #f5f5f5;
}
#frame #sidepanel #contacts {
  height: calc(100% - 177px);
  overflow-y: scroll;
  overflow-x: hidden;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #contacts {
    height: calc(100% - 149px);
    overflow-y: scroll;
    overflow-x: hidden;
  }
  #frame #sidepanel #contacts::-webkit-scrollbar {
    display: none;
  }
}
#frame #sidepanel #contacts.expanded {
  height: calc(100% - 334px);
}
#frame #sidepanel #contacts::-webkit-scrollbar {
  width: 8px;
  background: #2c3e50;
}
#frame #sidepanel #contacts::-webkit-scrollbar-thumb {
  background-color: #243140;
}
#frame #sidepanel #contacts ul li.contact {
  position: relative;
  padding: 10px 0 15px 0;
  font-size: 0.9em;
  cursor: pointer;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #contacts ul li.contact {
    padding: 6px 0 46px 8px;
  }
}
#frame #sidepanel #contacts ul li.contact:hover {
  background: #32465a;
}
#frame #sidepanel #contacts ul li.contact.active {
  background: #32465a;
  border-right: 5px solid #435f7a;
}
#frame #sidepanel #contacts ul li.contact.active span.contact-status {
  border: 2px solid #32465a !important;
}
#frame #sidepanel #contacts ul li.contact .wrap {
  width: 88%;
  margin: 0 auto;
  position: relative;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #contacts ul li.contact .wrap {
    width: 100%;
  }
}
#frame #sidepanel #contacts ul li.contact .wrap span {
  position: absolute;
  left: 0;
  margin: -2px 0 0 -2px;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  border: 2px solid #2c3e50;
  background: #95a5a6;
}
#frame #sidepanel #contacts ul li.contact .wrap span.online {
  background: #2ecc71;
}
#frame #sidepanel #contacts ul li.contact .wrap span.away {
  background: #f1c40f;
}
#frame #sidepanel #contacts ul li.contact .wrap span.busy {
  background: #e74c3c;
}
#frame #sidepanel #contacts ul li.contact .wrap img {
  width: 40px;
  border-radius: 50%;
  float: left;
  margin-right: 10px;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #contacts ul li.contact .wrap img {
    margin-right: 0px;
  }
}
#frame #sidepanel #contacts ul li.contact .wrap .meta {
  padding: 5px 0 0 0;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #contacts ul li.contact .wrap .meta {
    display: none;
  }
}
#frame #sidepanel #contacts ul li.contact .wrap .meta .name {
  font-weight: 600;
}
#frame #sidepanel #contacts ul li.contact .wrap .meta .preview {
  margin: 5px 0 0 0;
  padding: 0 0 1px;
  font-weight: 400;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  -moz-transition: 1s all ease;
  -o-transition: 1s all ease;
  -webkit-transition: 1s all ease;
  transition: 1s all ease;
}
#frame #sidepanel #contacts ul li.contact .wrap .meta .preview span {
  position: initial;
  border-radius: initial;
  background: none;
  border: none;
  padding: 0 2px 0 0;
  margin: 0 0 0 1px;
  opacity: .5;
}
#frame #sidepanel #bottom-bar {
  position: absolute;
  width: 100%;
  bottom: 0;
}
#frame #sidepanel #bottom-bar button {
  float: left;
  border: none;
  width: 50%;
  padding: 10px 0;
  background: #32465a;
  color: #f5f5f5;
  cursor: pointer;
  font-size: 0.85em;
  font-family: "proxima-nova",  "Source Sans Pro", sans-serif;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #bottom-bar button {
    float: none;
    width: 100%;
    padding: 15px 0;
  }
}
#frame #sidepanel #bottom-bar button:focus {
  outline: none;
}
#frame #sidepanel #bottom-bar button:nth-child(1) {
  border-right: 1px solid #2c3e50;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #bottom-bar button:nth-child(1) {
    border-right: none;
    border-bottom: 1px solid #2c3e50;
  }
}
#frame #sidepanel #bottom-bar button:hover {
  background: #435f7a;
}
#frame #sidepanel #bottom-bar button i {
  margin-right: 3px;
  font-size: 1em;
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #bottom-bar button i {
    font-size: 1.3em;
  }
}
@media screen and (max-width: 735px) {
  #frame #sidepanel #bottom-bar button span {
    display: none;
  }
}
#frame .content {
  float: right;
  width: 60%;
  height: 100%;
  overflow: hidden;
  position: relative;
}
@media screen and (max-width: 735px) {
  #frame .content {
    width: calc(100% - 58px);
    min-width: 300px !important;
  }
}
@media screen and (min-width: 900px) {
  #frame .content {
    width: calc(100% - 340px);
  }
}
#frame .content .contact-profile {
  width: 100%;
  height: 60px;
  line-height: 60px;
  background: #f5f5f5;
}
#frame .content .contact-profile img {
  width: 40px;
  border-radius: 50%;
  float: left;
  margin: 9px 12px 0 9px;
}
#frame .content .contact-profile p {
  float: left;
}
#frame .content .contact-profile .social-media {
  float: right;
}
#frame .content .contact-profile .social-media i {
  margin-left: 14px;
  cursor: pointer;
}
#frame .content .contact-profile .social-media i:nth-last-child(1) {
  margin-right: 20px;
}
#frame .content .contact-profile .social-media i:hover {
  color: #435f7a;
}
#frame .content .messages {
  height: auto;
  min-height: calc(100% - 93px);
  max-height: calc(100% - 93px);
  overflow-y: scroll;
  overflow-x: hidden;
}
@media screen and (max-width: 735px) {
  #frame .content .messages {
    max-height: calc(100% - 105px);
  }
}
#frame .content .messages::-webkit-scrollbar {
  width: 8px;
  background: transparent;
}
#frame .content .messages::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.3);
}
#frame .content .messages ul li {
  display: inline-block;
  clear: both;
  float: left;
  margin: 15px 15px 5px 15px;
  width: calc(100% - 25px);
  font-size: 0.9em;
}
#frame .content .messages ul li:nth-last-child(1) {
  margin-bottom: 20px;
}
#frame .content .messages ul li.sent img {
  margin: 6px 8px 0 0;
}
#frame .content .messages ul li.sent p {
  background: #435f7a;
  color: #f5f5f5;
}
#frame .content .messages ul li.replies img {
  float: right;
  margin: 6px 0 0 8px;
}
#frame .content .messages ul li.replies p {
  background: #f5f5f5;
  float: right;
}
#frame .content .messages ul li img {
  width: 22px;
  border-radius: 50%;
  float: left;
}
#frame .content .messages ul li p {
  display: inline-block;
  padding: 10px 15px;
  border-radius: 20px;
  max-width: 205px;
  line-height: 130%;
}
@media screen and (min-width: 735px) {
  #frame .content .messages ul li p {
    max-width: 300px;
  }
}
#frame .content .message-input {
  position: absolute;
  bottom: 0;
  width: 100%;
  z-index: 99;
}
#frame .content .message-input .wrap {
  position: relative;
}
#frame .content .message-input .wrap input {
  font-family: "proxima-nova",  "Source Sans Pro", sans-serif;
  float: left;
  border: none;
  width: calc(100% - 90px);
  padding: 11px 32px 10px 8px;
  font-size: 0.8em;
  color: #32465a;
}
@media screen and (max-width: 735px) {
  #frame .content .message-input .wrap input {
    padding: 15px 32px 16px 8px;
  }
}
#frame .content .message-input .wrap input:focus {
  outline: none;
}
#frame .content .message-input .wrap .attachment {
  position: absolute;
  right: 60px;
  z-index: 4;
  margin-top: 10px;
  font-size: 1.1em;
  color: #435f7a;
  opacity: .5;
  cursor: pointer;
}
@media screen and (max-width: 735px) {
  #frame .content .message-input .wrap .attachment {
    margin-top: 17px;
    right: 65px;
  }
}
#frame .content .message-input .wrap .attachment:hover {
  opacity: 1;
}
#frame .content .message-input .wrap button {
  float: right;
  border: none;
  width: 50px;
  padding: 12px 0;
  cursor: pointer;
  background: #32465a;
  color: #f5f5f5;
}
@media screen and (max-width: 735px) {
  #frame .content .message-input .wrap button {
    padding: 16px 0;
  }
}
#frame .content .message-input .wrap button:hover {
  background: #435f7a;
}
#frame .content .message-input .wrap button:focus {
  outline: none;
}
</style>
	<style type="text/css">
	#colorlib-aside #colorlib-main-menu ul li{padding: 6px;}
	</style>
</head>
<body>
	<div id="colorlib-page" style="display:flex; flex-flow:row nowrap;">
		<aside id="colorlib-aside" role="complementary" class="js-fullheight"
			style="position: relative;">
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="${cp}/./">Home</a></li>
					<c:choose>
						<c:when test="${empty sessionScope.id}">					
							<li><a href="${pageContext.request.contextPath}/member/login">Login</a></li>		
						</c:when>	
				 		<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/story/list?num=${sessionScope.num}">Story</a></li>
							<li><a href="${cp }/friends/list?num=${sessionScope.num}">Friends</a></li>			
						</c:otherwise>	 
					</c:choose>
					<li><a href="${pageContext.request.contextPath}/ChatList?num=${sessionScope.num}&clnum=-1">WebSocket</a></li>
					<li><a href="${cp }/emoShop/main">이모티콘(원래 위치는 about.html)</a></li>
					<li><a href="javascript:void(0);" onclick="showCalendar();">Calendar</a></li>
					
				</ul>
			</nav>

		</aside> <!-- END COLORLIB-ASIDE -->
	<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
	    	<div class="container">
	<div id="frame">
		<div id="sidepanel">
			<div id="profile">
				<div class="wrap">
					<img id="profile-img" src="http://emilcarlsson.se/assets/mikeross.png" class="online" alt="" />
					<p>${sessionScope.id }</p>
					<input type="hidden" id="sessionnum" value="${sessionScope.num }">
					<input type="hidden" id="sessionclnum" value="${sessionScope.clnum }">
					<i class="fa fa-chevron-down expand-button" aria-hidden="true"></i>
					<div id="status-options">
						<ul>
							<li id="status-online" class="active"><span class="status-circle"></span> <p>Online</p></li>
							<li id="status-away"><span class="status-circle"></span> <p>Away</p></li>
							<li id="status-busy"><span class="status-circle"></span> <p>Busy</p></li>
							<li id="status-offline"><span class="status-circle"></span> <p>Offline</p></li>
						</ul>
					</div>
					<div id="expanded">
						<label for="twitter"><i class="fa fa-facebook fa-fw" aria-hidden="true"></i></label>
						<input name="twitter" type="text" value="mikeross" />
						<label for="twitter"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i></label>
						<input name="twitter" type="text" value="ross81" />
						<label for="twitter"><i class="fa fa-instagram fa-fw" aria-hidden="true"></i></label>
						<input name="twitter" type="text" value="mike.ross" />
					</div>
				</div>
			</div>
			<div id="search">
				<label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
				<input type="text" placeholder="Search contacts..." />
			</div>
			<div id="contacts">
				<ul>
					<c:forEach var="al" items="${AcList }">
						<c:if test="${al.state !=0 }">
						<li class="contact<c:if test="${sessionScope.clnum==al.clnum }"> active</c:if>"><!-- "contact active" -->
							<div class="wrap">
								<span class="contact-status online"></span>
								<img src="" alt="" />
								<div class="meta">
									<a href="${pageContext.request.contextPath }/moveChatRoom?clnum=${al.clnum}&num=${sessionScope.num}">
										<c:forEach var="cl" items="${ChatList }">
											<c:if test="${cl.clnum == al.clnum }"><p class="name">${cl.name }</p>
											</c:if>
										</c:forEach>
									</a>
									<p class="preview" id="pp${al.clnum }">${clnameMap[al.clnum] }<span> <c:if test="${chatCountMap[al.clnum] !=0}">${chatCountMap[al.clnum] }</c:if> </span>
<%-- 										<span class="badge badge-notify" style="font-size:10px;" id="cc${al.clnum }"></span> --%>
									</p>
								</div>
							</div>
						</li>
						</c:if>
					</c:forEach>

				</ul>
			</div>
			
			<div id="bottom-bar">
				<a href="#layer1" class="btn-example"><button id="addcontact"><i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> <span>Add contact</span></button></a>
				<button id="settings"><i class="fa fa-cog fa-fw" aria-hidden="true"></i> <span>Settings</span></button>
			</div>
			
		</div>
		<c:if test="${clnum > 0 }">
		<div class="content">
			<div class="contact-profile">
				<img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
				<p>${clvo.name }</p>
				<div class="social-media">

					<span class="accordion" id="accordionExample">
							<i class="fa fa-search fa-fw btn-link collapsed" 
							data-toggle="collapse" data-target="#collapseThree" 
				        	aria-expanded="false" aria-controls="collapseThree" aria-hidden="true"></i>
					
					</span>
					<a href="#" class="btn-RoomClose" 
						data-toggle="modal" data-target="#updateroomname">수정</a>
					
					<i class="" aria-hidden="true"></i>
					<a href="#" class="btn-RoomClose" 
						data-toggle="modal" data-target="#exampleModalCenter">방 나가기</a>
						<!-- ${cp }/removeChatRoom?clnum=${sessionScope.clnum}&num=${sessionScope.num} -->
					<i class="" aria-hidden="true"></i>
				</div>
			</div>
			<div id="collapseThree" class="collapse" aria-labelledby="headingThree" 
		    	data-parent="#accordionExample">
		      <div class="card-body">
		      		<input type="text" id="searchChat" size="40">
		      		<a href="#" class="btn-Search" id="searchBtn">검색</a>
		      		<span id="searchcount" class="searchcount">0/0</span>
		      		<a href="#" class="btn-countUp" id="countUp">▲</a>
		      		<a href="#" class="btn-countDown" id="countDown">▼</a>
		      </div>
		    </div>
			
			<div class="messages">
				<ul>
				<c:forEach var="cvo" items="${chat }">
					<c:choose>
						<c:when test="${sessionScope.num == cvo.num }">
							<li class="replies">
							<div style="display:flex;flex-direction:row;align-items:center;justify-content:flex-end;">
							
								<div id="${cvo.cnum }" >
								<c:if test="${readinfomap[cvo.cnum] != 0 }">${readinfomap[cvo.cnum] }
								</c:if>
								</div>
							
							<c:forEach var="ct" items="${chattime }">
								<c:if test="${ct.cnum == cvo.cnum }">(${ct.time })</c:if>
							</c:forEach>
							<p>${cvo.content }</p>
							</div>
							</li>
						</c:when>
						<c:otherwise>
							<li class="sent">
							<div style="display:inline;">
								<div style="margin-left: 35px; margin-bottom: 2px;">${attname[cvo.num] }</div>
								<img src="http://emilcarlsson.se/assets/mikeross.png" alt="" />
								<p>${cvo.content }</p>
								<c:forEach var="ct" items="${chattime }">
									<c:if test="${ct.cnum == cvo.cnum }">
										<span>(${ct.time })</span>
									</c:if>
								</c:forEach>
								
									<span id="${cvo.cnum }" >
									<c:if test="${readinfomap[cvo.cnum] != 0 }">${readinfomap[cvo.cnum] }
									</c:if></span>
								
							</div>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</ul>
			</div>
			
			<div class="message-input">
				<div class="wrap">
				<input type="text" placeholder="Write your message..." id="textID" name="chatInput">
				<i class="fa fa-paperclip attachment" aria-hidden="true"></i>
				<button class="submit" id="buttonMessage"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
				</div>
			</div>
			
		</div>
		</c:if>
	</div>
	<div class="dim-layer">
			    <div class="dimBg"></div>
	<div id="layer1" class="pop-layer">
	    <div class="pop-container">
	        <div class="pop-conts">
	        	<form action="${pageContext.request.contextPath }/CreateChat" id="makefrm">
	            	<!--content //-->
		            <p class="ctxt mb20">친구 목록<br><br>
		            	<c:forEach var="pvo" items="${pvolist }">
		            		<input type="checkbox" value="${pvo.num }" name="fvalue"> ${pvo.name } <br>
		            	</c:forEach>
		                <input type="hidden" value="${sessionScope.num }" name="num">
		            </p>
		            <div class="btn-r">
		            	<a href="#" class="btn-layerMake" onclick="onMakeRoom()">방 만들기</a>
		                <a href="#" class="btn-layerClose">닫기</a>
		            </div>
		            <!--// content-->
	            </form>
	        </div>
	    </div>
	</div>
	</div>
	
	</div>
	</section>
	</div>
	
	</div><!-- END COLORLIB-PAGE -->

			<!-- 
			<a href="#layer2" class="btn-example">딤처리 팝업레이어 1</a>
			<div class="dim-layer">
			    <div class="dimBg"></div>
			    <div id="layer2" class="pop-layer">
			        <div class="pop-container">
			            <div class="pop-conts">
			                <!--content //--><!--
			                <p class="ctxt mb20">Thank you.<br>
			                    Your registration was submitted successfully.<br>
			                    Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
			                    Hope to see you soon!
			                </p>
			
			                <div class="btn-r">
			                    <a href="#" class="btn-layerClose">Close</a>
			                </div>
			                <!--// content--><!-- 
			            </div>
			        </div>
			    </div>
			</div>	 -->
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalCenterTitle">채팅 방 나가기</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        대화 내용을 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <a href="${cp }/removeChatRoom?clnum=${sessionScope.clnum}&num=${sessionScope.num}&check=0" 
			        	class="btn-layerMake">대화내용 삭제하기</a>
			        <a href="${cp }/removeChatRoom?clnum=${sessionScope.clnum}&num=${sessionScope.num}&check=1" 
			        	class="btn-layerMake">대화내용 유지하기</a>
			      </div>
			    </div>
			  </div>
			</div>
			
			
			<div class="modal fade" id="updateroomname" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalCenterTitle">방이름 수정</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        변경할 방이름을 입력해 주세요<br>
			        <input type="text" id="newroomname">
			      </div>
			      <div class="modal-footer">
			        <a href="javascript:void(0);" onclick="updateRoomName()"
			        	class="btn-layerMake">방이름 저장</a>
			        <a href="${cp }/moveChatRoom?clnum=${sessionScope.clnum}&num=${sessionScope.num}" 
			        	class="btn-layerMake">취소</a>
			      </div>
			    </div>
			  </div>
			</div>
			
</body>

<script type="text/javascript">
	function updateRoomName(){
		var name=$("#newroomname").val();
		location.href="${cp}/updateRoomName?clnum=${sessionScope.clnum}&num=${sessionScope.num}&name="+name;
	}
	var index=0;
	var count=0;
	$(function(){
		$("#searchBtn").click(function(e){
			e.preventDefault();
			var jclnum=parseInt($("#sessionclnum").val());
			$.ajax({
				url:"searchChatContentAjax",
				type:"post",
				dataType:"json",
				data: {
					clnum:jclnum,
					content:$("#searchChat").val()
				},success:function(data){
					var chatnum=parseInt(data.chatnum);
					if(chatnum!=0){
						$("#searchcount").html("1/"+data.chatcount);
						index=1;
						count=parseInt(data.chatcount);
						var a=$(".messages").scrollTop();
						var offset = $("#"+chatnum).offset();
						var aaa=a+offset.top-220;
						$(".messages").scrollTop(aaa);
					}else{
						index=0;
						count=0;
						$("#searchcount").html("0/0");
					}
				}
			});
		});
		$("#countUp").click(function(e){
			e.preventDefault();
			if(index >1){
				--index;
				$.ajax({
					url:"searchChatUpAjax",
					type:"post",
					dataType:"json",
					data: {
						index:index
					},success:function(data){
						var chatnum=parseInt(data.chatnum);
						var a=$(".messages").scrollTop();
						var offset = $("#"+chatnum).offset();
						var aaa=a+offset.top-220;
						$(".messages").scrollTop(aaa);
						$("#searchcount").html(index+"/"+count);
					}
				});
			}
		});
		$("#countDown").click(function(e){
			e.preventDefault();
			if(count > index){
				++index;
				$.ajax({
					url:"searchChatUpAjax",
					type:"post",
					dataType:"json",
					data: {
						index:index
					},success:function(data){
						var chatnum=parseInt(data.chatnum);
						var a=$(".messages").scrollTop();
						var offset = $("#"+chatnum).offset();
						var aaa=a+offset.top-220;
						$(".messages").scrollTop(aaa);
						$("#searchcount").html(index+"/"+count);
					}
				});
			}
		});
	});

// 	$(".testaabb").click(function(event){
// 		alert(event.target.id); // 해당 클래스 내에 클릭한 요소의 아이디 받아오기
		// nodeName 이라고 쓰면 요소 속성을 받아올 수 있음! 
// 	});
	
	$(function(){$('#textID').focus();});
	
	var sock = new SockJS("<c:url value="/echo"/>");
	sock.onopen = onOpen;
	sock.onmessage = onMessageAjax;
	sock.onclose = onClose;
	var num = '${sessionScope.num}';
	var id = '${sessionScope.id}';
	var clnum = '${clnum}';
	var ws = null;
	function onOpen(){}
	function sendMessage() { sock.send(num+"!%/"+clnum+"!%/"+$("#textID").val()); }
	function onMessageAjax(msg){
		var data=msg.data;
		var msgArr=data.split("!%/");
		if(msgArr[0]=="otherroom"){
			var jnum=parseInt($("#sessionnum").val());
			var msgclnum=parseInt(msgArr[1]);
			$.ajax({
				url:"getChatCount",
				type:"post",
				dataType:"json",
				data:{
					num:jnum
				},success:function(data){
					$(data).each(function(i,info){
						var jclnum=parseInt(info.clnum);
						var chatCount=parseInt(info.chatCount);
						if(msgclnum==jclnum){
							$("#pp"+jclnum).html('<span>N </span>'+msgArr[2]+'<span> '+chatCount+' </span>');
							//$("#cc"+jclnum).html(chatCount);
							//alert(chatCount);
						}
					});
				}
			});
		}else{
			// 0:content, 1:time, 2:num, 3:chatnum, 4:name
			var jnum=parseInt($("#sessionnum").val());
			var jclnum=parseInt($("#sessionclnum").val());
			var chatnum=parseInt(msgArr[3]);
			if(msgArr[2]==num){
				$('<li class="replies"><div style="display:flex;flex-direction:row;align-items:center;justify-content:flex-end;">'
				+'<div id="'+msgArr[3]+'"></div>'
				+ msgArr[1] +'<p>' + msgArr[0] + '</p></div></li>').appendTo($('.messages ul'));
			}else{
				$('<li class="sent"><div style="margin-left: 35px; margin-bottom: 2px;">'+ msgArr[4]
						+ '</div><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' 
						+ msgArr[0] + '</p>'+msgArr[1]+'<span id="'+msgArr[3]+'"></span></li>').appendTo($('.messages ul'));
			}
			$.ajax({
				url:"chatAjax",
				type:"post",
				dataType:"json",
				data: {
					num:jnum,
					clnum:jclnum
				},success:function(data){
					$(data).each(function(i,chat){
						var chatnum=parseInt(chat.chatnum);
						var count=parseInt(chat.count);
						if(count>=1){
							$("#"+chatnum).html(count);
						}else{
							$("#"+chatnum).html("");
						}
					});
				}
			});
			$('.message-input input').val(null);
			$('.contact.active .preview').html('<span>N </span>' + msgArr[0]);
			$(".messages").animate({ scrollTop: 999999 }, "fast");
		}
	}
	// JSON.parse() -- String 객체를 json 객체로 변환
	// JSON.stringify -- json 객체를 String 객체로 변환
	function onClose(evt) {
		$("#output").append("연결 끊김");
	}
	$('.submit').click(function() {
		sendMessage();
		$('#textID').val('');
	});
	$(window).on('keyup', function(e) {
	  if (e.which == 13) {
			sendMessage();
			$('#textID').val('');
	    return false;
	  }
	});
	$(".messages").animate({ scrollTop: 999999 }, "fast");
	$("#profile-img").click(function() {$("#status-options").toggleClass("active");});
	$(".expand-button").click(function() {
	  $("#profile").toggleClass("expanded");
		$("#contacts").toggleClass("expanded");
	});
	$("#status-options ul li").click(function() {
		$("#profile-img").removeClass();
		$("#status-online").removeClass("active");
		$("#status-away").removeClass("active");
		$("#status-busy").removeClass("active");
		$("#status-offline").removeClass("active");
		$(this).addClass("active");
		
		if($("#status-online").hasClass("active")) { $("#profile-img").addClass("online");
		} else if ($("#status-away").hasClass("active")) { $("#profile-img").addClass("away");
		} else if ($("#status-busy").hasClass("active")) { $("#profile-img").addClass("busy");
		} else if ($("#status-offline").hasClass("active")) { $("#profile-img").addClass("offline");
		} else { $("#profile-img").removeClass(); };
		$("#status-options").removeClass("active");
	});
	$('.btn-example').click(function(){
	        var $href = $(this).attr('href'); layer_popup($href);
	    });
    function layer_popup(el){
        var $el = $(el);        //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수
        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();
        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({ marginTop: -$elHeight /2, marginLeft: -$elWidth/2 })
        } else { $el.css({top: 0, left: 0}); }
        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });
        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut(); return false;
        });
    }
    function onMakeRoom(){ $("#makefrm").submit(); }
	
</script>
</html>