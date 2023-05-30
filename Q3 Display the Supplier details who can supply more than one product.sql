select * from supplier where supp_id in
(select supp_id from (
select supp_id,pro_count from (
select count(pro_id) as pro_count,supp_id from supplier_pricing group by supp_id) as merge_table where pro_count>1) as final_table);