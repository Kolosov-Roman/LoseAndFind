﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authorization.aspx.cs" Inherits="LoseAndFind.Authorization" %>

<!DOCTYPE html>

<html lang="ru">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lose and Find - сервис для нахождения потерянных животных</title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <link rel="stylesheet" href="~/Content/Site.css" asp-append-version="true" />
    <link rel="stylesheet" href="~/LoseAndFind.styles.css" asp-append-version="true" />
</head>
<body>
    <header class="fixed-top">
        <nav class="navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand text-white header main-title" href="Ads.aspx">Lose and Find</a>
                <div class="navbar-collapse justify-content-center">
                    <ul class="navbar-nav">
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divMyAds" class="nav-link text-white header">Мои объявления</a>
                        </li>
                        <li class="mx-2">
                            <a href="MakeAd.aspx" class="nav-link text-white header">Разместить объявление</a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divAdsInLikes" class="nav-link text-white header">Избранное</a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divBells" class="nav-link text-white header">Уведомления</a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divMessages" class="nav-link text-white header">Сообщения</a>
                        </li>
                    </ul>
                </div>
                <ul runat="server" id="ulAuthorization" class="navbar-nav">
                    <li class="mx-2">
                        <a href="Authorization.aspx" class="nav-link text-white header">Войти</a>
                    </li>
                </ul>
                <a id="imageAClient" runat="server" href="Settings.aspx">
                    <asp:Image ID="imgClient" runat="server" CssClass="header-image header-image-link"></asp:Image>
                </a>
            </div>
        </nav>
    </header>


    <%--                                                         Верхняя часть                                                                --%>










    <div class="registration_form">
        <h1 id="h1" class="registration_header">Авторизация</h1>
        <form id="authForm" runat="server">
            <div id="divAuth" runat="server" class="visible">
                <div class="form-group">
                    <div class="horizontal_label">
                        <label class="reg_label_left">Почта</label>
                        <label id="lblLoginAuth" runat="server" class="attention_red"></label>
                    </div>
                    <asp:TextBox ID="loginAuth" runat="server" class="form-control" placeholder="Введите почтовый адрес" />
                </div>
                <div class="form-group">
                    <div class="horizontal_label">
                        <label class="reg_label_left">Пароль</label>
                        <label id="lblPasswordAuth" runat="server" class="attention_red"></label>
                    </div>
                    <asp:TextBox type="password" ID="passwordAuth" runat="server" class="form-control" placeholder="Введите пароль" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnEnter" runat="server" Text="Войти" OnClick="Enter" CssClass="register-button" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnReg" runat="server" Text="Зарегистрироваться" OnClick="Reg" CssClass="register-button" />
                </div>
                <div class="form-group">
                    <span>Забыли пароль?</span>
                    <asp:Button ID="btnRecoverPassword" runat="server" Text="Восстановить пароль" CssClass="authorization-button" />
                </div>
            </div>


            <div id="divRecover" class="hidden" runat="server">
                <div class="form-group">
                    <div class="horizontal_label">
                        <label class="reg_label_left">Почта</label>
                        <label id="lblMail" runat="server" class="attention_red"></label>
                    </div>
                    <asp:TextBox ID="tbMail" runat="server" class="form-control" placeholder="Введите почтовый адрес" />
                </div>
                <div class="form-group">
                    <asp:Button ID="getCode" runat="server" Text="Получить код" CssClass="register-button" />
                </div>
            </div>


            <div id="divEnter" class="hidden" runat="server">
                <div class="form-group">
                    <div class="horizontal_label">
                        <label class="reg_label_left">Пароль</label>
                        <label id="lblPasswordReg" runat="server" class="attention_red"></label>
                    </div>
                    <asp:TextBox type="password" ID="passwordReg" runat="server" class="form-control" placeholder="Введите пароль" MaxLength="100" />
                </div>
                <div class="form-group">
                    <div class="horizontal_label">
                        <label class="reg_label_left">Повторите пароль</label>
                        <label id="lblPasswordConfirmReg" runat="server" class="attention_red"></label>
                    </div>
                    <asp:TextBox type="password" ID="passwordConfirmReg" runat="server" CssClass="form-control" placeholder="Повторите пароль" MaxLength="100" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSavePassword" runat="server" Text="Сохранить изменения" CssClass="register-button" />
                </div>
            </div>
            <asp:Panel ID="divCheckRegSecond" runat="server" CssClass="modal">
                <div class="modal-content">
                    <span class="close" onclick="closePopup()">&times;</span>
                    <div class="form-group">
                        <div class="horizontal_label">
                            <label class="reg_label_left">Код</label>
                            <label id="lblCorrectCode" runat="server" class="attention_red"></label>
                        </div>
                        <asp:TextBox ID="tbCode" runat="server" CssClass="form-control" placeholder="Введите проверочный код" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnCheckMailGood" runat="server" Text="Подтвердить" OnClientClick="btnCheckMail_Click(); return false;" CssClass="authorization-button" />
                    </div>
                </div>
            </asp:Panel>
        </form>
    </div>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <script type="text/javascript">
            document.getElementById('btnRecoverPassword').onclick = function (event) {
                event.preventDefault(); // предотвращение обновления страницы

                var divAuth = document.getElementById('divAuth');
                var divRecover = document.getElementById('divRecover');

                var h1 = document.getElementById('h1');

                divAuth.classList.add('hidden');
                divAuth.classList.remove('visible');
                divRecover.classList.add('visible');
                divRecover.classList.remove('hidden');
                h1.innerText = "Восстановление пароля";
            }
    </script>    <%-- Переход на окно восстановления пароля --%>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var modal = document.getElementById('<%= divCheckRegSecond.ClientID %>');

                function openPopup() {
                    if (modal && !modal.classList.contains('show')) {
                        modal.style.display = 'block';
                        setTimeout(function () {
                            modal.classList.add('show');
                            modal.addEventListener('transitionend', onTransitionEnd);
                        }, 10);
                    }
                }

                function closePopup() {
                    if (modal && modal.classList.contains('show')) {
                        modal.classList.remove('show');
                        modal.addEventListener('transitionend', onTransitionEnd);
                    }
                }

                function onTransitionEnd() {
                    modal.removeEventListener('transitionend', onTransitionEnd);
                    if (!modal.classList.contains('show')) {
                        modal.style.display = 'none';
                    }
                }

                if (modal) {
                    modal.addEventListener('click', function (event) {
                        if (event.target === modal) {
                            closePopup();
                        }
                    });
                }

                function setOpenModalFlag() {
                    sessionStorage.setItem('openModal', 'true');
                }

                function checkModalStatus() {
                    if (sessionStorage.getItem('openModal') === 'true') {
                        showModal();
                        sessionStorage.removeItem('openModal');
                    }
                }

                function showModal() {
                    openPopup();
                }

                checkModalStatus();

                window.openPopup = openPopup;
                window.closePopup = closePopup;
                window.setOpenModalFlag = setOpenModalFlag;
            });
    </script>    <%-- Открытие модального окна с почтой --%>


    <script type="text/javascript">
        document.getElementById('getCode').onclick = function (event) {
            event.preventDefault(); // предотвращение обновления страницы

            var mail = false;

            var tbMail = document.getElementById('tbMail');

            var lblMail = document.getElementById('lblMail');

            lblMail.innerText = "";

            if (tbMail.value.length < 10) {
                if (tbMail.value == "") {
                    lblMail.innerText = "Введите почту";
                    mail = true;
                }
                else {
                    lblMail.innerText = "Введите корректную почту";
                    mail = true;
                }
            }
            else lblMail.innerText = "";

            if (mail) return;

            $.ajax({
                type: "POST",
                url: "Authorization.aspx/CheckRegSecond",
                data: JSON.stringify({ tbMail: tbMail.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        lblMail.innerText = "";

                        openPopup();
                    } else {
                        lblMail.innerText = "Данная почта не зарегистрирована";
                        return;
                    }
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                    alert("Error processing request: " + error);
                }
            });
        };
    </script>    <%-- Проверка почты --%>


    <script>
        function btnCheckMail_Click() {
            var divEnter = document.getElementById('divEnter');
            var divRecover = document.getElementById('divRecover');
            var h1 = document.getElementById('h1');

            $.ajax({
                type: "POST",
                url: "Authorization.aspx/btnCheckMail_Click",
                data: JSON.stringify({ tbMail: tbMail.value, tbCode: tbCode.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    if (!response.d) {
                        lblCorrectCode.innerText = "Код неверный";
                    }
                    if (response.d) {

                        divRecover.classList.remove('visible');
                        divRecover.classList.add('hidden');
                        divEnter.classList.remove('hidden');
                        divEnter.classList.add('visible');
                        h1.innerText = "Изменение пароля";

                        // Сделать здесь отображение окна, в котором будет 2 поля пароля, которые если заполнить неправильно, показывало ошибку, иначе отправляло
                        // в метод c#, где новый пароль меняется на старый и пользователя перебрасывает на главную страницу

                        closePopup();
                    }
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText, error);
                    alert("Произошла ошибка при получении имени пользователя.");
                }
            });
        }
    </script>


    <script type="text/javascript">
        document.getElementById('btnSavePassword').onclick = function (event) {
            event.preventDefault(); // предотвращение обновления страницы

            var password = false;
            var passwordConfirm = false;
            var passwordConfirmRepeat = false;

            var tbMail = document.getElementById('tbMail');

            var passwordReg = document.getElementById('passwordReg');
            var passwordConfirmReg = document.getElementById('passwordConfirmReg');

            var lblPasswordReg = document.getElementById('lblPasswordReg');
            var lblPasswordConfirmReg = document.getElementById('lblPasswordConfirmReg');

            lblPasswordReg.innerText = "";
            lblPasswordConfirmReg.innerText = "";

            if (passwordReg.value == "") {
                lblPasswordReg.innerText = "Придумайте пароль";
                password = true;
            }
            else lblPasswordReg.innerText = "";

            if (passwordReg.value != passwordConfirmReg.value && passwordConfirmReg.value != "" && passwordReg.value != "") {
                lblPasswordConfirmReg.innerText = "Пароли не совпадают";
                passwordConfirmRepeat = true;
                return password || passwordConfirm || passwordConfirmRepeat;
            }
            else lblPasswordConfirmReg.innerText = "";

            if (passwordConfirmReg.value == "") {
                lblPasswordConfirmReg.innerText = "Повторите пароль";
                passwordConfirm = true;
            }
            else lblPasswordConfirmReg.innerText = "";

            if (password || passwordConfirm || passwordConfirmRepeat) return;

            $.ajax({
                type: "POST",
                url: "Authorization.aspx/CheckNewPassword",
                data: JSON.stringify({ tbMail: tbMail.value, passwordReg: passwordReg.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        lblPasswordReg.innerText = "";
                        lblPasswordConfirmReg.innerText = "";
                        window.location.href = "/Pages/Ads";
                    } else {
                        return;
                    }
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                    alert("Error processing request: " + error);
                }
            });
        };
    </script>









    <%--                                                         Нижняя часть                                                                 --%>


    <header class="fixed-bottom">
        <nav class="navbar navbar-expand-sm">
            <div class="container">
                <div class="navbar-collapse justify-content-center">
                    <ul class="navbar-nav">
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divMyAds" class="nav-link text-white header">Мои объявления</a>
                        </li>
                        <li class="mx-2">
                            <a href="MakeAd.aspx" class="nav-link text-white header">Разместить объявление</a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divAdsInLikes" class="nav-link text-white header">Избранное</a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divBells" class="nav-link text-white header">Уведомления</a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divMessages" class="nav-link text-white header">Сообщения</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
</body>
</html>