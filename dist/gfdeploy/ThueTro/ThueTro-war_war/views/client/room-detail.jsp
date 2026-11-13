<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="/views/layout/header.jsp"/>

<div class="card shadow-sm mb-4">
    <div class="row g-0">
        <div class="col-md-5">
            <c:choose>
                <c:when test="${not empty phong.hinhAnh}">
                    <img src="${pageContext.request.contextPath}/${phong.hinhAnh}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/no-image.svg';" class="img-fluid rounded-start h-100 object-fit-cover" alt="${phong.tenPhong}" style="min-height:300px;object-fit:cover">
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/images/no-image.svg" alt="${phong.tenPhong}" class="img-fluid rounded-start h-100 object-fit-cover">
                </c:otherwise>
            </c:choose>
        </div>
        <div class="col-md-7">
            <div class="card-body p-4">
                <span class="badge bg-success mb-2">${phong.trangThai == 'CON' ? 'Còn trống' : 'Đã thuê'}</span>
                <h3 class="fw-bold">${phong.tenPhong}</h3>
                <p class="text-muted"><i class="fa-solid fa-location-dot me-2"></i>${phong.diaChi} (${phong.maKV.tenKV})</p>
                <hr>
                <p><strong>Loại phòng:</strong> ${phong.maLoai.tenLoai}</p>
                <p><strong>Diện tích:</strong> ${phong.dienTich} m²</p>
                <p><strong>Mô tả:</strong> ${phong.moTa}</p>
                <h4 class="text-danger fw-bold my-3">
                    Giá thuê: <fmt:formatNumber value="${phong.giaThue}" type="number"/> VNĐ / tháng
                </h4>
                <c:if test="${phong.trangThai == 'CON'}">
                    <form action="${pageContext.request.contextPath}/cart" method="get" class="d-flex gap-2 align-items-center">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="id" value="${phong.maPhong}">
                        <label class="fw-semibold">Số tháng thuê:</label>
                        <input type="number" name="soThang" value="1" min="1" max="24" class="form-control" style="width: 90px;" required>
                        <button type="submit" class="btn btn-success"><i class="fa-solid fa-cart-plus me-1"></i>Thêm vào danh sách thuê</button>
                    </form>
                </c:if>
            </div>
        </div>
    </div>
</div>

<!-- Khu vực Góp ý / Bình luận (Tương tác CSDL bảng GopY) -->
<div class="card shadow-sm">
    <div class="card-header bg-light fw-bold">GÓP Ý & ĐÁNH GIÁ VỀ PHÒNG TRỌ NÀY</div>
    <div class="card-body">
        <c:if test="${param.msg == 'feedback_ok'}">
            <div class="alert alert-success">Cảm ơn bạn đã gửi góp ý!</div>
        </c:if>
        <form action="${pageContext.request.contextPath}/room-detail" method="post" class="mb-4">
            <input type="hidden" name="maPhong" value="${phong.maPhong}">
            <c:if test="${sessionScope.account == null}">
                <div class="row mb-2">
                    <div class="col-md-6">
                        <input type="text" name="hoTen" class="form-control" placeholder="Họ tên của bạn *" required>
                    </div>
                    <div class="col-md-6">
                        <input type="email" name="email" class="form-control" placeholder="Email liên hệ">
                    </div>
                </div>
            </c:if>
            <div class="mb-2">
                <textarea name="noiDung" class="form-control" rows="3" placeholder="Nhập nội dung thắc mắc hoặc góp ý về phòng trọ..." required></textarea>
            </div>
            <button type="submit" class="btn btn-primary btn-sm">Gửi góp ý</button>
        </form>

        <c:forEach items="${listGopY}" var="gy">
            <div class="border-bottom pb-2 mb-2">
                <strong>${gy.hoTen}</strong>
                <small class="text-muted ms-2"><fmt:formatDate value="${gy.ngayGui}" pattern="dd/MM/yyyy HH:mm"/></small>
                <p class="mb-0 mt-1">${gy.noiDung}</p>
            </div>
        </c:forEach>
        <c:if test="${empty listGopY}">
            <p class="text-muted mb-0">Chưa có góp ý nào cho phòng này.</p>
        </c:if>
    </div>
</div>

<jsp:include page="/views/layout/footer.jsp"/>
