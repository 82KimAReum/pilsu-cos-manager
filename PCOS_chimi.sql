

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
values('A','���ٵ��Ͽ콺');
insert into Brand(brandCode ,brandName) 
values('B','�̴Ͻ�����');
insert into Brand(brandCode ,brandName) 
values('C','��ŲǪ��');
insert into Brand(brandCode ,brandName) 
values('D','�����̽���');
insert into Brand(brandCode ,brandName) 
values('E','�̻�');
insert into Brand(brandCode ,brandName) 
values('F','��ϸ�');
insert into Brand(brandCode ,brandName) 
values('G','����ó���ۺ�');
insert into Brand(brandCode ,brandName) 
values('H','��Ÿ');
insert into category(categoryCode,categoryName)
values('1','��Ų');
insert into category(categoryCode,categoryName)
values('2','�μ�');
insert into category(categoryCode,categoryName)
values('3','������');
insert into category(categoryCode,categoryName)
values('4','ũ��/��');
insert into category(categoryCode,categoryName)
values('5','����');
insert into category(categoryCode,categoryName)
values('6','�����');
insert into category(categoryCode,categoryName)
values('7','Ŭ��¡');
insert into category(categoryCode,categoryName)
values('8','����ũ��');
insert into category(categoryCode,categoryName)
values('9','���̺�ũ��');


insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rladkfma0208@naver.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rladkfma0208@gmail.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rladkfma0208@daum.net','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rladkfma0208@nate.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('8@naver.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('08@naver.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rl@naver.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('adkfma@naver.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('208@naver.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('0208@naver.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('rlad08@naver.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('adkfma0208@naver.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
insert into Member (email,name,age,gender,skinType,phone,zipcode,address1,address2,regStat)
values('r208@naver.com','��Ƹ�',23,'F','���ռ�','01050068435','00000','����','���굿','Y');
commit;


insert into chimi.Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('prod_A_2_0008','ǻ�� ���� �ٿ��� ���ϵ� �μ� SPF30/PA++','�����Ӿ��� ������ ������ �ڿܼ� ���ܱ���� ���ϸ� ���ϵ� �μ�!-�ڿܼ� ���� ��� ���ȭ���� �����Ʈ�� ȿ�� ��ġ ������ ������ ������ �ε巯�� ���������� ������ ������ ���� ȭ���ϰ� �Ǻθ� ����� �ִ� �ڿܼ� ���� ��� ��� ���ϵ� �μ�-�޸��� �Ǻθ� ���� �����ϰ�!',11500,'90ml','http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150430/1430383272682.jpg','2','A');
insert into chimi.Product(productCode,productName,productDesc,price,capacity,image,categoryCode,brandCode)
values('','','',,'','','2','A');

"prod_A_2_0006","��ũ ���� ���� ������","����� ���� �ε巴�� �Ǻθ� ���� Ǫ���ϰ� ��ģ �Ǻθ� �Ų����� ���پ� �ִ� �������� ���� ������- ��ũ ������ ���Ϳ� ��Ÿ�� A/C/E �� ������ �ε巯�� ��Ű ���ķ��� �ε巴�� �Ǻο� ����Ǿ� �����ϰ� ��ĥ���� �Ǻθ� ��ũ�� ���� ��ġ�� �Ǻη� ���پ� �ִ� ���� ���� ���� �������Դϴ�.- ��ũ ������ ���� 68.86% ����",13000,	"180ml"	,"http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160302/1456886498278.jpg","2","A"
prod_A_2_0007	��� ȭ��Ʈ C ����� ������	- ������ �׻�ȭ ȿ���� ���� C ��� ���Ϳ� �����ϰ� ������ ä��� �̳׶� ��� ���Ͱ� �����Ǿ� ������ ���� ������ �Ǻη� ���ٴ� ��Ÿ�� ȭ��Ʈ�� ������ �Դϴ�.- �ε巴�� ������ ��ũ Ÿ������ �Ǻθ� ȯ�ϰ� ���ٴ� ���ÿ� �游�� ���а��� �����մϴ�.- ������ ����Ǿ� �Ǻο� ����ϰ� ���� �������� ���������� �������� �ݴϴ�.	18000	180ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160202/1454392610858.jpg	2	A
prod_A_2_0008	ǻ�� ���� �ٿ��� ���ϵ� �μ� SPF30/PA++	�����Ӿ��� ������ ������ �ڿܼ� ���ܱ���� ���ϸ� ���ϵ� �μ�!-�ڿܼ� ���� ��� ���ȭ���� �����Ʈ�� ȿ�� ��ġ ������ ������ ������ �ε巯�� ���������� ������ ������ ���� ȭ���ϰ� �Ǻθ� ����� �ִ� �ڿܼ� ���� ��� ��� ���ϵ� �μ�-�޸��� �Ǻθ� ���� �����ϰ�!	11500	90ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150430/1430383272682.jpg	2	A
prod_A_2_0009	���а��� �ݶ�� �μ�	������ �ؽ���" �׷��� ���� ���а� ź���� �������ִ� ��Ű �μ�. ������ �ִ� �ʱ��ʱ��� ���� ����� �Ǻθ� �ε巴�� �����ֵ� ź�°��� �ο����ָ�" �ٿ��� ���� ���⹰�� �ݶ���� ���յǾ� ��Ų�ɾ� ù�ܰ���� ������ ������ �ο����ݴϴ�. �Ϲ� ��Ų�� �޸�" ���а��� �ݶ�� ��Ų�� �������� ���Ͽ� ��Ų ����� �����ϰ� ���¸� �����ϴ� ������.	12000	180ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401947638533.jpg	2	A
prod_A_2_0010	�������� Ŭ��� ������	����ϰ� ������ ������ �������Ǿ� ��Ʈ���� ����� �������ִ� ������ ���� ��� ������-����������: �ʻ�������� ź���� �����ʰ� �����Ǿ� ����� ����� �ذ����ִ� ��� ��Ʈ�� �ַ�� ��ǰ�Դϴ�-����ϰ� ������: �Ǻο� ����ϰ� ������ ������ �������Ǿ� ��Ʈ���� ����� �������ݴϴ�-��꼺 pH ��� �ɾ�: ��꼺 pH ��� �ɾ�� �Ʊ� �Ǻ�ó�� �ε巴�� �ɾ����ָ� PH�뷱���� ���ߴµ� ������ �ݴϴ�	11999	150ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150506/1430882549156.jpg	2	A
prod_A_2_0011	ǻ�� ���� �ٿ��� ���̽�ó������	������� �� ������ ������ ������ ä�� �ִ� ������ ���̽�ó�������޸��� �Ǻθ� ���� �����ϰ�!- ���� �������� ���� �ٿ��� ���Ϳ� Ź���� ��ȭ�ɷ��� ���� �𸵰� ������ �����Ǿ�" �޸��� �Ǻο� ���� ������ ������ ������ ä���ִ� ���̽�ó�������Դϴ�.���麸�� �Ų����� ���� �Ǻ�!- ��ġ ������� �� ������ ������ �ε巯�� ���������� ������ ����Ǿ�" ��ĥ �� �����̴� ���а��� ���麸�� �Ų����� �Ǻΰ��� ���� ���� �Ǻθ� ������ݴϴ�.	10500	180ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140807/1407477366730.jpg	2	A
prod_A_2_0012	ACŬ���� ���ϸ� �� �μ�	�Ǻ� ��� �ֱ� ���� ���ϸ���~������ ���� �μ�. ���뼺 ���� ������ �ٷ� �����Ǿ� ���а��� �������� �ٿ��ְ�" ������ ������ ä���ִ� ������ �뷱�� �� �μ��Դϴ�. �츮�ǻ�� Ư�� ��� ������ ��鳪�� ���⹰ ���� ������ �����Ǿ� �ְ� ������ �ÿ��� �߸������� �Ǻο� �δ���� ����ϰ� �����ϰ� ������ ���ݴϴ�.	9500	150ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401949398129.jpg	2	A
prod_A_2_0013	��Ų���� ������	�ε巯�� �ؽ����� �Ǻ� ����" ��ȣ ���̽��Ķ�����. ��Ų ������ � ��Ų���� �� �������� �ؽ��ķ�" ������ Ȥ�� ũ���� �ٸ� �� ����" ��ȣȿ���� Ź���մϴ�. �ٹټ� ���� ���⹰�� ������ �Ǻ� ������ �̲������� �ε巴�� ������" ����Ÿ� ���� Ź���� �������� ��Ÿ���ϴ�. 5 free �Ķ�" �ΰ�����" �������" ������ ����" ������ free.	12000	200ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401950562365.jpg	2	A
prod_A_2_0014	���簡�� �þ���� ������ ������	�������� ���� ���� + �μ��� �Ǻ� ��ȣ ȿ��! �Ű��� ���̽�ó������. ����� ������ ���� �������ִ� �������� ��"���� �뷱���� �����ִ� �μ��� ���յ� ������ ���� �� ���� ���̽��Ķ�����. �������� ����� �þ���Ϳ� ���� ������ �ڻ��Ͽ� ������ ������ Ŭ���� ���� ������ ������ �ſ� ������ �Ǻθ� �����ϰ� �����ְ� ���پ��ݴϴ�. ����ũ�� �ܰ�� �����ְ� �Ų��� �Ǻθ� ǥ�����ݴϴ�.	18000	60ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401962947211.jpg	2	A
prod_A_2_0015	�޸��÷��� ���� ������	�ٸ��� ���� �����ϰ� ����ϰ� �����Ǵ� �ε巯�� ������ ������- �������� �������� ä�� �Ǻ� ��ȣ�� ����: �Ǻο� �������� �������� ä�� �Ǻ� ��ȣ���� �����Ͽ��� �Ӹ� �ƴ϶� ��ĥ���� �Ǻΰ��� �����ϰ� �����ݴϴ�.- ������ ���� ������ 72% ����: Ź���� ����ȿ�� �Ӹ� �ƴ϶� �Ǻ��庮��ȭ ȿ���� ����� �������κ��� �� ������ ���� ������- �ָ����� + �̹� ���� ��ɼ�: ĢĢ�ϰ� �������� �Ǻθ� ȯ�ϰ� źź�ϰ� �������ִ� �̹� �� �ָ����� ���� ��ɼ� ��ǰ�Դϴ�.	28000	120ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20141103/1414997728814.jpg	2	A
prod_A_2_0016	����ũ20 ������ ������	�������� ���� ������ ���� ����� ���� ��ġ�� �ؽ����� �������� �޸��� �Ǻο� ���� ������ ������ ������ �־�" �������� źź�� �ǰ��� �Ǻη� �����ݴϴ�. �Ǻΰ��� ���� �ε巴�� �Ų����� �����鼭 �Ǻο� ǳ���� �������� �����ϰ� ������ ���� �����ϰ� ������ �˴ϴ�.	16000	140ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401963876878.jpg	2	A
prod_A_2_0017	���� ��ä ���ζ� ������ �μ�	�̼��� Ÿ��Ƽ �����ֿ� ���ζ� ���ڰ� ������ ���� ���ζ� ��ä ������ �����Ǿ�" �Ǻ� ���̻��̸� �����ϰ� �����ϰ� ä�� ������ ��ä�� �ο��Ͽ� �ִ� ���ϸ� �������Դϴ�. �ٸ��� ��� �ε巯�� ���� ���⸷�� �Ǻθ� ���ΰ�" ǳ���� ���а��� �е����� ź�� �ο��� ũ������ �Ĳ��ϰ� �ٸ� �� �������� �����ϰ� �Ų��ϰ� ������ �Ǻη� ����� �ݴϴ�.	12000	100ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401960315164.jpg	2	A
prod_A_3_0009	�� �� �ַ�� �� �� ����ũ �ʸ� ŰƮ	���� ��! �Ų� �ʸ� 3���� ŰƮ- calming-energy ���� ���� �ʱؼ��� ��Ʈ- ������ ���� ��Ʈ�� ǫ �� �� �Ǻ� ����� ȸ��- 16������ ���� ��η� ������ ���� ��Ŀ���� Ȱ��ȭ*�������� �ʸ� ���� ����ũ�� �������� ��ϵǾ����ϴ�.	3900	4ml+2ml+25ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20170125/1485325237297.png	3	A
prod_A_3_0010	���а��� �ݶ�� ������	* 2015�� ������ �� ��ǰ�Դϴ� *��� ȯ�濡���� ���а� ź���� �����ִ� ����� ������. �Ǻ� ���� ������ ���������� �ʵ��� �ۿ��ϴ� �����̵� ĸ���� �ٷ� �����Ͽ� ������ ���и��� ������ �ݴϴ�. �Ǻ������� �̲������� �ε巴�� ������ �����ϰ� ź���ִ� ���������� �ο��� �ݴϴ�.	15000	45ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20150901/1441103224814.jpg	3	A
prod_A_3_0011	��Ÿ�̵� ���� �� ����	Firming Up! Tightening Up! Brightening Up! ���� ���� ������ �� �ִ� ź��" ������ Ÿ��Ʈ�� ȿ���� �ð��� ȯ������ ��ȭ�� �Ǻ��� ���̳ʽ� ������ ����־� źź�� ź���Ǻη� ���پ��ִ� 3 in 1 ���ɾ� ����* �¶��� ���� ��ǰ�Դϴ�.	38000	70ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20180510/1525934832559.png	3	A
prod_A_3_0012	�������� ������ �Ų�������	�Ų��� �Ǻη� �ɾ����ִ� �Ǹ��� Free ������-�Ǻο� �δ���� �Ų����� �Ǻη� ���پ� �ִ� �Ǹ��� ���� ������-�����й뷱���ɾ�� �����Ծ��� �������� �Ǻ�-3���� ���� ��÷�� : �Ǹ���" ����������" Ÿ������	12000	40ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20160516/1463388970988.PNG	3	A
prod_A_3_0013	���а��� �˷ο� �۽�Ʈ ������	���� �� �Ǻΰ� �񸶸� �� ���� ���� ����ϴ� ù��° ��������" ����� �˷ο��� 86.9%�� �����Ǿ� �Ǻο� ���� ȿ���� �Բ� ������ ǳ���� �����Ͽ� Ǫ���� �Ǻο� �����԰� �ǰ����� �ο����ݴϴ�. ������"�Ķ�"��ũ free. ����� �˷ο� 86.9% ����.	15000	100ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401957003581.jpg	3	A
prod_A_3_0014	0�� �̳׶� ����	���� ���� 0�� ���� �ν��� ȿ���� �ִ� ��õ�� �̽�Ʈ ����. ���� ������ �����ϰ� ������ �Ǻο� ���� ���� �������� �Ǻθ� �ǰ��ϰ� �ν��� ���� �ִ� �̽�Ʈ Ÿ���� 0�� �����Դϴ�. �Ǻ� ������ ���� ���޿� ȿ������ ���� �̳׶� ��õ���� �Ǻ� �ʼ� ���е��� �ٷ����� �����Ǿ�" ���麸�� �Ų��ϰ� �Ǻο� ������ �Ǻ� ������ ���� Ű�� �ݴϴ�.	14000	160ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140604/1401956865136.jpg	3	A
prod_A_3_0015	���а��� �ݶ�� �����ʷ�	���˷�λ��� �ݶ���� ���ΰ� �ִ� ������ ����ũ�� �ݶ�� ���Ʒ�ĸ���� �Ǻο� ���޵Ǿ� �ٿ��� ���͸� ������ �Ǻο� ������ ������ ä�� �ݴϴ�. �ٿ��� ������ ���װ� ���˷�λ��� �Ǻ� �� ���̻��̸� ��ƴ���� �����ϰ� �������ڸ� �ٿ��ִ� ������ �� �Ǻ� ���� ���� �����ϰ� �ɾ����ݴϴ�. �ٿ��� ���װ� ����ũ�� �ݶ�� ���Ʒ�ĸ���� �Ǻμӿ��� �����ϰ� ���� �Ǻ��� �������� �ٽ����ְ� Ǫ��Ǫ���ϰ� ������ �Ǻο� �ڿ������� ����ȿ���� �ο����ݴϴ�.	18000	50ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401958090434.jpg	3	A
prod_A_3_0016	����ũ20 �ν��� ������	������ ź���� ������ ä���ִ� ù �ܰ� ������ ����. ����" ������" ����" �ؽ��� �µ��� ������ ������ �Ǻ� �庮�� ��ȭ���� �ʱ� ��ȭ�� ��ȭ�� �ִ� �� Ÿ���� �ν��� ���� �������Դϴ�. ������ ����� ���� ���� �������� ���� ���Ϸ� ���� ������ ���� �Ų����� �Ǻο� �����Ǿ�" �Ǻ� ������ ź���� �ο��ϰ� ���� ������ ���� ���� �Ų��ϰ� ���� �帣�� �Ǻΰ��� ����� �ݴϴ�.	16000	100ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401963460537.jpg	3	A
prod_A_3_0017	��Ż����������� �ξ� ������	��Ƽ����¡���ش�" �ǰ��� ��ȿ�� �����ϴ� �Ǻ��� ��. �þ����� �˵��� �ؽ�ó�� �Ǻ� ������ ���� �� ź�� ���� ���� ��ɼ� ��Ż������. ������ �ڻ� �Ĺ� �Ӹ𸣶� �ö�� ���⹰�� �ξ������� ���� ��ȿ ���÷����� ���ճ����� ���⹰" ���˷�λ��� �����Ǿ��Ǻο� ź�°� ������ �����ϰ�" ������ ��Ʈ������ �Ǻΰ��� �����ϰ� �Ų��ϰ� ���־� �ǰ��ϰ� �����ִ� �Ǻη� ���پ� �ݴϴ�.	22000	45ml	http://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/20140605/1401959126192.JPG	3	A

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
values('�ɳ�','hifgadgaergerger');
commit;


 select count(*) 
        from faq    
        where title like concat('%',concat('��','%'));

-------------------------------------------------------------------------
--1:1���� �ڵ� qna_yyyymmdd_seq
--���� ������ seq refdata�� ��¥��
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180101_0001','Ÿ��Ʋ','����','2018-01-01','Y','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180101_0002','Ÿ��Ʋ','����','2018-01-01','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180101_0003','Ÿ��Ʋ','����','2018-01-01','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180101_0004','Ÿ��Ʋ','����','2018-01-01','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180101_0005','Ÿ��Ʋ','����','2018-01-01','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0001','Ÿ��Ʋ','����','2018-01-02','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0002','Ÿ��Ʋ','����','2018-01-02','Y','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0003','Ÿ��Ʋ','����','2018-01-02','N','rladkfma0208@naver.com');
--
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0004','Ÿ��Ʋ','����','2018-01-02','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0005','Ÿ��Ʋ','����','2018-01-02','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0006','Ÿ��Ʋ','����','2018-01-02','Y','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0007','Ÿ��Ʋ','����','2018-01-02','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0008','Ÿ��Ʋ','����','2018-01-02','N','rladkfma0208@naver.com');
insert into onetoone value(qnano,title,content,refdate,replstat,email)
values('qna_20180102_0009','Ÿ��Ʋ','����','2018-01-02','N','rladkfma0208@naver.com');

commit;
truncate table onetoone;
---------------------------
select count(*) from onetoone;
--
select max(qnano) from onetoone;
--insert�� ������ qnano�� ã�� ���ð� ���� ������ �� �� ���� ���̸� seq+1��
--���ð� ���� ���� �ƴϸ� ������ seq���۰�
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



