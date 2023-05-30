SELECT C.CAT_ID, P.PRO_NAME, SP.min_price
FROM Category C
INNER JOIN product P ON C.CAT_ID = P.CAT_ID
INNER JOIN (
    SELECT C.CAT_ID, MIN(SP.SUPP_PRICE) AS min_price
    FROM Category C
    INNER JOIN product P ON C.CAT_ID = P.CAT_ID
    INNER JOIN supplier_pricing SP ON P.PRO_ID = SP.PRO_ID
    GROUP BY C.CAT_ID
) AS SP ON C.CAT_ID = SP.CAT_ID AND P.PRO_ID = (
    SELECT P.PRO_ID
    FROM product P
    INNER JOIN supplier_pricing SP ON P.PRO_ID = SP.PRO_ID
    WHERE C.CAT_ID = P.CAT_ID
    ORDER BY SP.SUPP_PRICE ASC
    LIMIT 1
);