<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adv.aspx.cs" Inherits="LoseAndFind.Adv" %>

<!DOCTYPE html>

<html lang="ru">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minimum-scale=1" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>Lose and Find - сервис для нахождения потерянных животных</title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    
        <% if ((string)Page.Items["DeviceType"] == "mobile")
   { %>
    <link rel="stylesheet" href="/Content/Site_m.css" />
<% } else
   { %>
    <link rel="stylesheet" href="/Content/Site.css" />
<% }%>

    
</head>
<body id="body">
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
                        <a class="nav-link text-white header" href="Ads.aspx">Доска объявлений</a>
                    </li>
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









    <form id="adv" class="adv" runat="server" autocomplete="off">
        <asp:Button style="display: none" ID="hiddenButton" runat="server" OnClick="LinkButtonAd_Click" />
        <div id="advContainerLeft" class="adv-container-left">
            <div id="divCloseAndEditAd" runat="server" class="adv-container-right-showing">
                <asp:Button ID="btnEditAdv" CssClass="adv-btnEditAd" Text="Редактировать объявление" runat="server" OnClick="EditAdv" />
                <asp:Button ID="btnCloseAdv" CssClass="adv-btnCloseAd" Text="Снять с публикации" runat="server" OnClick="CloseAdv" />
            </div>
            <div class="adv-label-lf">
                <asp:Label ID="lblLoseOrFind" class="adv-loseOrFind" runat="server"></asp:Label>
                <asp:Label ID="lblCloseAdv" class="adv-loseOrFind red-title" runat="server">Объявление снято с публикации</asp:Label>
            </div>
            <asp:Label ID="lblTitleAnimal" class="adv-title" runat="server"></asp:Label>
            <div class="adv-div-div-img">
                <div class="adv-div-img">
                    <asp:Image ID="imgAnimal" runat="server" CssClass="adv-image-animal" />
                </div>
            </div>
            <div class="adv-img-margin">
                <asp:Label class="adv-address-info-label" ID="lblDataPublicationTitle" Text="Дата публикациии:" runat="server"></asp:Label>
                <asp:Label class="adv-address-value" ID="lblDataPublicationValue" runat="server"></asp:Label>
            </div>
            <div class="adv-info-margin">
                <asp:Label class="adv-address-info-label" ID="lblAddressTitle" Text="Адрес:" runat="server"></asp:Label>
                <asp:Label class="adv-address-value" ID="lblAddressValue" runat="server"></asp:Label>
            </div>
            <div class="adv-separator-top"></div>
            <asp:Label ID="lblTitleCharact" class="adv-title-charact" Text="Характеристики" runat="server"></asp:Label>
            <div class="adv-separator-bottom"></div>
            <div class="adv-charact-cb-div">
                <div>
                    <asp:Label ID="lblTypeTitle" class="adv-charact-label" Text="Тип:" runat="server"></asp:Label>
                    <asp:Label ID="lblTypeValue" runat="server"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblBreedTitle" class="adv-charact-label" Text="Порода:" runat="server"></asp:Label>
                    <asp:Label ID="lblBreedValue" runat="server"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblColorTitle" class="adv-charact-label" Text="Окрас:" runat="server"></asp:Label>
                    <asp:Label ID="lblColorValue" runat="server"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblMaleTitle" class="adv-charact-label" Text="Пол:" runat="server"></asp:Label>
                    <asp:Label ID="lblMaleValue" runat="server"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblIsChippingTitle" class="adv-charact-label" Text="Чипирован:" runat="server"></asp:Label>
                    <asp:Label ID="lblIsChippingValue" runat="server"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblIsCastratedTitle" class="adv-charact-label" Text="Кастрирован:" runat="server"></asp:Label>
                    <asp:Label ID="lblIsCastratedValue" runat="server"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblIsCollarTitle" class="adv-charact-label" Text="Ошейник:" runat="server"></asp:Label>
                    <asp:Label ID="lblIsCollarValue" runat="server"></asp:Label>
                </div>
            </div>
            <div class="adv-separator-top"></div>
            <div class="adv-description-last">
                <asp:Label ID="lblDescription" class="adv-description-last-text" runat="server"></asp:Label>
            </div>
            <div id="advSeparatorTop" class="adv-separator-top hidden"></div>
        </div>


        <div id="divInfoAccount" runat="server" class="adv-container-right">
            <div class="adv-div-center">
                <div class="adv-element-center">
                    <asp:Image ID="imgAClient" runat="server" CssClass="adv-image-client" />
                </div>
                <div class="adv-element-center">
                    <asp:Label ID="lblTitleName" class="adv-title-name" runat="server"></asp:Label>
                </div>
                <div class="adv-element-data-center">
                    <asp:Label CssClass="adv-title-mini" ID="lblTypeUser" runat="server"></asp:Label>
                </div>
                <div class="adv-element-data-center">
                    <asp:Label ID="lblDataPublicationYear" runat="server"></asp:Label>
                </div>
                <div class="adv-element-phone-center">
                    <asp:Button ID="btnShowPhone" CssClass="adv-btnShowPhone" Text="Показать телефон" runat="server" OnClientClick="openPopup(); return false;" />
                </div>
                <asp:Panel ID="pnlPopup" runat="server" CssClass="modal">
                    <div class="modal-content width-300">
                        <span class="close" onclick="closePopup()">&times;</span>
                        <asp:Label class="adv-title-name" ID="lblPhoneNumber" runat="server"></asp:Label>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </form>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            function doNotScrollBody() {
                var body = document.getElementById('body');
                var hidden = document.getElementById('pnlPopup');

                if (hidden.style.display === 'none' || hidden.style.display === '') {
                    body.style.overflow = '';
                } else {
                    body.style.overflow = 'hidden';
                }
            }

            // Initial check when the page loads
            doNotScrollBody();

            // Create an observer instance to monitor changes in the display property
            var observer = new MutationObserver(doNotScrollBody);

            // Configuration of the observer
            var config = { attributes: true, attributeFilter: ['style'] };

            // Pass the target node and observer options
            observer.observe(document.getElementById('pnlPopup'), config);
        });
    </script>    <%-- Запрет скролла при открытом модальном окне --%>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            function isMobile() {
                return /Mobi|Android/i.test(navigator.userAgent);
            }

            function applyRoundedCorners() {
                var hidden = document.getElementById('divInfoAccount');
                var advContainer = document.getElementById('advContainerLeft');
                if (isMobile() && hidden.style.display === 'none' && window.innerWidth >= 481) {
                    advContainer.classList.add('rounded-corners');
                } else {
                    advContainer.classList.remove('rounded-corners');
                }
            }

            // Initial check when the page loads
            applyRoundedCorners();

            // Check when the window is resized
            window.addEventListener('resize', applyRoundedCorners);
        });
    </script>    <%-- Скругление углов левого контейнера в мобилке --%>


    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var modal = document.getElementById('<%= pnlPopup.ClientID %>');

            function openPopup() {
                var isUserAuthenticated = <%= currentUser == null ? "false" : "true" %>;

                if (!isUserAuthenticated) {
                    $.ajax({
                        type: "POST",
                        url: "Adv.aspx/btnChangeValueOfPage",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            window.location.href = '<%= ResolveUrl("~/Pages/Authorization") %>';
                        },
                        error: function (xhr, status, error) {
                            console.error(xhr.responseText);
                            alert("Произошла ошибка при получении имени пользователя.");
                        }
                    });

                    return false;
                }
                else {
                    if (modal && !modal.classList.contains('show')) {
                        modal.style.display = 'flex';
                        modal.style.justifyContent = 'center';
                        // Добавляем класс через setTimeout, чтобы анимация началась с задержкой
                        setTimeout(function () {
                            modal.classList.add('show');
                            // Добавляем обработчик события transitionend для завершения анимации
                            modal.addEventListener('transitionend', onTransitionEnd);
                        }, 10);
                    }
                    return false;
                }
        }

        function closePopup() {
            if (modal && modal.classList.contains('show')) {
                modal.classList.remove('show');
                // Добавляем обработчик события transitionend для завершения анимации
                modal.addEventListener('transitionend', onTransitionEnd);
            }
        }

        function onTransitionEnd() {
            // Убираем обработчик события transitionend после его выполнения,
            // чтобы он не вызывался повторно при следующем открытии/закрытии
            modal.removeEventListener('transitionend', onTransitionEnd);
            // После завершения анимации скрываем или показываем модальное окно
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

        // Делаем функции глобальными, чтобы их можно было вызывать из других скриптов
        window.openPopup = openPopup;
        window.closePopup = closePopup;
    });
    </script>    <%-- Открытие модального окна с номером телефона --%>









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