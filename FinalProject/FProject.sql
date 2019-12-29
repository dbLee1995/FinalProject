`DROP TRIGGER TRI_account_num;
DROP TRIGGER TRI_ad_adnum;
DROP TRIGGER TRI_calender_anivernum;
DROP TRIGGER TRI_chatlist_clnum;
DROP TRIGGER TRI_chatnotice_noticenum;
DROP TRIGGER TRI_chat_cnum;
DROP TRIGGER TRI_comments_commnum;
DROP TRIGGER TRI_comment_commnum;
DROP TRIGGER TRI_emoshop_emognum;
DROP TRIGGER TRI_emoticon_emonum;
DROP TRIGGER TRI_favorlist_favornum;
DROP TRIGGER TRI_nationalday_anivernum;
DROP TRIGGER TRI_notice_noticenum;
DROP TRIGGER TRI_options_optionnum;
DROP TRIGGER TRI_option_optionnum;
DROP TRIGGER TRI_present_presnum;
DROP TRIGGER TRI_qna_qnanum;
DROP TRIGGER TRI_story_storynum;



/* Drop Tables */

DROP TABLE readinfo CASCADE CONSTRAINTS;
DROP TABLE chat CASCADE CONSTRAINTS;
DROP TABLE chatnotice CASCADE CONSTRAINTS;
DROP TABLE chatstate CASCADE CONSTRAINTS;
DROP TABLE attendinfo CASCADE CONSTRAINTS;
DROP TABLE calender CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE emoticongroup CASCADE CONSTRAINTS;
DROP TABLE favorlist CASCADE CONSTRAINTS;
DROP TABLE friendlist CASCADE CONSTRAINTS;
DROP TABLE options CASCADE CONSTRAINTS;
DROP TABLE present CASCADE CONSTRAINTS;
DROP TABLE profiles CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE story CASCADE CONSTRAINTS;
DROP TABLE account CASCADE CONSTRAINTS;
DROP TABLE ad CASCADE CONSTRAINTS;
DROP TABLE chatlist CASCADE CONSTRAINTS;
DROP TABLE emoticon CASCADE CONSTRAINTS;
DROP TABLE emoshop CASCADE CONSTRAINTS;
DROP TABLE nationalday CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_account_num;
DROP SEQUENCE SEQ_ad_adnum;
DROP SEQUENCE SEQ_calender_anivernum;
DROP SEQUENCE SEQ_chatlist_clnum;
DROP SEQUENCE SEQ_chatnotice_noticenum;
DROP SEQUENCE SEQ_chat_cnum;
DROP SEQUENCE SEQ_comments_commnum;
DROP SEQUENCE SEQ_comment_commnum;
DROP SEQUENCE SEQ_emoshop_emognum;
DROP SEQUENCE SEQ_emoticon_emonum;
DROP SEQUENCE SEQ_favorlist_favornum;
DROP SEQUENCE SEQ_nationalday_anivernum;
DROP SEQUENCE SEQ_notice_noticenum;
DROP SEQUENCE SEQ_options_optionnum;
DROP SEQUENCE SEQ_option_optionnum;
DROP SEQUENCE SEQ_present_presnum;
DROP SEQUENCE SEQ_qna_qnanum;
DROP SEQUENCE SEQ_story_storynum;




/* Create Sequences */
/* 컬럼명으로 찾기 */

CREATE SEQUENCE SEQ_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_adnum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_anivernum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_clnum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_noticenum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_cnum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_commnum INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE SEQ_emognum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_emonum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_favornum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_anivernum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_noticenum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_optionnum INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE SEQ_presnum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qnanum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_storynum INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE SEQ_purchasenum INCREMENT BY 1 START WITH 1;




/* Create Tables */

-- 계정
CREATE TABLE account
(
	-- 회원번호
	num number(5) primary key,
	-- 아이디
	id varchar2(20) NOT NULL UNIQUE,
	-- 비밀번호
	pwd varchar2(20) NOT NULL
);


-- 광고
CREATE TABLE ad
(
	-- 광고번호
	adnum number(5) PRIMARY KEY,
	-- 광고이름
	adname varchar2(50) NOT NULL,
	-- 광고원본이미지이름
	adorgimg varchar2(50) NOT NULL,
	-- 광고저장이미지이름
	adsaveimg varchar2(50) NOT NULL,
	-- 광고파일크기
	adimgsize long NOT NULL,
	-- 광고등록일자
	addadregdate date NOT NULL,
	-- 광고만료일자
	deladregdate date NOT NULL
);


-- 참여인원정보
CREATE TABLE attendinfo
(
	-- 채팅방번호
	clnum number(5) references chatlist (clnum),
	-- 회원번호
	num number(5) references account (num) ,
	-- 회원상태 : 0:퇴장
	-- 1:참가중
	state number(5),
	CONSTRAINT attnendkey PRIMARY KEY (clnum,num)
);


-- 달력
CREATE TABLE calendar
(
	-- 일정번호
	anivernum number(5) primary key,
	-- 회원번호
	num number(5) references account (num),
	-- 일정이름
	anivername varchar2(50) NOT NULL,
	-- 시작날짜
	aniverstartdate varchar2(60),
	-- 종료날짜
	aniverenddate varchar2(60),
	-- 일정내용
	anivercontent varchar2(200),
	-- 중요도
	aniverimpor varchar2(200),
	-- 일정타입
	anivertype varchar2(200),
	-- 일정색상
	aniverback varchar2(200),
	-- 폰트색상
	anivertext varchar2(200),
	-- 일정알람
	aniveralarm number(5),
	-- 하루종일
	allday varchar2(200)
);


-- 채팅
CREATE TABLE chat
(
	-- 채팅번호
	cnum number(5) primary key,
	-- 상태 : 0:텍스트
	-- 1:이모티콘
	-- 2:사진
	-- 3:#검색(링크)
	state number(5) NOT NULL,
	-- 내용
	content varchar2(100),
	-- 작성일자
	regdate date,
	-- 이모티콘번호
	emoticonnum number(5),
	-- 원본이미지이름
	orgimg varchar2(50),
	-- 저장이미지이름
	saveimg varchar2(50),
	-- 파일크기
	imgsize long,
	-- 채팅방번호
   clnum number(5) ,
	-- 회원번호
	num number(5), 
	Constraint fk_e Foreign Key (clnum,num) References attendinfo(clnum,num)
);


-- 채팅리스트
CREATE TABLE chatlist
(
	-- 채팅방번호
	clnum number(5) primary key,
	-- 채팅방이름
	name varchar2(50)
);


-- 공지
CREATE TABLE chatnotice
(
	-- 공지번호
	noticenum number(5) primary key,
	-- 공지
	notice varchar2(50),
	-- 채팅방번호
	clnum number(5) ,
	-- 회원번호
	num number(5), 
	Constraint fk_ade Foreign Key (clnum,num) References attendinfo(clnum,num)
);


-- 채팅방상태
CREATE TABLE chatstate
(
	-- 알람
	alarm number(5) NOT NULL,
	-- 즐겨찾기
	favo number(5),
	-- 채팅방번호
	clnum number(5) ,
	-- 회원번호
	num number(5), 
	Constraint fk_age Foreign Key (clnum,num) References attendinfo(clnum,num),
	CONSTRAINT chatstatekey PRIMARY KEY (clnum,num)
);


-- 코멘트
CREATE TABLE comments
(
	-- 코멘트번호
	commnum number(5) primary key,
	-- 스토리번호
	storynum number(5) references story (storynum),
	-- 회원번호
	num number(5) references account (num),
	-- 코멘트내용
	commcontent varchar2(50) NOT NULL,
	-- 코멘트그룹번호
	commref number(5) NOT NULL,
	-- 코멘트레벨
	commlev number(5) NOT NULL,
	-- 코멘트출력순서
	commstep number(5) NOT NULL
);


-- 이모티콘샵
CREATE TABLE emoshop
(
	-- 이모티콘그룹번호
	emognum number(5) primary key,
	-- 가격
	price number(10) NOT NULL,
	-- 이모티콘그룹이름
	name varchar2(50) NOT NULL UNIQUE,
	-- 카테고리
	category varchar2(20) NOT NULL,
	-- 대표이미지
	repreImg varhcar2(50) NOT NULL,
	-- 등록일
	regdate date NOT NULL
);


-- 이모티콘
CREATE TABLE emoticon
(
	-- 이모티콘번호
	emonum number(5) primary key,
	-- 이모티콘그룹번호
	emognum number(5) references emoshop (emognum),
	-- 이모티콘원본이미지명
	emoorgimg varchar2(50),
	-- 이모티콘저장이미지명
	emosaveimg varchar2(50),
	-- 이모티콘파일크기
	emoimgsize long
);


-- 이모티콘그룹
CREATE TABLE emoticongroup
(
	-- 이모티콘그룹번호
	emognum number(5) references emoshop (emognum),
	-- 회원번호
	num number(5) references account (num),
	CONSTRAINT emoticongroupkey PRIMARY KEY (emognum,num)
);

-- 이모티콘 구매
CREATE TABLE purchase
(
    purchasenum number(10),
    purchasedate date CONSTRAINT NN_purchase_purchasedate NOT NULL,
    emognum number(6),
    num number(7),
    CONSTRAINT PK_purchase_purchasenum PRIMARY KEY(purchasenum),
    CONSTRAINT FK_purchase_emognum FOREIGN KEY(emognum) REFERENCES emoshop,
    CONSTRAINT FK_purchase_usernum FOREIGN KEY(num) REFERENCES account
);

-- 찜목록
CREATE TABLE favorlist
(
	-- 찜번호
	favornum number(5) primary key,
	-- 찜
	favor number(5),
	-- 이모티콘그룹번호
	emognum number(5) references emoshop (emognum),
	-- 회원번호
	num number(5)  references account (num)
);


-- 친구목록
CREATE TABLE friendlist
(
	-- 회원번호
	num number(5) references account (num),
	-- 친구번호
	fnum number(5) NOT NULL,
	-- 즐겨찾기
	favo number(5),
	-- 차단여부
	spam number(5),
	-- 승인여부
	approv number(5),
	CONSTRAINT friendkey PRIMARY KEY (num,fnum)
);


-- 국가기념일
CREATE TABLE nationalday
(
	-- 기념일번호
	anivernum number(5) PRIMARY KEY,
	-- 기념일이름
	anivername varchar2(50) NOT NULL,
	-- 기념일날짜
	aniverregdate date,
	-- 기념일내용
	anivercontent varchar2(50)
);


-- 공지사항
CREATE TABLE notice
(
	-- 공지사항번호
	noticenum number(5) PRIMARY KEY,
	-- 공지사항제목
	noticetitle varchar2(50) NOT NULL,
	-- 공지사항내용
	noticecontent varchar2(100) NOT NULL,
	-- 공지사항작성일자
	noticeregdate date NOT NULL,
	-- 공지사항상태
	noticestate number(5) DEFAULT 0 NOT NULL
);


-- 옵션
CREATE TABLE options
(
	-- 옵션번호
	optionnum number(5) PRIMARY KEY,
	-- 회원번호
	num number(5) references account (num),
	-- 폰트크기
	fontsize number(5) NOT NULL,
	-- 테마
	theme varchar2(50) NOT NULL
);


-- 선물
CREATE TABLE present
(
	-- 선물번호
	presnum number(5) PRIMARY KEY,
	-- 이모티콘그룹번호
	emognum number(5) references emoshop (emognum),
	-- 주는사람
	gnum number(5) references account (num),
	-- 받는사람
	rnum number(5) references account (num)
);


-- 프로필
CREATE TABLE profiles
(
	-- 회원번호
	num number(5) references account (num) ,
	-- 이름
	name varchar2(20) NOT NULL,
	-- 전화번호
	phone varchar2(20) NOT NULL,
	-- 메일주소
	email varchar2(30) NOT NULL,
	-- 생년월일
	birth date NOT NULL,
	-- 프로필이미지
	profileimg varchar2(50),
	-- 배경이미지
	backimg varchar2(50),
	-- 상태메시지
	msg varchar2(100),
	PRIMARY KEY (num)
);


-- 문의
CREATE TABLE qna
(
	-- 문의번호
	qnanum number(5) PRIMARY KEY,
	-- 회원번호
	num number(5) references account (num),
	-- 문의카테고리
	qnacategory number(5) NOT NULL,
	-- 문의제목
	qnatitle varchar2(50) NOT NULL,
	-- 문의내용
	qnacontent varchar2(100) NOT NULL,
	-- 문의작성일자
	qnaregdate date NOT NULL,
	-- 문의답변
	qnaanswer varchar2(100) NOT NULL,
	-- 문의답변작성일자
	qnaqnswerregdate date NOT NULL
);


-- 읽은사람정보
CREATE TABLE readinfo
(
	-- 채팅번호
	cnum number(5) references chat (cnum),
	clnum number(5),
	-- 회원번호
	num number(5), 
	Constraint fk_ae Foreign Key (clnum,num) References attendinfo(clnum,num),
	CONSTRAINT  readinfokey PRIMARY KEY (num,cnum)
);


-- 스토리
CREATE TABLE story
(
	-- 스토리번호
	storynum number(5) primary key,
	-- 회원번호
	num number(5) references account (num),
	-- 스토리제목
	stitle varchar2(50) NOT NULL,
	-- 스토리내용
	scontent varchar2(50) NOT NULL,
	-- 작성일자
	sregdate date NOT NULL,
	-- 원본이미지이름
	orgimg varchar2(50),
	-- 저장이미지이름
	saveimg varchar2(50),
	-- 파일크기
	imgsize long
);



/* Create Foreign Keys */

ALTER TABLE attendinfo
	ADD FOREIGN KEY (num)
	REFERENCES account (num)
;


ALTER TABLE calender
	ADD FOREIGN KEY (num)
	REFERENCES account (num)
;


ALTER TABLE comments
	ADD FOREIGN KEY (num)
	REFERENCES account (num)
;


ALTER TABLE emoticongroup
	ADD FOREIGN KEY (num)
	REFERENCES account (num)
;


ALTER TABLE favorlist
	ADD FOREIGN KEY (num)
	REFERENCES account (num)
;


ALTER TABLE friendlist
	ADD FOREIGN KEY (num)
	REFERENCES account (num)
;


ALTER TABLE options
	ADD FOREIGN KEY (num)
	REFERENCES account (num)
;


ALTER TABLE present
	ADD FOREIGN KEY (gnum)
	REFERENCES account (num)
;


ALTER TABLE present
	ADD FOREIGN KEY (rnum)
	REFERENCES account (num)
;


ALTER TABLE profiles
	ADD FOREIGN KEY (num)
	REFERENCES account (num)
;


ALTER TABLE qna
	ADD FOREIGN KEY (num)
	REFERENCES account (num)
;


ALTER TABLE story
	ADD FOREIGN KEY (num)
	REFERENCES account (num)
;


ALTER TABLE chat
	ADD FOREIGN KEY (clnum, num)
	REFERENCES attendinfo (clnum, num)
;


ALTER TABLE chatnotice
	ADD FOREIGN KEY (clnum, num)
	REFERENCES attendinfo (clnum, num)
;


ALTER TABLE chatstate
	ADD FOREIGN KEY (clnum, num)
	REFERENCES attendinfo (clnum, num)
;


ALTER TABLE readinfo
	ADD FOREIGN KEY (clnum, num)
	REFERENCES attendinfo (clnum, num)
;


ALTER TABLE readinfo
	ADD FOREIGN KEY (cnum)
	REFERENCES chat (cnum)
;


ALTER TABLE attendinfo
	ADD FOREIGN KEY (clnum)
	REFERENCES chatlist (clnum)
;


ALTER TABLE emoticon
	ADD FOREIGN KEY (emognum)
	REFERENCES emoshop (emognum)
;


ALTER TABLE emoticongroup
	ADD FOREIGN KEY (emognum)
	REFERENCES emoshop (emognum)
;


ALTER TABLE favorlist
	ADD FOREIGN KEY (emognum)
	REFERENCES emoshop (emognum)
;


ALTER TABLE present
	ADD FOREIGN KEY (emognum)
	REFERENCES emoshop (emognum)
;


ALTER TABLE comments
	ADD FOREIGN KEY (storynum)
	REFERENCES story (storynum)
;



/* Comments */

COMMENT ON TABLE account IS '계정';
COMMENT ON COLUMN account.num IS '회원번호';
COMMENT ON COLUMN account.id IS '아이디';
COMMENT ON COLUMN account.pwd IS '비밀번호';
COMMENT ON TABLE ad IS '광고';
COMMENT ON COLUMN ad.adnum IS '광고번호';
COMMENT ON COLUMN ad.adname IS '광고이름';
COMMENT ON COLUMN ad.adorgimg IS '광고원본이미지이름';
COMMENT ON COLUMN ad.adsaveimg IS '광고저장이미지이름';
COMMENT ON COLUMN ad.adimgsize IS '광고파일크기';
COMMENT ON COLUMN ad.addadregdate IS '광고등록일자';
COMMENT ON COLUMN ad.deladregdate IS '광고만료일자';
COMMENT ON TABLE attendinfo IS '참여인원정보';
COMMENT ON COLUMN attendinfo.clnum IS '채팅방번호';
COMMENT ON COLUMN attendinfo.num IS '회원번호';
COMMENT ON COLUMN attendinfo.state IS '회원상태 : 0:퇴장
1:참가중';
COMMENT ON TABLE calender IS '달력';
COMMENT ON COLUMN calender.anivernum IS '기념일번호';
COMMENT ON COLUMN calender.num IS '회원번호';
COMMENT ON COLUMN calender.anivername IS '기념일이름';
COMMENT ON COLUMN calender.aniverregdate IS '기념일날짜';
COMMENT ON COLUMN calender.anivercontent IS '기념일내용';
COMMENT ON COLUMN calender.aniverstate IS '기념일상태 : 0:국가기념일
1:친구생일
2:지정기념일';
COMMENT ON COLUMN calender.alarm IS '알람';
COMMENT ON TABLE chat IS '채팅';
COMMENT ON COLUMN chat.cnum IS '채팅번호';
COMMENT ON COLUMN chat.state IS '상태 : 0:텍스트
1:이모티콘
2:사진
3:#검색(링크)';
COMMENT ON COLUMN chat.content IS '내용';
COMMENT ON COLUMN chat.regdate IS '작성일자';
COMMENT ON COLUMN chat.emoticonnum IS '이모티콘번호';
COMMENT ON COLUMN chat.orgimg IS '원본이미지이름';
COMMENT ON COLUMN chat.saveimg IS '저장이미지이름';
COMMENT ON COLUMN chat.imgsize IS '파일크기';
COMMENT ON COLUMN chat.clnum IS '채팅방번호';
COMMENT ON COLUMN chat.num IS '회원번호';
COMMENT ON TABLE chatlist IS '채팅리스트';
COMMENT ON COLUMN chatlist.clnum IS '채팅방번호';
COMMENT ON COLUMN chatlist.name IS '채팅방이름';
COMMENT ON TABLE chatnotice IS '공지';
COMMENT ON COLUMN chatnotice.noticenum IS '공지번호';
COMMENT ON COLUMN chatnotice.notice IS '공지';
COMMENT ON COLUMN chatnotice.clnum IS '채팅방번호';
COMMENT ON COLUMN chatnotice.num IS '회원번호';
COMMENT ON TABLE chatstate IS '채팅방상태';
COMMENT ON COLUMN chatstate.alarm IS '알람';
COMMENT ON COLUMN chatstate.favo IS '즐겨찾기';
COMMENT ON COLUMN chatstate.clnum IS '채팅방번호';
COMMENT ON COLUMN chatstate.num IS '회원번호';
COMMENT ON TABLE comments IS '코멘트';
COMMENT ON COLUMN comments.commnum IS '코멘트번호';
COMMENT ON COLUMN comments.storynum IS '스토리번호';
COMMENT ON COLUMN comments.num IS '회원번호';
COMMENT ON COLUMN comments.commcontent IS '코멘트내용';
COMMENT ON COLUMN comments.commref IS '코멘트그룹번호';
COMMENT ON COLUMN comments.commlev IS '코멘트레벨';
COMMENT ON COLUMN comments.commstep IS '코멘트출력순서';
COMMENT ON TABLE emoshop IS '이모티콘샵';
COMMENT ON COLUMN emoshop.emognum IS '이모티콘그룹번호';
COMMENT ON COLUMN emoshop.price IS '가격';
COMMENT ON COLUMN emoshop.name IS '이모티콘그룹이름';
COMMENT ON COLUMN emoshop.category IS '카테고리';
COMMENT ON TABLE emoticon IS '이모티콘';
COMMENT ON COLUMN emoticon.emonum IS '이모티콘번호';
COMMENT ON COLUMN emoticon.emognum IS '이모티콘그룹번호';
COMMENT ON COLUMN emoticon.emoorgimg IS '이모티콘원본이미지명';
COMMENT ON COLUMN emoticon.emosaveimg IS '이모티콘저장이미지명';
COMMENT ON COLUMN emoticon.emoimgsize IS '이모티콘파일크기';
COMMENT ON TABLE emoticongroup IS '이모티콘그룹';
COMMENT ON COLUMN emoticongroup.emognum IS '이모티콘그룹번호';
COMMENT ON COLUMN emoticongroup.num IS '회원번호';
COMMENT ON TABLE favorlist IS '찜목록';
COMMENT ON COLUMN favorlist.favornum IS '찜번호';
COMMENT ON COLUMN favorlist.favor IS '찜';
COMMENT ON COLUMN favorlist.emognum IS '이모티콘그룹번호';
COMMENT ON COLUMN favorlist.num IS '회원번호';
COMMENT ON TABLE friendlist IS '친구목록';
COMMENT ON COLUMN friendlist.num IS '회원번호';
COMMENT ON COLUMN friendlist.fnum IS '친구번호';
COMMENT ON COLUMN friendlist.favo IS '즐겨찾기';
COMMENT ON COLUMN friendlist.spam IS '차단여부';
COMMENT ON COLUMN friendlist.approv IS '승인여부';
COMMENT ON TABLE nationalday IS '국가기념일';
COMMENT ON COLUMN nationalday.anivernum IS '기념일번호';
COMMENT ON COLUMN nationalday.anivername IS '기념일이름';
COMMENT ON COLUMN nationalday.aniverregdate IS '기념일날짜';
COMMENT ON COLUMN nationalday.anivercontent IS '기념일내용';
COMMENT ON TABLE notice IS '공지사항';
COMMENT ON COLUMN notice.noticenum IS '공지사항번호';
COMMENT ON COLUMN notice.noticetitle IS '공지사항제목';
COMMENT ON COLUMN notice.noticecontent IS '공지사항내용';
COMMENT ON COLUMN notice.noticeregdate IS '공지사항작성일자';
COMMENT ON COLUMN notice.noticestate IS '공지사항상태';
COMMENT ON TABLE options IS '옵션';
COMMENT ON COLUMN options.optionnum IS '옵션번호';
COMMENT ON COLUMN options.num IS '회원번호';
COMMENT ON COLUMN options.fontsize IS '폰트크기';
COMMENT ON COLUMN options.theme IS '테마';
COMMENT ON TABLE present IS '선물';
COMMENT ON COLUMN present.presnum IS '선물번호';
COMMENT ON COLUMN present.emognum IS '이모티콘그룹번호';
COMMENT ON COLUMN present.gnum IS '주는사람';
COMMENT ON COLUMN present.rnum IS '받는사람';
COMMENT ON TABLE profiles IS '프로필';
COMMENT ON COLUMN profiles.num IS '회원번호';
COMMENT ON COLUMN profiles.name IS '이름';
COMMENT ON COLUMN profiles.phone IS '전화번호';
COMMENT ON COLUMN profiles.email IS '메일주소';
COMMENT ON COLUMN profiles.birth IS '생년월일';
COMMENT ON COLUMN profiles.profileimg IS '프로필이미지';
COMMENT ON COLUMN profiles.backimg IS '배경이미지';
COMMENT ON COLUMN profiles.msg IS '상태메시지';
COMMENT ON TABLE qna IS '문의';
COMMENT ON COLUMN qna.qnanum IS '문의번호';
COMMENT ON COLUMN qna.num IS '회원번호';
COMMENT ON COLUMN qna.qnacategory IS '문의카테고리';
COMMENT ON COLUMN qna.qnatitle IS '문의제목';
COMMENT ON COLUMN qna.qnacontent IS '문의내용';
COMMENT ON COLUMN qna.qnaregdate IS '문의작성일자';
COMMENT ON COLUMN qna.qnaanswer IS '문의답변';
COMMENT ON COLUMN qna.qnaqnswerregdate IS '문의답변작성일자';
COMMENT ON TABLE readinfo IS '읽은사람정보';
COMMENT ON COLUMN readinfo.cnum IS '채팅번호';
COMMENT ON COLUMN readinfo.clnum IS '채팅방번호';
COMMENT ON COLUMN readinfo.num IS '회원번호';
COMMENT ON TABLE story IS '스토리';
COMMENT ON COLUMN story.storynum IS '스토리번호';
COMMENT ON COLUMN story.num IS '회원번호';
COMMENT ON COLUMN story.stitle IS '스토리제목';
COMMENT ON COLUMN story.scontent IS '스토리내용';
COMMENT ON COLUMN story.sregdate IS '작성일자';
COMMENT ON COLUMN story.orgimg IS '원본이미지이름';
COMMENT ON COLUMN story.saveimg IS '저장이미지이름';
COMMENT ON COLUMN story.imgsize IS '파일크기';