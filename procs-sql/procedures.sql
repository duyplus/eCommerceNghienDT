use eCommerceNghienDT;

# NumberOfProductSoldPerYear
DELIMITER  //
DROP PROCEDURE IF EXISTS productSalesByYear//
CREATE PROCEDURE productSalesByYear(IN year SMALLINT)
BEGIN
    SELECT p.name, SUM(dt.quantity) AS sales, year AS year
    FROM PRODUCTS p
             JOIN order_details dt ON p.id = dt.product_id
             JOIN orders o ON dt.order_id = o.id
    WHERE YEAR(o.created_at) = year
    GROUP BY p.id, p.name, year
    ORDER BY sales DESC;
END //

CALL productSalesByYear(2022);

# productSoldByShop
DELIMITER  //
DROP PROCEDURE IF EXISTS productSalesByShop//
CREATE PROCEDURE productSalesByShop(IN shop_id BIGINT)
BEGIN
    SELECT p.name,
           p.image,
           SUM(od.quantity) AS sales
    FROM products p
             RIGHT JOIN users u ON u.id = p.user_id
             JOIN order_details od ON p.id = od.product_id
    WHERE u.id = shop_id
    GROUP BY p.name, p.image, u.fullname
    ORDER BY sales DESC;
END //

CALL productSalesByShop(14);

