<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/head.jspf" %>

<link rel="stylesheet" href="../css/login.css">
<script src="/js/login.js"></script>    

<body class="">
    <div class="wrapper fadeInDown">
        <div id="formContent">
          <!-- Tabs Titles -->
          
          <!-- Login Form -->
        <form id="login" method="post" action="/users/loginCheck">
            <h2 class="active noto cu_po"> 로그인 </h2>
            <h2 class="inactive underlineHover noto cu_po change_reg">회원가입 </h2>
            <input type="text" id="user_ID" class="fadeIn second noto" name="user_ID" autofocus placeholder="IDENTIFICATION">
            <input type="password" id="user_Passwd" class="fadeIn third noto" name="user_Passwd" placeholder="PASSWORD">
            <p id="confirm" class="bold clr_tomato margin_t10 margin_b10">${msg}</p>
            <input type="submit" class="fadeIn fourth" id="log_btn" value="Log In">
        </form>


        <form id="register" method="post" action="/users/register">
            <h2 class="inactive underlineHover noto cu_po change_login"> 로그인 </h2>
            <h2 class="active noto cu_po">회원가입 </h2>
            <input type="text" name="user_Name" id="user_Name" class="fadeIn third noto" placeholder="NAME" />            
           	<input type="text" name="user_ID" id="user_ID" class="fadeIn second noto lalign" placeholder="IDENTIFICATION" />
           	<span id="checked" class="dp_in bold clr_tomato"></span>
            <input type="password" name="user_Passwd" id="user_Passwd" class="fadeIn third noto" placeholder="PASSWORD" />
            <input type="password" name="" id="repasswd" class="fadeIn third noto" placeholder="REPASSWORD" />
            <input type="text" name="user_Email" id="user_Email" class="fadeIn third noto" placeholder="EMAIL" />
            <input type="text" name="user_Domain" id="user_Domain" class="dp_in valign fadeIn third noto domain" value="naver.com" />
            <select name="url" id="url" class="url open fadeIn third dp_in valign">
                <option value="1">직접입력</option>
                <option value="naver.com" selected>naver.com</option>
                <option value="hanmail.com">hanmail.com</option>
                <option value="korea.com">korea.com</option>
                <option value="google.com">google.com</option>
                <option value="nate.com">nate.com</option>
            </select>

            <input type="text" name="user_Addr" id="user_Addr" class="fadeIn third noto" placeholder="Addr.*" />
            <input type="text" name="user_Phone" id="user_Phone" class="fadeIn third noto" maxlength="13" placeholder="PHONE" />
            <input type="submit" class="fadeIn fourth" id="reg_btn" value="Registration" />
        </form>

          <!-- Remind Passowrd -->
        <div id="formFooter">
            <a class="underlineHover" href="#">Forgot Password?</a>
        </div>

        </div>
    </div>
</body>
<script>
    $('#register').hide();
    $(function() {
        $('.change_reg').click(function() {
            $('#login').hide();
            $('#register').show();
        });

        $('.change_login').click(function() {
            $('#register').hide();
            $('#login').show();
        });
    });
</script>

</html>