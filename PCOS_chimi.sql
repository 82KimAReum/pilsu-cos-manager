

create table Member
(
email varchar2(50) primary key,
name varchar2(30) not null,
age number(4) not null,
gender char(1) not null,
skinType varchar2(9) not null,
phone varchar2(11) ,
zipcode char(5) ,
address1 varchar2(200) ,
address2 varchar2(200) ,
regStat char(1) not null
);

create table Brand
(
brandCode char(1) primary key,
brandName varchar2(100) not null
);
create table Category
(
categoryCode char(1) primary key,
categoryName varchar2(100) not null
);
create sequence seq_faqNo  increment by 1;
drop sequence seq_faqNo;
truncate table faq;
create table FAQ(
faqNo number(4) default seq_faqNo.nextval  primary key,
title varchar2(50) not null ,
contents varchar2(500) not null
);
------

create table QNA
(
qnaNo char(17)  primary key,
title varchar2(50) not null,
content varchar2(500) not null,
refDate date default sysdate,
replStat char(1) not null,
email varchar2(50) not null,
constraint qna_fk_email foreign key (email) REFERENCES Member(email)
);
drop table onetoone;


create table p_Order(
orderNo char(19) primary key ,
name varchar2(20) not null,
zipcode varchar2(5) not null,
address1 varchar2(200) not null,
address2 varchar2(200) not null,
phone varchar2(11) not null,
payment char(4) ,
comments varchar2(100) ,
orderDate date default sysdate,
orderStat char(1) not null,
email varchar2(50) not null,
constraint p_order_fk_email foreign key (email) REFERENCES Member(email)
);


create table Board
(
boardNo char(19)  primary key,
title varchar2(50) not null,
contents varchar2(500) not null,
regDate date default sysdate,
readCount number(5) default 0,
likeCount number(5) default 0,
dislikeCount number(5) default 0,
email varchar2(50) not null,
constraint board_fk_email foreign key (email) REFERENCES Member(email)
);
create table Product (
productCode char(13) primary key,
productName varchar2(100) not null,
productDesc varchar2(500) not null,
price number(6) not null,
capacity varchar2(10) not null,
image varchar2(300) not null,
categoryCode char(1) not null,
brandCode char(1) not null,
constraint product_fk_categorycode foreign key (categoryCode) references Category(categoryCode),
constraint product_fk_brandCode foreign key (brandCode) REFERENCES Brand(brandCode)
);

alter table Product modify  productName varchar2(100);

create table Cart
(
cartNo char(18)  primary key,
amount number(3) not null,
email varchar2(50) not null,
productCode char(13) not null,
constraint cart_fk_email foreign key (email) REFERENCES Member(email),
constraint cart_fk_productcode foreign key (productCode) REFERENCES Product(productCode)
);


create table OrderDetail(
productCode char(13) not null,
orderNo char(19) not null,
amount number(3) not null,
price number(6) not null,
constraint orderdetaul_fk_productcode foreign key (productCode) REFERENCES Product(productCode),
constraint orderdetaul_fk_orderno foreign key (orderNo) REFERENCES p_Order(orderNo)
);
--create sequence seq_gradeNo start with 1 increment by 1;
create table Grade(
gradeNo char(19)  primary key,
comments varchar2(1000) not null,
grade number(2,1) default 0.0,
regDate date default sysdate,
email varchar2(50) not null,
productCode char(13) not null,
constraint grade_fk_email foreign key (email) REFERENCES Member(email),
constraint grade_fk_productcode foreign key (productCode) REFERENCES Product(productCode)

);

-----
create table AvgGrade(
productCode char(13) not null,
avgGrade number(2,1) default 0.0,
totalCount ,
type1Count,
type1Avg,
type2Count,
type2Avg,
type3Count,
type3Avg
);
create or replace trigger tr_grade
after
insert or update on Grade
begin
    insert into AvgGrade
    values();
end;
/
insert into Brand(brandCode ,brandName) 
values('A','에뛰드하우스');
insert into Brand(brandCode ,brandName) 
values('B','이니스프리');
insert into Brand(brandCode ,brandName) 
values('C','스킨푸드');
insert into Brand(brandCode ,brandName) 
values('D','데페이스샵');
insert into Brand(brandCode ,brandName) 
values('E','미샤');
insert into Brand(brandCode ,brandName) 
values('F','토니모리');
insert into Brand(brandCode ,brandName) 
values('G','네이처리퍼블릭');
insert into Brand(brandCode ,brandName) 
values('H','기타');
insert into category(categoryCode,categoryName)
values('1','스킨');
insert into category(categoryCode,categoryName)
values('2','로션');
insert into category(categoryCode,categoryName)
values('3','에센스');
insert into category(categoryCode,categoryName)
values('4','크림/젤');
insert into category(categoryCode,categoryName)
values('5','오일');
insert into category(categoryCode,categoryName)
values('6','선블록');
insert into category(categoryCode,categoryName)
values('7','클랜징');
insert into category(categoryCode,categoryName)
values('8','마스크팩');
insert into category(categoryCode,categoryName)
values('9','쉐이빙크림');


insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rladkfma0208@naver.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rladkfma0208@gmail.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rladkfma0208@daum.net','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rladkfma0208@nate.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('8@naver.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('08@naver.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rl@naver.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('adkfma@naver.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('208@naver.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('0208@naver.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rlad08@naver.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('adkfma0208@naver.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('r208@naver.com','김아름',23,'F','복합성','01050068435','00000','고양시','관산동','Y');
commit;


insert into chimi.Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0008','퓨어 워터 바오밥 마일드 로션 SPF30/PA++','끈적임없이 가볍고 촉촉한 자외선 차단기능의 데일리 마일드 로션!-자외선 차단 기능 겸비＆화사한 브라이트닝 효과 마치 물결이 퍼지듯 가볍고 부드러운 퍼짐성으로 빠르게 스며들어 맑고 화사하게 피부를 만들어 주는 자외선 차단 기능 겸용 마일드 로션-메마른 피부를 맑고 촉촉하게!',11500,'90ml','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150430/1430383272682.jpg','2','A');
insert into chimi.Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('','','',,'','','2','A');

"prod_A_2_0006","핑크 생기 워터 에멀전","답답함 없이 부드럽게 피부를 감싸 푸석하고 거친 피부를 매끄럽게 가꾸어 주는 생기충전 수분 에멀젼- 핑크 복숭아 워터와 비타민 A/C/E 가 함유된 부드러운 밀키 포뮬러가 부드럽게 피부에 흡수되어 건조하고 거칠어진 피부를 핑크빛 생기 넘치는 피부로 가꾸어 주는 생기 충전 수분 에멀전입니다.- 핑크 복숭아 워터 68.86% 함유",13000,	"180ml"	,"http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160302/1456886498278.jpg","2","A"
prod_A_2_0007	토닝 화이트 C 래디언스 에멀전	- 강력한 항산화 효과의 베리 C 토닝 워터와 촘촘하게 수분을 채우는 미네랄 토닝 워터가 함유되어 촉촉한 투명 유리알 피부로 가꾸는 비타민 화이트닝 에멀전 입니다.- 부드럽고 촉촉한 밀크 타입으로 피부를 환하게 가꾸는 동시에 충만한 수분감을 선사합니다.- 빠르게 흡수되어 피부에 산뜻하고 맑은 유연감을 지속적으로 유지시켜 줍니다.	18000	180ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160202/1454392610858.jpg	2	A
prod_A_2_0008	퓨어 워터 바오밥 마일드 로션 SPF30/PA++	끈적임없이 가볍고 촉촉한 자외선 차단기능의 데일리 마일드 로션!-자외선 차단 기능 겸비＆화사한 브라이트닝 효과 마치 물결이 퍼지듯 가볍고 부드러운 퍼짐성으로 빠르게 스며들어 맑고 화사하게 피부를 만들어 주는 자외선 차단 기능 겸용 마일드 로션-메마른 피부를 맑고 촉촉하게!	11500	90ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150430/1430383272682.jpg	2	A
prod_A_2_0009	수분가득 콜라겐 로션	가벼운 텍스쳐" 그러나 깊은 수분과 탄력을 공급해주는 밀키 로션. 응집력 있는 탱글탱글한 수분 방울이 피부를 부드럽게 조여주듯 탄력감을 부여해주며" 바오밥 나무 추출물과 콜라겐이 배합되어 스킨케어 첫단계부터 촉촉한 느낌을 부여해줍니다. 일반 스킨과 달리" 수분가득 콜라겐 스킨은 응집력이 강하여 스킨 방울이 탱탱하게 형태를 유지하는 신제형.	12000	180ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401947638533.jpg	2	A
prod_A_2_0010	원더포어 클리어링 에멀전	산뜻하게 퍼지고 가볍게 마무리되어 흐트러진 모공을 정돈해주는 박하초 함유 모공 에멀전-박하초함유: 초산공법으로 탄생된 박하초가 함유되어 모공의 고민을 해결해주는 모공 울트라 솔루션 제품입니다-산뜻하고 가볍게: 피부에 산뜻하게 퍼지고 가볍게 마무리되어 흐트러진 모공을 정돈해줍니다-약산성 pH 모공 케어: 약산성 pH 모공 케어로 아기 피부처험 부드럽게 케어해주며 PH밸런스를 맞추는데 도움을 줍니다	11999	150ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150506/1430882549156.jpg	2	A
prod_A_2_0011	퓨어 워터 바오밥 모이스처라이저	물방울이 톡 터지듯 빠르게 수분을 채워 주는 촉촉한 모이스처라이저메마른 피부를 맑고 촉촉하게!- 수분 함유량이 높은 바오밥 워터와 탁월한 정화능력을 가진 모링가 씨앗이 함유되어" 메마른 피부에 맑고 촉촉한 수분을 빠르게 채워주는 모이스처라이저입니다.보들보들 매끄러운 물결 피부!- 마치 물방울이 톡 터지듯 가볍고 부드러운 퍼짐성으로 빠르게 흡수되어" 넘칠 듯 찰랑이는 수분감과 보들보들 매끄러운 피부결을 가진 물결 피부를 만들어줍니다.	10500	180ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140807/1407477366730.jpg	2	A
prod_A_2_0012	AC클리닉 데일리 젤 로션	피부 고민 있기 전에 매일매일~유수분 조절 로션. 수용성 보습 성분이 다량 함유되어 유분감과 끈적임은 줄여주고" 부족한 수분은 채워주는 유수분 밸런싱 젤 로션입니다. 살리실산과 특허 출원 성분인 편백나무 추출물 등의 성분이 함유되어 있고 가볍게 시원한 발림성으로 피부에 부담없이 산뜻하고 촉촉하게 마무리 해줍니다.	9500	150ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401949398129.jpg	2	A
prod_A_2_0013	스킨맑음 에멀젼	부드러운 텍스쳐의 피부 보습" 보호 모이스쳐라이져. 스킨 맑음의 어떤 스킨과도 잘 어울어지는 텍스쳐로" 에센스 혹은 크림을 바른 듯 보습" 보호효과가 탁월합니다. 바바수 열매 추출물의 함유로 피부 위에서 미끄러지듯 부드럽게 퍼지며" 번들거림 없이 탁월한 보습력을 나타냅니다. 5 free 파라벤" 인공색소" 벤조페논" 동물성 원료" 광물유 free.	12000	200ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401950562365.jpg	2	A
prod_A_2_0014	영양가득 시어버터 에센셜 라이져	에센스의 농축 성분 + 로션의 피부 보호 효과! 신개념 모이스처라이져. 농축된 영양을 집중 공급해주는 에센스와 유"수분 밸런스를 맞춰주는 로션이 결합된 형태의 고보습 ＆ 고영양 모이스쳐라이져. 인증받은 유기농 시어버터와 극한 지역에 자생하여 영양이 가득한 클라우드 베리 성분의 함유로 매우 건조한 피부를 촉촉하고 윤기있게 가꾸어줍니다. 메이크업 단계시 생기있고 매끈한 피부를 표현해줍니다.	18000	60ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401962947211.jpg	2	A
prod_A_2_0015	달링플러스 리페어링 에멀젼	바르는 순간 촉촉하고 편안하게 밀착되는 부드러운 질감의 에멀젼- 유수분을 차곡차곡 채워 피부 보호막 형성: 피부에 차곡차곡 유수분을 채워 피부 보호막을 형성하여줄 뿐만 아니라 거칠어진 피부결을 유연하게 가꿔줍니다.- 달팽이 점액 여과물 72% 함유: 탁월한 보습효과 뿐만 아니라 피부장벽강화 효과도 우수한 프랑스로부터 온 달팽이 점액 여과물- 주름개선 + 미백 이중 기능성: 칙칙하고 연약해진 피부를 환하고 탄탄하게 개선해주는 미백 ＆ 주름개선 이중 기능성 제품입니다.	28000	120ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20141103/1414997728814.jpg	2	A
prod_A_2_0016	라이크20 에센셜 에멀젼	에센스의 영양 성분이 가득 농축된 듯한 리치한 텍스쳐의 에멀젼이 메마른 피부에 깊은 보습과 영양을 공급해 주어" 조밀조밀 탄탄한 건강한 피부로 지켜줍니다. 피부결을 따라 부드럽고 매끄럽게 퍼지면서 피부에 풍부한 보습감을 선사하고 끈적임 없이 촉촉하게 마무리 됩니다.	16000	140ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401963876878.jpg	2	A
prod_A_2_0017	진주 광채 오로라 에센스 로션	미세한 타히티 흑진주와 오로라 입자가 함유된 진주 오로라 광채 성분이 함유되어" 피부 사이사이를 촘촘하고 촉촉하게 채워 투명한 광채를 부여하여 주는 데일리 에멀젼입니다. 바르는 즉시 부드러운 보습 윤기막이 피부를 감싸고" 풍부한 수분감과 밀도높은 탄력 부여로 크림까지 꼼꼼하게 바른 듯 오래도록 촉촉하고 매끈하게 빛나는 피부로 만들어 줍니다.	12000	100ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401960315164.jpg	2	A
prod_A_3_0009	한 장 솔루션 봉 앤 마스크 필링 키트	각질 싹! 매끈 필링 3스텝 키트- calming-energy 워터 함유 초극세사 시트- 포근한 구름 시트가 푹 잔 듯 피부 컨디션 회복- 16가닥의 공기 통로로 에센스 전달 매커니즘 활성화*전성분은 필링 수딩 마스크를 기준으로 등록되었습니다.	3900	4ml+2ml+25ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20170125/1485325237297.png	3	A
prod_A_3_0010	수분가득 콜라겐 에센스	* 2015년 리뉴얼 된 제품입니다 *어떠한 환경에서도 수분과 탄력을 지켜주는 고농축 에센스. 피부 내의 수분이 빠져나가지 않도록 작용하는 세라마이드 캡슐을 다량 함유하여 강력한 수분막을 형성해 줍니다. 피부위에서 미끄러지듯 부드럽게 퍼지며 촉촉하고 탄력있는 마무리감을 부여해 줍니다.	15000	45ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150901/1441103224814.jpg	3	A
prod_A_3_0011	펩타이드 버블 업 세럼	Firming Up! Tightening Up! Brightening Up! 맑은 생기 보습과 힘 있는 탄력" 팽팽한 타이트닝 효과로 시간과 환경으로 변화된 피부의 마이너스 사인을 잡아주어 탄탄한 탄성피부로 가꾸어주는 3 in 1 올케어 세럼* 온라인 전용 상품입니다.	38000	70ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20180510/1525934832559.png	3	A
prod_A_3_0012	제로피지 오일컷 매끈에센스	매끈한 피부로 케어해주는 실리콘 Free 에센스-피부에 부담없이 매끄러운 피부로 가꾸어 주는 실리콘 프리 에센스-유수분밸런스케어로 건조함없는 균형잡힌 피부-3가지 성분 무첨가 : 실리콘" 광물성오일" 타르색소	12000	40ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160516/1463388970988.PNG	3	A
prod_A_3_0013	수분가득 알로에 퍼스트 에센스	세안 후 피부가 목마를 때 가장 먼저 사용하는 첫번째 에센스로" 유기농 알로에가 86.9%가 함유되어 피부에 진정 효과와 함께 수분을 풍부히 공급하여 푸석한 피부에 촉촉함과 건강함을 부여해줍니다. 광물성"파라벤"탤크 free. 유기농 알로에 86.9% 함유.	15000	100ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401957003581.jpg	3	A
prod_A_3_0014	0초 미네랄 세럼	세안 직후 0초 강력 부스팅 효과를 주는 온천수 미스트 세럼. 세안 직후의 건조하고 약해진 피부에 빠른 수분 공급으로 피부를 건강하게 부스팅 시켜 주는 미스트 타입의 0초 세럼입니다. 피부 진정과 수분 공급에 효과적인 각종 미네랄 온천수와 피부 필수 성분들이 다량으로 함유되어" 보들보들 매끈하게 피부에 스며들어 피부 본연의 힘을 키워 줍니다.	14000	160ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401956865136.jpg	3	A
prod_A_3_0015	수분가득 콜라겐 물광필러	히알루로산이 콜라겐을 감싸고 있는 형태인 마이크로 콜라겐 히아루캡슐이 피부에 전달되어 바오밥 워터를 끌어당겨 피부에 수분을 빠르게 채워 줍니다. 바오밥 나무의 점액과 히알루로산이 피부 층 사이사이를 빈틈없이 촉촉하게 수분입자를 붙여주는 역할을 해 피부 속을 더욱 촉촉하게 케어해줍니다. 바오밥 점액과 마이크로 콜라겐 히아루캡슐이 피부속에서 촉촉하게 터져 피부의 건조함을 다스려주고 푸석푸석하고 건조한 피부에 자연스러운 물광효과를 부여해줍니다.	18000	50ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401958090434.jpg	3	A
prod_A_3_0016	라이크20 부스터 에센스	보습과 탄력을 빠르게 채워주는 첫 단계 오일젤 세럼. 세안" 에어컨" 히터" 극심한 온도차 등으로 약해진 피부 장벽을 강화시켜 초기 노화를 완화해 주는 젤 타입의 부스팅 오일 에센스입니다. 가볍고 산뜻한 젤이 깊은 보습력을 가진 오일로 변해 끈적임 없이 매끄럽게 피부에 도포되어" 피부 보습과 탄력을 부여하고 수분 증발을 막아 촉촉 매끈하게 윤기 흐르는 피부결을 만들어 줍니다.	16000	100ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401963460537.jpg	3	A
prod_A_3_0017	토탈에이지리페어 로얄 에센스	안티에이징의해답" 건강한 발효가 선사하는 피부의 힘. 늘어지듯 쫀득한 텍스처의 피부 유연감 개선 및 탄력 공급 이중 기능성 토탈에센스. 지중해 자생 식물 임모르뗄 플라워 추출물과 로얄제리의 성분 발효 컴플렉스와 베롱나무꽃 추출물" 히알루로산이 함유되어피부에 탄력과 보습을 제공하고" 에이지 매트릭스가 피부결을 촘촘하고 매끈하게 해주어 건강하고 윤기있는 피부로 가꾸어 줍니다.	22000	45ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401959126192.JPG	3	A

select * from member
where name like concat('%',concat('rladkfma','%')) or email like concat('%',concat('rladkfma','%'))  or phone like concat('%',concat('rladkfma','%'));

select * from member;

delete from Member
where email in('08@naver.com','8@naver.com');
------------------
create or replace procedure deleteMember_SP
(
v_email in String
)
is
begin
    delete from Member
    where email in(v_email);
    commit;
end;
/





insert into faq(title,contents)
values('hi123','hifgadgaergerger');
insert into faq(title,contents)
values('raldkfma','hifgadgaergerger');
insert into faq(title,contents)
values('냥냥','hifgadgaergerger');
commit;


 select count(*) 
        from faq    
        where title like concat('%',concat('냥','%'));

-------------------------------------------------------------------------
--1:1문의 코드 qna_yyyymmdd_seq
--매일 새로은 seq refdata는 날짜형
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180101_0001','타이틀','내용','2018-01-01','Y','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180101_0002','타이틀','내용','2018-01-01','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180101_0003','타이틀','내용','2018-01-01','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180101_0004','타이틀','내용','2018-01-01','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180101_0005','타이틀','내용','2018-01-01','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0001','타이틀','내용','2018-01-02','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0002','타이틀','내용','2018-01-02','Y','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0003','타이틀','내용','2018-01-02','N','rladkfma0208@naver.com');
--
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0004','타이틀','내용','2018-01-02','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0005','타이틀','내용','2018-01-02','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0006','타이틀','내용','2018-01-02','Y','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0007','타이틀','내용','2018-01-02','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0008','타이틀','내용','2018-01-02','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0009','타이틀','내용','2018-01-02','N','rladkfma0208@naver.com');

commit;
truncate table onetoone;
---------------------------
select count(*) from onetoone;
--
select max(qnano) from onetoone;
--insert시 마지막 qnano를 찾고 오늘과 같은 날인지 비교 후 같은 날이면 seq+1값
--오늘과 같은 날이 아니면 오늘의 seq시작값
-----------------------
select * 
from (
    select A.*, rownum as rnum 
    from (
        select * 
        from onetoone    
        order by replstat asc, refdate desc
        )A
    )
where rnum >=11 and rnum <=20 
;



