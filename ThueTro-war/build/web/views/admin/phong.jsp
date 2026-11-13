<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="/views/layout/header.jsp"/>

<h4 class="fw-bold mb-3">QUẢN LÝ DANH MỤC PHÒNG TRỌ</h4>
<c:if test="${param.msg == 'saved'}"><div class="alert alert-success">Lưu thông tin phòng trọ thành công!</div></c:if>
<c:if test="${param.msg == 'deleted'}"><div class="alert alert-success">Đã xóa phòng trọ!</div></c:if>
<c:if test="${param.error == 'invalid_image'}"><div class="alert alert-danger">Ảnh không hợp lệ. Vui lòng chọn file JPG, JPEG, PNG, GIF hoặc WEBP.</div></c:if>
<c:if test="${param.error == 'upload_failed'}"><div class="alert alert-danger">Không thể lưu ảnh. Kiểm tra quyền ghi thư mục ThueTroUploads trong thư mục người dùng và thử lại.</div></c:if>
<c:if test="${param.error == 'invalid_input' || param.error == 'invalid_number' || param.error == 'in_use'}"><div class="alert alert-danger">Lỗi dữ liệu nhập vào hoặc phòng đang nằm trong đơn thuê!</div></c:if>

<div class="card shadow-sm mb-4">
    <div class="card-header bg-primary text-white fw-bold">${editItem != null ? 'CẬP NHẬT THÔNG TIN PHÒNG' : 'THÊM PHÒNG TRỌ MỚI'}</div>
    <div class="card-body">
        <form action="${pageContext.request.contextPath}/admin/phong" method="post" enctype="multipart/form-data" class="row g-3">
            <input type="hidden" name="maPhong" value="${editItem.maPhong}">
            <div class="col-md-4">
                <label class="form-label">Tên phòng *</label>
                <input type="text" name="tenPhong" value="${editItem.tenPhong}" class="form-control" required>
            </div>
            <div class="col-md-4">
                <label class="form-label">Khu vực *</label>
                <select name="maKV" class="form-select" required>
                    <c:forEach items="${listKV}" var="kv">
                        <option value="${kv.maKV}" ${editItem.maKV.maKV == kv.maKV ? 'selected' : ''}>${kv.tenKV}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label">Loại phòng *</label>
                <select name="maLoai" class="form-select" required>
                    <c:forEach items="${listLoai}" var="lp">
                        <option value="${lp.maLoai}" ${editItem.maLoai.maLoai == lp.maLoai ? 'selected' : ''}>${lp.tenLoai}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Địa chỉ cụ thể *</label>
                <input type="text" name="diaChi" value="${editItem.diaChi}" class="form-control" required>
            </div>
            <div class="col-md-2">
                <label class="form-label">Diện tích (m²) *</label>
                <input type="number" step="0.1" min="1" name="dienTich" value="${editItem.dienTich}" class="form-control" required>
            </div>
            <div class="col-md-2">
                <label class="form-label">Giá thuê (VNĐ) *</label>
                <input type="number" step="10000" min="100000" name="giaThue" value="${editItem.giaThue}" class="form-control" required>
            </div>
            <div class="col-md-2">
                <label class="form-label">Trạng thái</label>
                <select name="trangThai" class="form-select">
                    <option value="CON" ${editItem.trangThai == 'CON' ? 'selected' : ''}>Còn trống</option>
                    <option value="DATHUE" ${editItem.trangThai == 'DATHUE' ? 'selected' : ''}>Đã thuê</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label">Chọn hình ảnh phòng</label>
                <input type="file" name="hinhAnhFile" class="form-control" accept="image/png,image/jpeg,image/gif,image/webp">
                <small class="text-muted">Chọn ảnh có sẵn trên máy (JPG, PNG, GIF, WEBP; tối đa 5 MB). Để trống khi sửa nếu muốn giữ ảnh cũ.</small>
                <c:if test="${not empty editItem.hinhAnh}">
                    <div class="mt-2">
                        <img src="${pageContext.request.contextPath}/${editItem.hinhAnh}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/no-image.svg';" alt="Ảnh phòng hiện tại" style="max-width:150px;max-height:100px;object-fit:cover" class="rounded border">
                    </div>
                </c:if>
            </div>
            <div class="col-md-8">
                <label class="form-label">Mô tả tiện nghi</label>
                <input type="text" name="moTa" value="${editItem.moTa}" class="form-control">
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Lưu Phòng Trọ</button>
                <c:if test="${editItem != null}">
                    <a href="${pageContext.request.contextPath}/admin/phong" class="btn btn-secondary">Hủy sửa</a>
                </c:if>
            </div>
        </form>
    </div>
</div>

<!-- Tìm kiếm & Danh sách -->
<form action="${pageContext.request.contextPath}/admin/phong" method="get" class="row g-2 mb-3">
    <div class="col-md-6">
        <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="Tìm theo tên phòng hoặc địa chỉ...">
    </div>
    <div class="col-md-4">
        <select name="trangThai" class="form-select">
            <option value="">-- Tất cả trạng thái --</option>
            <option value="CON" ${trangThai == 'CON' ? 'selected' : ''}>Còn trống</option>
            <option value="DATHUE" ${trangThai == 'DATHUE' ? 'selected' : ''}>Đã thuê</option>
        </select>
    </div>
    <div class="col-md-2">
        <button type="submit" class="btn btn-outline-primary w-100">Tìm kiếm</button>
    </div>
</form>

<div class="table-responsive bg-white shadow-sm rounded p-3">
    <table class="table table-hover align-middle">
        <thead class="table-light">
            <tr>
                <th>Mã</th><th>Ảnh</th><th>Tên phòng</th><th>Khu vực</th><th>Loại</th><th>Giá thuê</th><th>Trạng thái</th><th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="p">
                <tr>
                    <td>${p.maPhong}</td>
                    <td>
                        <c:if test="${not empty p.hinhAnh}">
                            <img src="${pageContext.request.contextPath}/${p.hinhAnh}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/no-image.svg';" alt="Ảnh phòng"
                                 style="width:80px;height:55px;object-fit:cover" class="rounded border">
                        </c:if>
                        <c:if test="${empty p.hinhAnh}"><span class="text-muted small">Chưa có ảnh</span></c:if>
                    </td>
                    <td class="fw-bold">${p.tenPhong}<br><small class="text-muted fw-normal">${p.diaChi}</small></td>
                    <td>${p.maKV.tenKV}</td>
                    <td>${p.maLoai.tenLoai}</td>
                    <td class="text-danger fw-bold"><fmt:formatNumber value="${p.giaThue}" type="number"/> đ</td>
                    <td>
                        <span class="badge ${p.trangThai == 'CON' ? 'bg-success' : 'bg-secondary'}">
                            ${p.trangThai == 'CON' ? 'Còn trống' : 'Đã thuê'}
                        </span>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/phong?action=edit&id=${p.maPhong}" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="${pageContext.request.contextPath}/admin/phong?action=delete&id=${p.maPhong}" onclick="return confirm('Xóa phòng này?')" class="btn btn-danger btn-sm">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/views/layout/footer.jsp"/>
