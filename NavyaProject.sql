--DATABASE

CREATE DATABASE orderdb;

--DDL

-- Table: Tbl_cloth
CREATE TABLE Tbl_cloth (
    Cloth_id int NOT NULL,
    Cloth_name varchar(125) NOT NULL,
    Cloth_type varchar(75) NOT NULL,
    Cloth_vendorname varchar(125) NOT NULL,
    Cloth_make varchar(75) NOT NULL,
    CONSTRAINT Tbl_cloth_pk PRIMARY KEY (Cloth_id)
);

-- Table: Tbl_dispatch
CREATE TABLE Tbl_dispatch (
    Dispatch_id int NOT NULL,
    Dispatch_datetime datetime NOT NULL,
    Dispatch_invoicenumber bigint NOT NULL,
    Order_id int NOT NULL,
    Cloth_id int NOT NULL,
    CONSTRAINT Tbl_dispatch_pk PRIMARY KEY (Dispatch_id)
);

-- Table: Tbl_dispatchlocation
CREATE TABLE Tbl_dispatchlocation (
    Location_id int NOT NULL,
    Address varchar(500) NOT NULL,
    City varchar(50) NOT NULL,
    State varchar(50) NOT NULL,
    Zipcode char(10) NOT NULL,
    Dispatch_id int NOT NULL,
    CONSTRAINT Tbl_dispatchlocation_pk PRIMARY KEY (Location_id)
);

-- Table: Tbl_order
CREATE TABLE Tbl_order (
    Order_id int NOT NULL,
    Location_id int NOT NULL,
    quantity float(5,2) NOT NULL,
    orderprice float(5,2) NOT NULL,
    invoicenumber bigint NOT NULL,
    Is_discounted bit NOT NULL,
    Cloth_id int NOT NULL,
    CONSTRAINT Tbl_order_pk PRIMARY KEY (Order_id)
);

-- Table: Tbl_warehouse
CREATE TABLE Tbl_warehouse ( 
    Warehouse_id int NOT NULL,
    Warehouse_name varchar(125) NOT NULL,
    Warehouse_region varchar(100) NOT NULL,
    Location_id int NOT NULL,
    CONSTRAINT Tbl_warehouse_pk PRIMARY KEY (Warehouse_id)
);

-- foreign keys
-- Reference: Tbl_dispatch_Tbl_cloth (table: Tbl_dispatch)
ALTER TABLE Tbl_dispatch ADD CONSTRAINT Tbl_dispatch_Tbl_cloth FOREIGN KEY Tbl_dispatch_Tbl_cloth (Cloth_id)
    REFERENCES Tbl_cloth (Cloth_id);

-- Reference: Tbl_dispatchlocation_Tbl_dispatch (table: Tbl_dispatchlocation)
ALTER TABLE Tbl_dispatchlocation ADD CONSTRAINT Tbl_dispatchlocation_Tbl_dispatch FOREIGN KEY Tbl_dispatchlocation_Tbl_dispatch (Dispatch_id)
    REFERENCES Tbl_dispatch (Dispatch_id);

-- Reference: Tbl_order_Tbl_cloth (table: Tbl_order)
ALTER TABLE Tbl_order ADD CONSTRAINT Tbl_order_Tbl_cloth FOREIGN KEY Tbl_order_Tbl_cloth (Cloth_id)
    REFERENCES Tbl_cloth (Cloth_id);

-- Reference: Tbl_warehouse_Tbl_dispatchlocation (table: Tbl_warehouse)
ALTER TABLE Tbl_warehouse ADD CONSTRAINT Tbl_warehouse_Tbl_dispatchlocation FOREIGN KEY Tbl_warehouse_Tbl_dispatchlocation (Location_id)
    REFERENCES Tbl_dispatchlocation (Location_id);


---DML

Insert into tbl_cloth (cloth_id,cloth_name,cloth_type,cloth_vendorname,cloth_make) values (1,'Cotton','lightthin','scotch','plaid');
Insert into tbl_cloth (cloth_id,cloth_name,cloth_type,cloth_vendorname,cloth_make) values (2,'Silk','twill','satin','doublegauze');
Insert into tbl_cloth (cloth_id,cloth_name,cloth_type,cloth_vendorname,cloth_make)values (3,'Cotton','quiltingcotton','melly','geometric');
Insert into tbl_cloth (cloth_id,cloth_name,cloth_type,cloth_vendorname,cloth_make)values (4,'Rayon','challis','woven','flowy');
Insert into tbl_cloth (cloth_id,cloth_name,cloth_type,cloth_vendorname,cloth_make)values (5,'Crepe','polyster','sheer','l ining');

INSERT into tbl_order(Order_id,Location_id,quantity,orderprice,invoicenumber,Is_discounted,Cloth_id)values (1,1,'11.00','14.75','0006218',1,1);
INSERT into tbl_order(Order_id,Location_id,quantity,orderprice,invoicenumber,Is_discounted,Cloth_id)values (2,2,'6.50','11.85','0006578',0,2);
INSERT into tbl_order(Order_id,Location_id,quantity,orderprice,invoicenumber,Is_discounted,Cloth_id)values (3,3,'6.50','16.75','0008965',1,3);
INSERT into tbl_order(Order_id,Location_id,quantity,orderprice,invoicenumber,Is_discounted,Cloth_id)values (4,4,'7.00','12.75','0006790',0,4);
INSERT into tbl_order(Order_id,Location_id,quantity,orderprice,invoicenumber,Is_discounted,Cloth_id)values (5,5,'13.00','2.75','0002390',1,1);

INSERT into tbl_dispatch (Dispatch_id,Dispatch_datetime,dispatch_invoicenumber,Cloth_id,Order_id) values (1,NOW(),3456,1,1);
INSERT into tbl_dispatch (Dispatch_id,Dispatch_datetime,dispatch_invoicenumber,Cloth_id,Order_id) values (2,NOW(),6578,2,2);
INSERT into tbl_dispatch (Dispatch_id,Dispatch_datetime,dispatch_invoicenumber,Cloth_id,Order_id) values (3,NOW(),8965,3,3);
INSERT into tbl_dispatch (Dispatch_id,Dispatch_datetime,dispatch_invoicenumber,Cloth_id,Order_id) values (4,NOW(),6790,4,4);
INSERT into tbl_dispatch (Dispatch_id,Dispatch_datetime,dispatch_invoicenumber,Cloth_id,Order_id) values (5,NOW(),2390,1,5);


INSERT into tbl_dispatchlocation(location_id,Address,city,state,zipcode,Dispatch_id) values (1,'45 commom drive','Richmond','VA','23173',1);
INSERT into tbl_dispatchlocation(location_id,Address,city,state,zipcode,Dispatch_id) values (2,'2110 holly hall','Portland','OR','97009',2);
INSERT into tbl_dispatchlocation(location_id,Address,city,state,zipcode,Dispatch_id) values (3,'1800 elpaso','SanAntonio','TX','78201',3);
INSERT into tbl_dispatchlocation(location_id,Address,city,state,zipcode,Dispatch_id) values (4,'96 islin drive','Lancaster','PA','93534',4);
INSERT into tbl_dispatchlocation(location_id,Address,city,state,zipcode,Dispatch_id) values (5,'780 correja ave','Columbus','IN','43004',5);


INSERT into tbl_warehouse(warehouse_id,warehouse_name,warehouse_region,location_id)values (1,'Bulk Supply','Richmond,VA',1);
INSERT into tbl_warehouse(warehouse_id,warehouse_name,warehouse_region,location_id)values (2,'Strict Supply','Portland,OR',2);
INSERT into tbl_warehouse(warehouse_id,warehouse_name,warehouse_region,location_id)values (3,'Store Supply','SanAntonio,TX',3);
INSERT into tbl_warehouse(warehouse_id,warehouse_name,warehouse_region,location_id)values (4,'Grateful Goods','Lancaster,PA',4);
INSERT into tbl_warehouse(warehouse_id,warehouse_name,warehouse_region,location_id)values (5,'Happy Wholesale','Columbus,IN',5);

--DML

UPDATE tbl_warehouse set location_id = 2 where warehouse_name = 'strict supply';
UPDATE tbl_dispatchlocation set city = 'Baltimore' , state = 'MD' where location_id = 1;


--DELETE 
DELETE FROM tbl_warehouse where warehouse_id = 5;

--JOIN 

Select dl.location_id,o.quantity,o.orderprice,w.warehouse_name
from tbl_order o
join tbl_dispatchlocation dl on dl.location_id = o.location_id
join tbl_warehouse w on w.location_id = dl.location_id
where o.Is_discounted = 1;

--QUERY OF MY CHOICE

SELECT IF(quantity>0,quantity*orderprice,0) as 'PRICE IN $' from tbl_order;


--INDEX

CREATE INDEX idx_tlprice on tbl_order(quantity,orderprice);
CREATE INDEX idx_disdtls on tbl_warehouse(warehouse_name);
CREATE INDEX idx_vedtls on tbl_cloth(Cloth_vendorname);


--VIEW

CREATE VIEW odmv_orderdeatils AS
SELECT cl.cloth_vendorname,
       cl.Cloth_make,
       IF(o.quantity>0,o.quantity*o.orderprice,0) as 'PRICE IN $',
       d.Dispatch_datetime,
       dlo.Address,
       dlo.City,
       dlo.State,
       dlo.Zipcode,
       w.Warehouse_name
from tbl_cloth cl
join tbl_order o on cl.cloth_id = o.cloth_id
join tbl_dispatch d on cl.cloth_id= d.cloth_id
join tbl_dispatchlocation dlo on d.Dispatch_id = dlo.Dispatch_id
join tbl_warehouse w on dlo.location_id = w.location_id
order by cl.cloth_id asc; 


Select * from  odmv_orderdeatils where Dispatch_datetime <= NOW();

--FUNCTION/STOREPROC

DELIMITER $$

CREATE PROCEDURE GetOrderDiscount(
    IN  inorder_id INT, 
    OUT outapplydiscount  VARCHAR(100))
BEGIN
    DECLARE PRICE FLOAT(10,2) DEFAULT 0;

    SELECT IF(quantity>0,quantity*orderprice,0) 
    INTO PRICE
    FROM tbl_order
    WHERE Order_id = inorder_id
    AND Is_discounted = 0;

    IF PRICE > 100 THEN
        SET outapplydiscount = 'APPLY DISCOUNT';
    END IF;
END$$

DELIMITER ;

--STOREPROC CALL
CALL GetOrderDiscount(2,@outapplydiscount);
SELECT @outapplydiscount;


--SECURITY


--PYTHON USER

CREATE USER 'pyeuser'@'%' IDENTIFIED BY 'p@@ss!23';
GRANT SELECT, INSERT, UPDATE ,DELETE on orderdb.* TO 'pyeuser'@'%';
FLUSH PRIVILEGES;

--SERVICE USER

CREATE USER 'orderseviceusers'@'%' IDENTIFIED BY '0rDerUser';
GRANT SELECT  on orderdb.* TO 'orderseviceusers'@'%';
FLUSH PRIVILEGES;

--APP USER

CREATE USER 'orderdeveusers'@'%' IDENTIFIED BY 'DevUser';
GRANT SELECT  on orderdb.* TO 'orderdeveusers'@'%';
FLUSH PRIVILEGES;



--PYTHON CODE

--Order.py




