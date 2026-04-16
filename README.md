# Video Game Sales Management System (SAYGAMESTORE)

## 🌎 Overview / Tổng quan
This project is a comprehensive database management system for **SAYGAMESTORE**, a platform specializing in video game sales and gaming configuration rentals. Developed as a final project for the "Database 2" course at the University of Social Sciences and Humanities (VNU-HCM).

Dự án này là một hệ thống quản lý cơ sở dữ liệu toàn diện cho **SAYGAMESTORE**, một nền tảng chuyên bán trò chơi điện tử và cho thuê cấu hình chơi game. Đây là đồ án cuối kỳ cho môn học "Cơ sở dữ liệu 2" tại Trường Đại học Khoa học Xã hội và Nhân văn (ĐHQG-HCM).

---

## ✨ Features / Tính năng
- **Customer Management:** Tracks user information, membership types (Regular/Premium), and demographics.
- **Product Inventory:** Manages game details, genres, release dates, and age ratings.
- **Service & Rental:** Handles gaming configuration rentals and additional digital services.
- **Transaction Processing:** Manages orders, secure payments, and subscription plans.
- **Promotion System:** Integration of discounts and vouchers to enhance customer engagement.
- **Security & Roles:** Implements SQL Server roles (Admin, Staff, Customer) with granular permissions.

- **Quản lý khách hàng:** Theo dõi thông tin người dùng, loại thành viên và nhân khẩu học.
- **Kho sản phẩm:** Quản lý chi tiết trò chơi, thể loại, ngày phát hành và giới hạn độ tuổi.
- **Dịch vụ & Cho thuê:** Xử lý việc cho thuê cấu hình máy và các dịch vụ bổ sung.
- **Xử lý giao dịch:** Quản lý đơn hàng, thanh toán và đăng ký thành viên.
- **Hệ thống khuyến mãi:** Tích hợp giảm giá và voucher.
- **Bảo mật & Phân quyền:** Triển khai các vai trò (Admin, Staff, Customer) với quyền hạn cụ thể.

---

## 🛠 Technical Stack / Công nghệ sử dụng
- **Database:** Microsoft SQL Server
- **Key SQL Concepts:**
  - Complex Queries & Joins
  - Stored Procedures & Triggers
  - Views for Reporting
  - User-defined Functions (UDFs)
  - Database Security & User Management (Logins/Roles)

---

## 📊 Database Schema / Sơ đồ Cơ sở dữ liệu
The system consists of several interconnected tables:
- `CUSTOMER`: Personal details and account type.
- `GAME`: Titles, publishers, and pricing.
- `SERVICE`: Rental configurations and extra services.
- `ORDER_TABLE`: Records of sales and rentals.
- `PAYMENT`: Transaction details and methods.
- `DISCOUNT`: Available promotions.

*Chi tiết sơ đồ ERD và logic nghiệp vụ có thể tìm thấy trong tài liệu PDF đính kèm.*

---

## 🚀 Getting Started / Hướng dẫn cài đặt
1. **Clone the repository:**
   ```bash
   git clone [https://github.com/your-username/SAYGAMESTORE.git](https://github.com/your-username/SAYGAMESTORE.git)
