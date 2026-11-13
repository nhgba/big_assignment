<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="/views/layout/header.jsp"/>

<h4 class="fw-bold mb-3">DANH SÁCH PHÒNG ĐANG CHỌN THUÊ (GIỎ HÀNG)</h4>
<c:choose>
    <c:when test="${empty sessionScope.cart}">
        <div class="alert alert-warning">
            Danh sách chọn thuê đang trống. <a href="${pageContext.request.contextPath}/home">Quay lại chọn phòng</a>.
        </div>
    </c:when>
    <c:otherwise>
        <div class="table-responsive bg-white shadow-sm rounded p-3">
            <table class="table align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Tên phòng</th>
                        <th>Khu vực</th>
                        <th>Đơn giá / tháng</th>
                        <th style="width: 160px;">Số tháng thuê</th>
                        <th>Thành tiền</th>
                        <th>Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.cart.values()}" var="item">
                        <tr>
                            <td class="fw-bold">${item.phong.tenPhong}</td>
                            <td>${item.phong.maKV.tenKV}</td>
                            <td><fmt:formatNumber value="${item.phong.giaThue}" type="number"/> đ</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/cart" method="post" class="d-flex gap-1">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="maPhong" value="${item.phong.maPhong}">
                                    <input type="number" name="soThang" value="${item.soThang}" min="1" max="24" class="form-control form-control-sm">
                                    <button type="submit" class="btn btn-outline-secondary btn-sm">Lưu</button>
                                </form>
                            </td>
                            <td class="text-danger fw-bold"><fmt:formatNumber value="${item.thanhTien}" type="number"/> đ</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/cart?action=remove&id=${item.phong.maPhong}" class="btn btn-danger btn-sm">
                                    <i class="fa-solid fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="d-flex justify-content-between align-items-center mt-3">
                <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-primary">Chọn thêm phòng</a>
                <div>
                    <span class="fs-5 me-3">Tổng cộng: <strong class="text-danger"><fmt:formatNumber value="${tongTien}" type="number"/> VNĐ</strong></span>
                    <a href="${pageContext.request.contextPath}/checkout" class="btn btn-success btn-lg">Tiến hành Đặt thuê</a>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="/views/layout/footer.jsp"/>
