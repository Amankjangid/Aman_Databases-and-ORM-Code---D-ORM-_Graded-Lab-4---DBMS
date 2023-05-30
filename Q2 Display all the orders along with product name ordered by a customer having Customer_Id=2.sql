select o.ord_id,o.ord_amount,o.ord_date,o.cus_id,o.pricing_id,sp_p.pro_name from `order` as o inner join
(select sp.pricing_id,p.* from product p 
inner join supplier_pricing sp
on p.pro_id=sp.pro_id) as sp_p
on o.pricing_id=sp_p.pricing_id where o.cus_id='2';