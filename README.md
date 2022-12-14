## Dự án tốt nghiệp - Sàn thương mại điện tử NghienDT

Xây dựng ứng dụng web với mục đích tạo ra cho bạn một kênh mua bán hàng trực tuyến, kết nối người mua với người bán lại với nhau bằng những giao dịch cực kỳ đơn giản, tiện lợi, nhanh chóng, an toàn, mang đến hiệu quả bất ngờ.

© 2022 NghienTeam.

### Frontend

> Link: **_https://github.com/duyplus/NghienDT_**

### Sàn thương mại điện tử

- Các chức năng chính:
    + Đăng nhập bằng mạng xã hội, xác thực danh tính
    + Quản lý sản phẩm, người dùng, đáng giá, danh mục, hãng
    + Xem danh sách sản phẩm, tìm kiếm, lọc sản phẩm
    + Giỏ hàng, huỷ và duyệt đơn hàng, hóa đơn chi tiết, mã giảm giá, thanh toán
    + Thống kê sản phẩm, doanh thu, đơn hàng...
- Công nghệ sử dụng:
    + Java Core, Spring Boot, Spring Security
    + AngularJS, Bootstrap, HTML, CSS, Javascript, SQL,...
- Môi trường phát triển:
    + IntelliJ IDEA
    + Visual Studio Code
    + Microsoft SQL Server
- Công cụ hỗ trợ:
    + Postman
    + Swagger - http://localhost:8080/swagger-ui/index.html
    + Lombok
    + JPA Buddy

## CRUD Rest APIs

##### USER

| Methods | Urls | Status Code | Actions |
| ------------ | ------------ | ------------ | ------------ |
| GET | /api/user | 200 (OK) | Retrieve all user |
| POST | /api/user | 201 (Created) | Create a new user |
| GET | /api/user/:id | 200 (OK) | Retrieve a user by :id |
| PUT | /api/user/:id | 200 (OK) | Update a user by :id |
| DELETE | /api/user/:id | 204 (No Content) | Delete a user by :id ||

### Git clone

```
  git init
  git clone https://github.com/duyplus/eCommerceNghienDT.git
```

### License

The source code for the site is licensed under the MIT license. Please
see [the license terms](https://github.com/duyplus/eCommerceNghienDT/blob/master/LICENSE).
