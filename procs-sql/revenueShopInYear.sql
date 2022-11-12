use eCommerceNghiENDT;

DELIMITER //
DROP FUNCTION IF EXISTS revenueShopByYear//
CREATE FUNCTION revenueShopByYear(shop_id BIGINT, year SMALLINT)
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


DELIMITER //
DROP PROCEDURE IF EXISTS revenueShopByYear//
CREATE PROCEDURE revenueShopByYear(shop_id BIGINT, year SMALLINT)
BEGIN
    SELECT revenueShopByYear(shop_id, year);
END //

DELIMITER //
DROP PROCEDURE IF EXISTS revenueAllShopsByYear//
CREATE PROCEDURE revenueAllShopsByYear(year SMALLINT)
BEGIN
    SELECT fullname,
           revenueShopByYear(id, year) AS revenue,
           year
    FROM users
    ORDER BY revenue DESC;
END //

CALL revenueAllShopsByYear(2021);