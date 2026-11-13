<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ Thống Thuê Trọ Trực Tuyến</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; display: flex; flex-direction: column; min-height: 100vh; }
        .main-content { flex: 1; }
        .card-room { transition: transform 0.2s; }
        .card-room:hover { transform: translateY(-4px); box-shadow: 0 8px 20px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home">
            <i class="fa-solid fa-house-chimney me-2"></i>THUÊ TRỌ CẦN THƠ
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home">Danh sách phòng</a>
                </li>
                <c:if test="${sessionScope.account != null && sessionScope.account.vaiTro == 'ADMIN'}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-warning fw-semibold" href="#" data-bs-toggle="dropdown">
                            <i class="fa-solid fa-gear me-1"></i>Quản trị Website
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/phong">1. Quản lý Phòng trọ</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/khu-vuc">2. Quản lý Khu vực</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/loai-phong">3. Quản lý Loại phòng</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/register-admin"><i class="fa-solid fa-user-plus me-1"></i> Đăng ký tài khoản Admin</a></li>
                            <li><a class="dropdown-item fw-bold text-primary" href="${pageContext.request.contextPath}/admin/don-thue">Xác nhận Đơn thuê</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item me-3">
                    <a class="btn btn-outline-light btn-sm position-relative" href="${pageContext.request.contextPath}/cart">
                        <i class="fa-solid fa-cart-shopping me-1"></i>Danh sách chọn thuê
                        <c:if test="${not empty sessionScope.cart}">
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                ${sessionScope.cart.size()}
                            </span>
                        </c:if>
                    </a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.account != null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white" href="#" data-bs-toggle="dropdown">
                                <i class="fa-solid fa-user-circle me-1"></i>Xin chào, ${sessionScope.account.hoTen}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/my-orders">Đơn thuê của tôi</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item me-2">
                            <a class="btn btn-light btn-sm" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/register">Đăng ký</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
<div class="container main-content my-4">
