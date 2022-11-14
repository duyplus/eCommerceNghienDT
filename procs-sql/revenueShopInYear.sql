use eCommerceNghiENDT;

# ---  ----
DELIMITER //
DROP FUNCTION IF EXISTS revenueShop//
CREATE FUNCTION revenueShop(shop_id BIGINT, year SMALLINT)
    RETURNS BIGINT
    DETERMINISTIC
BEGIN
    DECLARE result BIGINT;
    SELECT SUM(od.price * od.quantity)
    FROM order_details od
             JOIN products p ON p.id = od.product_id
             JOIN orders o ON od.order_id = o.id
             JOIN users u ON p.user_id = u.id
    WHERE u.id = shop_id
      AND year(o.created_at) = year
    GROUP BY year
    INTO result;
    RETURN COALESCE(result, 0);
END //

# ---  ----
DELIMITER //
DROP PROCEDURE IF EXISTS revenueShopByYear//
CREATE PROCEDURE revenueShopByYear(IN shop_id BIGINT,IN year SMALLINT)
BEGIN
    SELECT id,
           fullname                   as full_name,
           year,
           revenueShop(shop_id, year) AS amount
    FROM users
    WHERE id = shop_id;
END //

# ---  ----
DELIMITER //
DROP PROCEDURE IF EXISTS revenueAllShopsByYear//
CREATE PROCEDURE revenueAllShopsByYear(year SMALLINT)
BEGIN
    SELECT id,
           fullname              as full_name,
           revenueShop(id, year) AS amount,
           year
    FROM users
    ORDER BY amount DESC;
END //

CALL revenueAllShopsByYear(2021);
CALL revenueShopByYear(13, 2021);