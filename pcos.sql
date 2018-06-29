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
values('�ɳ�','hifgadgaergerger');
commit;

select * from faq ;
--------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
insert into member(email,name,age,gender,skintype,phone,zipcode,address1,address2,regstat)
values('admin','admin',24,'F','�Ǽ�','01000000000','12345','����','���','Y');



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


--1:1���� �ڵ� qna_yyyymmdd_seq
--���� ������ seq refdata�� ��¥��
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0001','Ÿ��Ʋ','����','2018-01-01','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0002','Ÿ��Ʋ','����','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0003','Ÿ��Ʋ','����','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0004','Ÿ��Ʋ','����','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0005','Ÿ��Ʋ','����','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0001','Ÿ��Ʋ','����','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0002','Ÿ��Ʋ','����','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0003','Ÿ��Ʋ','����','2018-01-02','N','admin');
--
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0004','Ÿ��Ʋ','����','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0005','Ÿ��Ʋ','����','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0006','Ÿ��Ʋ','����','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0007','Ÿ��Ʋ','����','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0008','Ÿ��Ʋ','����','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,email)
values('qna_20180102_0009','Ÿ��Ʋ','����','2018-01-02','admin');
insert into qna value(qnano,title,contents,email)
values('qna_20180102_0010','Ÿ��Ʋ','����','admin');
commit;
truncate table onetoone;
---------------------------
select count(*) from onetoone;
--
select max(qnano) from qna;
--insert�� ������ qnano�� ã�� ���ð� ���� ������ �� �� ���� ���̸� seq+1��
--���ð� ���� ���� �ƴϸ� ������ seq���۰�
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
where productcode like concat('%',concat('��ũ','%'))
            or productname like concat('%',concat('��ũ','%'));
-------------------------------------------------------------------

select max(productcode) from product 
where brandcode='A' and categorycode='3  ';

select max(productcode) from product 
		where brandcode='A' and categorycode='3';


---------------------------------
select b.productcode, c.* from p_order a, orderdetail b, product c
where a.orderno =b.orderno and b.productcode=c.productcode;
--�ֹ��� ����
--
--�ֹ� ���̺� row-> sales.jsp selectall
select * 
from (
    select A.*, rownum as rnum 
    from(
            select * 
            from p_order 
            where email like concat('%',concat('������','%')) or name like concat('%',concat('������','%'))
        )A
    )
where rnum >=1 and rnum <=10
    ;

--�ֹ� ������ ->�Ѿ�� �ֹ� ��ȣ , �׿� �ش��ϴ»�ǰ���� ������ �̸�,�ڵ���� ����
--����¡ �ʿ����
select o.* from orderdetail o ,product p
where orderno='order_20180611_0004' and p.productcode=o.productcode;
select p.* from orderdetail o ,product p
where orderno='order_20180611_0004' and p.productcode=o.productcode;
--ȸ���� Ŭ���ϸ� ���ݱ��� �ֹ� �̷��� ȸ���� ���
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
values('prod_A_2_0008','ǻ�� ���� �ٿ��� ���ϵ� �μ� SPF30/PA++','�����Ӿ��� ������ ������ �ڿܼ� ���ܱ���� ���ϸ� ���ϵ� �μ�!-�ڿܼ� ���� ��� ���ȭ���� �����Ʈ�� ȿ�� ��ġ ������ ������ ������ �ε巯�� ���������� ������ ������ ���� ȭ���ϰ� �Ǻθ� ����� �ִ� �ڿܼ� ���� ��� ��� ���ϵ� �μ�-�޸��� �Ǻθ� ���� �����ϰ�!',11500,'90ml','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150430/1430383272682.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('','','',,'','','2','A');

insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0006','��ũ ���� ���� ������','����� ���� �ε巴�� �Ǻθ� ���� Ǫ���ϰ� ��ģ �Ǻθ� �Ų����� ���پ� �ִ� �������� ���� ������- ��ũ ������ ���Ϳ� ��Ÿ�� A/C/E �� ������ �ε巯�� ��Ű ���ķ��� �ε巴�� �Ǻο� ����Ǿ� �����ϰ� ��ĥ���� �Ǻθ� ��ũ�� ���� ��ġ�� �Ǻη� ���پ� �ִ� ���� ���� ���� �������Դϴ�.- ��ũ ������ ���� 68.86% ����',13000,   '180ml'   ,'http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160302/1456886498278.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0007'   ,'��� ȭ��Ʈ C ����� ������','   - ������ �׻�ȭ ȿ���� ���� C ��� ���Ϳ� �����ϰ� ������ ä��� �̳׶� ��� ���Ͱ� �����Ǿ� ������ ���� ������ �Ǻη� ���ٴ� ��Ÿ�� ȭ��Ʈ�� ������ �Դϴ�.- �ε巴�� ������ ��ũ Ÿ������ �Ǻθ� ȯ�ϰ� ���ٴ� ���ÿ� �游�� ���а��� �����մϴ�.- ������ ����Ǿ� �Ǻο� ����ϰ� ���� �������� ���������� �������� �ݴϴ�.',   18000   ,'180ml'   ,'http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160202/1454392610858.jpg'   ,'2'   ,'A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0008', 'ǻ�� ���� �ٿ��� ���ϵ� �μ� SPF30/PA++','   �����Ӿ��� ������ ������ �ڿܼ� ���ܱ���� ���ϸ� ���ϵ� �μ�!-�ڿܼ� ���� ��� ���ȭ���� �����Ʈ�� ȿ�� ��ġ ������ ������ ������ �ε巯�� ���������� ������ ������ ���� ȭ���ϰ� �Ǻθ� ����� �ִ� �ڿܼ� ���� ��� ��� ���ϵ� �μ�-�޸��� �Ǻθ� ���� �����ϰ�!',   11500   ,'90ml','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150430/1430383272682.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0009', '���а��� �ݶ�� �μ�','   ������ �ؽ���" �׷��� ���� ���а� ź���� �������ִ� ��Ű �μ�. ������ �ִ� �ʱ��ʱ��� ���� ����� �Ǻθ� �ε巴�� �����ֵ� ź�°��� �ο����ָ�" �ٿ��� ���� ���⹰�� �ݶ���� ���յǾ� ��Ų�ɾ� ù�ܰ���� ������ ������ �ο����ݴϴ�. �Ϲ� ��Ų�� �޸�" ���а��� �ݶ�� ��Ų�� �������� ���Ͽ� ��Ų ����� �����ϰ� ���¸� �����ϴ� ������.',   12000   ,'180ml','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401947638533.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0010', '�������� Ŭ��� ������   ','����ϰ� ������ ������ �������Ǿ� ��Ʈ���� ����� �������ִ� ������ ���� ��� ������-����������: �ʻ�������� ź���� �����ʰ� �����Ǿ� ����� ����� �ذ����ִ� ��� ��Ʈ�� �ַ�� ��ǰ�Դϴ�-����ϰ� ������: �Ǻο� ����ϰ� ������ ������ �������Ǿ� ��Ʈ���� ����� �������ݴϴ�-��꼺 pH ��� �ɾ�: ��꼺 pH ��� �ɾ�� �Ʊ� �Ǻ�ó�� �ε巴�� �ɾ����ָ� PH�뷱���� ���ߴµ� ������ �ݴϴ�   ',11999   ,'150ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150506/1430882549156.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0011',   'ǻ�� ���� �ٿ��� ���̽�ó������   ','������� �� ������ ������ ������ ä�� �ִ� ������ ���̽�ó�������޸��� �Ǻθ� ���� �����ϰ�!- ���� �������� ���� �ٿ��� ���Ϳ� Ź���� ��ȭ�ɷ��� ���� �𸵰� ������ �����Ǿ�" �޸��� �Ǻο� ���� ������ ������ ������ ä���ִ� ���̽�ó�������Դϴ�.���麸�� �Ų����� ���� �Ǻ�!- ��ġ ������� �� ������ ������ �ε巯�� ���������� ������ ����Ǿ�" ��ĥ �� �����̴� ���а��� ���麸�� �Ų����� �Ǻΰ��� ���� ���� �Ǻθ� ������ݴϴ�.',   10500   ,'180ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140807/1407477366730.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0012',  'ACŬ���� ���ϸ� �� �μ�','   �Ǻ� ��� �ֱ� ���� ���ϸ���~������ ���� �μ�. ���뼺 ���� ������ �ٷ� �����Ǿ� ���а��� �������� �ٿ��ְ�" ������ ������ ä���ִ� ������ �뷱�� �� �μ��Դϴ�. �츮�ǻ�� Ư�� ��� ������ ��鳪�� ���⹰ ���� ������ �����Ǿ� �ְ� ������ �ÿ��� �߸������� �Ǻο� �δ���� ����ϰ� �����ϰ� ������ ���ݴϴ�.',   9500   ,'150ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401949398129.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0013','��Ų���� ������','   �ε巯�� �ؽ����� �Ǻ� ����" ��ȣ ���̽��Ķ�����. ��Ų ������ � ��Ų���� �� �������� �ؽ��ķ�" ������ Ȥ�� ũ���� �ٸ� �� ����" ��ȣȿ���� Ź���մϴ�. �ٹټ� ���� ���⹰�� ������ �Ǻ� ������ �̲������� �ε巴�� ������" ����Ÿ� ���� Ź���� �������� ��Ÿ���ϴ�. 5 free �Ķ�" �ΰ�����" �������" ������ ����" ������ free.',   12000   ,'200ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401950562365.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0014',   '���簡�� �þ���� ������ ������','   �������� ���� ���� + �μ��� �Ǻ� ��ȣ ȿ��! �Ű��� ���̽�ó������. ����� ������ ���� �������ִ� �������� ��"���� �뷱���� �����ִ� �μ��� ���յ� ������ ���� �� ���� ���̽��Ķ�����. �������� ����� �þ���Ϳ� ���� ������ �ڻ��Ͽ� ������ ������ Ŭ���� ���� ������ ������ �ſ� ������ �Ǻθ� �����ϰ� �����ְ� ���پ��ݴϴ�. ����ũ�� �ܰ�� �����ְ� �Ų��� �Ǻθ� ǥ�����ݴϴ�.',   18000   ,'60ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401962947211.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0015',   '�޸��÷��� ���� ������','   �ٸ��� ���� �����ϰ� ����ϰ� �����Ǵ� �ε巯�� ������ ������- �������� �������� ä�� �Ǻ� ��ȣ�� ����: �Ǻο� �������� �������� ä�� �Ǻ� ��ȣ���� �����Ͽ��� �Ӹ� �ƴ϶� ��ĥ���� �Ǻΰ��� �����ϰ� �����ݴϴ�.- ������ ���� ������ 72% ����: Ź���� ����ȿ�� �Ӹ� �ƴ϶� �Ǻ��庮��ȭ ȿ���� ����� �������κ��� �� ������ ���� ������- �ָ����� + �̹� ���� ��ɼ�: ĢĢ�ϰ� �������� �Ǻθ� ȯ�ϰ� źź�ϰ� �������ִ� �̹� �� �ָ����� ���� ��ɼ� ��ǰ�Դϴ�.   ',28000   ,'120ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20141103/1414997728814.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0016',   '����ũ20 ������ ������','   �������� ���� ������ ���� ����� ���� ��ġ�� �ؽ����� �������� �޸��� �Ǻο� ���� ������ ������ ������ �־�" �������� źź�� �ǰ��� �Ǻη� �����ݴϴ�. �Ǻΰ��� ���� �ε巴�� �Ų����� �����鼭 �Ǻο� ǳ���� �������� �����ϰ� ������ ���� �����ϰ� ������ �˴ϴ�.',   16000   ,'140ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401963876878.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0017',   '���� ��ä ���ζ� ������ �μ�','   �̼��� Ÿ��Ƽ �����ֿ� ���ζ� ���ڰ� ������ ���� ���ζ� ��ä ������ �����Ǿ�" �Ǻ� ���̻��̸� �����ϰ� �����ϰ� ä�� ������ ��ä�� �ο��Ͽ� �ִ� ���ϸ� �������Դϴ�. �ٸ��� ��� �ε巯�� ���� ���⸷�� �Ǻθ� ���ΰ�" ǳ���� ���а��� �е����� ź�� �ο��� ũ������ �Ĳ��ϰ� �ٸ� �� �������� �����ϰ� �Ų��ϰ� ������ �Ǻη� ����� �ݴϴ�.',   12000   ,'100ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401960315164.jpg','2','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0009',   '�� �� �ַ�� �� �� ����ũ �ʸ� ŰƮ','   ���� ��! �Ų� �ʸ� 3���� ŰƮ- calming-energy ���� ���� �ʱؼ��� ��Ʈ- ������ ���� ��Ʈ�� ǫ �� �� �Ǻ� ����� ȸ��- 16������ ���� ��η� ������ ���� ��Ŀ���� Ȱ��ȭ*�������� �ʸ� ���� ����ũ�� �������� ��ϵǾ����ϴ�.',   3900   ,'4ml+2ml+25ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20170125/1485325237297.png','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0010',   '���а��� �ݶ�� ������','   * 2015�� ������ �� ��ǰ�Դϴ� *��� ȯ�濡���� ���а� ź���� �����ִ� ����� ������. �Ǻ� ���� ������ ���������� �ʵ��� �ۿ��ϴ� �����̵� ĸ���� �ٷ� �����Ͽ� ������ ���и��� ������ �ݴϴ�. �Ǻ������� �̲������� �ε巴�� ������ �����ϰ� ź���ִ� ���������� �ο��� �ݴϴ�.',   15000   ,'45ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150901/1441103224814.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0011',   '��Ÿ�̵� ���� �� ����   ','Firming Up! Tightening Up! Brightening Up! ���� ���� ������ �� �ִ� ź��" ������ Ÿ��Ʈ�� ȿ���� �ð��� ȯ������ ��ȭ�� �Ǻ��� ���̳ʽ� ������ ����־� źź�� ź���Ǻη� ���پ��ִ� 3 in 1 ���ɾ� ����* �¶��� ���� ��ǰ�Դϴ�.',   38000   ,'70ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20180510/1525934832559.png','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0012',   '�������� ������ �Ų�������','   �Ų��� �Ǻη� �ɾ����ִ� �Ǹ��� Free ������-�Ǻο� �δ���� �Ų����� �Ǻη� ���پ� �ִ� �Ǹ��� ���� ������-�����й뷱���ɾ�� �����Ծ��� �������� �Ǻ�-3���� ���� ��÷�� : �Ǹ���" ����������" Ÿ������',   12000   ,'40ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160516/1463388970988.PNG','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0013',   '���а��� �˷ο� �۽�Ʈ ������','   ���� �� �Ǻΰ� �񸶸� �� ���� ���� ����ϴ� ù��° ��������" ����� �˷ο��� 86.9%�� �����Ǿ� �Ǻο� ���� ȿ���� �Բ� ������ ǳ���� �����Ͽ� Ǫ���� �Ǻο� �����԰� �ǰ����� �ο����ݴϴ�. ������"�Ķ�"��ũ free. ����� �˷ο� 86.9% ����.',   15000   ,'100ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401957003581.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0014',   '0�� �̳׶� ����','   ���� ���� 0�� ���� �ν��� ȿ���� �ִ� ��õ�� �̽�Ʈ ����. ���� ������ �����ϰ� ������ �Ǻο� ���� ���� �������� �Ǻθ� �ǰ��ϰ� �ν��� ���� �ִ� �̽�Ʈ Ÿ���� 0�� �����Դϴ�. �Ǻ� ������ ���� ���޿� ȿ������ ���� �̳׶� ��õ���� �Ǻ� �ʼ� ���е��� �ٷ����� �����Ǿ�" ���麸�� �Ų��ϰ� �Ǻο� ������ �Ǻ� ������ ���� Ű�� �ݴϴ�.',   14000   ,'160ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401956865136.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0015',   '���а��� �ݶ�� �����ʷ�','   ���˷�λ��� �ݶ���� ���ΰ� �ִ� ������ ����ũ�� �ݶ�� ���Ʒ�ĸ���� �Ǻο� ���޵Ǿ� �ٿ��� ���͸� ������ �Ǻο� ������ ������ ä�� �ݴϴ�. �ٿ��� ������ ���װ� ���˷�λ��� �Ǻ� �� ���̻��̸� ��ƴ���� �����ϰ� �������ڸ� �ٿ��ִ� ������ �� �Ǻ� ���� ���� �����ϰ� �ɾ����ݴϴ�. �ٿ��� ���װ� ����ũ�� �ݶ�� ���Ʒ�ĸ���� �Ǻμӿ��� �����ϰ� ���� �Ǻ��� �������� �ٽ����ְ� Ǫ��Ǫ���ϰ� ������ �Ǻο� �ڿ������� ����ȿ���� �ο����ݴϴ�.',   18000   ,'50ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401958090434.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0016',   '����ũ20 �ν��� ������','   ������ ź���� ������ ä���ִ� ù �ܰ� ������ ����. ����" ������" ����" �ؽ��� �µ��� ������ ������ �Ǻ� �庮�� ��ȭ���� �ʱ� ��ȭ�� ��ȭ�� �ִ� �� Ÿ���� �ν��� ���� �������Դϴ�. ������ ����� ���� ���� �������� ���� ���Ϸ� ���� ������ ���� �Ų����� �Ǻο� �����Ǿ�" �Ǻ� ������ ź���� �ο��ϰ� ���� ������ ���� ���� �Ų��ϰ� ���� �帣�� �Ǻΰ��� ����� �ݴϴ�.',   16000   ,'100ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401963460537.jpg','3','A');
insert into Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_3_0017',   '��Ż����������� �ξ� ������','   ��Ƽ����¡���ش�" �ǰ��� ��ȿ�� �����ϴ� �Ǻ��� ��. �þ����� �˵��� �ؽ�ó�� �Ǻ� ������ ���� �� ź�� ���� ���� ��ɼ� ��Ż������. ������ �ڻ� �Ĺ� �Ӹ𸣶� �ö�� ���⹰�� �ξ������� ���� ��ȿ ���÷����� ���ճ����� ���⹰" ���˷�λ��� �����Ǿ��Ǻο� ź�°� ������ �����ϰ�" ������ ��Ʈ������ �Ǻΰ��� �����ϰ� �Ų��ϰ� ���־� �ǰ��ϰ� �����ִ� �Ǻη� ���پ� �ݴϴ�.',   22000,'45ml   ','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401959126192.JPG','3','A');

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
values('�ɳ�','hifgadgaergerger');
commit;

select * from faq ;
--------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
insert into member(email,name,ageyear,gender,skintype,phone,zipcode,address1,address2,regstat)
values('admin','admin',24,'F','�Ǽ�','01000000000','12345','����','���','Y');



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

--1:1���� �ڵ� qna_yyyymmdd_seq
--���� ������ seq refdata�� ��¥��
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0001','Ÿ��Ʋ','����','2018-01-01','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0002','Ÿ��Ʋ','����','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0003','Ÿ��Ʋ','����','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0004','Ÿ��Ʋ','����','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180101_0005','Ÿ��Ʋ','����','2018-01-01','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0001','Ÿ��Ʋ','����','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0002','Ÿ��Ʋ','����','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0003','Ÿ��Ʋ','����','2018-01-02','N','admin');
--
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0004','Ÿ��Ʋ','����','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0005','Ÿ��Ʋ','����','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0006','Ÿ��Ʋ','����','2018-01-02','Y','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0007','Ÿ��Ʋ','����','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,replstat,email)
values('qna_20180102_0008','Ÿ��Ʋ','����','2018-01-02','N','admin');
insert into qna value(qnano,title,contents,regdate,email)
values('qna_20180102_0009','Ÿ��Ʋ','����','2018-01-02','admin');
insert into qna value(qnano,title,contents,email)
values('qna_20180102_0010','Ÿ��Ʋ','����','admin');
commit;
truncate table onetoone;
---------------------------
select count(*) from onetoone;
--
select max(qnano) from qna;
--insert�� ������ qnano�� ã�� ���ð� ���� ������ �� �� ���� ���̸� seq+1��
--���ð� ���� ���� �ƴϸ� ������ seq���۰�
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
where productcode like concat('%',concat('��ũ','%'))
            or productname like concat('%',concat('��ũ','%'));
-------------------------------------------------------------------

select max(productcode) from product 
where brandcode='A' and categorycode='3  ';

select max(productcode) from product 
      where brandcode='A' and categorycode='3';


---------------------------------
select b.productcode, c.* from p_order a, orderdetail b, product c
where a.orderno =b.orderno and b.productcode=c.productcode;
--�ֹ��� ����
--
--�ֹ� ���̺� row-> sales.jsp selectall
select * 
from (
    select A.*, rownum as rnum 
    from(
            select * 
            from p_order 
            where email like concat('%',concat('������','%')) or name like concat('%',concat('������','%'))
        )A
    )
where rnum >=1 and rnum <=10
    ;

--�ֹ� ������ ->�Ѿ�� �ֹ� ��ȣ , �׿� �ش��ϴ»�ǰ���� ������ �̸�,�ڵ���� ����
--����¡ �ʿ����
select p.productcode,r.orderno,amount,o.price,productname,p.price as productprice,image,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email
from orderdetail o ,product p, p_order r
where r.orderno='order_20180521_0001' and p.productcode=o.productcode and r.orderno=o.orderno;
select * from orderdetail o ,product p
where orderno='order_20180521_0001' and p.productcode=o.productcode;
--ȸ���� Ŭ���ϸ� ���ݱ��� �ֹ� �̷��� ȸ���� ���
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
values('order_20180521_0001','��Ƹ�','00000','����','���','01050068435','CARD','�ڸ�Ʈ',sysdate,'N','rladkfma0208@naver.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0001',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0001',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0001',2,24000);
commit;
--
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0001','��Ƹ�','00000','����','���','01050068435','CARD','�ڸ�Ʈ',sysdate,'N','rladkfma0208@naver.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0001',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0001',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0001',2,24000);
commit;
-----
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0001','��Ƹ�','00000','����','���','01050068435','CARD','�ڸ�Ʈ',sysdate,'N','rladkfma0208@naver.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0001',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0001',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0001',2,24000);
commit;
------
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0002','������','00000','����','���','01050068435','CARD','�ڸ�Ʈ',sysdate,'N','rladkfma0208@gmail.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0002',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0002',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0002',2,24000);
commit;
------
insert into p_order(orderno,name,zipcode,address1,address2,phone,payment,comments,orderdate,orderstat,email)
values('order_20180521_0003','������','00000','����','���','01050068435','CARD','�ڸ�Ʈ',sysdate,'N','rladkfma0208@nate.com');
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0006','order_20180521_0003',2,26000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0007','order_20180521_0003',1,18000);
insert into orderdetail(productcode,orderno,amount,price)
values('prod_A_2_0009','order_20180521_0003',2,24000);
commit;


---��ǰ �ڵ�, �̸� ��������
select productcode, productname
from product;

---p_order���� ��ǰ�ڵ�,��ǰ�̸�,�ֹ���,�����

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
  values('grade_20180617_0001','���ƿ�',5.0,'2018-06-17','admin','prod_A_2_0006');
 insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0002','���ƿ�',5.0,'2018-06-17','admin','prod_A_2_0007');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0003','���ƿ�',5.0,'2018-06-17','admin','prod_A_2_0008');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0004','���ƿ�',5.0,'2018-06-17','admin','prod_A_2_0009');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0005','���ƿ�',5.0,'2018-06-17','admin','prod_A_2_0010');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0006','���ƿ�',5.0,'2018-06-17','admin','prod_A_2_0011');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0007','���ƿ�',5.0,'2018-06-17','admin','prod_A_2_0012');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0008','���ƿ�',5.0,'2018-06-17','admin','prod_A_2_0013');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0009','���ƿ�',5.0,'2018-06-17','08@naver.com','prod_A_2_0014');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0010','���ƿ�',5.0,'2018-06-17','08@naver.com','prod_A_2_0015');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0011','���ƿ�',5.0,'2018-06-17','rladkfma0208@naver.com','prod_A_2_0016');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0012','���ƿ�',5.0,'2018-06-17','rladkfma0208@naver.com','prod_A_2_0017');
   insert into grade(gradeno,comments,grade,regdate,email,productcode)
  values('grade_20180617_0013','���ƿ�',5.0,'2018-06-17','rladkfma0208@naver.com','prod_A_3_0011');
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
  values('board_20180101_0001','�ȳ�','������','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0002','���ϸ���','���ϸ���','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0003','�̺�ű','������������������������','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0004','����Ƽ�丮','������ ���� ����','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180101_0005','����ũ ����','����ũ ����','2018-01-01','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0001','������','������','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0002','�����÷���','������','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0003','DNA','������','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0004','���θ�','������','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180102_0005','���','������','2018-01-02','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180103_0001','����ũ���','������','2018-01-03','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180103_0002','�����','������','2018-01-03','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180103_0003','����Ʈ ���� ��','ü�ν���Ŀ��','2018-01-03','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180104_0001','Ƽ��','������','2018-01-04','0','0','0','admin@admin.co.kr');
    insert into board(boardno,title,contents,regdate,readcount,likecount,dislikecount,email)
  values('board_20180105_0001','����','������','2018-01-05','0','0','0','admin@admin.co.kr');
  commit;
  --����, �ۼ���,�ۼ�����,��ȸ��,��õ��,����õ��
  --����, ��õ��,���߭���,��ȸ��,�ۼ���,�ۼ�����,����,�̸�,������������sdfsd������
  
  
  
  
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
