<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/views/layout/header.jsp"/>

<h4 class="fw-bold mb-3">QUẢN LÝ DANH MỤC LOẠI PHÒNG</h4>
<c:if test="${param.msg == 'saved'}"><div class="alert alert-success">Lưu dữ liệu Loại phòng thành công!</div></c:if>
<c:if test="${param.msg == 'deleted'}"><div class="alert alert-success">Đã xóa Loại phòng!</div></c:if>
<c:if test="${not empty param.error}"><div class="alert alert-danger">Lỗi thao tác (Tên loại phòng bị trùng hoặc đang có phòng sử dụng)!</div></c:if>

<div class="row">
    <div class="col-md-4">
        <div class="card shadow-sm mb-3">
            <div class="card-header bg-primary text-white fw-bold">${editItem != null ? 'CẬP NHẬT LOẠI PHÒNG' : 'THÊM LOẠI PHÒNG MỚI'}</div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/loai-phong" method="post">
                    <input type="hidden" name="maLoai" value="${editItem.maLoai}">
                    <div class="mb-3">
                        <label class="form-label">Tên Loại phòng *</label>
                        <input type="text" name="tenLoai" value="${editItem.tenLoai}" class="form-control" required maxlength="100">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mô tả</label>
                        <textarea name="moTa" class="form-control" rows="3" maxlength="300">${editItem.moTa}</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Lưu thông tin</button>
                    <c:if test="${editItem != null}">
                        <a href="${pageContext.request.contextPath}/admin/loai-phong" class="btn btn-secondary w-100 mt-2">Hủy sửa</a>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-8">
        <form action="${pageContext.request.contextPath}/admin/loai-phong" method="get" class="d-flex gap-2 mb-3">
            <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="Tìm kiếm loại phòng...">
            <button type="submit" class="btn btn-outline-primary">Tìm</button>
        </form>
        <div class="table-responsive bg-white shadow-sm rounded p-3">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr><th>Mã</th><th>Tên Loại phòng</th><th>Mô tả</th><th>Thao tác</th></tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>${item.maLoai}</td>
                            <td class="fw-bold">${item.tenLoai}</td>
                            <td>${item.moTa}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/loai-phong?action=edit&id=${item.maLoai}" class="btn btn-warning btn-sm">Sửa</a>
                                <a href="${pageContext.request.contextPath}/admin/loai-phong?action=delete&id=${item.maLoai}" onclick="return confirm('Xóa loại phòng này?')" class="btn btn-danger btn-sm">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="/views/layout/footer.jsp"/>
