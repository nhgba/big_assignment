<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="/views/layout/header.jsp"/>

<div class="card shadow-sm mb-4">
    <div class="card-body">
        <form action="${pageContext.request.contextPath}/home" method="get" class="row g-3">
            <div class="col-md-4">
                <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="Tìm theo tên phòng, địa chỉ...">
            </div>
            <div class="col-md-3">
                <select name="maKV" class="form-select">
                    <option value="">-- Tất cả Khu vực --</option>
                    <c:forEach items="${listKV}" var="kv">
                        <option value="${kv.maKV}" ${selectedKV == kv.maKV ? 'selected' : ''}>${kv.tenKV}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-3">
                <select name="maLoai" class="form-select">
                    <option value="">-- Tất cả Loại phòng --</option>
                    <c:forEach items="${listLoai}" var="lp">
                        <option value="${lp.maLoai}" ${selectedLoai == lp.maLoai ? 'selected' : ''}>${lp.tenLoai}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100"><i class="fa-solid fa-search me-1"></i>Tìm kiếm</button>
            </div>
        </form>
    </div>
</div>

<h4 class="mb-3 fw-bold text-primary">DANH SÁCH PHÒNG TRỌ ĐANG CÒN TRỐNG</h4>
<div class="row g-4">
    <c:forEach items="${listPhong}" var="p">
        <div class="col-md-4">
            <div class="card h-100 card-room shadow-sm">
                <c:choose>
                    <c:when test="${not empty p.hinhAnh}">
                        <img src="${pageContext.request.contextPath}/${p.hinhAnh}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/no-image.svg';" class="card-img-top" alt="${p.tenPhong}" style="height:220px;object-fit:cover">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/images/no-image.svg" alt="${p.tenPhong}" class="card-img-top" style="height:220px;object-fit:cover">
                    </c:otherwise>
                </c:choose>
                <div class="card-body d-flex flex-column">
                    <span class="badge bg-info text-dark mb-2 align-self-start">${p.maKV.tenKV} - ${p.maLoai.tenLoai}</span>
                    <h5 class="card-title fw-bold">${p.tenPhong}</h5>
                    <p class="text-muted small mb-1"><i class="fa-solid fa-location-dot me-1"></i>${p.diaChi}</p>
                    <p class="text-muted small mb-2"><i class="fa-solid fa-expand me-1"></i>Diện tích: ${p.dienTich} m²</p>
                    <h5 class="text-danger fw-bold mt-auto">
                        <fmt:formatNumber value="${p.giaThue}" type="number"/> VNĐ/tháng
                    </h5>
                    <div class="d-flex gap-2 mt-3">
                        <a href="${pageContext.request.contextPath}/room-detail?id=${p.maPhong}" class="btn btn-outline-primary btn-sm flex-fill">Chi tiết & Góp ý</a>
                        <a href="${pageContext.request.contextPath}/cart?action=add&id=${p.maPhong}" class="btn btn-success btn-sm flex-fill">
                            <i class="fa-solid fa-cart-plus me-1"></i>Chọn thuê
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:if test="${empty listPhong}">
        <div class="col-12"><div class="alert alert-info">Không tìm thấy phòng trọ phù hợp!</div></div>
    </c:if>
</div>

<jsp:include page="/views/layout/footer.jsp"/>
