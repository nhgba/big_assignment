<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="/views/layout/header.jsp"/>

<div class="row">
    <div class="col-md-7">
        <div class="card shadow-sm">
            <div class="card-header bg-success text-white fw-bold">THÔNG TIN NGƯỜI ĐĂNG KÝ THUÊ PHÒNG</div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/checkout" method="post">
                    <div class="mb-3">
                        <label class="form-label">Họ tên người thuê *</label>
                        <input type="text" name="hoTenNguoiThue" value="${sessionScope.account.hoTen}" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số điện thoại liên hệ *</label>
                        <input type="text" name="soDienThoai" value="${sessionScope.account.soDienThoai}" pattern="[0-9]{10,11}" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Địa chỉ liên hệ hiện tại</label>
                        <input type="text" name="diaChiLienHe" class="form-control" placeholder="Nhập địa chỉ quê quán hoặc nơi ở hiện tại">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phương thức thanh toán tiền cọc / tiền thuê *</label>
                        <select name="phuongThucTT" class="form-select">
                            <option value="Tiền mặt">Thanh toán Tiền mặt khi nhận phòng</option>
                            <option value="Chuyển khoản ngân hàng">Chuyển khoản ngân hàng</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Ghi chú thêm (Ngày dự kiến dọn vào...)</label>
                        <textarea name="ghiChu" class="form-control" rows="2"></textarea>
                    </div>
                    <button type="submit" class="btn btn-success w-100 fw-bold">XÁC NHẬN ĐẶT THUÊ PHÒNG</button>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-5">
        <div class="card shadow-sm">
            <div class="card-header bg-light fw-bold">TÓM TẮT ĐƠN THUÊ</div>
            <div class="card-body">
                <c:forEach items="${sessionScope.cart.values()}" var="item">
                    <div class="d-flex justify-content-between border-bottom py-2">
                        <div>
                            <div class="fw-bold">${item.phong.tenPhong}</div>
                            <small class="text-muted">Thời hạn: ${item.soThang} tháng</small>
                        </div>
                        <div class="fw-bold"><fmt:formatNumber value="${item.thanhTien}" type="number"/> đ</div>
                    </div>
                </c:forEach>
                <div class="d-flex justify-content-between mt-3 fs-5">
                    <strong>Tổng thanh toán:</strong>
                    <strong class="text-danger"><fmt:formatNumber value="${tongTien}" type="number"/> VNĐ</strong>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/layout/footer.jsp"/>
