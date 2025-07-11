<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="header">
    <img class="logo" src="<%= request.getContextPath() %>/images/babaz_logo_2.png" alt="BabaZ Logo"/>

    📚 Welcome to the Online Bookstore
</div>

<style>
.header {
    width: 100%;
    margin: 0;
    padding: 20px 0;
    box-sizing: border-box;
    position: absolute;
    top: 0;
    left: 0;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);

    display: flex;
    align-items: center;
    justify-content: center;

    color: white;
    font-size: 28px;
    font-weight: bold;
    letter-spacing: 1px;
    background-image: linear-gradient(-225deg, #231557 0%, #44107A 29%, #FF1361 67%, #FFF800 100%);
}

.header img.logo {
    position: absolute;
    left: 100px;
    height: 70px;
    width: 80px;
}
</style>
