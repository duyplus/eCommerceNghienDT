## Dự án tốt nghiệp - eCommerceNghienDT

Xây dựng ứng dụng web nhằm mục đích bán hàng online

### Frontend

Link: https://github.com/duyplus/NghienDT

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
