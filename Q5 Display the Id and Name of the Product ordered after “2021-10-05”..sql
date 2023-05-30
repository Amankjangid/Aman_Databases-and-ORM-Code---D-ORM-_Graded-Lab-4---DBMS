select p.pro_name,p.pro_id from product p where pro_id in (
select sp.pro_id from `order` o
inner join
supplier_pricing sp
on o.pricing_id = sp.pricing_id where ord_date>='2021-10-05');