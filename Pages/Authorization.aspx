<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authorization.aspx.cs" Inherits="LoseAndFind.Authorization" %>

<!DOCTYPE html>

<html lang="ru">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minimum-scale=1" />
    <title>Вход - Lose and Find</title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    
        <% if ((string)Page.Items["DeviceType"] == "mobile")
   { %>
    <link rel="stylesheet" href="/Content/Site_m.css" />
<% } else
   { %>
    <link rel="stylesheet" href="/Content/Site.css" />
<% }%>

</head>
<body id="bg" style="height: calc(100vh - 50px);">
    <header id="header-hide" class="fixed-top">
        <nav class="navbar navbar-expand-sm">
            <div class="container">
                <a class="text-white header" style="height: 40px; text-decoration: none;" href="Ads.aspx">
                    <img style="margin-top: 2px; height: 47px; width: 26px; margin-right: 15px;" src="/Resources/lapaThin.svg" />
                    <img style="margin-bottom: 7px;" src="/Resources/logoDefault.svg" />
                </a>
                <div class="navbar-collapse justify-content-center">
                    <ul class="navbar-nav">
                        <li class="mx-2">
                            <a href="MakeAd.aspx" class="nav-link text-white header header-text-shadow" onclick="document.getElementById('hiddenButton').click(); return false;">Разместить объявление</a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divMyAds" style="margin-right: 8px;" class="nav-link text-white header">Мои объявления</a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divAdsInLikes">
                                <img class="header-img header" src="/Resources/heartFull-active.svg" /></a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divBells">
                                <img class="header-img header" src="/Resources/bell.svg" /></a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divMessages">
                                <img class="header-img header" src="/Resources/message-active.svg" /></a>
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









    <form runat="server" id="authForm" class="cont">
        <div class="registration_form" runat="server">
            <h1 id="h1" class="registration_header">Авторизация</h1>
            <asp:Button Style="display: none" ID="hiddenButton" runat="server" OnClick="LinkButtonAd_Click" />
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
                    <asp:Button ID="btnEnter" runat="server" Text="Войти" CssClass="register-button" />
                    <asp:Button ID="btnEnterHide" runat="server" OnClick="Enter" Style="display: none;" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnReg" runat="server" Text="Зарегистрироваться" OnClick="Reg" CssClass="register-button" />
                </div>
                <div class="form-group">
                    <span>Забыли пароль?</span>
                    <asp:Button ID="btnRecoverPassword" runat="server" Text="Восстановить пароль" CssClass="authorization-button" />
                </div>
            </div>


            <div id="divRecover" class="hidden hidden-m" runat="server">
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


            <div id="divEnter" class="hidden hidden-m" runat="server">
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
        </div>
    </form>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var authForm = document.getElementById('authForm');
            function isMobile() {
                return /Mobi|Android/i.test(navigator.userAgent);
            }

            if (isMobile()) {
                authForm.style.backgroundColor = 'white';
            }
        });
    </script>    <%-- Белый фон при заходе с мобилки --%>


    <script type="text/javascript">
            document.getElementById('btnRecoverPassword').onclick = function (event) {
                event.preventDefault(); // предотвращение обновления страницы

                var divAuth = document.getElementById('divAuth');
                var divRecover = document.getElementById('divRecover');

                var h1 = document.getElementById('h1');

                divAuth.classList.add('hidden-m', 'hidden');
                divAuth.classList.remove('visible');
                divRecover.classList.add('visible');
                divRecover.classList.remove('hidden-m', 'hidden');
                h1.innerText = "Восстановление пароля";
            }
    </script>    <%-- Переход на окно восстановления пароля --%>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var modal = document.getElementById('<%= divCheckRegSecond.ClientID %>');

                function openPopup() {
                    if (modal && !modal.classList.contains('show')) {
                        modal.style.display = 'flex';
                        modal.style.justifyContent = 'center';
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
                        divRecover.classList.add('hidden-m');
                        divEnter.classList.remove('hidden-m');
                        divEnter.classList.add('visible');
                        h1.innerText = "Изменение пароля";

                        closePopup();
                    }
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText, error);
                    alert("Произошла ошибка при получении имени пользователя.");
                }
            });
        }
    </script>    <%-- Проверка кода почты --%>


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
    </script>    <%-- Проверка изменения нового пароля --%>


    <script>
        document.getElementById('btnEnter').onclick = function (event) {
            event.preventDefault(); // предотвращение обновления страницы

            var password = false;
            var login = false;

            var loginAuth = document.getElementById('loginAuth');
            var passwordAuth = document.getElementById('passwordAuth');

            var lblLoginAuth = document.getElementById('lblLoginAuth');
            var lblPasswordAuth = document.getElementById('lblPasswordAuth');

            lblLoginAuth.innerText = "";
            lblPasswordAuth.innerText = "";

            if (loginAuth.value == "") {
                lblLoginAuth.innerText = "Введите почту";
                login = true;
            }
            else lblLoginAuth.innerText = "";

            if (passwordAuth.value == "") {
                lblPasswordAuth.innerText = "Введите пароль";
                password = true;
            }
            else lblPasswordAuth.innerText = "";

            if (login || password) return;

            $.ajax({
                type: "POST",
                url: "Authorization.aspx/CheckAuth",
                data: JSON.stringify({ loginAuth: loginAuth.value, passwordAuth: passwordAuth.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == "") {
                        document.getElementById('<%= btnEnterHide.ClientID %>').click();
                    } else if (result == "Данный пользователь не найден") {
                        lblLoginAuth.innerText = "Данный пользователь не найден";
                    } else {
                        lblPasswordAuth.innerText = "Пароль не верный";
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


    <header id="footer-hide" class="fixed-bottom">
        <nav class="navbar navbar-expand-sm">
            <div class="container">
                <div class="navbar-collapse justify-content-center">
                    <ul class="navbar-nav">
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divMyAds" class="nav-link text-white header">Мои объявления</a>
                        </li>
                        <li class="mx-2">
                            <a href="MakeAd.aspx" class="nav-link text-white header" onclick="document.getElementById('hiddenButton').click(); return false;">Разместить объявление</a>
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


    <header id="footer-show" style="display: none;" class="fixed-bottom">
    <ul id="ul-row" class="navbar-nav">
        <li class="mx-2">
            <a href="Ads.aspx" class="nav-link header div-li">
                <img class="header-img header" src="/Resources/search-passive.svg" />
                <asp:Label runat="server">Главная</asp:Label>
            </a>
        </li>
        <li class="mx-2">
            <a href="Settings.aspx?section=divAdsInLikes" class="nav-link header div-li">
                <img class="header-img header" src="/Resources/heartFull-passive.svg" />
                <asp:Label runat="server">Избранное</asp:Label>
            </a>
        </li>
        <li class="mx-2">
            <a href="Settings.aspx?section=divMyAds" class="nav-link header div-li">
                <img class="header-img header" src="/Resources/ads-passive.svg" />
                <asp:Label runat="server">Объявления</asp:Label>
            </a>
        </li>
        <li class="mx-2">
            <a href="Settings.aspx?section=divMessages" class="nav-link header div-li">
                <img class="header-img header" src="/Resources/message-passive.svg" />
                <asp:Label runat="server">Сообщения</asp:Label>
            </a>
        </li>
        <li id="ulAuthorizationFooter" runat="server" class="mx-2">
            <a href="Authorization.aspx" class="nav-link header div-li">
                <img class="header-img header" src="/Resources/pictureClient-passive.svg" />
                <asp:Label runat="server">Аккаунт</asp:Label>
            </a>
        </li>
        <li id="imageAClientFooter" runat="server" class="mx-2">
            <a href="Settings.aspx" class="nav-link header div-li">
                <asp:Image ID="imgClientFooter" runat="server" CssClass="header-img header header-image-link"></asp:Image>
                <asp:Label runat="server">Аккаунт</asp:Label>
            </a>
        </li>
    </ul>
</header>
</body>
</html>