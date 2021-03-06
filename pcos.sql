create sequence seq_faqNo  increment by 1;
drop sequence seq_faqNo;
truncate table faq;
create table FAQ(
faqNo number(4) default seq_faqNo.nextval  primary key,
title varchar2(100) not null ,
contents varchar2(2000) not null
);
drop table faq;

insert into faq(title,contents)
values('hi123','hifgadgaergerger');
insert into faq(title,contents)
values('raldkfma','hifgadgaergerger');
insert into faq(title,contents)
values('냥냥','hifgadgaergerger');
commit;

select * from faq ;
--------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
insert into member(email,name,age,gender,skintype,phone,zipcode,address1,address2,regstat)
values('admin','admin',24,'F','건성','01000000000','12345','서울','어딘가','Y');



drop table qna ;
create table QNA
(
qnaNo char(17)  primary key,
title varchar2(50) not null,
contents varchar2(1000) not null,
reContents varchar2(1000) ,
regDate date default sysdate,
replStat char(1) default 'N',
email varchar2(50) not null,
constraint qna_fk_email foreign key (email) REFERENCES Member(email)
);
alter table qna drop constraint qna_fk_email;
alter table qna add constraint qna_fk_email foreign key (email) references member(email) on delete cascade;


--1:1문의 코드 qna_yyyymmdd_seq
--매일 새로은 seq refdata는 날짜형
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0001','타이틀','내용','2018-01-01','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0002','타이틀','내용','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0003','타이틀','내용','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0004','타이틀','내용','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0005','타이틀','내용','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0001','타이틀','내용','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0002','타이틀','내용','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0003','타이틀','내용','2018-01-02','N','admin');
--
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0004','타이틀','내용','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0005','타이틀','내용','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0006','타이틀','내용','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0007','타이틀','내용','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0008','타이틀','내용','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,email)
values('qna_20180102_0009','타이틀','내용','2018-01-02','admin');
insert into qna value(qnano,title,contents,email)
values('qna_20180102_0010','타이틀','내용','admin');
commit;
truncate table onetoone;
---------------------------
select count(*) from onetoone;
--
select max(qnano) from qna;
--insert시 마지막 qnano를 찾고 오늘과 같은 날인지 비교 후 같은 날이면 seq+1값
--오늘과 같은 날이 아니면 오늘의 seq시작값
-----------------------
select * 
from (
    select A.*, rownum as rnum 
    from (
        select * 
        from qna    
        where email like concat('%',concat('admin','%'))
        order by replstat desc, regdate desc
        )A
    )
--where rnum >=1 and rnum <=10
;

--------
update qna 
set reContent= 'hiihi', replstat='Y'
where qnano ='qna_20180102_0009';
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-------------

select count(*)  from qna ;

--------------------
select count(*) 
from product    
where productcode like concat('%',concat('핑크','%'))
            or productname like concat('%',concat('핑크','%'));
-------------------------------------------------------------------

select max(productcode) from product 
where brandcode='A' and categorycode='3  ';

select max(productcode) from product 
		where brandcode='A' and categorycode='3';


---------------------------------
select b.productcode, c.* from p_order a, orderdetail b, product c
where a.orderno =b.orderno and b.productcode=c.productcode;
--주문된 물건
--
--주문 테이블 row-> sales.jsp selectall
select * 
from (
    select A.*, rownum as rnum 
    from(
            select * 
            from p_order 
            where email like concat('%',concat('한지민','%')) or name like concat('%',concat('한지민','%'))
        )A
    )
where rnum >=1 and rnum <=10
    ;

--주문 디테일 ->넘어온 주문 번호 , 그에 해당하는상품들의 각각의 이름,코드등의 정보
--페이징 필요없음
select o.* from orderdetail o ,product p
where orderno='order_20180611_0004' and p.productcode=o.productcode;
select p.* from orderdetail o ,product p
where orderno='order_20180611_0004' and p.productcode=o.productcode;
--회원을 클릭하면 지금까지 주문 이력중 회원만 출력
select o.* 
from p_order p , orderdetail o, member m, product s
where m.email = p.email and p.orderno=o.orderno and o.productcode=s.productcode and m.email='admin@admin.co.kr';

create or replace procedure sp_order_select
(   --v_orderno in p_order.order%type,
    v_email in member.email%type,
    v_searchData in STRING ,
    v_rowStart in int,
    v_rowEnd in int,
    v_member out sys_refcursor,
    v_product out sys_refcursor,
    v_p_order out sys_refcursor,
    v_orderdetail out sys_refcursor
)
as 
begin
    open v_member for
    select * 
    from (
        select A.*, rownum as rnum 
        from(
                select m.* 
                from  p_order p , orderdetail o, member m, product s
                where m.email = p.email and p.orderno=o.orderno and o.productcode=s.productcode and m.email=v_email
            )A
        )
    where rnum >=v_rowStart and rnum <=v_rowEnd;
    
    open v_product for
     select * 
    from (
        select A.*, rownum as rnum 
        from(
                select * 
                from  p_order p , orderdetail o, member m, product s
                where m.email = p.email and p.orderno=o.orderno and o.productcode=s.productcode and m.email=v_email
            )A
        )
    where rnum >=v_rowStart and rnum <=v_rowEnd;
    
        
end;
/
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------

ALTER TABLE member RENAME COLUMN age TO ageyear;
ALTER TABLE product MODIFY(productdesc varchar2(1000));


---------------

insert into chimi.Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0008','퓨어 워터 바오밥 마일드 로션 SPF30/PA++','끈적임없이 가볍고 촉촉한 자외선 차단기능의 데일리 마일드 로션!-자외선 차단 기능 겸비＆화사한 브라이트닝 효과 마치 물결이 퍼지듯 가볍고 부드러운 퍼짐성으로 빠르게 스며들어 맑고 화사하게 피부를 만들어 주는 자외선 차단 기능 겸용 마일드 로션-메마른 피부를 맑고 촉촉하게!',11500,'90ml','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150430/1430383272682.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('','','',,'','','2','A');

insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0006','핑크 생기 워터 에멀전','답답함 없이 부드럽게 피부를 감싸 푸석하고 거친 피부를 매끄럽게 가꾸어 주는 생기충전 수분 에멀젼- 핑크 복숭아 워터와 비타민 A/C/E 가 함유된 부드러운 밀키 포뮬러가 부드럽게 피부에 흡수되어 건조하고 거칠어진 피부를 핑크빛 생기 넘치는 피부로 가꾸어 주는 생기 충전 수분 에멀전입니다.- 핑크 복숭아 워터 68.86% 함유',13000,   '180ml'   ,'http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160302/1456886498278.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0007'   ,'토닝 화이트 C 래디언스 에멀전','   - 강력한 항산화 효과의 베리 C 토닝 워터와 촘촘하게 수분을 채우는 미네랄 토닝 워터가 함유되어 촉촉한 투명 유리알 피부로 가꾸는 비타민 화이트닝 에멀전 입니다.- 부드럽고 촉촉한 밀크 타입으로 피부를 환하게 가꾸는 동시에 충만한 수분감을 선사합니다.- 빠르게 흡수되어 피부에 산뜻하고 맑은 유연감을 지속적으로 유지시켜 줍니다.',   18000   ,'180ml'   ,'http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160202/1454392610858.jpg'   ,'2'   ,'A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0008', '퓨어 워터 바오밥 마일드 로션 SPF30/PA++','   끈적임없이 가볍고 촉촉한 자외선 차단기능의 데일리 마일드 로션!-자외선 차단 기능 겸비＆화사한 브라이트닝 효과 마치 물결이 퍼지듯 가볍고 부드러운 퍼짐성으로 빠르게 스며들어 맑고 화사하게 피부를 만들어 주는 자외선 차단 기능 겸용 마일드 로션-메마른 피부를 맑고 촉촉하게!',   11500   ,'90ml','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150430/1430383272682.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0009', '수분가득 콜라겐 로션','   가벼운 텍스쳐" 그러나 깊은 수분과 탄력을 공급해주는 밀키 로션. 응집력 있는 탱글탱글한 수분 방울이 피부를 부드럽게 조여주듯 탄력감을 부여해주며" 바오밥 나무 추출물과 콜라겐이 배합되어 스킨케어 첫단계부터 촉촉한 느낌을 부여해줍니다. 일반 스킨과 달리" 수분가득 콜라겐 스킨은 응집력이 강하여 스킨 방울이 탱탱하게 형태를 유지하는 신제형.',   12000   ,'180ml','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401947638533.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0010', '원더포어 클리어링 에멀전   ','산뜻하게 퍼지고 가볍게 마무리되어 흐트러진 모공을 정돈해주는 박하초 함유 모공 에멀전-박하초함유: 초산공법으로 탄생된 박하초가 함유되어 모공의 고민을 해결해주는 모공 울트라 솔루션 제품입니다-산뜻하고 가볍게: 피부에 산뜻하게 퍼지고 가볍게 마무리되어 흐트러진 모공을 정돈해줍니다-약산성 pH 모공 케어: 약산성 pH 모공 케어로 아기 피부처험 부드럽게 케어해주며 PH밸런스를 맞추는데 도움을 줍니다   ',11999   ,'150ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150506/1430882549156.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0011',   '퓨어 워터 바오밥 모이스처라이저   ','물방울이 톡 터지듯 빠르게 수분을 채워 주는 촉촉한 모이스처라이저메마른 피부를 맑고 촉촉하게!- 수분 함유량이 높은 바오밥 워터와 탁월한 정화능력을 가진 모링가 씨앗이 함유되어" 메마른 피부에 맑고 촉촉한 수분을 빠르게 채워주는 모이스처라이저입니다.보들보들 매끄러운 물결 피부!- 마치 물방울이 톡 터지듯 가볍고 부드러운 퍼짐성으로 빠르게 흡수되어" 넘칠 듯 찰랑이는 수분감과 보들보들 매끄러운 피부결을 가진 물결 피부를 만들어줍니다.',   10500   ,'180ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140807/1407477366730.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0012',  'AC클리닉 데일리 젤 로션','   피부 고민 있기 전에 매일매일~유수분 조절 로션. 수용성 보습 성분이 다량 함유되어 유분감과 끈적임은 줄여주고" 부족한 수분은 채워주는 유수분 밸런싱 젤 로션입니다. 살리실산과 특허 출원 성분인 편백나무 추출물 등의 성분이 함유되어 있고 가볍게 시원한 발림성으로 피부에 부담없이 산뜻하고 촉촉하게 마무리 해줍니다.',   9500   ,'150ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401949398129.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0013','스킨맑음 에멀젼','   부드러운 텍스쳐의 피부 보습" 보호 모이스쳐라이져. 스킨 맑음의 어떤 스킨과도 잘 어울어지는 텍스쳐로" 에센스 혹은 크림을 바른 듯 보습" 보호효과가 탁월합니다. 바바수 열매 추출물의 함유로 피부 위에서 미끄러지듯 부드럽게 퍼지며" 번들거림 없이 탁월한 보습력을 나타냅니다. 5 free 파라벤" 인공색소" 벤조페논" 동물성 원료" 광물유 free.',   12000   ,'200ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401950562365.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0014',   '영양가득 시어버터 에센셜 라이져','   에센스의 농축 성분 + 로션의 피부 보호 효과! 신개념 모이스처라이져. 농축된 영양을 집중 공급해주는 에센스와 유"수분 밸런스를 맞춰주는 로션이 결합된 형태의 고보습 ＆ 고영양 모이스쳐라이져. 인증받은 유기농 시어버터와 극한 지역에 자생하여 영양이 가득한 클라우드 베리 성분의 함유로 매우 건조한 피부를 촉촉하고 윤기있게 가꾸어줍니다. 메이크업 단계시 생기있고 매끈한 피부를 표현해줍니다.',   18000   ,'60ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401962947211.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0015',   '달링플러스 리페어링 에멀젼','   바르는 순간 촉촉하고 편안하게 밀착되는 부드러운 질감의 에멀젼- 유수분을 차곡차곡 채워 피부 보호막 형성: 피부에 차곡차곡 유수분을 채워 피부 보호막을 형성하여줄 뿐만 아니라 거칠어진 피부결을 유연하게 가꿔줍니다.- 달팽이 점액 여과물 72% 함유: 탁월한 보습효과 뿐만 아니라 피부장벽강화 효과도 우수한 프랑스로부터 온 달팽이 점액 여과물- 주름개선 + 미백 이중 기능성: 칙칙하고 연약해진 피부를 환하고 탄탄하게 개선해주는 미백 ＆ 주름개선 이중 기능성 제품입니다.   ',28000   ,'120ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20141103/1414997728814.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0016',   '라이크20 에센셜 에멀젼','   에센스의 영양 성분이 가득 농축된 듯한 리치한 텍스쳐의 에멀젼이 메마른 피부에 깊은 보습과 영양을 공급해 주어" 조밀조밀 탄탄한 건강한 피부로 지켜줍니다. 피부결을 따라 부드럽고 매끄럽게 퍼지면서 피부에 풍부한 보습감을 선사하고 끈적임 없이 촉촉하게 마무리 됩니다.',   16000   ,'140ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401963876878.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0017',   '진주 광채 오로라 에센스 로션','   미세한 타히티 흑진주와 오로라 입자가 함유된 진주 오로라 광채 성분이 함유되어" 피부 사이사이를 촘촘하고 촉촉하게 채워 투명한 광채를 부여하여 주는 데일리 에멀젼입니다. 바르는 즉시 부드러운 보습 윤기막이 피부를 감싸고" 풍부한 수분감과 밀도높은 탄력 부여로 크림까지 꼼꼼하게 바른 듯 오래도록 촉촉하고 매끈하게 빛나는 피부로 만들어 줍니다.',   12000   ,'100ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401960315164.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0009',   '한 장 솔루션 봉 앤 마스크 필링 키트','   각질 싹! 매끈 필링 3스텝 키트- calming-energy 워터 함유 초극세사 시트- 포근한 구름 시트가 푹 잔 듯 피부 컨디션 회복- 16가닥의 공기 통로로 에센스 전달 매커니즘 활성화*전성분은 필링 수딩 마스크를 기준으로 등록되었습니다.',   3900   ,'4ml+2ml+25ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20170125/1485325237297.png','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0010',   '수분가득 콜라겐 에센스','   * 2015년 리뉴얼 된 제품입니다 *어떠한 환경에서도 수분과 탄력을 지켜주는 고농축 에센스. 피부 내의 수분이 빠져나가지 않도록 작용하는 세라마이드 캡슐을 다량 함유하여 강력한 수분막을 형성해 줍니다. 피부위에서 미끄러지듯 부드럽게 퍼지며 촉촉하고 탄력있는 마무리감을 부여해 줍니다.',   15000   ,'45ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150901/1441103224814.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0011',   '펩타이드 버블 업 세럼   ','Firming Up! Tightening Up! Brightening Up! 맑은 생기 보습과 힘 있는 탄력" 팽팽한 타이트닝 효과로 시간과 환경으로 변화된 피부의 마이너스 사인을 잡아주어 탄탄한 탄성피부로 가꾸어주는 3 in 1 올케어 세럼* 온라인 전용 상품입니다.',   38000   ,'70ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20180510/1525934832559.png','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0012',   '제로피지 오일컷 매끈에센스','   매끈한 피부로 케어해주는 실리콘 Free 에센스-피부에 부담없이 매끄러운 피부로 가꾸어 주는 실리콘 프리 에센스-유수분밸런스케어로 건조함없는 균형잡힌 피부-3가지 성분 무첨가 : 실리콘" 광물성오일" 타르색소',   12000   ,'40ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160516/1463388970988.PNG','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0013',   '수분가득 알로에 퍼스트 에센스','   세안 후 피부가 목마를 때 가장 먼저 사용하는 첫번째 에센스로" 유기농 알로에가 86.9%가 함유되어 피부에 진정 효과와 함께 수분을 풍부히 공급하여 푸석한 피부에 촉촉함과 건강함을 부여해줍니다. 광물성"파라벤"탤크 free. 유기농 알로에 86.9% 함유.',   15000   ,'100ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401957003581.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0014',   '0초 미네랄 세럼','   세안 직후 0초 강력 부스팅 효과를 주는 온천수 미스트 세럼. 세안 직후의 건조하고 약해진 피부에 빠른 수분 공급으로 피부를 건강하게 부스팅 시켜 주는 미스트 타입의 0초 세럼입니다. 피부 진정과 수분 공급에 효과적인 각종 미네랄 온천수와 피부 필수 성분들이 다량으로 함유되어" 보들보들 매끈하게 피부에 스며들어 피부 본연의 힘을 키워 줍니다.',   14000   ,'160ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401956865136.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0015',   '수분가득 콜라겐 물광필러','   히알루로산이 콜라겐을 감싸고 있는 형태인 마이크로 콜라겐 히아루캡슐이 피부에 전달되어 바오밥 워터를 끌어당겨 피부에 수분을 빠르게 채워 줍니다. 바오밥 나무의 점액과 히알루로산이 피부 층 사이사이를 빈틈없이 촉촉하게 수분입자를 붙여주는 역할을 해 피부 속을 더욱 촉촉하게 케어해줍니다. 바오밥 점액과 마이크로 콜라겐 히아루캡슐이 피부속에서 촉촉하게 터져 피부의 건조함을 다스려주고 푸석푸석하고 건조한 피부에 자연스러운 물광효과를 부여해줍니다.',   18000   ,'50ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401958090434.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0016',   '라이크20 부스터 에센스','   보습과 탄력을 빠르게 채워주는 첫 단계 오일젤 세럼. 세안" 에어컨" 히터" 극심한 온도차 등으로 약해진 피부 장벽을 강화시켜 초기 노화를 완화해 주는 젤 타입의 부스팅 오일 에센스입니다. 가볍고 산뜻한 젤이 깊은 보습력을 가진 오일로 변해 끈적임 없이 매끄럽게 피부에 도포되어" 피부 보습과 탄력을 부여하고 수분 증발을 막아 촉촉 매끈하게 윤기 흐르는 피부결을 만들어 줍니다.',   16000   ,'100ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401963460537.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0017',   '토탈에이지리페어 로얄 에센스','   안티에이징의해답" 건강한 발효가 선사하는 피부의 힘. 늘어지듯 쫀득한 텍스처의 피부 유연감 개선 및 탄력 공급 이중 기능성 토탈에센스. 지중해 자생 식물 임모르뗄 플라워 추출물과 로얄제리의 성분 발효 컴플렉스와 베롱나무꽃 추출물" 히알루로산이 함유되어피부에 탄력과 보습을 제공하고" 에이지 매트릭스가 피부결을 촘촘하고 매끈하게 해주어 건강하고 윤기있는 피부로 가꾸어 줍니다.',   22000,'45ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401959126192.JPG','3','A');

----------------
create sequence seq_faqNo  increment by 1;
drop sequence seq_faqNo;
truncate table faq;
create table FAQ(
faqNo number(4) default seq_faqNo.nextval  primary key,
title varchar2(50) not null ,
contents varchar2(500) not null
);
drop table faq;

insert into faq(title,contents)
values('hi123','hifgadgaergerger');
insert into faq(title,contents)
values('raldkfma','hifgadgaergerger');
insert into faq(title,contents)
values('냥냥','hifgadgaergerger');
commit;

select * from faq ;
--------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
insert into member(email,name,ageyear,gender,skintype,phone,zipcode,address1,address2,regstat)
values('admin','admin',24,'F','건성','01000000000','12345','서울','어딘가','Y');



drop table onetoone ;
create table QNA
(
qnaNo char(17)  primary key,
title varchar2(50) not null,
contents varchar2(1000) not null,
reContents varchar2(1000) ,
regDate date default sysdate,
replStat char(1) default 'N',
email varchar2(50) not null,
constraint qna_fk_email foreign key (email) REFERENCES Member(email)
);

--1:1문의 코드 qna_yyyymmdd_seq
--매일 새로은 seq refdata는 날짜형
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0001','타이틀','내용','2018-01-01','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0002','타이틀','내용','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0003','타이틀','내용','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0004','타이틀','내용','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0005','타이틀','내용','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0001','타이틀','내용','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0002','타이틀','내용','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0003','타이틀','내용','2018-01-02','N','admin');
--
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0004','타이틀','내용','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0005','타이틀','내용','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0006','타이틀','내용','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0007','타이틀','내용','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0008','타이틀','내용','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,email)
values('qna_20180102_0009','타이틀','내용','2018-01-02','admin');
insert into qna value(qnano,title,contents,email)
values('qna_20180102_0010','타이틀','내용','admin');
commit;
truncate table onetoone;
---------------------------
select count(*) from onetoone;
--
select max(qnano) from qna;
--insert시 마지막 qnano를 찾고 오늘과 같은 날인지 비교 후 같은 날이면 seq+1값
--오늘과 같은 날이 아니면 오늘의 seq시작값
-----------------------
select * 
from (
    select A.*, rownum as rnum 
    from (
        select * 
        from qna    
        where email like concat('%',concat('admin','%'))
        order by replstat desc, regdate desc
        )A
    )
--where rnum >=1 and rnum <=10
;

--------
update qna 
set reContent= 'hiihi', replstat='Y'
where qnano ='qna_20180102_0009';
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-------------

select count(*)  from qna ;

--------------------
select count(*) 
from product    
where productcode like concat('%',concat('핑크','%'))
            or productname like concat('%',concat('핑크','%'));
-------------------------------------------------------------------

select max(productcode) from product 
where brandcode='A' and categorycode='3  ';

select max(productcode) from product 
      where brandcode='A' and categorycode='3';


---------------------------------
select b.productcode, c.* from p_order a, orderdetail b, product c
where a.orderno =b.orderno and b.productcode=c.productcode;
--주문된 물건
--
--주문 테이블 row-> sales.jsp selectall
select * 
from (
    select A.*, rownum as rnum 
    from(
            select * 
            from p_order 
            where email like concat('%',concat('한지민','%')) or name like concat('%',concat('한지민','%'))
        )A
    )
where rnum >=1 and rnum <=10
    ;

--주문 디테일 ->넘어온 주문 번호 , 그에 해당하는상품들의 각각의 이름,코드등의 정보
--페이징 필요없음
select p.productcode,r.orderno,amount,o.price,productname,p.price as productprice,image,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email
from orderdetail o ,product p, p_order r
where r.orderno='order_20180521_0001' and p.productcode=o.productcode and r.orderno=o.orderno;
select * from orderdetail o ,product p
where orderno='order_20180521_0001' and p.productcode=o.productcode;
--회원을 클릭하면 지금까지 주문 이력중 회원만 출력
select o.* 
from p_order p , orderdetail o, member m, product s
where m.email = p.email and p.orderno=o.orderno and o.productcode=s.productcode and m.email='admin@admin.co.kr';



--------------
select p.productcode,o.orderno,amount,o.price,productname,p.price as productprice,image
      from orderdetail o ,product p
      where o.orderno='order_20180521_0001' and p.productcode=o.productcode ;
-----
select orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email
      from  p_order 
      where orderno='order_20180521_0001';
--------------


create or replace procedure sp_order_select
(   
    v_p_orderno in p_order.type%orderno,
    v_p_order out sys_refcursor,
    v_orderdetail out sys_refcursor
)
as 
begin
    open p_order for
    select * 
    from p_order
    where p_orderno=v_orderno;
    
    open v_orderdetail for
     select * 
    from (
        select A.*, rownum as rnum 
        from(
                select * 
                from  p_order p , orderdetail o, member m, product s
                where m.email = p.email and p.orderno=o.orderno and o.productcode=s.productcode and m.email=v_email
            )A
        )
    where rnum >=v_rowStart and rnum <=v_rowEnd;
    
        
end;
/

admin
rladkfma0208@naver.com
rladkfma0208@gmail.com
rladkfma0208@daum.net
rladkfma0208@nate.com
8@naver.com
08@naver.com
rl@naver.com
adkfma@naver.com
208@naver.com
0208@naver.com
rlad08@naver.com
adkfma0208@naver.com
r208@naver.com
;
--
prod_A_2_0006
prod_A_2_0007
prod_A_2_0009
prod_A_2_0012
prod_A_2_0013
prod_A_2_0016
prod_A_2_0017
prod_A_3_0010
prod_A_3_0011
prod_A_3_0012
prod_A_3_0013
prod_A_3_0014
prod_A_2_0010
prod_A_2_0011
prod_A_2_0014
prod_A_2_0015
prod_A_3_0015
prod_A_3_0016
prod_A_3_0017
prod_A_2_0008
;
--order_20180521_0001
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0001','김아름','00000','서울','어딘가','01050068435','CARD','코멘트',sysdate,'N','rladkfma0208@naver.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0001',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0001',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0001',2,24000);
commit;
--
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0001','김아름','00000','서울','어딘가','01050068435','CARD','코멘트',sysdate,'N','rladkfma0208@naver.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0001',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0001',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0001',2,24000);
commit;
-----
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0001','김아름','00000','서울','어딘가','01050068435','CARD','코멘트',sysdate,'N','rladkfma0208@naver.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0001',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0001',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0001',2,24000);
commit;
------
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0002','박지민','00000','서울','어딘가','01050068435','CARD','코멘트',sysdate,'N','rladkfma0208@gmail.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0002',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0002',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0002',2,24000);
commit;
------
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0003','김태형','00000','서울','어딘가','01050068435','CARD','코멘트',sysdate,'N','rladkfma0208@nate.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0003',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0003',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0003',2,24000);
commit;


---상품 코드, 이름 가져오기
select productcode, productname
from product;

---p_order에서 상품코드,상품이름,주문수,매출액

select * 
from (
    select A.*, rownum as rnum 
    from(   
          select p.productcode,p.productname,sum(amount)as amount,sum(o.price)as profit
          from orderdetail o, product p, p_order r
          where p.productcode=o.productcode 
                and r.orderno=o.orderno 
                --and p.productcode='prod_A_2_0007'
                --and orderdate between '11/01/01' and '19/01/01'
          group by p.productcode, p.productname
          order by p.productcode
        )A
    )
where rnum >=1 and rnum <=10
    ;
    ------------
 select count(*)
from orderdetail o, product p, p_order r
where p.productcode=o.productcode 
      and r.orderno=o.orderno 
      and orderdate between '11/01/01' and '19/01/01'
group by p.productcode, p.productname;

---------
select * 
      from (
          select A.*, rownum as rnum 
          from(   
                select p.productcode,p.productname,sum(amount)as amount,sum(o.price)as profit
                from orderdetail o, product p, p_order r
                where p.productcode=o.productcode 
                      and r.orderno=o.orderno 
                     
                     -- AND p.productcode = #{searchData}
                  
                  
                     -- and orderdate between #{startDate} and #{endDate}
                  
                group by p.productcode, p.productname
                order by p.productcode
              )A
          )
      where rnum >='1' and rnum <='10';

select count(*)
      from orderdetail o, product p, p_order r
      where p.productcode=o.productcode
          and o.orderno=r.orderno
         -- <if test="searchData != null">
            -- AND p.productcode = #{searchData}
         --</if>
         --<if test="startDate != null and endDate != null">
           --  and orderdate between #{startDate} and #{endDate}
      --   </if>
      group by p.productcode, p.productname;
    
    
    
    
    
    
    
    
    select sum(profit)as profit,sum(amount)as amount,count(*)as count
    from(
              select p.productcode,p.productname,sum(amount)as amount,sum(o.price)as profit
                from orderdetail o, product p, p_order r
                where p.productcode=o.productcode 
                      and r.orderno=o.orderno 
                     
                     -- AND p.productcode = #{searchData}
                  
                  
                      and orderdate between '2011-01-01' and '2020-01-01'
                  
                group by p.productcode, p.productname
                order by p.productcode
        )
  ;
  
  
  insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0001','좋아여',5.0,'2018-06-17','admin','prod_A_2_0006');
 insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0002','좋아여',5.0,'2018-06-17','admin','prod_A_2_0007');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0003','좋아여',5.0,'2018-06-17','admin','prod_A_2_0008');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0004','좋아여',5.0,'2018-06-17','admin','prod_A_2_0009');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0005','좋아여',5.0,'2018-06-17','admin','prod_A_2_0010');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0006','좋아여',5.0,'2018-06-17','admin','prod_A_2_0011');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0007','좋아여',5.0,'2018-06-17','admin','prod_A_2_0012');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0008','좋아여',5.0,'2018-06-17','admin','prod_A_2_0013');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0009','좋아여',5.0,'2018-06-17','08@naver.com','prod_A_2_0014');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0010','좋아여',5.0,'2018-06-17','08@naver.com','prod_A_2_0015');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0011','좋아여',5.0,'2018-06-17','rladkfma0208@naver.com','prod_A_2_0016');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0012','좋아여',5.0,'2018-06-17','rladkfma0208@naver.com','prod_A_2_0017');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0013','좋아여',5.0,'2018-06-17','rladkfma0208@naver.com','prod_A_3_0011');
  commit;
  
  select * 
      from (
          select A.*, rownum as rnum 
          from(  
              select*
              from(
                    select gradeno,comments,grade,regdate,g.email as email,g.productcode as productcode,productname,name
                    from member m, grade g,product p
                    where p.productcode=g.productcode and m.email=g.email
              )
              where productcode like concat('%',concat('0208','%')) or 
                  productname like concat('%',concat('0208','%')) or
                  name like concat('%',concat('0208','%')) or
                  email like concat('%',concat('0208','%')) 
                  order by regdate desc
      
         )A
    )
where rnum >=1 and rnum <=10
    ;
  
  select gradeno,comments,grade,regdate,g.email as email,g.productcode as productcode,productname,name
  from member m, grade g,product p
  where p.productcode=g.productcode and m.email=g.email
    and g.gradeno='grade_20180617_0001';
  
  delete from grade
  where gradeno='grade_20180617_0000';
  
  
  
  
        
      select * 
      from (
          select A.*, rownum as rnum 
          from(   
                select p.productcode,p.productname, r.orderno, o.amount,o.price as profit ,p.price,r.orderdate
                from orderdetail o, product p, p_order r
                where p.productcode=o.productcode 
                      and r.orderno=o.orderno 
       -- ]]>              
                    --  <if test="searchData != null">
                    -- <![CDATA[ AND p.productcode = #{searchData}]]>
               --   </if>
                  --<if test="startDate != null and endDate != null">
                    -- <![CDATA[ and orderdate >= #{startDate} and orderdate<= #{endDate}]]>
                  --</if>
      --<![CDATA[         
                --group by p.productcode, p.productname
                order by p.productcode
              )A
          )
      where rnum >=1 and rnum <=10;
    
    
    
    select sum(profit),sum(amount),count(*)
       from(
                 select p.productcode,p.productname, r.orderno, o.amount,o.price as profit ,p.price,r.orderdate
                   from orderdetail o, product p, p_order r
                   where p.productcode=o.productcode 
                         and r.orderno=o.orderno 
                           <if test="searchData != null">
                           <![CDATA[ AND p.productcode = #{searchData}]]>
                     </if>
                  <if test="startDate != null and endDate != null">
                        <![CDATA[ and orderdate >= #{startDate} and orderdate<= #{endDate}]]>
                     </if>
                   --group by p.productcode, p.productname
                   order by p.productcode
           )
  ;
  
  
  
  --board_20180101_0001
 
  insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0001','안녕','디지몬','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0002','웨일리언','웨일리언','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0003','이불킥','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0004','케이티페리','전하지 못한 진심','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0005','페이크 러브','페이크 러브','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0001','매직샵','매직샵','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0002','에어플레인','디지몬','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0003','DNA','디지몬','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0004','앙팡맨','디지몬','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0005','고고','디지몬','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180103_0001','마이크드랍','디지몬','2018-01-03','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180103_0002','깔깔깔깔','디지몬','2018-01-03','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180103_0003','베슽트 오브 미','체인스모커스','2018-01-03','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180104_0001','티어','디지몬','2018-01-04','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180105_0001','라이','디지몬','2018-01-05','0','0','0','admin@admin.co.kr');
  commit;
  --제목, 작성자,작성일자,조회수,추천수,비추천수
  --내용, 추천수,비추춴수,조회수,작성자,작성일자,제목,이름,ㄴㅇㄹㄴㅇㄹsdfsdㅇㄴㄹ
  
  
  
  
  ;
  
     
      select * 
      from (
          select A.*, rownum as rnum 
          from(   
            select boardno,title,contents,regdate,readcount,likecount,dislikecount,b.email as email,name
            from board b, member m
            where b.email=m.email
              )A
        where email like concat('%',concat('0001','%'))
            or title like concat('%',concat('0001','%'))
            or boardno like concat('%',concat('0001','%'))
          )
      where rnum >=1 and rnum <=10
    ;
    
    
          select count(*)--A.*, rownum as rnum 
          from(   
            select boardno,title,contents,regdate,readcount,likecount,dislikecount,b.email as email,name
            from board b, member m
            where b.email=m.email
              )A
        where email like concat('%',concat(null,'%'))
          or title like concat('%',concat(null,'%'))
            or boardno like concat('%',concat(null,'%'))
         
      --where rnum >=1 and rnum <=10
    ;
    select boardno,title,contents,regdate,readcount,likecount,dislikecount,b.email as email,name
    from board b, member m
    where b.email=m.email
    and boardno ='board_20180101_0002';
    
    delete from board
    where boardno ='';
    
    
    select m.email,m.name,m.ageyear,m.gender,m.skintype,m.phone,m.zipcode,m.address1,m.address2,m.regstat,p.orderno,g.gradeno,b.boardno,q.qnano
    from member m, p_order p , grade g, board b, qna q
    where m.email= p.email(+) and m.email=g.email(+) and m.email=b.email(+) and m.email=q.email(+)
    group by m.email;
    
    
    
    
    
    
    
    
    
    select count(*) 
        from p_order    
          where email='0208@naver.com'
    
;    

select * from all_constraints where table_name ='P_ORDER';
-----------cart------------------
alter table cart drop constraint FK_Member_TO_Cart;
alter table cart add constraint FK_Member_TO_Cart foreign key (email) references member(email) on delete cascade;

alter table cart drop constraint FK_Product_TO_Cart;
alter table cart add constraint FK_Product_TO_Cart foreign key (productCode) references product(productCode) on delete cascade;

---------------p_order
select * from all_constraints where table_name ='P_ORDER';
alter table P_ORDER drop constraint FK_MEMBER_TO_P_ORDER;
alter table P_ORDER add constraint FK_MEMBER_TO_P_ORDER foreign key (email) references member(email) on delete cascade;

--------------OrderDetail
select * from all_constraints where table_name ='ORDERDETAIL';
alter table ORDERDETAIL drop constraint FK_ORDER_TO_ORDERDETAIL;
alter table ORDERDETAIL add constraint FK_ORDER_TO_ORDERDETAIL foreign key (orderNo) references p_order(orderNo) on delete cascade;
