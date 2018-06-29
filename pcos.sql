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
values('³É³É','hifgadgaergerger');
commit;

select * from faq ;
--------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
insert into member(email,name,age,gender,skintype,phone,zipcode,address1,address2,regstat)
values('admin','admin',24,'F','°Ç¼º','01000000000','12345','¼­¿ï','¾îµò°¡','Y');



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


--1:1¹®ÀÇ ÄÚµå qna_yyyymmdd_seq
--¸ÅÀÏ »õ·ÎÀº seq refdata´Â ³¯Â¥Çü
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0001','Å¸ÀÌÆ²','³»¿ë','2018-01-01','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0002','Å¸ÀÌÆ²','³»¿ë','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0003','Å¸ÀÌÆ²','³»¿ë','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0004','Å¸ÀÌÆ²','³»¿ë','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0005','Å¸ÀÌÆ²','³»¿ë','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0001','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0002','Å¸ÀÌÆ²','³»¿ë','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0003','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
--
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0004','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0005','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0006','Å¸ÀÌÆ²','³»¿ë','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0007','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0008','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,email)
values('qna_20180102_0009','Å¸ÀÌÆ²','³»¿ë','2018-01-02','admin');
insert into qna value(qnano,title,contents,email)
values('qna_20180102_0010','Å¸ÀÌÆ²','³»¿ë','admin');
commit;
truncate table onetoone;
---------------------------
select count(*) from onetoone;
--
select max(qnano) from qna;
--insert½Ã ¸¶Áö¸· qnano¸¦ Ã£°í ¿À´Ã°ú °°Àº ³¯ÀÎÁö ºñ±³ ÈÄ °°Àº ³¯ÀÌ¸é seq+1°ª
--¿À´Ã°ú °°Àº ³¯ÀÌ ¾Æ´Ï¸é ¿À´ÃÀÇ seq½ÃÀÛ°ª
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
where productcode like concat('%',concat('ÇÎÅ©','%'))
            or productname like concat('%',concat('ÇÎÅ©','%'));
-------------------------------------------------------------------

select max(productcode) from product 
where brandcode='A' and categorycode='3  ';

select max(productcode) from product 
		where brandcode='A' and categorycode='3';


---------------------------------
select b.productcode, c.* from p_order a, orderdetail b, product c
where a.orderno =b.orderno and b.productcode=c.productcode;
--ÁÖ¹®µÈ ¹°°Ç
--
--ÁÖ¹® Å×ÀÌºí row-> sales.jsp selectall
select * 
from (
    select A.*, rownum as rnum 
    from(
            select * 
            from p_order 
            where email like concat('%',concat('ÇÑÁö¹Î','%')) or name like concat('%',concat('ÇÑÁö¹Î','%'))
        )A
    )
where rnum >=1 and rnum <=10
    ;

--ÁÖ¹® µğÅ×ÀÏ ->³Ñ¾î¿Â ÁÖ¹® ¹øÈ£ , ±×¿¡ ÇØ´çÇÏ´Â»óÇ°µéÀÇ °¢°¢ÀÇ ÀÌ¸§,ÄÚµåµîÀÇ Á¤º¸
--ÆäÀÌÂ¡ ÇÊ¿ä¾øÀ½
select o.* from orderdetail o ,product p
where orderno='order_20180611_0004' and p.productcode=o.productcode;
select p.* from orderdetail o ,product p
where orderno='order_20180611_0004' and p.productcode=o.productcode;
--È¸¿øÀ» Å¬¸¯ÇÏ¸é Áö±İ±îÁö ÁÖ¹® ÀÌ·ÂÁß È¸¿ø¸¸ Ãâ·Â
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
values('prod_A_2_0008','Ç»¾î ¿öÅÍ ¹Ù¿À¹ä ¸¶ÀÏµå ·Î¼Ç SPF30/PA++','²öÀûÀÓ¾øÀÌ °¡º±°í ÃËÃËÇÑ ÀÚ¿Ü¼± Â÷´Ü±â´ÉÀÇ µ¥ÀÏ¸® ¸¶ÀÏµå ·Î¼Ç!-ÀÚ¿Ü¼± Â÷´Ü ±â´É °âºñ£¦È­»çÇÑ ºê¶óÀÌÆ®´× È¿°ú ¸¶Ä¡ ¹°°áÀÌ ÆÛÁöµí °¡º±°í ºÎµå·¯¿î ÆÛÁü¼ºÀ¸·Î ºü¸£°Ô ½º¸çµé¾î ¸¼°í È­»çÇÏ°Ô ÇÇºÎ¸¦ ¸¸µé¾î ÁÖ´Â ÀÚ¿Ü¼± Â÷´Ü ±â´É °â¿ë ¸¶ÀÏµå ·Î¼Ç-¸Ş¸¶¸¥ ÇÇºÎ¸¦ ¸¼°í ÃËÃËÇÏ°Ô!',11500,'90ml','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150430/1430383272682.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('','','',,'','','2','A');

insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0006','ÇÎÅ© »ı±â ¿öÅÍ ¿¡¸ÖÀü','´ä´äÇÔ ¾øÀÌ ºÎµå·´°Ô ÇÇºÎ¸¦ °¨½Î Çª¼®ÇÏ°í °ÅÄ£ ÇÇºÎ¸¦ ¸Å²ô·´°Ô °¡²Ù¾î ÁÖ´Â »ı±âÃæÀü ¼öºĞ ¿¡¸ÖÁ¯- ÇÎÅ© º¹¼ş¾Æ ¿öÅÍ¿Í ºñÅ¸¹Î A/C/E °¡ ÇÔÀ¯µÈ ºÎµå·¯¿î ¹ĞÅ° Æ÷¹Ä·¯°¡ ºÎµå·´°Ô ÇÇºÎ¿¡ Èí¼öµÇ¾î °ÇÁ¶ÇÏ°í °ÅÄ¥¾îÁø ÇÇºÎ¸¦ ÇÎÅ©ºû »ı±â ³ÑÄ¡´Â ÇÇºÎ·Î °¡²Ù¾î ÁÖ´Â »ı±â ÃæÀü ¼öºĞ ¿¡¸ÖÀüÀÔ´Ï´Ù.- ÇÎÅ© º¹¼ş¾Æ ¿öÅÍ 68.86% ÇÔÀ¯',13000,   '180ml'   ,'http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160302/1456886498278.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0007'   ,'Åä´× È­ÀÌÆ® C ·¡µğ¾ğ½º ¿¡¸ÖÀü','   - °­·ÂÇÑ Ç×»êÈ­ È¿°úÀÇ º£¸® C Åä´× ¿öÅÍ¿Í ÃÎÃÎÇÏ°Ô ¼öºĞÀ» Ã¤¿ì´Â ¹Ì³×¶ö Åä´× ¿öÅÍ°¡ ÇÔÀ¯µÇ¾î ÃËÃËÇÑ Åõ¸í À¯¸®¾Ë ÇÇºÎ·Î °¡²Ù´Â ºñÅ¸¹Î È­ÀÌÆ®´× ¿¡¸ÖÀü ÀÔ´Ï´Ù.- ºÎµå·´°í ÃËÃËÇÑ ¹ĞÅ© Å¸ÀÔÀ¸·Î ÇÇºÎ¸¦ È¯ÇÏ°Ô °¡²Ù´Â µ¿½Ã¿¡ Ãæ¸¸ÇÑ ¼öºĞ°¨À» ¼±»çÇÕ´Ï´Ù.- ºü¸£°Ô Èí¼öµÇ¾î ÇÇºÎ¿¡ »ê¶æÇÏ°í ¸¼Àº À¯¿¬°¨À» Áö¼ÓÀûÀ¸·Î À¯Áö½ÃÄÑ Áİ´Ï´Ù.',   18000   ,'180ml'   ,'http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160202/1454392610858.jpg'   ,'2'   ,'A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0008', 'Ç»¾î ¿öÅÍ ¹Ù¿À¹ä ¸¶ÀÏµå ·Î¼Ç SPF30/PA++','   ²öÀûÀÓ¾øÀÌ °¡º±°í ÃËÃËÇÑ ÀÚ¿Ü¼± Â÷´Ü±â´ÉÀÇ µ¥ÀÏ¸® ¸¶ÀÏµå ·Î¼Ç!-ÀÚ¿Ü¼± Â÷´Ü ±â´É °âºñ£¦È­»çÇÑ ºê¶óÀÌÆ®´× È¿°ú ¸¶Ä¡ ¹°°áÀÌ ÆÛÁöµí °¡º±°í ºÎµå·¯¿î ÆÛÁü¼ºÀ¸·Î ºü¸£°Ô ½º¸çµé¾î ¸¼°í È­»çÇÏ°Ô ÇÇºÎ¸¦ ¸¸µé¾î ÁÖ´Â ÀÚ¿Ü¼± Â÷´Ü ±â´É °â¿ë ¸¶ÀÏµå ·Î¼Ç-¸Ş¸¶¸¥ ÇÇºÎ¸¦ ¸¼°í ÃËÃËÇÏ°Ô!',   11500   ,'90ml','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150430/1430383272682.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0009', '¼öºĞ°¡µæ Äİ¶ó°Õ ·Î¼Ç','   °¡º­¿î ÅØ½ºÃÄ" ±×·¯³ª ±íÀº ¼öºĞ°ú Åº·ÂÀ» °ø±ŞÇØÁÖ´Â ¹ĞÅ° ·Î¼Ç. ÀÀÁı·Â ÀÖ´Â ÅÊ±ÛÅÊ±ÛÇÑ ¼öºĞ ¹æ¿ïÀÌ ÇÇºÎ¸¦ ºÎµå·´°Ô Á¶¿©ÁÖµí Åº·Â°¨À» ºÎ¿©ÇØÁÖ¸ç" ¹Ù¿À¹ä ³ª¹« ÃßÃâ¹°°ú Äİ¶ó°ÕÀÌ ¹èÇÕµÇ¾î ½ºÅ²ÄÉ¾î Ã¹´Ü°èºÎÅÍ ÃËÃËÇÑ ´À³¦À» ºÎ¿©ÇØÁİ´Ï´Ù. ÀÏ¹İ ½ºÅ²°ú ´Ş¸®" ¼öºĞ°¡µæ Äİ¶ó°Õ ½ºÅ²Àº ÀÀÁı·ÂÀÌ °­ÇÏ¿© ½ºÅ² ¹æ¿ïÀÌ ÅÊÅÊÇÏ°Ô ÇüÅÂ¸¦ À¯ÁöÇÏ´Â ½ÅÁ¦Çü.',   12000   ,'180ml','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401947638533.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0010', '¿ø´õÆ÷¾î Å¬¸®¾î¸µ ¿¡¸ÖÀü   ','»ê¶æÇÏ°Ô ÆÛÁö°í °¡º±°Ô ¸¶¹«¸®µÇ¾î ÈåÆ®·¯Áø ¸ğ°øÀ» Á¤µ·ÇØÁÖ´Â ¹ÚÇÏÃÊ ÇÔÀ¯ ¸ğ°ø ¿¡¸ÖÀü-¹ÚÇÏÃÊÇÔÀ¯: ÃÊ»ê°ø¹ıÀ¸·Î Åº»ıµÈ ¹ÚÇÏÃÊ°¡ ÇÔÀ¯µÇ¾î ¸ğ°øÀÇ °í¹ÎÀ» ÇØ°áÇØÁÖ´Â ¸ğ°ø ¿ïÆ®¶ó ¼Ö·ç¼Ç Á¦Ç°ÀÔ´Ï´Ù-»ê¶æÇÏ°í °¡º±°Ô: ÇÇºÎ¿¡ »ê¶æÇÏ°Ô ÆÛÁö°í °¡º±°Ô ¸¶¹«¸®µÇ¾î ÈåÆ®·¯Áø ¸ğ°øÀ» Á¤µ·ÇØÁİ´Ï´Ù-¾à»ê¼º pH ¸ğ°ø ÄÉ¾î: ¾à»ê¼º pH ¸ğ°ø ÄÉ¾î·Î ¾Æ±â ÇÇºÎÃ³Çè ºÎµå·´°Ô ÄÉ¾îÇØÁÖ¸ç PH¹ë·±½º¸¦ ¸ÂÃß´Âµ¥ µµ¿òÀ» Áİ´Ï´Ù   ',11999   ,'150ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150506/1430882549156.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0011',   'Ç»¾î ¿öÅÍ ¹Ù¿À¹ä ¸ğÀÌ½ºÃ³¶óÀÌÀú   ','¹°¹æ¿ïÀÌ Åå ÅÍÁöµí ºü¸£°Ô ¼öºĞÀ» Ã¤¿ö ÁÖ´Â ÃËÃËÇÑ ¸ğÀÌ½ºÃ³¶óÀÌÀú¸Ş¸¶¸¥ ÇÇºÎ¸¦ ¸¼°í ÃËÃËÇÏ°Ô!- ¼öºĞ ÇÔÀ¯·®ÀÌ ³ôÀº ¹Ù¿À¹ä ¿öÅÍ¿Í Å¹¿ùÇÑ Á¤È­´É·ÂÀ» °¡Áø ¸ğ¸µ°¡ ¾¾¾ÑÀÌ ÇÔÀ¯µÇ¾î" ¸Ş¸¶¸¥ ÇÇºÎ¿¡ ¸¼°í ÃËÃËÇÑ ¼öºĞÀ» ºü¸£°Ô Ã¤¿öÁÖ´Â ¸ğÀÌ½ºÃ³¶óÀÌÀúÀÔ´Ï´Ù.º¸µéº¸µé ¸Å²ô·¯¿î ¹°°á ÇÇºÎ!- ¸¶Ä¡ ¹°¹æ¿ïÀÌ Åå ÅÍÁöµí °¡º±°í ºÎµå·¯¿î ÆÛÁü¼ºÀ¸·Î ºü¸£°Ô Èí¼öµÇ¾î" ³ÑÄ¥ µí Âû¶ûÀÌ´Â ¼öºĞ°¨°ú º¸µéº¸µé ¸Å²ô·¯¿î ÇÇºÎ°áÀ» °¡Áø ¹°°á ÇÇºÎ¸¦ ¸¸µé¾îÁİ´Ï´Ù.',   10500   ,'180ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140807/1407477366730.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0012',  'ACÅ¬¸®´Ğ µ¥ÀÏ¸® Á© ·Î¼Ç','   ÇÇºÎ °í¹Î ÀÖ±â Àü¿¡ ¸ÅÀÏ¸ÅÀÏ~À¯¼öºĞ Á¶Àı ·Î¼Ç. ¼ö¿ë¼º º¸½À ¼ººĞÀÌ ´Ù·® ÇÔÀ¯µÇ¾î À¯ºĞ°¨°ú ²öÀûÀÓÀº ÁÙ¿©ÁÖ°í" ºÎÁ·ÇÑ ¼öºĞÀº Ã¤¿öÁÖ´Â À¯¼öºĞ ¹ë·±½Ì Á© ·Î¼ÇÀÔ´Ï´Ù. »ì¸®½Ç»ê°ú Æ¯Çã Ãâ¿ø ¼ººĞÀÎ Æí¹é³ª¹« ÃßÃâ¹° µîÀÇ ¼ººĞÀÌ ÇÔÀ¯µÇ¾î ÀÖ°í °¡º±°Ô ½Ã¿øÇÑ ¹ß¸²¼ºÀ¸·Î ÇÇºÎ¿¡ ºÎ´ã¾øÀÌ »ê¶æÇÏ°í ÃËÃËÇÏ°Ô ¸¶¹«¸® ÇØÁİ´Ï´Ù.',   9500   ,'150ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401949398129.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0013','½ºÅ²¸¼À½ ¿¡¸ÖÁ¯','   ºÎµå·¯¿î ÅØ½ºÃÄÀÇ ÇÇºÎ º¸½À" º¸È£ ¸ğÀÌ½ºÃÄ¶óÀÌÁ®. ½ºÅ² ¸¼À½ÀÇ ¾î¶² ½ºÅ²°úµµ Àß ¾î¿ï¾îÁö´Â ÅØ½ºÃÄ·Î" ¿¡¼¾½º È¤Àº Å©¸²À» ¹Ù¸¥ µí º¸½À" º¸È£È¿°ú°¡ Å¹¿ùÇÕ´Ï´Ù. ¹Ù¹Ù¼ö ¿­¸Å ÃßÃâ¹°ÀÇ ÇÔÀ¯·Î ÇÇºÎ À§¿¡¼­ ¹Ì²ô·¯Áöµí ºÎµå·´°Ô ÆÛÁö¸ç" ¹øµé°Å¸² ¾øÀÌ Å¹¿ùÇÑ º¸½À·ÂÀ» ³ªÅ¸³À´Ï´Ù. 5 free ÆÄ¶óº¥" ÀÎ°ø»ö¼Ò" º¥Á¶Æä³í" µ¿¹°¼º ¿ø·á" ±¤¹°À¯ free.',   12000   ,'200ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401950562365.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0014',   '¿µ¾ç°¡µæ ½Ã¾î¹öÅÍ ¿¡¼¾¼È ¶óÀÌÁ®','   ¿¡¼¾½ºÀÇ ³óÃà ¼ººĞ + ·Î¼ÇÀÇ ÇÇºÎ º¸È£ È¿°ú! ½Å°³³ä ¸ğÀÌ½ºÃ³¶óÀÌÁ®. ³óÃàµÈ ¿µ¾çÀ» ÁıÁß °ø±ŞÇØÁÖ´Â ¿¡¼¾½º¿Í À¯"¼öºĞ ¹ë·±½º¸¦ ¸ÂÃçÁÖ´Â ·Î¼ÇÀÌ °áÇÕµÈ ÇüÅÂÀÇ °íº¸½À £¦ °í¿µ¾ç ¸ğÀÌ½ºÃÄ¶óÀÌÁ®. ÀÎÁõ¹ŞÀº À¯±â³ó ½Ã¾î¹öÅÍ¿Í ±ØÇÑ Áö¿ª¿¡ ÀÚ»ıÇÏ¿© ¿µ¾çÀÌ °¡µæÇÑ Å¬¶ó¿ìµå º£¸® ¼ººĞÀÇ ÇÔÀ¯·Î ¸Å¿ì °ÇÁ¶ÇÑ ÇÇºÎ¸¦ ÃËÃËÇÏ°í À±±âÀÖ°Ô °¡²Ù¾îÁİ´Ï´Ù. ¸ŞÀÌÅ©¾÷ ´Ü°è½Ã »ı±âÀÖ°í ¸Å²öÇÑ ÇÇºÎ¸¦ Ç¥ÇöÇØÁİ´Ï´Ù.',   18000   ,'60ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401962947211.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0015',   '´Ş¸µÇÃ·¯½º ¸®Æä¾î¸µ ¿¡¸ÖÁ¯','   ¹Ù¸£´Â ¼ø°£ ÃËÃËÇÏ°í Æí¾ÈÇÏ°Ô ¹ĞÂøµÇ´Â ºÎµå·¯¿î Áú°¨ÀÇ ¿¡¸ÖÁ¯- À¯¼öºĞÀ» Â÷°îÂ÷°î Ã¤¿ö ÇÇºÎ º¸È£¸· Çü¼º: ÇÇºÎ¿¡ Â÷°îÂ÷°î À¯¼öºĞÀ» Ã¤¿ö ÇÇºÎ º¸È£¸·À» Çü¼ºÇÏ¿©ÁÙ »Ó¸¸ ¾Æ´Ï¶ó °ÅÄ¥¾îÁø ÇÇºÎ°áÀ» À¯¿¬ÇÏ°Ô °¡²ãÁİ´Ï´Ù.- ´ŞÆØÀÌ Á¡¾× ¿©°ú¹° 72% ÇÔÀ¯: Å¹¿ùÇÑ º¸½ÀÈ¿°ú »Ó¸¸ ¾Æ´Ï¶ó ÇÇºÎÀåº®°­È­ È¿°úµµ ¿ì¼öÇÑ ÇÁ¶û½º·ÎºÎÅÍ ¿Â ´ŞÆØÀÌ Á¡¾× ¿©°ú¹°- ÁÖ¸§°³¼± + ¹Ì¹é ÀÌÁß ±â´É¼º: Ä¢Ä¢ÇÏ°í ¿¬¾àÇØÁø ÇÇºÎ¸¦ È¯ÇÏ°í ÅºÅºÇÏ°Ô °³¼±ÇØÁÖ´Â ¹Ì¹é £¦ ÁÖ¸§°³¼± ÀÌÁß ±â´É¼º Á¦Ç°ÀÔ´Ï´Ù.   ',28000   ,'120ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20141103/1414997728814.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0016',   '¶óÀÌÅ©20 ¿¡¼¾¼È ¿¡¸ÖÁ¯','   ¿¡¼¾½ºÀÇ ¿µ¾ç ¼ººĞÀÌ °¡µæ ³óÃàµÈ µíÇÑ ¸®Ä¡ÇÑ ÅØ½ºÃÄÀÇ ¿¡¸ÖÁ¯ÀÌ ¸Ş¸¶¸¥ ÇÇºÎ¿¡ ±íÀº º¸½À°ú ¿µ¾çÀ» °ø±ŞÇØ ÁÖ¾î" Á¶¹ĞÁ¶¹Ğ ÅºÅºÇÑ °Ç°­ÇÑ ÇÇºÎ·Î ÁöÄÑÁİ´Ï´Ù. ÇÇºÎ°áÀ» µû¶ó ºÎµå·´°í ¸Å²ô·´°Ô ÆÛÁö¸é¼­ ÇÇºÎ¿¡ Ç³ºÎÇÑ º¸½À°¨À» ¼±»çÇÏ°í ²öÀûÀÓ ¾øÀÌ ÃËÃËÇÏ°Ô ¸¶¹«¸® µË´Ï´Ù.',   16000   ,'140ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401963876878.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0017',   'ÁøÁÖ ±¤Ã¤ ¿À·Î¶ó ¿¡¼¾½º ·Î¼Ç','   ¹Ì¼¼ÇÑ Å¸È÷Æ¼ ÈæÁøÁÖ¿Í ¿À·Î¶ó ÀÔÀÚ°¡ ÇÔÀ¯µÈ ÁøÁÖ ¿À·Î¶ó ±¤Ã¤ ¼ººĞÀÌ ÇÔÀ¯µÇ¾î" ÇÇºÎ »çÀÌ»çÀÌ¸¦ ÃÎÃÎÇÏ°í ÃËÃËÇÏ°Ô Ã¤¿ö Åõ¸íÇÑ ±¤Ã¤¸¦ ºÎ¿©ÇÏ¿© ÁÖ´Â µ¥ÀÏ¸® ¿¡¸ÖÁ¯ÀÔ´Ï´Ù. ¹Ù¸£´Â Áï½Ã ºÎµå·¯¿î º¸½À À±±â¸·ÀÌ ÇÇºÎ¸¦ °¨½Î°í" Ç³ºÎÇÑ ¼öºĞ°¨°ú ¹Ğµµ³ôÀº Åº·Â ºÎ¿©·Î Å©¸²±îÁö ²Ä²ÄÇÏ°Ô ¹Ù¸¥ µí ¿À·¡µµ·Ï ÃËÃËÇÏ°í ¸Å²öÇÏ°Ô ºû³ª´Â ÇÇºÎ·Î ¸¸µé¾î Áİ´Ï´Ù.',   12000   ,'100ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401960315164.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0009',   'ÇÑ Àå ¼Ö·ç¼Ç ºÀ ¾Ø ¸¶½ºÅ© ÇÊ¸µ Å°Æ®','   °¢Áú ½Ï! ¸Å²ö ÇÊ¸µ 3½ºÅÜ Å°Æ®- calming-energy ¿öÅÍ ÇÔÀ¯ ÃÊ±Ø¼¼»ç ½ÃÆ®- Æ÷±ÙÇÑ ±¸¸§ ½ÃÆ®°¡ Ç« ÀÜ µí ÇÇºÎ ÄÁµğ¼Ç È¸º¹- 16°¡´ÚÀÇ °ø±â Åë·Î·Î ¿¡¼¾½º Àü´Ş ¸ÅÄ¿´ÏÁò È°¼ºÈ­*Àü¼ººĞÀº ÇÊ¸µ ¼öµù ¸¶½ºÅ©¸¦ ±âÁØÀ¸·Î µî·ÏµÇ¾ú½À´Ï´Ù.',   3900   ,'4ml+2ml+25ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20170125/1485325237297.png','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0010',   '¼öºĞ°¡µæ Äİ¶ó°Õ ¿¡¼¾½º','   * 2015³â ¸®´º¾ó µÈ Á¦Ç°ÀÔ´Ï´Ù *¾î¶°ÇÑ È¯°æ¿¡¼­µµ ¼öºĞ°ú Åº·ÂÀ» ÁöÄÑÁÖ´Â °í³óÃà ¿¡¼¾½º. ÇÇºÎ ³»ÀÇ ¼öºĞÀÌ ºüÁ®³ª°¡Áö ¾Êµµ·Ï ÀÛ¿ëÇÏ´Â ¼¼¶ó¸¶ÀÌµå Ä¸½¶À» ´Ù·® ÇÔÀ¯ÇÏ¿© °­·ÂÇÑ ¼öºĞ¸·À» Çü¼ºÇØ Áİ´Ï´Ù. ÇÇºÎÀ§¿¡¼­ ¹Ì²ô·¯Áöµí ºÎµå·´°Ô ÆÛÁö¸ç ÃËÃËÇÏ°í Åº·ÂÀÖ´Â ¸¶¹«¸®°¨À» ºÎ¿©ÇØ Áİ´Ï´Ù.',   15000   ,'45ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150901/1441103224814.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0011',   'ÆéÅ¸ÀÌµå ¹öºí ¾÷ ¼¼·³   ','Firming Up! Tightening Up! Brightening Up! ¸¼Àº »ı±â º¸½À°ú Èû ÀÖ´Â Åº·Â" ÆØÆØÇÑ Å¸ÀÌÆ®´× È¿°ú·Î ½Ã°£°ú È¯°æÀ¸·Î º¯È­µÈ ÇÇºÎÀÇ ¸¶ÀÌ³Ê½º »çÀÎÀ» Àâ¾ÆÁÖ¾î ÅºÅºÇÑ Åº¼ºÇÇºÎ·Î °¡²Ù¾îÁÖ´Â 3 in 1 ¿ÃÄÉ¾î ¼¼·³* ¿Â¶óÀÎ Àü¿ë »óÇ°ÀÔ´Ï´Ù.',   38000   ,'70ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20180510/1525934832559.png','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0012',   'Á¦·ÎÇÇÁö ¿ÀÀÏÄÆ ¸Å²ö¿¡¼¾½º','   ¸Å²öÇÑ ÇÇºÎ·Î ÄÉ¾îÇØÁÖ´Â ½Ç¸®ÄÜ Free ¿¡¼¾½º-ÇÇºÎ¿¡ ºÎ´ã¾øÀÌ ¸Å²ô·¯¿î ÇÇºÎ·Î °¡²Ù¾î ÁÖ´Â ½Ç¸®ÄÜ ÇÁ¸® ¿¡¼¾½º-À¯¼öºĞ¹ë·±½ºÄÉ¾î·Î °ÇÁ¶ÇÔ¾ø´Â ±ÕÇüÀâÈù ÇÇºÎ-3°¡Áö ¼ººĞ ¹«Ã·°¡ : ½Ç¸®ÄÜ" ±¤¹°¼º¿ÀÀÏ" Å¸¸£»ö¼Ò',   12000   ,'40ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160516/1463388970988.PNG','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0013',   '¼öºĞ°¡µæ ¾Ë·Î¿¡ ÆÛ½ºÆ® ¿¡¼¾½º','   ¼¼¾È ÈÄ ÇÇºÎ°¡ ¸ñ¸¶¸¦ ¶§ °¡Àå ¸ÕÀú »ç¿ëÇÏ´Â Ã¹¹øÂ° ¿¡¼¾½º·Î" À¯±â³ó ¾Ë·Î¿¡°¡ 86.9%°¡ ÇÔÀ¯µÇ¾î ÇÇºÎ¿¡ ÁøÁ¤ È¿°ú¿Í ÇÔ²² ¼öºĞÀ» Ç³ºÎÈ÷ °ø±ŞÇÏ¿© Çª¼®ÇÑ ÇÇºÎ¿¡ ÃËÃËÇÔ°ú °Ç°­ÇÔÀ» ºÎ¿©ÇØÁİ´Ï´Ù. ±¤¹°¼º"ÆÄ¶óº¥"ÅÅÅ© free. À¯±â³ó ¾Ë·Î¿¡ 86.9% ÇÔÀ¯.',   15000   ,'100ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401957003581.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0014',   '0ÃÊ ¹Ì³×¶ö ¼¼·³','   ¼¼¾È Á÷ÈÄ 0ÃÊ °­·Â ºÎ½ºÆÃ È¿°ú¸¦ ÁÖ´Â ¿ÂÃµ¼ö ¹Ì½ºÆ® ¼¼·³. ¼¼¾È Á÷ÈÄÀÇ °ÇÁ¶ÇÏ°í ¾àÇØÁø ÇÇºÎ¿¡ ºü¸¥ ¼öºĞ °ø±ŞÀ¸·Î ÇÇºÎ¸¦ °Ç°­ÇÏ°Ô ºÎ½ºÆÃ ½ÃÄÑ ÁÖ´Â ¹Ì½ºÆ® Å¸ÀÔÀÇ 0ÃÊ ¼¼·³ÀÔ´Ï´Ù. ÇÇºÎ ÁøÁ¤°ú ¼öºĞ °ø±Ş¿¡ È¿°úÀûÀÎ °¢Á¾ ¹Ì³×¶ö ¿ÂÃµ¼ö¿Í ÇÇºÎ ÇÊ¼ö ¼ººĞµéÀÌ ´Ù·®À¸·Î ÇÔÀ¯µÇ¾î" º¸µéº¸µé ¸Å²öÇÏ°Ô ÇÇºÎ¿¡ ½º¸çµé¾î ÇÇºÎ º»¿¬ÀÇ ÈûÀ» Å°¿ö Áİ´Ï´Ù.',   14000   ,'160ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401956865136.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0015',   '¼öºĞ°¡µæ Äİ¶ó°Õ ¹°±¤ÇÊ·¯','   È÷¾Ë·ç·Î»êÀÌ Äİ¶ó°ÕÀ» °¨½Î°í ÀÖ´Â ÇüÅÂÀÎ ¸¶ÀÌÅ©·Î Äİ¶ó°Õ È÷¾Æ·çÄ¸½¶ÀÌ ÇÇºÎ¿¡ Àü´ŞµÇ¾î ¹Ù¿À¹ä ¿öÅÍ¸¦ ²ø¾î´ç°Ü ÇÇºÎ¿¡ ¼öºĞÀ» ºü¸£°Ô Ã¤¿ö Áİ´Ï´Ù. ¹Ù¿À¹ä ³ª¹«ÀÇ Á¡¾×°ú È÷¾Ë·ç·Î»êÀÌ ÇÇºÎ Ãş »çÀÌ»çÀÌ¸¦ ºóÆ´¾øÀÌ ÃËÃËÇÏ°Ô ¼öºĞÀÔÀÚ¸¦ ºÙ¿©ÁÖ´Â ¿ªÇÒÀ» ÇØ ÇÇºÎ ¼ÓÀ» ´õ¿í ÃËÃËÇÏ°Ô ÄÉ¾îÇØÁİ´Ï´Ù. ¹Ù¿À¹ä Á¡¾×°ú ¸¶ÀÌÅ©·Î Äİ¶ó°Õ È÷¾Æ·çÄ¸½¶ÀÌ ÇÇºÎ¼Ó¿¡¼­ ÃËÃËÇÏ°Ô ÅÍÁ® ÇÇºÎÀÇ °ÇÁ¶ÇÔÀ» ´Ù½º·ÁÁÖ°í Çª¼®Çª¼®ÇÏ°í °ÇÁ¶ÇÑ ÇÇºÎ¿¡ ÀÚ¿¬½º·¯¿î ¹°±¤È¿°ú¸¦ ºÎ¿©ÇØÁİ´Ï´Ù.',   18000   ,'50ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401958090434.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0016',   '¶óÀÌÅ©20 ºÎ½ºÅÍ ¿¡¼¾½º','   º¸½À°ú Åº·ÂÀ» ºü¸£°Ô Ã¤¿öÁÖ´Â Ã¹ ´Ü°è ¿ÀÀÏÁ© ¼¼·³. ¼¼¾È" ¿¡¾îÄÁ" È÷ÅÍ" ±Ø½ÉÇÑ ¿ÂµµÂ÷ µîÀ¸·Î ¾àÇØÁø ÇÇºÎ Àåº®À» °­È­½ÃÄÑ ÃÊ±â ³ëÈ­¸¦ ¿ÏÈ­ÇØ ÁÖ´Â Á© Å¸ÀÔÀÇ ºÎ½ºÆÃ ¿ÀÀÏ ¿¡¼¾½ºÀÔ´Ï´Ù. °¡º±°í »ê¶æÇÑ Á©ÀÌ ±íÀº º¸½À·ÂÀ» °¡Áø ¿ÀÀÏ·Î º¯ÇØ ²öÀûÀÓ ¾øÀÌ ¸Å²ô·´°Ô ÇÇºÎ¿¡ µµÆ÷µÇ¾î" ÇÇºÎ º¸½À°ú Åº·ÂÀ» ºÎ¿©ÇÏ°í ¼öºĞ Áõ¹ßÀ» ¸·¾Æ ÃËÃË ¸Å²öÇÏ°Ô À±±â Èå¸£´Â ÇÇºÎ°áÀ» ¸¸µé¾î Áİ´Ï´Ù.',   16000   ,'100ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401963460537.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0017',   'ÅäÅ»¿¡ÀÌÁö¸®Æä¾î ·Î¾â ¿¡¼¾½º','   ¾ÈÆ¼¿¡ÀÌÂ¡ÀÇÇØ´ä" °Ç°­ÇÑ ¹ßÈ¿°¡ ¼±»çÇÏ´Â ÇÇºÎÀÇ Èû. ´Ã¾îÁöµí ÂËµæÇÑ ÅØ½ºÃ³ÀÇ ÇÇºÎ À¯¿¬°¨ °³¼± ¹× Åº·Â °ø±Ş ÀÌÁß ±â´É¼º ÅäÅ»¿¡¼¾½º. ÁöÁßÇØ ÀÚ»ı ½Ä¹° ÀÓ¸ğ¸£¶¿ ÇÃ¶ó¿ö ÃßÃâ¹°°ú ·Î¾âÁ¦¸®ÀÇ ¼ººĞ ¹ßÈ¿ ÄÄÇÃ·º½º¿Í º£·Õ³ª¹«²É ÃßÃâ¹°" È÷¾Ë·ç·Î»êÀÌ ÇÔÀ¯µÇ¾îÇÇºÎ¿¡ Åº·Â°ú º¸½ÀÀ» Á¦°øÇÏ°í" ¿¡ÀÌÁö ¸ÅÆ®¸¯½º°¡ ÇÇºÎ°áÀ» ÃÎÃÎÇÏ°í ¸Å²öÇÏ°Ô ÇØÁÖ¾î °Ç°­ÇÏ°í À±±âÀÖ´Â ÇÇºÎ·Î °¡²Ù¾î Áİ´Ï´Ù.',   22000,'45ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401959126192.JPG','3','A');

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
values('³É³É','hifgadgaergerger');
commit;

select * from faq ;
--------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
insert into member(email,name,ageyear,gender,skintype,phone,zipcode,address1,address2,regstat)
values('admin','admin',24,'F','°Ç¼º','01000000000','12345','¼­¿ï','¾îµò°¡','Y');



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

--1:1¹®ÀÇ ÄÚµå qna_yyyymmdd_seq
--¸ÅÀÏ »õ·ÎÀº seq refdata´Â ³¯Â¥Çü
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0001','Å¸ÀÌÆ²','³»¿ë','2018-01-01','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0002','Å¸ÀÌÆ²','³»¿ë','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0003','Å¸ÀÌÆ²','³»¿ë','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0004','Å¸ÀÌÆ²','³»¿ë','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0005','Å¸ÀÌÆ²','³»¿ë','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0001','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0002','Å¸ÀÌÆ²','³»¿ë','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0003','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
--
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0004','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0005','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0006','Å¸ÀÌÆ²','³»¿ë','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0007','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0008','Å¸ÀÌÆ²','³»¿ë','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,email)
values('qna_20180102_0009','Å¸ÀÌÆ²','³»¿ë','2018-01-02','admin');
insert into qna value(qnano,title,contents,email)
values('qna_20180102_0010','Å¸ÀÌÆ²','³»¿ë','admin');
commit;
truncate table onetoone;
---------------------------
select count(*) from onetoone;
--
select max(qnano) from qna;
--insert½Ã ¸¶Áö¸· qnano¸¦ Ã£°í ¿À´Ã°ú °°Àº ³¯ÀÎÁö ºñ±³ ÈÄ °°Àº ³¯ÀÌ¸é seq+1°ª
--¿À´Ã°ú °°Àº ³¯ÀÌ ¾Æ´Ï¸é ¿À´ÃÀÇ seq½ÃÀÛ°ª
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
where productcode like concat('%',concat('ÇÎÅ©','%'))
            or productname like concat('%',concat('ÇÎÅ©','%'));
-------------------------------------------------------------------

select max(productcode) from product 
where brandcode='A' and categorycode='3  ';

select max(productcode) from product 
      where brandcode='A' and categorycode='3';


---------------------------------
select b.productcode, c.* from p_order a, orderdetail b, product c
where a.orderno =b.orderno and b.productcode=c.productcode;
--ÁÖ¹®µÈ ¹°°Ç
--
--ÁÖ¹® Å×ÀÌºí row-> sales.jsp selectall
select * 
from (
    select A.*, rownum as rnum 
    from(
            select * 
            from p_order 
            where email like concat('%',concat('ÇÑÁö¹Î','%')) or name like concat('%',concat('ÇÑÁö¹Î','%'))
        )A
    )
where rnum >=1 and rnum <=10
    ;

--ÁÖ¹® µğÅ×ÀÏ ->³Ñ¾î¿Â ÁÖ¹® ¹øÈ£ , ±×¿¡ ÇØ´çÇÏ´Â»óÇ°µéÀÇ °¢°¢ÀÇ ÀÌ¸§,ÄÚµåµîÀÇ Á¤º¸
--ÆäÀÌÂ¡ ÇÊ¿ä¾øÀ½
select p.productcode,r.orderno,amount,o.price,productname,p.price as productprice,image,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email
from orderdetail o ,product p, p_order r
where r.orderno='order_20180521_0001' and p.productcode=o.productcode and r.orderno=o.orderno;
select * from orderdetail o ,product p
where orderno='order_20180521_0001' and p.productcode=o.productcode;
--È¸¿øÀ» Å¬¸¯ÇÏ¸é Áö±İ±îÁö ÁÖ¹® ÀÌ·ÂÁß È¸¿ø¸¸ Ãâ·Â
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
values('order_20180521_0001','±è¾Æ¸§','00000','¼­¿ï','¾îµò°¡','01050068435','CARD','ÄÚ¸àÆ®',sysdate,'N','rladkfma0208@naver.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0001',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0001',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0001',2,24000);
commit;
--
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0001','±è¾Æ¸§','00000','¼­¿ï','¾îµò°¡','01050068435','CARD','ÄÚ¸àÆ®',sysdate,'N','rladkfma0208@naver.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0001',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0001',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0001',2,24000);
commit;
-----
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0001','±è¾Æ¸§','00000','¼­¿ï','¾îµò°¡','01050068435','CARD','ÄÚ¸àÆ®',sysdate,'N','rladkfma0208@naver.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0001',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0001',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0001',2,24000);
commit;
------
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0002','¹ÚÁö¹Î','00000','¼­¿ï','¾îµò°¡','01050068435','CARD','ÄÚ¸àÆ®',sysdate,'N','rladkfma0208@gmail.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0002',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0002',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0002',2,24000);
commit;
------
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0003','±èÅÂÇü','00000','¼­¿ï','¾îµò°¡','01050068435','CARD','ÄÚ¸àÆ®',sysdate,'N','rladkfma0208@nate.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0003',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0003',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0003',2,24000);
commit;


---»óÇ° ÄÚµå, ÀÌ¸§ °¡Á®¿À±â
select productcode, productname
from product;

---p_order¿¡¼­ »óÇ°ÄÚµå,»óÇ°ÀÌ¸§,ÁÖ¹®¼ö,¸ÅÃâ¾×

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
  values('grade_20180617_0001','ÁÁ¾Æ¿©',5.0,'2018-06-17','admin','prod_A_2_0006');
 insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0002','ÁÁ¾Æ¿©',5.0,'2018-06-17','admin','prod_A_2_0007');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0003','ÁÁ¾Æ¿©',5.0,'2018-06-17','admin','prod_A_2_0008');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0004','ÁÁ¾Æ¿©',5.0,'2018-06-17','admin','prod_A_2_0009');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0005','ÁÁ¾Æ¿©',5.0,'2018-06-17','admin','prod_A_2_0010');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0006','ÁÁ¾Æ¿©',5.0,'2018-06-17','admin','prod_A_2_0011');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0007','ÁÁ¾Æ¿©',5.0,'2018-06-17','admin','prod_A_2_0012');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0008','ÁÁ¾Æ¿©',5.0,'2018-06-17','admin','prod_A_2_0013');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0009','ÁÁ¾Æ¿©',5.0,'2018-06-17','08@naver.com','prod_A_2_0014');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0010','ÁÁ¾Æ¿©',5.0,'2018-06-17','08@naver.com','prod_A_2_0015');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0011','ÁÁ¾Æ¿©',5.0,'2018-06-17','rladkfma0208@naver.com','prod_A_2_0016');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0012','ÁÁ¾Æ¿©',5.0,'2018-06-17','rladkfma0208@naver.com','prod_A_2_0017');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0013','ÁÁ¾Æ¿©',5.0,'2018-06-17','rladkfma0208@naver.com','prod_A_3_0011');
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
  values('board_20180101_0001','¾È³ç','µğÁö¸ó','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0002','¿şÀÏ¸®¾ğ','¿şÀÏ¸®¾ğ','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0003','ÀÌºÒÅ±','¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0004','ÄÉÀÌÆ¼Æä¸®','ÀüÇÏÁö ¸øÇÑ Áø½É','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0005','ÆäÀÌÅ© ·¯ºê','ÆäÀÌÅ© ·¯ºê','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0001','¸ÅÁ÷¼¥','¸ÅÁ÷¼¥','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0002','¿¡¾îÇÃ·¹ÀÎ','µğÁö¸ó','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0003','DNA','µğÁö¸ó','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0004','¾ÓÆÎ¸Ç','µğÁö¸ó','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0005','°í°í','µğÁö¸ó','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180103_0001','¸¶ÀÌÅ©µå¶ø','µğÁö¸ó','2018-01-03','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180103_0002','±ò±ò±ò±ò','µğÁö¸ó','2018-01-03','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180103_0003','º£šÀÆ® ¿Àºê ¹Ì','Ã¼ÀÎ½º¸ğÄ¿½º','2018-01-03','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180104_0001','Æ¼¾î','µğÁö¸ó','2018-01-04','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180105_0001','¶óÀÌ','µğÁö¸ó','2018-01-05','0','0','0','admin@admin.co.kr');
  commit;
  --Á¦¸ñ, ÀÛ¼ºÀÚ,ÀÛ¼ºÀÏÀÚ,Á¶È¸¼ö,ÃßÃµ¼ö,ºñÃßÃµ¼ö
  --³»¿ë, ÃßÃµ¼ö,ºñÃß­¼ö,Á¶È¸¼ö,ÀÛ¼ºÀÚ,ÀÛ¼ºÀÏÀÚ,Á¦¸ñ,ÀÌ¸§,¤¤¤·¤©¤¤¤·¤©sdfsd¤·¤¤¤©
  
  
  
  
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
