<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="/views/layout/header.jsp"/>

<h4 class="fw-bold mb-3">LỊCH SỬ ĐƠN ĐẶT THUÊ PHÒNG CỦA TÔI</h4>
<c:if test="${param.msg == 'order_success'}">
    <div class="alert alert-success">Đặt thuê phòng thành công! Quản lý sẽ liên hệ xác nhận sớm nhất.</div>
</c:if>

<div class="table-responsive bg-white shadow-sm rounded p-3">
    <table class="table table-bordered align-middle">
        <thead class="table-light">
            <tr>
                <th>Mã Đơn</th>
                <th>Ngày đặt</th>
                <th>Chi tiết phòng thuê</th>
                <th>Phương thức TT</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${orders}" var="d">
                <tr>
                    <td>#${d.maDon}</td>
                    <td><fmt:formatDate value="${d.ngayDat}" pattern="dd/MM/yyyy HH:mm"/></td>
                    <td>
                        <ul class="mb-0 ps-3">
                            <c:forEach items="${d.chiTietDonThueList}" var="ct">
                                <li>${ct.maPhong.tenPhong} (${ct.soThang} tháng)</li>
                            </c:forEach>
                        </ul>
                    </td>
                    <td>${d.phuongThucTT}</td>
                    <td class="text-danger fw-bold"><fmt:formatNumber value="${d.tongTien}" type="number"/> đ</td>
                    <td>
                        <c:choose>
                            <c:when test="${d.trangThai == 'CHOXACNHAN'}"><span class="badge bg-warning text-dark">Chờ xác nhận</span></c:when>
                            <c:when test="${d.trangThai == 'DAXACNHAN'}"><span class="badge bg-success">Đã xác nhận</span></c:when>
                            <c:otherwise><span class="badge bg-secondary">Đã hủy</span></c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/views/layout/footer.jsp"/>
