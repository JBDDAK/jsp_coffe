CREATE TABLE TBL_PIZZA_01 (
    pcode char(4) NOT NULL, PRIMARY KEY,
    pname varchar2(30),
    cost number(7)
);

CREATE TABLE TBL_SHOP_01 (
    scode char(4) NOT NULL, PRIMARY KEY,
    sname varchar2(20),
);

CREATE TABLE TBL_SALELIST_01 (
    saleno number(7) NOT NULL, PRIMARY KEY,
    scode char(4) NOT NULL,
    saledate date,
    pcode char(4) NOT NULL,
    amount number(5)
);

INSERT INTO TBL_PIZZA_01 VALUES('AA01','고르곤졸라피자','6000')
INSERT INTO TBL_PIZZA_01 VALUES('AA02','치즈피자','6500')
INSERT INTO TBL_PIZZA_01 VALUES('AA03','페퍼로니피자','7000')
INSERT INTO TBL_PIZZA_01 VALUES('AA04','콤비네이션피자','7500')
INSERT INTO TBL_PIZZA_01 VALUES('AA05','고구마피자','6000')
INSERT INTO TBL_PIZZA_01 VALUES('AA06','포테이토피자','7000')
INSERT INTO TBL_PIZZA_01 VALUES('AA07','불고기피자','8000')
INSERT INTO TBL_PIZZA_01 VALUES('AA08','나폴리피자','8000')

INSERT INTO TBL_SHOP_01 VALUES('S001','강남점')
INSERT INTO TBL_SHOP_01 VALUES('S002','강서점')
INSERT INTO TBL_SHOP_01 VALUES('S003','강동점')
INSERT INTO TBL_SHOP_01 VALUES('S004','영동점')
INSERT INTO TBL_SHOP_01 VALUES('S005','시청점')
INSERT INTO TBL_SHOP_01 VALUES('S006','인천점')

INSERT INTO TBL_SALELIST_01 VALUES('100001','S001','2018-12-02','AA01','50')
INSERT INTO TBL_SALELIST_01 VALUES('100002','S001','2018-12-02','AA02','30')
INSERT INTO TBL_SALELIST_01 VALUES('100003','S001','2018-12-02','AA03','20')
INSERT INTO TBL_SALELIST_01 VALUES('100004','S001','2018-12-02','AA04','50')
INSERT INTO TBL_SALELIST_01 VALUES('100005','S003','2018-12-03','AA01','40')
INSERT INTO TBL_SALELIST_01 VALUES('100006','S003','2018-12-03','AA02','60')
INSERT INTO TBL_SALELIST_01 VALUES('100007','S003','2018-12-03','AA04','60')
INSERT INTO TBL_SALELIST_01 VALUES('100008','S003','2018-12-04','AA05','70')
INSERT INTO TBL_SALELIST_01 VALUES('100009','S005','2018-12-02','AA01','80')
INSERT INTO TBL_SALELIST_01 VALUES('100010','S005','2018-12-02','AA03','30')
INSERT INTO TBL_SALELIST_01 VALUES('100011','S005','2018-12-02','AA04','40')
INSERT INTO TBL_SALELIST_01 VALUES('100012','S005','2018-12-02','AA05','50')
INSERT INTO TBL_SALELIST_01 VALUES('100013','S004','2018-12-04','AA01','30')
INSERT INTO TBL_SALELIST_01 VALUES('100014','S004','2018-12-04','AA02','20')
INSERT INTO TBL_SALELIST_01 VALUES('100015','S004','2018-12-04','AA06','50')

select salelist.saleno, shop.scode || '-' || shop.sname, salelist.saledate, salelist.pcode, pizza.pname,salelist.amount, salelist.amount * pizza.cost from tbl_pizza_01 PIZZA, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST
WHERE shop.scode = salelist.scode
and salelist.pcode = pizza.pcode
order by shop.sname, pizza.pcode

select shop.scode, shop.sname, sum(salelist.amount*pizza.cost) from tbl_pizza_01 PIZZA, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST
WHERE shop.scode = salelist.scode
and salelist.pcode = pizza.pcode
group by shop.scode, shop.sname 
order by shop.scode

select pizza.pcode, pizza.pname, sum(salelist.amount*pizza.cost) from tbl_pizza_01 PIZZA, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST
WHERE shop.scode = salelist.scode
and salelist.pcode = pizza.pcode
group by pizza.pcode, pizza.pname
order by sum(salelist.amount*pizza.cost) desc

-- 

CREATE TABLE tbl_product_01 (
    pcode varchar2(10) NOT NULL PRIMARY KEY,
    name varchar2(20),
    cost number(10)
);

CREATE TABLE tbl_shop_01 (
    scode varchar2(10) NOT NULL PRIMARY KEY,
    sname varchar2(20),
);

CREATE TABLE tbl_salelist_01 (
    saleno number(10) NOT NULL PRIMARY KEY,
    pcode varchar2(10) NOT NULL,
    saledate date,
    scode varchar2(10) NOT NULL,
    amount number(10)
);

INSERT INTO TBL_product_01 VALUES('AA01','아메리카노','3000');
INSERT INTO TBL_product_01 VALUES('AA02','에스프레소','3500');
INSERT INTO TBL_product_01 VALUES('AA03','카페라떼','4000');
INSERT INTO TBL_product_01 VALUES('AA04','카라멜마끼','4500');
INSERT INTO TBL_product_01 VALUES('AA05','카푸치노','5000');
INSERT INTO TBL_product_01 VALUES('AA06','초코롤케익','6000');
INSERT INTO TBL_product_01 VALUES('AA07','녹차롤케익','6500');
INSERT INTO TBL_product_01 VALUES('AA08','망고쥬스','7000');
INSERT INTO TBL_product_01 VALUES('AA09','핫초코','2500');

INSERT INTO TBL_shop_01 VALUES('S001','강남점');
INSERT INTO TBL_shop_01 VALUES('S002','강서점');
INSERT INTO TBL_shop_01 VALUES('S003','강동점');
INSERT INTO TBL_shop_01 VALUES('S004','강북점');
INSERT INTO TBL_shop_01 VALUES('S005','동대문점');
INSERT INTO TBL_shop_01 VALUES('S006','인천점');

INSERT INTO TBL_SALELIST_01 VALUES('100001','AA01','20180902','S001','50');
INSERT INTO TBL_SALELIST_01 VALUES('100002','AA03','20180902','S002','40');
INSERT INTO TBL_SALELIST_01 VALUES('100003','AA04','20180902','S002','20');
INSERT INTO TBL_SALELIST_01 VALUES('100004','AA04','20180902','S001','30');
INSERT INTO TBL_SALELIST_01 VALUES('100005','AA05','20180902','S004','40');
INSERT INTO TBL_SALELIST_01 VALUES('100006','AA03','20180902','S004','30');
INSERT INTO TBL_SALELIST_01 VALUES('100007','AA01','20180902','S003','40');
INSERT INTO TBL_SALELIST_01 VALUES('100008','AA04','20180902','S004','10');
INSERT INTO TBL_SALELIST_01 VALUES('100009','AA01','20180902','S003','20');
INSERT INTO TBL_SALELIST_01 VALUES('100010','AA05','20180902','S003','30');
INSERT INTO TBL_SALELIST_01 VALUES('100011','AA01','20180902','S001','40');
INSERT INTO TBL_SALELIST_01 VALUES('100012','AA03','20180902','S002','50');
INSERT INTO TBL_SALELIST_01 VALUES('100013','AA04','20180902','S002','50');
INSERT INTO TBL_SALELIST_01 VALUES('100014','AA05','20180902','S004','20');
INSERT INTO TBL_SALELIST_01 VALUES('100015','AA01','20180902','S003','30');


select salelist.saleno, salelist.pcode, salelist.saledate, salelist.scode, product.name, salelist.amount, salelist.amount * product.cost from tbl_product_01 PRODUCT, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST
WHERE salelist.pcode = product.pcode
AND shop.scode = salelist.scode

select product.pcode, product.name, sum(product.cost * salelist.amount) from tbl_product_01 PRODUCT, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST
WHERE salelist.pcode = product.pcode
AND shop.scode = salelist.scode
GROUP BY product.pcode, product.name

select shop.scode, shop.sname, sum(product.cost * salelist.amount) from tbl_product_01 PRODUCT, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST
WHERE salelist.pcode = product.pcode
AND shop.scode = salelist.scode
GROUP BY shop.scode, shop.sname
order by shop.scode