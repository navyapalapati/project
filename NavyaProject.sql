


ALTER TABLE tbl_dispatch 
DROP CONSTRAINT tbl_dispatch_tbl_order ;




Insert into tbl_clothes (cloth_id,cloth_name,cloth_type,cloth_vendorname,cloth_make) values (1,'Cotton','lightthin','scotch','plaid');
Insert into tbl_clothes (cloth_id,cloth_name,cloth_type,cloth_vendorname,cloth_make) values (2,'Silk','twill','satin','doublegauze');
Insert into tbl_clothes (cloth_id,cloth_name,cloth_type,cloth_vendorname,cloth_make)values (3,'Cotton','quiltingcotton','melly','geometric');
Insert into tbl_clothes (cloth_id,cloth_name,cloth_type,cloth_vendorname,cloth_make)values (4,'Rayon','challis','woven','flowy');
Insert into tbl_clothes (cloth_id,cloth_name,cloth_type,cloth_vendorname,cloth_make)values (5,'Crepe','polyster','sheer','lining');

INSERT into tbl_dispatches (dispatch_id,cloth_id,dispatch_datetime,dispatch_invoicenumber,order_invoicenumberr) values (1,1,NOW(),3456,2457);
INSERT into tbl_dispatch (dispatch_id,cloth_id,dispatch_datetime,dispatch_invoicenumber,order_invoicenumberr) values (2,2,NOW(),4456,3457);
INSERT into tbl_dispatch (dispatch_id,cloth_id,dispatch_datetime,dispatch_invoicenumber,order_invoicenumberr) values (3,3,NOW(),5456,4457);
INSERT into tbl_dispatch (dispatch_id,cloth_id,dispatch_datetime,dispatch_invoicenumber,order_invoicenumberr) values (4,4,NOW(),6456,5457);
INSERT into tbl_dispatch (dispatch_id,cloth_id,dispatch_datetime,dispatch_invoicenumber,order_invoicenumberr)values (5,5,NOW(),7456,6457);


INSERT into tbl_dispatchlocation(location_id,dispatch_id,streetadrees,city,state,zipcode) values (1,1,'45 commom drive','Richmond','VA','23173');
INSERT into tbl_dispatchlocation(location_id,dispatch_id,streetadrees,city,state,zipcode) values (2,2,'2110 holly hall','Portland','OR','97009');
INSERT into tbl_dispatchlocation(location_id,dispatch_id,streetadrees,city,state,zipcode) values (3,3,'1800 elpaso','SanAntonio','TX','78201');
INSERT into tbl_dispatchlocation(location_id,dispatch_id,streetadrees,city,state,zipcode) values (4,4,'45 commom drive','Lancaster','PA','93534');
INSERT into tbl_dispatchlocation(location_id,dispatch_id,streetadrees,city,state,zipcode) values (5,5,'45 commom drive','Columbus','IN','43004');

INSERT into tbl_order(order_id,cloth_id,location_id,quantity,orderprice,invoicenumberr,is discounted)values (1,1,1,'4.5','5.5','2457',0);
INSERT into tbl_order(order_id,cloth_id,location_id,quantity,orderprice,invoicenumberr,is discounted)values (2,2,2,'8.5','2.4','3457',1);
INSERT into tbl_order(order_id,cloth_id,location_id,quantity,orderprice,invoicenumberr,is discounted)values (3,3,3,'12.5','4.5','4457',0);
INSERT into tbl_order(order_id,cloth_id,location_id,quantity,orderprice,invoicenumberr,is discounted)values (4,4,4,'14.5','6.7','5457',0);
INSERT into tbl_order(order_id,cloth_id,location_id,quantity,orderprice,invoicenumberr,is discounted)values (4,4,4,'14.5','6.7','5457',0)


INSERT into tbl_warehouse(warehouse_id,warehouse_name,location_id,warehouse_region)values (1,'Binsertulk Supply',1,'Richmond,VA');
INSERT into tbl_warehouse(warehouse_id,warehouse_name,location_id,warehouse_region)values (2,'Strict Supply',3,'Portland,OR');
INSERT into tbl_warehouse(warehouse_id,warehouse_name,location_id,warehouse_region)values (3,'Store Supply',2,'SanAntonio,TX');
INSERT into tbl_warehouse(warehouse_id,warehouse_name,location_id,warehouse_region)values (4,'Grateful Goods',4,'Lancaster,PA');
INSERT into tbl_warehouse(warehouse_id,warehouse_name,location_id,warehouse_region)values (5,'Happy Wholesale',5,'Columbus,IN');

--DDL

UPDATE tbl_warehouse set location_id = 2 where warehouse_name = 'strict supply';
UPDATE tbl_dispatchlocation set city = 'Baltimore' and state = 'MD';


--DELETE 
DELETE FROM tbl_warehouse where warehouse_id = 5;

--JOIN 

Select dl.location_id,o.quantity,o.orderprice,w.warehouse_name
from tbl_order o
join tbl_dispatchlocation dl on dl.location_id = o.location_id
join tbl_warehouse w on w.location_id = dl.location_id
where o.is discount=1 

CREATE USER 'pyuser'@'%' IDENTIFIED BY 'p@@ss!23';
GRANT SELECT, INSERT, UPDATE ,DELETE on CustomerOrder* TO 'pyuser'@'%';

