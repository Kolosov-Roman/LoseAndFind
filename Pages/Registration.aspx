<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="LoseAndFind.Registration" %>

<!DOCTYPE html>

<html lang="ru">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lose and Find - сервис для нахождения потерянных животных</title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <link rel="stylesheet" href="~/Content/Site.css" asp-append-version="true" />
    <link rel="stylesheet" href="~/LoseAndFind.styles.css" asp-append-version="true" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
</head>
<body>
    <header class="fixed-top">
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
                                <img class="header-img header" src="/Resources/heartFull.png" /></a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divBells">
                                <img class="header-img header" src="/Resources/bell.png" /></a>
                        </li>
                        <li class="mx-2">
                            <a href="Settings.aspx?section=divMessages">
                                <img class="header-img header" src="/Resources/message.png" /></a>
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


    <%--                                                          Верхняя часть                                                                --%>








    <div class="cont">
        <form id="regForm" runat="server" class="registration_form" autocomplete="off">
            <asp:Button Style="display: none" ID="hiddenButton" runat="server" OnClick="LinkButtonAd_Click" />
            <h1 id="titleReg" class="registration_header">Регистрация</h1>
            <div id="divCheckRegFirst" class="reg-div-left visible" runat="server">
                <div class="form-group">
                    <div class="horizontal_label">
                        <label class="reg_label_left">Имя</label>
                        <label id="lblNameReg" runat="server" class="attention_red"></label>
                    </div>
                    <asp:TextBox ID="tbNameReg" MaxLength="100" runat="server" CssClass="form-control" placeholder="Введите ваше имя" />
                </div>
                <div class="form-group">
                    <div class="horizontal_label">
                        <label class="reg_label_left">Телефон</label>
                        <label id="lblNumberPhone" runat="server" class="attention_red"></label>
                    </div>
                    <asp:TextBox ID="tbNumberPhone" runat="server" class="form-control" placeholder="Введите номер телефона" />
                </div>
                <div class="form-group">
                    <div class="horizontal_label">
                        <label class="reg_label_left">Тип аккаунта</label>
                        <label id="lblTypeUser" runat="server" class="attention_red"></label>
                    </div>
                    <asp:DropDownList ID="cbTypeUser" runat="server" CssClass="main-cb" AutoPostBack="True">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnReg" runat="server" Text="Зарегистрироваться" CssClass="register-button" />
                    <asp:Button ID="btnRegHide" runat="server" OnClick="Reg" Style="display: none;" />
                </div>
                <div class="form-group">
                    <span>Уже есть аккаунт?</span>
                    <asp:Button ID="btnAuth" runat="server" Text="Авторизоваться" OnClick="Auth" CssClass="authorization-button" />
                </div>
            </div>


            <div id="divCheckReg" class="reg-div-right hidden" runat="server">
                <div class="form-group">
                    <div class="horizontal_label">
                        <label class="reg_label_left">Почта</label>
                        <label id="lblLoginReg" runat="server" class="attention_red"></label>
                    </div>
                    <asp:TextBox ID="loginReg" runat="server" class="form-control" placeholder="Введите почтовый адрес" MaxLength="100" />
                </div>
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
                    <asp:Button ID="btnR" runat="server" Text="Зарегистрироваться" CssClass="register-button" />
                </div>
                <div class="form-group">
                    <span>Уже есть аккаунт?</span>
                    <asp:Button ID="btnA" runat="server" Text="Авторизоваться" OnClick="Auth" CssClass="authorization-button" />
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
                        <asp:Button ID="btnCheckMailGood" runat="server" Text="Подтвердить" OnClick="Reg" OnClientClick="btnCheckMail_Click(); return false;" CssClass="authorization-button" />
                    </div>
                </div>
            </asp:Panel>
        </form>
    </div>


    <script type="text/javascript">
        document.getElementById('btnReg').onclick = function (event) {
            event.preventDefault(); // предотвращение обновления страницы

            var divCheckRegFirst = document.getElementById('divCheckRegFirst');
            var divCheckReg = document.getElementById('divCheckReg');

            var name = false;
            var numberPhone = false;

            var tbNameReg = document.getElementById('tbNameReg');
            var tbNumberPhone = document.getElementById('tbNumberPhone');

            var lblNameReg = document.getElementById('lblNameReg');
            var lblNumberPhone = document.getElementById('lblNumberPhone');

            lblNameReg.innerText = "";
            lblNumberPhone.innerText = "";

            var phoneNumber = tbNumberPhone.value;

            if (tbNameReg.value === "") {
                lblNameReg.innerText = "Введите имя";
                name = true;
            } else {
                lblNameReg.innerText = "";
            }

            if (!phoneNumber) {
                lblNumberPhone.innerText = "Введите номер телефона";
                numberPhone = true;
            } else if (phoneNumber.length > 12 ||
                phoneNumber.length < 11 ||
                /[^0-9+]/.test(phoneNumber) ||
                (!phoneNumber.startsWith("+7") && !phoneNumber.startsWith("8")) ||
                (phoneNumber.indexOf('+') !== 0 && (phoneNumber.match(/\+/g) || []).length > 1) ||
                (!phoneNumber.startsWith("+7") && phoneNumber.indexOf('+') !== -1)) {
                lblNumberPhone.innerText = "Введите корректный номер телефона";
                numberPhone = true;
            } else {
                lblNumberPhone.innerText = "";
            }

            if (name || numberPhone) return;
            else {
                divCheckRegFirst.classList.add('hidden');
                divCheckRegFirst.classList.remove('visible');
                divCheckReg.classList.add('visible');
                divCheckReg.classList.remove('hidden');
            }
        };
</script>    <%-- Проверки на валидность первого окна регистрации --%>


    <script type="text/javascript">
        document.getElementById('btnR').onclick = function (event) {
            event.preventDefault(); // предотвращение обновления страницы

            var login = false;
            var password = false;
            var passwordConfirm = false;
            var passwordConfirmRepeat = false;

            var loginReg = document.getElementById('loginReg');
            var passwordReg = document.getElementById('passwordReg');
            var passwordConfirmReg = document.getElementById('passwordConfirmReg');

            var lblLoginReg = document.getElementById('lblLoginReg');
            var lblPasswordReg = document.getElementById('lblPasswordReg');
            var lblPasswordConfirmReg = document.getElementById('lblPasswordConfirmReg');

            lblLoginReg.innerText = "";
            lblPasswordReg.innerText = "";
            lblPasswordConfirmReg.innerText = "";

            if (loginReg.value.length < 10) {
                if (loginReg.value == "") {
                    lblLoginReg.innerText = "Введите почту";
                    login = true;
                }
                else {
                    lblLoginReg.innerText = "Введите корректную почту";
                    login = true;
                }
            }
            else lblLoginReg.innerText = "";

            if (passwordReg.value == "") {
                lblPasswordReg.innerText = "Придумайте пароль";
                password = true;
            }
            else lblPasswordReg.innerText = "";

            if (passwordReg.value != passwordConfirmReg.value && passwordConfirmReg.value != "" && passwordReg.value != "") {
                lblPasswordConfirmReg.innerText = "Пароли не совпадают";
                passwordConfirmRepeat = true;
                return login || password || passwordConfirm || passwordConfirmRepeat;
            }
            else lblPasswordConfirmReg.innerText = "";

            if (passwordConfirmReg.value == "") {
                lblPasswordConfirmReg.innerText = "Повторите пароль";
                passwordConfirm = true;
            }
            else lblPasswordConfirmReg.innerText = "";

            if (login || password || passwordConfirm || passwordConfirmRepeat) return;

            $.ajax({
                type: "POST",
                url: "Registration.aspx/CheckRegSecond",
                data: JSON.stringify({ loginReg: loginReg.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        lblLoginReg.innerText = "";
                        lblPasswordReg.innerText = "";
                        lblPasswordConfirmReg.innerText = "";

                        openPopup();
                    } else {
                        lblLoginReg.innerText = "Данная почта уже существует";
                        return;
                    }
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                    alert("Error processing request: " + error);
                }
            });
        };
    </script>    <%-- Проверки на валидность второго окна регистрации --%>


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


    <script>
        function btnCheckMail_Click() {
            $.ajax({
                type: "POST",
                url: "Registration.aspx/btnCheckMail_Click",
                data: JSON.stringify({ loginReg: loginReg.value, tbCode: tbCode.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    if (!response.d) {
                        lblCorrectCode.innerText = "Код неверный";
                    }
                    if (response.d) {
                        document.getElementById('<%= btnRegHide.ClientID %>').click();
                        closePopup();
                    }
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText, error);
                    alert("Произошла ошибка при получении имени пользователя.");
                }
            });
        }
    </script>    <%-- Проверка кода и регистрация --%>


    <script>
        $(document).ready(function () {
            $('#cbTypeUser').select2({
                width: '50%',
                minimumResultsForSearch: -1, // отключает поисковую строку
                dropdownCssClass: 'my-dropdown'
            });
        });
</script>    <%-- Стили для комбобокса --%>









    <%--                                                          Нижняя часть                                                                --%>


    <header class="fixed-bottom">
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
</body>
</html>