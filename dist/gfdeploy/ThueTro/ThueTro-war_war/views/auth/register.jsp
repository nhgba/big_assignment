<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/views/layout/header.jsp"/>

<div class="row justify-content-center">
    <div class="col-md-6">
        <div class="card shadow-sm">
            <div class="card-header bg-warning text-dark text-center fw-bold">ĐĂNG KÝ TÀI KHOẢN KHÁCH HÀNG</div>
            <div class="card-body p-4">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>
                <form action="${pageContext.request.contextPath}/register" method="post">
                    <div class="mb-3">
                        <label class="form-label">Tên đăng nhập *</label>
                        <input type="text" name="tenDangNhap" class="form-control" required minlength="4" maxlength="50">
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Mật khẩu *</label>
                            <input type="password" name="matKhau" class="form-control" required minlength="6">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Xác nhận mật khẩu *</label>
                            <input type="password" name="xacNhanMK" class="form-control" required minlength="6">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Họ và tên *</label>
                        <input type="text" name="hoTen" class="form-control" required>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Email *</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Số điện thoại *</label>
                            <input type="text" name="soDienThoai" class="form-control" pattern="[0-9]{10,11}" title="Nhập 10-11 chữ số" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-warning w-100 fw-bold">Tạo tài khoản</button>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/layout/footer.jsp"/>
