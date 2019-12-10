DROP TRIGGER TRI_account_num;
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
/* �÷������� ã�� */

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



/* Create Tables */

-- ����
CREATE TABLE account
(
	-- ȸ����ȣ
	num number(5) primary key,
	-- ���̵�
	id varchar2(20) NOT NULL UNIQUE,
	-- ��й�ȣ
	pwd varchar2(20) NOT NULL
);


-- ����
CREATE TABLE ad
(
	-- �����ȣ
	adnum number(5) PRIMARY KEY,
	-- �����̸�
	adname varchar2(50) NOT NULL,
	-- ��������̹����̸�
	adorgimg varchar2(50) NOT NULL,
	-- ���������̹����̸�
	adsaveimg varchar2(50) NOT NULL,
	-- ��������ũ��
	adimgsize long NOT NULL,
	-- ����������
	addadregdate date NOT NULL,
	-- ����������
	deladregdate date NOT NULL
	
);


-- �����ο�����
CREATE TABLE attendinfo
(
	-- ä�ù��ȣ
	clnum number(5) references chatlist (clnum),
	-- ȸ����ȣ
	num number(5) references account (num) ,
	-- ȸ������ : 0:����
	-- 1:������
	state number(5),
	CONSTRAINT attnendkey PRIMARY KEY (clnum,num)
);


-- �޷�
CREATE TABLE calender
(
	-- ������ȣ
	anivernum number(5) primary key,
	-- ȸ����ȣ
	num number(5) references account (num),
	-- �����̸�
	anivername varchar2(50) NOT NULL,
	-- ���۳�¥
	aniverstartdate varchar2(60),
	-- ���ᳯ¥
	aniverenddate varchar2(60),
	-- ��������
	anivercontent varchar2(200),
	-- �߿䵵
	aniverimpor varchar2(200),
	-- ����Ÿ��
	anivertype varchar2(200),
	-- ��������
	aniverback varchar2(200),
	-- ��Ʈ����
	anivertext varchar2(200),
	-- �����˶�
	aniveralarm number(5),
	-- �Ϸ�����
	allday varchar2(200)
);


-- ä��
CREATE TABLE chat
(
	-- ä�ù�ȣ
	cnum number(5) primary key,
	-- ���� : 0:�ؽ�Ʈ
	-- 1:�̸�Ƽ��
	-- 2:����
	-- 3:#�˻�(��ũ)
	state number(5) NOT NULL,
	-- ����
	content varchar2(100),
	-- �ۼ�����
	regdate date,
	-- �̸�Ƽ�ܹ�ȣ
	emoticonnum number(5),
	-- �����̹����̸�
	orgimg varchar2(50),
	-- �����̹����̸�
	saveimg varchar2(50),
	-- ����ũ��
	imgsize long,
	-- ä�ù��ȣ
   clnum number(5) ,
	-- ȸ����ȣ
	num number(5), 
	Constraint fk_e Foreign Key (clnum,num) References attendinfo(clnum,num)
	
);


-- ä�ø���Ʈ
CREATE TABLE chatlist
(
	-- ä�ù��ȣ
	clnum number(5) primary key,
	-- ä�ù��̸�
	name varchar2(50)
	
);


-- ����
CREATE TABLE chatnotice
(
	-- ������ȣ
	noticenum number(5) primary key,
	-- ����
	notice varchar2(50),
	-- ä�ù��ȣ
	clnum number(5) ,
	-- ȸ����ȣ
	num number(5), 
	Constraint fk_ade Foreign Key (clnum,num) References attendinfo(clnum,num)
	
);


-- ä�ù����
CREATE TABLE chatstate
(
	-- �˶�
	alarm number(5) NOT NULL,
	-- ���ã��
	favo number(5),
	-- ä�ù��ȣ
	clnum number(5) ,
	-- ȸ����ȣ
	num number(5), 
	Constraint fk_age Foreign Key (clnum,num) References attendinfo(clnum,num),
	CONSTRAINT chatstatekey PRIMARY KEY (clnum,num)
);


-- �ڸ�Ʈ
CREATE TABLE comments
(
	-- �ڸ�Ʈ��ȣ
	commnum number(5) primary key,
	-- ���丮��ȣ
	storynum number(5) references story (storynum),
	-- ȸ����ȣ
	num number(5) references account (num),
	-- �ڸ�Ʈ����
	commcontent varchar2(50) NOT NULL,
	-- �ڸ�Ʈ�׷��ȣ
	commref number(5) NOT NULL,
	-- �ڸ�Ʈ����
	commlev number(5) NOT NULL,
	-- �ڸ�Ʈ��¼���
	commstep number(5) NOT NULL
	
);


-- �̸�Ƽ�ܼ�
CREATE TABLE emoshop
(
	-- �̸�Ƽ�ܱ׷��ȣ
	emognum number(5) primary key,
	-- ����
	price number(10) NOT NULL,
	-- �̸�Ƽ�ܱ׷��̸�
	name varchar2(50) NOT NULL, UNIQUE,
	-- ī�װ�
	category varchar2(20) NOT NULL, UNIQUE
	
);


-- �̸�Ƽ��
CREATE TABLE emoticon
(
	-- �̸�Ƽ�ܹ�ȣ
	emonum number(5) primary key,
	-- �̸�Ƽ�ܱ׷��ȣ
	emognum number(5) references emoshop (emognum),
	-- �̸�Ƽ�ܿ����̹�����
	emoorgimg varchar2(50),
	-- �̸�Ƽ�������̹�����
	emosaveimg varchar2(50),
	-- �̸�Ƽ������ũ��
	emoimgsize long
	
);


-- �̸�Ƽ�ܱ׷�
CREATE TABLE emoticongroup
(
	-- �̸�Ƽ�ܱ׷��ȣ
	emognum number(5) references emoshop (emognum),
	-- ȸ����ȣ
	num number(5) references account (num),
	CONSTRAINT emoticongroupkey PRIMARY KEY (emognum,num)
);


-- ����
CREATE TABLE favorlist
(
	-- ���ȣ
	favornum number(5) primary key,
	-- ��
	favor number(5),
	-- �̸�Ƽ�ܱ׷��ȣ
	emognum number(5) references emoshop (emognum),
	-- ȸ����ȣ
	num number(5)  references account (num)
	
);


-- ģ�����
CREATE TABLE friendlist
(
	-- ȸ����ȣ
	num number(5) references account (num),
	-- ģ����ȣ
	fnum number(5) NOT NULL,
	-- ���ã��
	favo number(5),
	-- ���ܿ���
	spam number(5),
	-- ���ο���
	approv number(5),
	CONSTRAINT friendkey PRIMARY KEY (num,fnum)
);


-- ���������
CREATE TABLE nationalday
(
	-- ����Ϲ�ȣ
	anivernum number(5) PRIMARY KEY,
	-- ������̸�
	anivername varchar2(50) NOT NULL,
	-- ����ϳ�¥
	aniverregdate date,
	-- ����ϳ���
	anivercontent varchar2(50)
	
);


-- ��������
CREATE TABLE notice
(
	-- �������׹�ȣ
	noticenum number(5) PRIMARY KEY,
	-- ������������
	noticetitle varchar2(50) NOT NULL,
	-- �������׳���
	noticecontent varchar2(100) NOT NULL,
	-- ���������ۼ�����
	noticeregdate date NOT NULL,
	-- �������׻���
	noticestate number(5) DEFAULT 0 NOT NULL

);


-- �ɼ�
CREATE TABLE options
(
	-- �ɼǹ�ȣ
	optionnum number(5) PRIMARY KEY,
	-- ȸ����ȣ
	num number(5) references account (num),
	-- ��Ʈũ��
	fontsize number(5) NOT NULL,
	-- �׸�
	theme varchar2(50) NOT NULL

);


-- ����
CREATE TABLE present
(
	-- ������ȣ
	presnum number(5) PRIMARY KEY,
	-- �̸�Ƽ�ܱ׷��ȣ
	emognum number(5) references emoshop (emognum),
	-- �ִ»��
	gnum number(5) references account (num),
	-- �޴»��
	rnum number(5) references account (num)
	
);


-- ������
CREATE TABLE profiles
(
	-- ȸ����ȣ
	num number(5) references account (num) ,
	-- �̸�
	name varchar2(20) NOT NULL,
	-- ��ȭ��ȣ
	phone varchar2(20) NOT NULL,
	-- �����ּ�
	email varchar2(30) NOT NULL,
	-- �������
	birth date NOT NULL,
	-- �������̹���
	profileimg varchar2(50),
	-- ����̹���
	backimg varchar2(50),
	-- ���¸޽���
	msg varchar2(100),
	PRIMARY KEY (num)
);


-- ����
CREATE TABLE qna
(
	-- ���ǹ�ȣ
	qnanum number(5) PRIMARY KEY,
	-- ȸ����ȣ
	num number(5) references account (num),
	-- ����ī�װ�
	qnacategory number(5) NOT NULL,
	-- ��������
	qnatitle varchar2(50) NOT NULL,
	-- ���ǳ���
	qnacontent varchar2(100) NOT NULL,
	-- �����ۼ�����
	qnaregdate date NOT NULL,
	-- ���Ǵ亯
	qnaanswer varchar2(100) NOT NULL,
	-- ���Ǵ亯�ۼ�����
	qnaqnswerregdate date NOT NULL
	
);


-- �����������
CREATE TABLE readinfo
(
	-- ä�ù�ȣ
	cnum number(5) references chat (cnum),

	clnum number(5) ,
	-- ȸ����ȣ
	num number(5), 
	Constraint fk_ae Foreign Key (clnum,num) References attendinfo(clnum,num),
	CONSTRAINT  readinfokey PRIMARY KEY (num,cnum)
);


-- ���丮
CREATE TABLE story
(
	-- ���丮��ȣ
	storynum number(5) primary key,
	-- ȸ����ȣ
	num number(5) references account (num),
	-- ���丮����
	stitle varchar2(50) NOT NULL,
	-- ���丮����
	scontent varchar2(50) NOT NULL,
	-- �ۼ�����
	sregdate date NOT NULL,
	-- �����̹����̸�
	orgimg varchar2(50),
	-- �����̹����̸�
	saveimg varchar2(50),
	-- ����ũ��
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

COMMENT ON TABLE account IS '����';
COMMENT ON COLUMN account.num IS 'ȸ����ȣ';
COMMENT ON COLUMN account.id IS '���̵�';
COMMENT ON COLUMN account.pwd IS '��й�ȣ';
COMMENT ON TABLE ad IS '����';
COMMENT ON COLUMN ad.adnum IS '�����ȣ';
COMMENT ON COLUMN ad.adname IS '�����̸�';
COMMENT ON COLUMN ad.adorgimg IS '��������̹����̸�';
COMMENT ON COLUMN ad.adsaveimg IS '���������̹����̸�';
COMMENT ON COLUMN ad.adimgsize IS '��������ũ��';
COMMENT ON COLUMN ad.addadregdate IS '����������';
COMMENT ON COLUMN ad.deladregdate IS '����������';
COMMENT ON TABLE attendinfo IS '�����ο�����';
COMMENT ON COLUMN attendinfo.clnum IS 'ä�ù��ȣ';
COMMENT ON COLUMN attendinfo.num IS 'ȸ����ȣ';
COMMENT ON COLUMN attendinfo.state IS 'ȸ������ : 0:����
1:������';
COMMENT ON TABLE calender IS '�޷�';
COMMENT ON COLUMN calender.anivernum IS '����Ϲ�ȣ';
COMMENT ON COLUMN calender.num IS 'ȸ����ȣ';
COMMENT ON COLUMN calender.anivername IS '������̸�';
COMMENT ON COLUMN calender.aniverregdate IS '����ϳ�¥';
COMMENT ON COLUMN calender.anivercontent IS '����ϳ���';
COMMENT ON COLUMN calender.aniverstate IS '����ϻ��� : 0:���������
1:ģ������
2:���������';
COMMENT ON COLUMN calender.alarm IS '�˶�';
COMMENT ON TABLE chat IS 'ä��';
COMMENT ON COLUMN chat.cnum IS 'ä�ù�ȣ';
COMMENT ON COLUMN chat.state IS '���� : 0:�ؽ�Ʈ
1:�̸�Ƽ��
2:����
3:#�˻�(��ũ)';
COMMENT ON COLUMN chat.content IS '����';
COMMENT ON COLUMN chat.regdate IS '�ۼ�����';
COMMENT ON COLUMN chat.emoticonnum IS '�̸�Ƽ�ܹ�ȣ';
COMMENT ON COLUMN chat.orgimg IS '�����̹����̸�';
COMMENT ON COLUMN chat.saveimg IS '�����̹����̸�';
COMMENT ON COLUMN chat.imgsize IS '����ũ��';
COMMENT ON COLUMN chat.clnum IS 'ä�ù��ȣ';
COMMENT ON COLUMN chat.num IS 'ȸ����ȣ';
COMMENT ON TABLE chatlist IS 'ä�ø���Ʈ';
COMMENT ON COLUMN chatlist.clnum IS 'ä�ù��ȣ';
COMMENT ON COLUMN chatlist.name IS 'ä�ù��̸�';
COMMENT ON TABLE chatnotice IS '����';
COMMENT ON COLUMN chatnotice.noticenum IS '������ȣ';
COMMENT ON COLUMN chatnotice.notice IS '����';
COMMENT ON COLUMN chatnotice.clnum IS 'ä�ù��ȣ';
COMMENT ON COLUMN chatnotice.num IS 'ȸ����ȣ';
COMMENT ON TABLE chatstate IS 'ä�ù����';
COMMENT ON COLUMN chatstate.alarm IS '�˶�';
COMMENT ON COLUMN chatstate.favo IS '���ã��';
COMMENT ON COLUMN chatstate.clnum IS 'ä�ù��ȣ';
COMMENT ON COLUMN chatstate.num IS 'ȸ����ȣ';
COMMENT ON TABLE comments IS '�ڸ�Ʈ';
COMMENT ON COLUMN comments.commnum IS '�ڸ�Ʈ��ȣ';
COMMENT ON COLUMN comments.storynum IS '���丮��ȣ';
COMMENT ON COLUMN comments.num IS 'ȸ����ȣ';
COMMENT ON COLUMN comments.commcontent IS '�ڸ�Ʈ����';
COMMENT ON COLUMN comments.commref IS '�ڸ�Ʈ�׷��ȣ';
COMMENT ON COLUMN comments.commlev IS '�ڸ�Ʈ����';
COMMENT ON COLUMN comments.commstep IS '�ڸ�Ʈ��¼���';
COMMENT ON TABLE emoshop IS '�̸�Ƽ�ܼ�';
COMMENT ON COLUMN emoshop.emognum IS '�̸�Ƽ�ܱ׷��ȣ';
COMMENT ON COLUMN emoshop.price IS '����';
COMMENT ON COLUMN emoshop.name IS '�̸�Ƽ�ܱ׷��̸�';
COMMENT ON COLUMN emoshop.category IS 'ī�װ�';
COMMENT ON TABLE emoticon IS '�̸�Ƽ��';
COMMENT ON COLUMN emoticon.emonum IS '�̸�Ƽ�ܹ�ȣ';
COMMENT ON COLUMN emoticon.emognum IS '�̸�Ƽ�ܱ׷��ȣ';
COMMENT ON COLUMN emoticon.emoorgimg IS '�̸�Ƽ�ܿ����̹�����';
COMMENT ON COLUMN emoticon.emosaveimg IS '�̸�Ƽ�������̹�����';
COMMENT ON COLUMN emoticon.emoimgsize IS '�̸�Ƽ������ũ��';
COMMENT ON TABLE emoticongroup IS '�̸�Ƽ�ܱ׷�';
COMMENT ON COLUMN emoticongroup.emognum IS '�̸�Ƽ�ܱ׷��ȣ';
COMMENT ON COLUMN emoticongroup.num IS 'ȸ����ȣ';
COMMENT ON TABLE favorlist IS '����';
COMMENT ON COLUMN favorlist.favornum IS '���ȣ';
COMMENT ON COLUMN favorlist.favor IS '��';
COMMENT ON COLUMN favorlist.emognum IS '�̸�Ƽ�ܱ׷��ȣ';
COMMENT ON COLUMN favorlist.num IS 'ȸ����ȣ';
COMMENT ON TABLE friendlist IS 'ģ�����';
COMMENT ON COLUMN friendlist.num IS 'ȸ����ȣ';
COMMENT ON COLUMN friendlist.fnum IS 'ģ����ȣ';
COMMENT ON COLUMN friendlist.favo IS '���ã��';
COMMENT ON COLUMN friendlist.spam IS '���ܿ���';
COMMENT ON COLUMN friendlist.approv IS '���ο���';
COMMENT ON TABLE nationalday IS '���������';
COMMENT ON COLUMN nationalday.anivernum IS '����Ϲ�ȣ';
COMMENT ON COLUMN nationalday.anivername IS '������̸�';
COMMENT ON COLUMN nationalday.aniverregdate IS '����ϳ�¥';
COMMENT ON COLUMN nationalday.anivercontent IS '����ϳ���';
COMMENT ON TABLE notice IS '��������';
COMMENT ON COLUMN notice.noticenum IS '�������׹�ȣ';
COMMENT ON COLUMN notice.noticetitle IS '������������';
COMMENT ON COLUMN notice.noticecontent IS '�������׳���';
COMMENT ON COLUMN notice.noticeregdate IS '���������ۼ�����';
COMMENT ON COLUMN notice.noticestate IS '�������׻���';
COMMENT ON TABLE options IS '�ɼ�';
COMMENT ON COLUMN options.optionnum IS '�ɼǹ�ȣ';
COMMENT ON COLUMN options.num IS 'ȸ����ȣ';
COMMENT ON COLUMN options.fontsize IS '��Ʈũ��';
COMMENT ON COLUMN options.theme IS '�׸�';
COMMENT ON TABLE present IS '����';
COMMENT ON COLUMN present.presnum IS '������ȣ';
COMMENT ON COLUMN present.emognum IS '�̸�Ƽ�ܱ׷��ȣ';
COMMENT ON COLUMN present.gnum IS '�ִ»��';
COMMENT ON COLUMN present.rnum IS '�޴»��';
COMMENT ON TABLE profiles IS '������';
COMMENT ON COLUMN profiles.num IS 'ȸ����ȣ';
COMMENT ON COLUMN profiles.name IS '�̸�';
COMMENT ON COLUMN profiles.phone IS '��ȭ��ȣ';
COMMENT ON COLUMN profiles.email IS '�����ּ�';
COMMENT ON COLUMN profiles.birth IS '�������';
COMMENT ON COLUMN profiles.profileimg IS '�������̹���';
COMMENT ON COLUMN profiles.backimg IS '����̹���';
COMMENT ON COLUMN profiles.msg IS '���¸޽���';
COMMENT ON TABLE qna IS '����';
COMMENT ON COLUMN qna.qnanum IS '���ǹ�ȣ';
COMMENT ON COLUMN qna.num IS 'ȸ����ȣ';
COMMENT ON COLUMN qna.qnacategory IS '����ī�װ�';
COMMENT ON COLUMN qna.qnatitle IS '��������';
COMMENT ON COLUMN qna.qnacontent IS '���ǳ���';
COMMENT ON COLUMN qna.qnaregdate IS '�����ۼ�����';
COMMENT ON COLUMN qna.qnaanswer IS '���Ǵ亯';
COMMENT ON COLUMN qna.qnaqnswerregdate IS '���Ǵ亯�ۼ�����';
COMMENT ON TABLE readinfo IS '�����������';
COMMENT ON COLUMN readinfo.cnum IS 'ä�ù�ȣ';
COMMENT ON COLUMN readinfo.clnum IS 'ä�ù��ȣ';
COMMENT ON COLUMN readinfo.num IS 'ȸ����ȣ';
COMMENT ON TABLE story IS '���丮';
COMMENT ON COLUMN story.storynum IS '���丮��ȣ';
COMMENT ON COLUMN story.num IS 'ȸ����ȣ';
COMMENT ON COLUMN story.stitle IS '���丮����';
COMMENT ON COLUMN story.scontent IS '���丮����';
COMMENT ON COLUMN story.sregdate IS '�ۼ�����';
COMMENT ON COLUMN story.orgimg IS '�����̹����̸�';
COMMENT ON COLUMN story.saveimg IS '�����̹����̸�';
COMMENT ON COLUMN story.imgsize IS '����ũ��';