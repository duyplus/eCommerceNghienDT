## Dự án tốt nghiệp - Sàn thương mại điện tử NghienDT

Xây dựng ứng dụng web với mục đích tạo ra cho bạn một kênh mua bán hàng trực tuyến, kết nối người mua với người bán lại
với nhau bằng những giao dịch cực kỳ đơn giản, tiện lợi, nhanh chóng, an toàn, mang đến hiệu quả bất ngờ.

© 2022 NghienTeam.

### Frontend

> Link: **_https://github.com/duyplus/NghienDT_**

### Sàn thương mại điện tử

- Các chức năng chính:
    + Đăng ký, đăng nhập tài khoản
    + Quên mật khẩu, đổi mật khẩu, thông tin người dùng
    + Người dùng có thể đăng bán hoặc mua sản phẩm
    + Quản lý sản phẩm, người dùng, đáng giá, danh mục, hãng
    + Xem danh sách sản phẩm, tìm kiếm, lọc sản phẩm
    + Giỏ hàng, huỷ và duyệt đơn hàng, hóa đơn chi tiết, mã giảm giá, thanh toán
    + Doanh thu đơn hàng theo ngày
    + Thống kê sản phẩm theo danh mục, hãng, thời gian
- Công nghệ sử dụng:
    + Java Core, Spring Boot, Spring Security
    + AngularJS, Bootstrap, HTML, CSS, Javascript, SQL,...
- Môi trường phát triển:
    + IntelliJ IDEA
    + Visual Studio Code
    + Microsoft SQL Server
    + MySQL Workbench
- Công cụ hỗ trợ:
    + Postman
    + Swagger
    + Lombok
    + JPA Buddy

## CRUD Rest APIs

##### USER, CATEGORY, COMPANY, PRODUCT, ORDER, REVIEW,... = (name)

| Methods | Urls            | Status Code      | Actions                  |
|---------|-----------------|------------------|--------------------------|
| GET     | /api/(name)     | 200 (OK)         | Retrieve all (name)      |
| POST    | /api/(name)     | 201 (Created)    | Create a new (name)      |
| GET     | /api/(name)/:id | 200 (OK)         | Retrieve a (name) by :id |
| PUT     | /api/(name)/:id | 200 (OK)         | Update a (name) by :id   |
| DELETE  | /api/(name)/:id | 204 (No Content) | Delete a (name) by :id   ||

### Git clone

```
  git init
  git clone https://github.com/duyplus/eCommerceNghienDT.git
```

### License

The source code for the site is licensed under the MIT license. Please
see [the license terms](https://github.com/duyplus/eCommerceNghienDT/blob/master/LICENSE).
