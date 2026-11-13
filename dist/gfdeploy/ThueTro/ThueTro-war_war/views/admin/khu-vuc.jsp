<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/views/layout/header.jsp"/>

<h4 class="fw-bold mb-3">QUẢN LÝ DANH MỤC KHU VỰC</h4>
<c:if test="${param.msg == 'saved'}"><div class="alert alert-success">Lưu dữ liệu Khu vực thành công!</div></c:if>
<c:if test="${param.msg == 'deleted'}"><div class="alert alert-success">Đã xóa Khu vực!</div></c:if>
<c:if test="${not empty param.error}"><div class="alert alert-danger">Lỗi thao tác (Tên khu vực bị trùng hoặc đang có phòng sử dụng)!</div></c:if>

<div class="row">
    <div class="col-md-4">
        <div class="card shadow-sm mb-3">
            <div class="card-header bg-primary text-white fw-bold">${editItem != null ? 'CẬP NHẬT KHU VỰC' : 'THÊM KHU VỰC MỚI'}</div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/khu-vuc" method="post">
                    <input type="hidden" name="maKV" value="${editItem.maKV}">
                    <div class="mb-3">
                        <label class="form-label">Tên Khu vực *</label>
                        <input type="text" name="tenKV" value="${editItem.tenKV}" class="form-control" required maxlength="100">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mô tả</label>
                        <textarea name="moTa" class="form-control" rows="3" maxlength="300">${editItem.moTa}</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Lưu thông tin</button>
                    <c:if test="${editItem != null}">
                        <a href="${pageContext.request.contextPath}/admin/khu-vuc" class="btn btn-secondary w-100 mt-2">Hủy sửa</a>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-8">
        <form action="${pageContext.request.contextPath}/admin/khu-vuc" method="get" accept-charset="UTF-8" class="d-flex gap-2 mb-3">
            <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="Tìm kiếm theo tên hoặc mô tả khu vực...">
            <button type="submit" class="btn btn-outline-primary">Tìm</button>
        </form>
        <div class="table-responsive bg-white shadow-sm rounded p-3">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr><th>Mã</th><th>Tên Khu vực</th><th>Mô tả</th><th>Thao tác</th></tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>${item.maKV}</td>
                            <td class="fw-bold">${item.tenKV}</td>
                            <td>${item.moTa}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/khu-vuc?action=edit&id=${item.maKV}" class="btn btn-warning btn-sm">Sửa</a>
                                <a href="${pageContext.request.contextPath}/admin/khu-vuc?action=delete&id=${item.maKV}" onclick="return confirm('Xóa khu vực này?')" class="btn btn-danger btn-sm">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="/views/layout/footer.jsp"/>
