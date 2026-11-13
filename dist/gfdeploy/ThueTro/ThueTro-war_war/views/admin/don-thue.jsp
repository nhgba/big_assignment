<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="/views/layout/header.jsp"/>

<h4 class="fw-bold mb-3">QUẢN LÝ & XÁC NHẬN ĐƠN THUÊ PHÒNG CỦA KHÁCH HÀNG</h4>
<c:if test="${param.msg == 'confirmed'}"><div class="alert alert-success">Đã xác nhận đơn thuê và cập nhật trạng thái phòng sang ĐÃ THUÊ!</div></c:if>
<c:if test="${param.msg == 'canceled'}"><div class="alert alert-warning">Đã hủy đơn thuê!</div></c:if>

<c:if test="${selectedDon != null}">
    <div class="card border-primary shadow-sm mb-4">
        <div class="card-header bg-primary text-white d-flex justify-content-between">
            <span>CHI TIẾT ĐƠN THUÊ #${selectedDon.maDon}</span>
            <a href="${pageContext.request.contextPath}/admin/don-thue" class="btn btn-sm btn-light">Đóng</a>
        </div>
        <div class="card-body">
            <p><strong>Người thuê:</strong> ${selectedDon.hoTenNguoiThue} - <strong>SĐT:</strong> ${selectedDon.soDienThoai}</p>
            <p><strong>Địa chỉ liên hệ:</strong> ${selectedDon.diaChiLienHe} | <strong>Ghi chú:</strong> ${selectedDon.ghiChu}</p>
            <table class="table table-sm table-bordered">
                <thead><tr><th>Tên phòng</th><th>Khu vực</th><th>Số tháng</th><th>Đơn giá</th><th>Thành tiền</th></tr></thead>
                <tbody>
                    <c:forEach items="${selectedDon.chiTietDonThueList}" var="ct">
                        <tr>
                            <td>${ct.maPhong.tenPhong}</td>
                            <td>${ct.maPhong.maKV.tenKV}</td>
                            <td>${ct.soThang}</td>
                            <td><fmt:formatNumber value="${ct.donGia}" type="number"/> đ</td>
                            <td class="fw-bold"><fmt:formatNumber value="${ct.thanhTien}" type="number"/> đ</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</c:if>

<div class="table-responsive bg-white shadow-sm rounded p-3">
    <table class="table table-hover align-middle">
        <thead class="table-light">
            <tr>
                <th>Mã Đơn</th><th>Khách hàng</th><th>Ngày đặt</th><th>Tổng tiền</th><th>Thanh toán</th><th>Trạng thái</th><th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listDon}" var="d">
                <tr>
                    <td>#${d.maDon}</td>
                    <td>${d.hoTenNguoiThue}<br><small class="text-muted">${d.soDienThoai}</small></td>
                    <td><fmt:formatDate value="${d.ngayDat}" pattern="dd/MM/yyyy HH:mm"/></td>
                    <td class="text-danger fw-bold"><fmt:formatNumber value="${d.tongTien}" type="number"/> đ</td>
                    <td>${d.phuongThucTT}</td>
                    <td>
                        <c:choose>
                            <c:when test="${d.trangThai == 'CHOXACNHAN'}"><span class="badge bg-warning text-dark">Chờ xác nhận</span></c:when>
                            <c:when test="${d.trangThai == 'DAXACNHAN'}"><span class="badge bg-success">Đã xác nhận</span></c:when>
                            <c:otherwise><span class="badge bg-secondary">Đã hủy</span></c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/don-thue?action=detail&id=${d.maDon}" class="btn btn-info btn-sm text-white">Chi tiết</a>
                        <c:if test="${d.trangThai == 'CHOXACNHAN'}">
                            <a href="${pageContext.request.contextPath}/admin/don-thue?action=confirm&id=${d.maDon}" onclick="return confirm('Xác nhận đơn thuê này?')" class="btn btn-success btn-sm">Xác nhận</a>
                            <a href="${pageContext.request.contextPath}/admin/don-thue?action=cancel&id=${d.maDon}" onclick="return confirm('Hủy đơn thuê này?')" class="btn btn-danger btn-sm">Hủy</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/views/layout/footer.jsp"/>
