<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="LoseAndFind.Settings" %>

<!DOCTYPE html>

<html lang="ru">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minimum-scale=1" />
    <title>Личный кабинет - Lose and Find</title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />

    <% if ((string)Page.Items["DeviceType"] == "mobile")
        { %>
    <link rel="stylesheet" href="/Content/Site_m.css" />
    <% }
        else
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


    <%--                                                          Верхняя часть                                                                --%>









    <form id="set" class="set-form" runat="server" autocomplete="off">
        <asp:Button style="display: none" ID="hiddenButton" runat="server" OnClick="LinkButtonAd_Click" />
        <div class="set">
            <div class="set-left-container">
                <div class="set-account">
                    <asp:Image ID="imgClientAccount" runat="server" CssClass="set-image"></asp:Image>
                    <asp:Label ID="lblNameAccount" class="adv-title-name" runat="server"></asp:Label>
                    <asp:Label ID="lblTypeUserAccount" runat="server"></asp:Label>
                    <asp:Label ID="lblDataRegAccount" runat="server"></asp:Label>
                </div>
                <div class="set-sidebar-menu">
                    <div data-section-id="divAccount" class="set-sidebar-item">
                        <asp:Label runat="server">Аккаунт</asp:Label>
                    </div>
                    <div data-section-id="divSecurity" class="set-sidebar-item">
                        <asp:Label runat="server">Безопасность</asp:Label>
                    </div>
                    <div class="set-separator"></div>
                    <div data-section-id="divMyAds" onclick="setOpacityMyAds();" class="set-sidebar-item">
                        <asp:Label runat="server">Мои объявления</asp:Label>
                    </div>
                    <div data-section-id="divMessages" class="set-sidebar-item">
                        <asp:Label runat="server">Сообщения</asp:Label>
                    </div>
                    <div data-section-id="divAdsInLikes" class="set-sidebar-item">
                        <asp:Label runat="server">Избранное</asp:Label>
                    </div>
                    <div data-section-id="divBells" class="set-sidebar-item">
                        <asp:Label runat="server">Уведомления</asp:Label>
                    </div>
                    <div class="set-separator"></div>
                    <div data-section-id="divHelp" class="set-sidebar-item">
                        <asp:Label runat="server">Обратная связь</asp:Label>
                    </div>
                    <div data-section-id="divBlog" class="set-sidebar-item">
                        <asp:Label runat="server">Блог</asp:Label>
                    </div>
                </div>
            </div>


            <div class="set-right-container">
                <div class="set-sidebar" id="divAccount">    <%-- Настройки профиля --%>
                    <h3 class="set-title-margin">Настройки профиля</h3>
                    <div class="set-all">
                        <div class="set-account-1">
                            <div class="set-horizontal-namemail" runat="server">
                                <asp:Label ClientIDMode="Static" ID="lblNameSidebar" runat="server"></asp:Label>
                                <asp:TextBox ClientIDMode="Static" ID="tbNameSidebar" runat="server" class="set-form-control placeholder-red" placeholder="Имя пользователя" MaxLength="100" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnChangeName" OnClientClick="btnChangeName_Click(); return false;" ImageUrl="~/Resources/edit.png" runat="server" CssClass="set-save-data" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnSaveName" OnClientClick="btnSaveName_Click(); return false;" ImageUrl="~/Resources/save.svg" runat="server" CssClass="set-save-data" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnCancelName" OnClientClick="btnCancelName_Click(); return false;" ImageUrl="~/Resources/cancel.svg" runat="server" CssClass="set-save-data" />
                            </div>
                            <div class="set-horizontal-namemail">
                                <asp:Label ClientIDMode="Static" ID="lblMailSidebar" runat="server"></asp:Label>
                                <asp:TextBox ClientIDMode="Static" ID="tbMailSidebar" runat="server" class="set-form-control placeholder-red" placeholder="Email" MaxLength="100" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnChangeMail" OnClientClick="btnChangeMail_Click(); return false;" ImageUrl="~/Resources/edit.png" runat="server" CssClass="set-save-data" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnSaveMail" OnClientClick="btnSaveMail_Click(); return false;" ImageUrl="~/Resources/save.svg" runat="server" CssClass="set-save-data" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnCancelMail" OnClientClick="btnCancelMail_Click(); return false;" ImageUrl="~/Resources/cancel.svg" runat="server" CssClass="set-save-data" />
                            </div>
                            <div class="set-horizontal-label">
                                <asp:Label ID="lblNumberPhone" runat="server"></asp:Label>
                            </div>
                            <div class="set-horizontal-label">
                                <asp:Label ID="lblTypeUserSidebar" runat="server"></asp:Label>
                            </div>
                            <div class="set-horizontal-label">
                                <asp:Label ID="lblIdSidebar" runat="server"></asp:Label>
                            </div>
                            <div class="set-horizontal-label">
                                <asp:Label ID="lblDateRegSidebar" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="set-sidebar-photo">
                            <div id="fileUploadWrapperr" class="file-upload-wrapper">
                                <asp:FileUpload class="file-upload-wrapper" onchange="checkFileFormat()" ID="fileUploadImp" runat="server" />
                                <asp:Image class="file-upload-wrapper" ID="imgClientChange" runat="server" />
                            </div>
                            <asp:Button ID="btnSavePhotoClient" OnClick="imgClientChange_Click" Text="Сохранить" CssClass="set-save-photo" runat="server" />
                        </div>
                    </div>
                    <div id="setSeparatorCenter" class="set-separator-center"></div>
                    <div data-section-id="divHelp" class="set-sidebar-item hidden">
                        <asp:Label runat="server">Обратная связь</asp:Label>
                    </div>
                    <div data-section-id="divBlog" class="set-sidebar-item hidden">
                        <asp:Label runat="server">Блог</asp:Label>
                    </div>
                    <div class="set-separator-center hidden"></div>
                    <div class="set-dno">
                        <asp:Button ID="exitAccount" OnClick="exitAccount_Click" Text="Выйти из аккаунта" CssClass="set-exitAccount" runat="server" />
                        <asp:Button ID="deleteAccount" OnClick="deleteAccount_Click" Text="Удалить аккаунт" CssClass="set-deleteAccount" runat="server" />
                    </div>
                </div>
                <div class="set-sidebar" id="divSecurity">    <%-- Изменение пароля --%>
                    <div class="set-account-set">
                        <h3 class="set-title-margin">Изменение пароля</h3>
                        <div class="set-horizontal-label">
                            <asp:TextBox type="password" TextMode="Password" autocomplete="new-password" ID="oldPasswordSett" runat="server" class="set-form-control" placeholder="Старый пароль" />
                            <asp:Label ID="lblOldPasswordSett" runat="server" class="set-attention-red"></asp:Label>
                        </div>
                        <div class="set-horizontal-label">
                            <asp:TextBox type="password" ID="newPasswordSett" runat="server" class="set-form-control" placeholder="Новый пароль" />
                            <asp:Label ID="lblNewPasswordSett" runat="server" class="set-attention-red"></asp:Label>
                        </div>
                        <div class="set-horizontal-label">
                            <asp:TextBox type="password" ID="newConfirmPasswordSett" runat="server" class="set-form-control" placeholder="Подтвердите новый пароль" />
                            <asp:Label ID="lblNewConfirmPasswordSett" runat="server" class="set-attention-red"></asp:Label>
                        </div>
                        <div class="set-save-center">
                            <asp:Label ID="lblSaveOkSecuritySett" runat="server" class="attention_green"></asp:Label>
                            <asp:Button ID="btnChangePassword" runat="server" Text="Сохранить" CssClass="set-save-button" />
                        </div>
                    </div>
                </div>
                <div class="set-sidebar" id="divMyAds">
                    <%-- Мои объявления --%>
                    <div class="message-right">
                        <h3 class="set-title-margin">Мои объявления</h3>
                        <asp:Label runat="server" ID="message" class="message-container-center"></asp:Label>
                    </div>
                    <div class="divActivePassiveAdv">
                        <a href="javascript:void(0);" id="activeTabLink" class="active active-tab tab" onclick="showTab('active')">Активные</a>
                        <a href="javascript:void(0);" id="archiveTabLink" class="passive archive-tab tab" onclick="showTab('archived')">Архивные</a>
                    </div>
                    <div class="separator-container">
                        <div class="indicator"></div>
                        <div style="height: 50px;">
                            <div class="separator"></div>
                            <div class="separator-1"></div>
                        </div>
                    </div>

                    <div id="divActiveAds">
                        <%-- Активные --%>
                        <div runat="server" class="main-container-message-attention" id="divMyAdsAttention">
                            <asp:Label CssClass="main-text-attention-hight" runat="server">У вас ещё нет объявлений</asp:Label>
                            <asp:Label CssClass="main-text-attention-low" runat="server">Но это легко исправить - разместите первое</asp:Label>
                            <asp:Button ID="btnMakeAd" OnClick="MakeAd_Click" runat="server" CssClass="myads-btn-make-ad" Text="Разместить объявление" />
                        </div>
                        <div runat="server" class="myads-card-container">
                            <asp:Repeater ID="MyAdsRepeater" runat="server" OnItemDataBound="MyAdsRepeater_ItemDataBound">
                                <ItemTemplate>
                                    <div class="ads-card">
                                        <a id="urlImage" class="ads-full-size" runat="server" href='<%# ResolveUrl("~/Pages/Adv?advertisementId=" + Eval("id")) %>'>
                                            <div class="ads-card-img">
                                                <asp:Image ID="imgAnimal" class="ads-img" runat="server" />
                                            </div>
                                        </a>
                                        <div class="ads-card-charact">
                                            <div class="ads-card-title-heart">
                                                <a id="urlTitle" class="ads-text-title" runat="server" href='<%# ResolveUrl("~/Pages/Adv?advertisementId=" + Eval("id")) %>'>
                                                    <asp:Label ID="lblTitleAd" Text='<%# Eval("title") %>' runat="server"></asp:Label>
                                                </a>
                                            </div>
                                            <asp:Label ID="lblTownAd" Text='<%# Eval("town") %>' CssClass="ads-text-town" runat="server"></asp:Label>
                                            <asp:Label ID="lblDataPublicationAd" Text='<%# FormatPublishDateToMinute((DateTime)Eval("dataPublication")) %>' CssClass="ads-text-time" runat="server"></asp:Label>
                                            <asp:Label ID="lblDescriptionAd" Text='<%# Eval("description") %>' CssClass="ads-text-discription hidden-m" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div id="divArchivedAds" class="hidden hidden-m">
                        <%-- Пассивные --%>
                        <div runat="server" class="main-container-message-attention" id="divMyArchivedAdsAttention">
                            <asp:Label CssClass="main-text-attention-hight" runat="server">У вас нет архивных объявлений</asp:Label>
                        </div>
                        <div runat="server" class="myads-card-container">
                            <asp:Repeater ID="ArchivedAdsRepeater" runat="server" OnItemDataBound="ArchivedAdsRepeater_ItemDataBound">
                                <ItemTemplate>
                                    <div class="ads-card">
                                        <a id="urlImage" class="ads-full-size" runat="server" href='<%# ResolveUrl("~/Pages/Adv?advertisementId=" + Eval("id")) %>'>
                                            <div id="status" class="ads-card-img favourite" data-style="<%# Eval("idStatus").ToString() == "2" ? 1 : 0 %>">
                                                <asp:Image ID="imgAnimal" class="ads-img" runat="server" />
                                            </div>
                                        </a>
                                        <div class="ads-card-charact">
                                            <div class="ads-card-title-heart">
                                                <a id="urlTitle" class="ads-text-title" runat="server" href='<%# ResolveUrl("~/Pages/Adv?advertisementId=" + Eval("id")) %>'>
                                                    <asp:Label ID="lblTitleAd" Text='<%# Eval("title") %>' runat="server"></asp:Label>
                                                </a>
                                            </div>
                                            <asp:Label ID="lblTownAd" Text='<%# Eval("town") %>' CssClass="ads-text-town" runat="server"></asp:Label>
                                            <asp:Label ID="lblDataPublicationAd" Text='<%# FormatPublishDateToMinute((DateTime)Eval("dataPublication")) %>' CssClass="ads-text-time" runat="server"></asp:Label>
                                            <asp:Label ID="lblDescriptionAd" Text='<%# Eval("description") %>' CssClass="ads-text-discription hidden-m" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <div class="set-sidebar" id="divMessages">    <%-- Сообщения --%>
                    <h3 class="set-title-margin">Сообщения</h3>
                </div>
                <div class="set-sidebar" id="divAdsInLikes">    <%-- Избранное --%>
                    <h3 class="set-title-margin">Избранное</h3>
                    <div runat="server" class="main-container-message-attention" id="divAdsInLikesAttention">
                        <asp:Label CssClass="main-text-attention-hight" runat="server">У вас ещё нет избранных</asp:Label>
                        <asp:Label CssClass="main-text-attention-low" runat="server">Но это легко исправить - добавьте первое</asp:Label>
                        <asp:Button runat="server" ID="btnAds" OnClick="Ads_Click" CssClass="myads-btn-make-ad" Text="Перейти к объявлениям" />
                    </div>
                    <div class="ads-card-container-settings">
                        <asp:Repeater ID="AdsInLikeRepeater" runat="server" OnItemDataBound="AdsInLikeRepeater_ItemDataBound">
                            <ItemTemplate>
                                <div class="ads-card">
                                    <a id="urlImage" class="ads-full-size" runat="server" href='<%# ResolveUrl("~/Pages/Adv?advertisementId=" + Eval("id")) %>'>
                                        <div id="status" class="ads-card-img favourite" data-style="<%# Eval("idStatus").ToString() == "2" ? 1 : 0 %>">
                                            <asp:Image ID="imgAnimal" class="ads-img" runat="server" />
                                        </div>
                                    </a>
                                    <div class="ads-card-charact">
                                        <div class="ads-card-title-heart">
                                            <a id="urlTitle" class="ads-text-title" runat="server" href='<%# ResolveUrl("~/Pages/Adv?advertisementId=" + Eval("id")) %>'>
                                                <asp:Label ID="lblTitleAd" Text='<%# Eval("title") %>' runat="server"></asp:Label>
                                            </a>
                                            <asp:Button runat="server" ID="btnAddInLikes" CssClass="ads-card-heart" OnClientClick='<%# "btnAddInLikes(this); return false;" %>' />
                                        </div>
                                        <asp:Label ID="lblTownAd" Text='<%# Eval("town") %>' CssClass="ads-text-town" runat="server"></asp:Label>
                                        <asp:Label ID="lblDataPublicationAd" Text='<%# FormatPublishDateToMinute((DateTime)Eval("dataPublication")) %>' CssClass="ads-text-time" runat="server"></asp:Label>
                                        <asp:Label ID="lblDescriptionAd" Text='<%# Eval("description") %>' Visible='<%# Eval("idStatus").ToString() != "2" %>' CssClass="ads-text-discription hidden-m" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="set-sidebar" id="divBells">    <%-- Уведомления --%>
                    <h3 class="set-title-margin">Уведомления</h3>
                </div>
                <div class="set-sidebar" id="divHelp">    <%-- Обратная связь --%>
                    <h3 class="set-title-margin">Обратная связь</h3>
                    <div runat="server" class="set-divHelp">
                        <div class="set-labels-main">
                            <asp:Label CssClass="set-main-text-attention-hight" runat="server">Вопросы, претензии, пожелания</asp:Label>
                            <asp:Label CssClass="set-main-text-attention-low" runat="server">Здесь Вы можете рассказать о том, что можно добавить или улучшить, а также задать интересующие вас вопросы. Мы пришлём письмо с ответом на вашу почту в ближайшее время.</asp:Label>
                        </div>
                        <div id="setDivElementsHelp" class="set-divElementsHelp">
                            <asp:Label ID="lblHelpRed" runat="server" class="set-attention-red width-300"></asp:Label>
                            <asp:TextBox ID="tbHelp" runat="server" class="set-help-email" placeholder="Ваша почта" />
                            <asp:TextBox ID="txtDescription" runat="server" class="set-description-input" TextMode="MultiLine" placeholder="Ваш вопрос, претензия или пожелание"></asp:TextBox>
                            <asp:Button runat="server" ID="btnHelp" OnClientClick="btnHelp_Click(); return false;" CssClass="set-btnHelp" Text="Отправить" />
                        </div>
                        <asp:Label CssClass="set-message-container-center" ID="lblResultEnter" runat="server">Спасибо за обратную связь, вы прекрасны!</asp:Label>
                    </div>
                </div>
                <div class="set-sidebar" id="divBlog">    <%-- Блог --%>
                    <h3 class="set-title-margin">Блог</h3>
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
                            <asp:Button ID="btnCheckMail" runat="server" Text="Подтвердить" OnClientClick="btnCheckMail_Click(); return false;" CssClass="authorization-button" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </form>


    <script>
        function handleEnterKeyOldPassword(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                document.getElementById('newPasswordSett').focus();
            }
        }
        function handleEnterKeyNewPassword(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                document.getElementById('newConfirmPasswordSett').focus();
            }
        }
        function handleEnterKeyConfirmPassword(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                document.getElementById('newConfirmPasswordSett').blur();
                document.getElementById('btnChangePassword').click();
            }
        }
        function handleEnterKeyChangeName(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                document.getElementById('btnSaveName').click();
            }
        }
        function handleEnterKeyChangeMail(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                document.getElementById('btnSaveMail').click();
            }
        }
        function handleEnterKeyCode(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                document.getElementById('tbCode').blur();
                document.getElementById('btnCheckMail').click();
            }
        }
        function handleEnterKeyNextTxtDescription(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                document.getElementById('txtDescription').focus();
            }
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            const tbNameSidebar = document.getElementById('tbNameSidebar');
            const tbMailSidebar = document.getElementById('tbMailSidebar');
            const oldPasswordSett = document.getElementById('oldPasswordSett');
            const newPasswordSett = document.getElementById('newPasswordSett');
            const newConfirmPasswordSett = document.getElementById('newConfirmPasswordSett');
            const tbCode = document.getElementById('tbCode');
            const tbHelp = document.getElementById('tbHelp');

            tbNameSidebar.addEventListener('keydown', handleEnterKeyChangeName);
            tbMailSidebar.addEventListener('keydown', handleEnterKeyChangeMail);
            oldPasswordSett.addEventListener('keydown', handleEnterKeyOldPassword);
            newPasswordSett.addEventListener('keydown', handleEnterKeyNewPassword);
            newConfirmPasswordSett.addEventListener('keydown', handleEnterKeyConfirmPassword);
            tbCode.addEventListener('keydown', handleEnterKeyCode);
            tbHelp.addEventListener('keydown', handleEnterKeyNextTxtDescription);
        });
    </script>    <%-- События клика по enter --%>


    <script>
        document.addEventListener("DOMContentLoaded", function () {
            $('#btnCancelName, #btnCancelMail, #btnSaveName, #btnSaveMail, #tbNameSidebar, #tbMailSidebar').hide();

            const tabs = document.querySelectorAll('.tab');
            const indicator = document.querySelector('.indicator');

            tabs.forEach(tab => {
                tab.addEventListener('click', function () {
                    moveIndicator(tab);
                    setActiveTab(tab);
                    saveActiveTab(tab.id);
                });
            });

            function moveIndicator(tab) {
                const tabRect = tab.getBoundingClientRect();
                const tabsRect = tab.parentNode.getBoundingClientRect();

                const leftPosition = tabRect.left - tabsRect.left;
                const width = tab.offsetWidth;

                indicator.style.width = `${width}px`;
                indicator.style.transform = `translateX(${leftPosition}px)`;
            }

            function setActiveTab(activeTab) {
                tabs.forEach(tab => {
                    tab.classList.remove('active');
                    tab.classList.add('passive');
                });
                activeTab.classList.add('active');
                activeTab.classList.remove('passive');
                showTab(activeTab.getAttribute('onclick').split("'")[1]);
            }

            function saveActiveTab(tabId) {
                localStorage.setItem('activeTab', tabId);
            }

            function getActiveTab() {
                return localStorage.getItem('activeTab');
            }

            // Установка начальной позиции индикатора после полной загрузки страницы
            window.addEventListener('load', function () {
                const activeTabId = getActiveTab();
                const initialTab = activeTabId ? document.getElementById(activeTabId) : document.querySelector('.tab');
                moveIndicator(initialTab);
                setActiveTab(initialTab);
            });
        });

        function showTab(tabName) {
            const tabContents = document.querySelectorAll('.tab-content');
            tabContents.forEach(content => {
                content.classList.remove('active-content');
            });
            document.getElementById(tabName).classList.add('active-content');
        }
    </script>    <%-- Отображение архивных и активных объявлений --%>


    <script type="text/javascript">
        function showTab(tabName) {
            var activeTab = document.getElementById('divActiveAds');
            var archiveTab = document.getElementById('divArchivedAds');

            var activeLink = document.getElementById('activeTabLink');
            var archiveLink = document.getElementById('archiveTabLink');

            if (tabName === 'active') {
                activeTab.classList.remove('hidden');
                archiveTab.classList.add('hidden');
                activeTab.classList.remove('hidden-m');
                archiveTab.classList.add('hidden-m');

                activeLink.classList.add('active');
                activeLink.classList.remove('passive');
                archiveLink.classList.add('passive');
                archiveLink.classList.remove('active');
            } else {
                activeTab.classList.add('hidden');
                archiveTab.classList.remove('hidden');
                activeTab.classList.add('hidden-m');
                archiveTab.classList.remove('hidden-m');

                activeLink.classList.add('passive');
                activeLink.classList.remove('active');
                archiveLink.classList.add('active');
                archiveLink.classList.remove('passive');
            }
        }
    </script>    <%-- Отображение стилей архивных и активных объявлений --%>


    <script type="text/javascript">
        var lblNameSidebar = document.getElementById('<%= lblNameSidebar.ClientID %>');
        var lblMailSidebar = document.getElementById('<%= lblMailSidebar.ClientID %>');
        var lblNameAccount = document.getElementById('<%= lblNameAccount.ClientID %>');
        var lblCorrectCode = document.getElementById('<%= lblCorrectCode.ClientID %>');

        var btnChangeMail = document.getElementById('<%= btnChangeMail.ClientID %>');
        var btnChangeName = document.getElementById('<%= btnChangeName.ClientID %>');
        var btnCancelMail = document.getElementById('<%= btnCancelMail.ClientID %>');
        var btnCancelName = document.getElementById('<%= btnCancelName.ClientID %>');
        var btnSaveName = document.getElementById('<%= btnSaveName.ClientID %>');
        var btnSaveMail = document.getElementById('<%= btnSaveMail.ClientID %>');

        var tbNameSidebar = document.getElementById('<%= tbNameSidebar.ClientID %>');
        var tbMailSidebar = document.getElementById('<%= tbMailSidebar.ClientID %>');
        var tbCode = document.getElementById('<%= tbCode.ClientID %>');

        function btnChangeName_Click() {
            $.ajax({
                type: "POST",
                url: "Settings.aspx/btnChangeName_Click",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var currentUserName = response.d;

                    setTimeout(function () {
                        tbNameSidebar.focus();
                    });

                    tbNameSidebar.style.borderColor = "black";

                    lblMailSidebar.style.display = 'inline';
                    btnChangeMail.style.display = 'inline';
                    btnCancelMail.style.display = 'none';
                    btnSaveMail.style.display = 'none';
                    tbMailSidebar.style.display = 'none';

                    lblNameSidebar.style.display = 'none';
                    btnChangeName.style.display = 'none';
                    btnCancelName.style.display = 'inline';
                    btnSaveName.style.display = 'inline';

                    tbNameSidebar.style.display = 'inline';
                    tbNameSidebar.value = currentUserName;
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                    alert("Произошла ошибка при получении вашего имени.");
                }
            });
        }

        function btnChangeMail_Click() {
            $.ajax({
                type: "POST",
                url: "Settings.aspx/btnChangeMail_Click",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var currentUserMail = response.d;

                    setTimeout(function () {
                        tbMailSidebar.focus();
                    });

                    lblNameSidebar.style.display = 'inline';
                    btnChangeName.style.display = 'inline';
                    btnCancelName.style.display = 'none';
                    btnSaveName.style.display = 'none';
                    tbNameSidebar.style.display = 'none';

                    lblMailSidebar.style.display = 'none';
                    btnChangeMail.style.display = 'none';
                    btnCancelMail.style.display = 'inline';
                    btnSaveMail.style.display = 'inline';
                    tbMailSidebar.style.display = 'inline';

                    tbMailSidebar.value = currentUserMail;
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                    alert("Произошла ошибка при получении вашей почты.");
                }
            });
        }

        function btnCancelName_Click() {
            lblNameSidebar.style.display = 'inline';
            btnChangeName.style.display = 'inline';
            btnCancelName.style.display = 'none';
            btnSaveName.style.display = 'none';
            tbNameSidebar.style.display = 'none';
        }

        function btnCancelMail_Click() {
            lblMailSidebar.style.display = 'inline';
            btnChangeMail.style.display = 'inline';
            btnCancelMail.style.display = 'none';
            btnSaveMail.style.display = 'none';
            tbMailSidebar.style.display = 'none';
        }

        function btnSaveName_Click() {
            $.ajax({
                type: "POST",
                url: "Settings.aspx/btnSaveName_Click",
                data: JSON.stringify({ tbNameSidebar: tbNameSidebar.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    if (!response.d) {
                        tbNameSidebar.style.borderColor = "red";
                        tbNameSidebar.placeholder = "Введите имя";
                        tbNameSidebar.classList.add('placeholder-red');
                    }
                    if (response.d) {
                        lblNameSidebar.innerText = tbNameSidebar.value;
                        lblNameAccount.innerText = tbNameSidebar.value;
                        tbNameSidebar.style.borderColor = "black";
                        lblNameSidebar.style.display = 'inline';
                        btnChangeName.style.display = 'inline';
                        btnSaveName.style.display = 'none';
                        btnCancelName.style.display = 'none';
                        tbNameSidebar.style.display = 'none';
                    }
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                    alert("Произошла ошибка при записи вашего нового имени.");
                }
            });
        }

        function btnSaveMail_Click() {
            $.ajax({
                type: "POST",
                url: "Settings.aspx/btnSaveMail_Click",
                data: JSON.stringify({ tbMailSidebar: tbMailSidebar.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    if (!response.d) {
                        tbMailSidebar.style.borderColor = "red";
                        tbMailSidebar.placeholder = "Введите почту";
                        tbMailSidebar.classList.add('placeholder-red');
                    }
                    if (response.d) {
                        lblMailSidebar.innerText = tbMailSidebar.value;
                        tbMailSidebar.style.borderColor = "black";
                        lblMailSidebar.style.display = 'inline';
                        btnChangeMail.style.display = 'inline';
                        btnSaveMail.style.display = 'none';
                        btnCancelMail.style.display = 'none';
                        tbMailSidebar.style.display = 'none';
                        openPopup();
                    }
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText, error);
                    alert("Произошла ошибка при отправке кода подтверждения на вашу почту.");
                }
           });
        }

        function btnCheckMail_Click() {
            $.ajax({
                type: "POST",
                url: "Settings.aspx/btnCheckMail_Click",
                data: JSON.stringify({ tbMailSidebar: tbMailSidebar.value, tbCode: tbCode.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    if (!response.d) {
                        lblCorrectCode.innerText = "Код неверный";
                    }
                    if (response.d) {
                        lblMailSidebar.innerText = tbMailSidebar.value;
                        lblMailSidebar.style.display = 'inline';
                        closePopup();
                    }
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText, error);
                    alert("Произошла ошибка при записи вашей новой почты.");
                }
            });
        }
    </script>    <%-- Изменение имени и почты --%>


    <script>
    document.addEventListener("DOMContentLoaded", function () {
        setOpacityMyAds();
    });

    function setOpacityMyAds() {
        var ads = document.getElementsByClassName("favourite");
        Array.from(ads).forEach(ad => {
            if (ad.getAttribute("data-style") == 1) {
                ad.classList.add("adinlike-deleted-opacity");
            }
        });
    }

    const links = document.querySelectorAll('a');
    links.forEach(link => {
        link.addEventListener('click', function () {
            setOpacityMyAds();
        });
    });
</script>    <%-- Сделать фон изображения объявления темнее при снятии с публикации --%>


    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        // Проверяем наличие параметра message в URL-адресе
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');
        if (message) {
            // Показываем сообщение
            showMessage(message);

            // Удаляем параметр message из URL
            urlParams.delete('message');
            window.history.replaceState({}, document.title, window.location.pathname);
        }

        // Проверяем наличие сообщения в localStorage при загрузке страницы
        var deletionMessage = localStorage.getItem('deletionMessage');
        if (deletionMessage) {
            // Удаляем сообщение из localStorage перед его показом
            localStorage.removeItem('deletionMessage');
            showMessage(deletionMessage);
        }

        // Отслеживаем изменения в localStorage
        window.addEventListener('storage', function (event) {
            if (event.key === 'deletionMessage' && event.newValue) {
                // Удаляем сообщение из localStorage перед его показом
                localStorage.removeItem('deletionMessage');
                showMessage(event.newValue);
            }
        });
    });

    function showMessage(message) {
        var messageContainer = document.getElementById('message');
        if (messageContainer) {
            messageContainer.innerText = message;
            messageContainer.style.display = 'block'; // Показываем контейнер
            setTimeout(function () {
                messageContainer.classList.add('show'); // Добавляем класс для показа контейнера
            }, 10); // Немного задержки, чтобы переход сработал

            // Плавное исчезновение
            setTimeout(function () {
                messageContainer.classList.remove('show'); // Плавно скрываем текст
                setTimeout(function () {
                    messageContainer.style.display = 'none'; // Скрываем контейнер после завершения анимации
                }, 1000);
            }, 4000);
        }
    }
</script>    <%-- Отображение сообщения о снятии объявления --%>


    <script>
        window.onload = function () {
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        }
    </script>    <%-- Отмена повторной отправки запроса --%>


    <script>
        var saveButton = document.getElementById('<%= btnSavePhotoClient.ClientID %>');
        document.getElementById('<%= imgClientChange.ClientID %>').addEventListener('click', function () {
            document.getElementById('<%= fileUploadImp.ClientID %>').click();
        });

        document.getElementById('<%= fileUploadImp.ClientID %>').addEventListener('change', function (e) {
            var file = e.target.files[0];
            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('<%= imgClientChange.ClientID %>').src = e.target.result;
                };
                reader.readAsDataURL(file);
                saveButton.style.display = 'block';
            }
        });
</script>    <%-- Загрузка изображения клиента и отображение --%>


    <script type="text/javascript">
            function checkFileFormat() {
                var fileInput = document.getElementById('<%= fileUploadImp.ClientID %>');
                if (fileInput.files.length > 0) {
                    for (var i = 0; i < fileInput.files.length; i++) {
                        var file = fileInput.files[i];
                        var fileName = file.name;
                        var fileExtension = fileName.split('.').pop().toLowerCase();
                        if (fileExtension !== 'jpg' && fileExtension !== 'jpeg') {
                            alert('Файл ' + fileName + ' имеет недопустимый формат. Пожалуйста, выберите файлы с расширением .jpg или .jpeg.');
                            fileInput.value = ''; // Очищаем поле выбора файла
                            fileInput.files = 0;
                            return false;
                        }
                        if (fileInput.files.length > 10) {
                            alert('Количество файлов может быть не более 10.');
                            fileInput.value = ''; // Очищаем поле выбора файла
                            fileInput.files = 0;
                            return false;
                        }
                    }
                }
                return true;
            }
        </script>    <%-- Проверка на jpg --%>


    <script>
        type = "text/javascript"
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


    <script>
        document.addEventListener("DOMContentLoaded", function () {

            function insertAtPosition(parent, child, position) {
                parent.insertBefore(child, parent.children[position - 1]);
            }

            function showSection(sectionId, element) {
                var sidebarItems = document.getElementsByClassName('set-sidebar-item');
                var sections = document.getElementsByClassName('set-sidebar');

                var child = document.querySelector('.set-account-set');
                var parent2 = document.getElementById('divAccount');
                var parent3 = document.getElementById('divSecurity');
                var divAdsInLikesAttention = document.getElementById('divAdsInLikesAttention');
                var body = document.getElementById('body');

                function isMobile() {
                    return /Mobi|Android/i.test(navigator.userAgent);
                }

                function applyRounded() {
                    if (isMobile() && window.innerWidth < 1024 && sectionId === "divSecurity") {
                        parent2.style.display = 'flex';
                    }
                    if (isMobile() && sectionId !== "divSecurity" || window.innerWidth >= 1024) {
                        parent2.style.display = 'none';
                    }
                    if (sectionId === "divAccount") {
                        parent2.style.display = 'flex';
                    }
                    if (isMobile() && window.innerWidth < 768) body.style.backgroundColor = 'white';
                    else body.style.backgroundColor = 'rgb(233, 166, 166)';
                }

                function applyRoundedCorners() {
                    if (isMobile() && window.innerWidth < 1024) {
                        insertAtPosition(parent2, child, 3);
                        if (sectionId === "divHelp") parent2.style.display = 'none';
                    }
                    else if (isMobile()) {
                        parent3.insertBefore(child, parent3.firstChild);
                    }
                }

                applyRoundedCorners();

                window.addEventListener('resize', applyRoundedCorners);
                window.addEventListener('resize', applyRounded);
                window.addEventListener('load', applyRounded);

                // Скрыть все секции
                for (var i = 0; i < sections.length; i++) {
                    sections[i].style.display = 'none';
                }

                // Удалить класс 'set-active' у всех пунктов меню
                for (var i = 0; i < sidebarItems.length; i++) {
                    sidebarItems[i].classList.remove('set-active');
                }

                // Показать выбранную секцию
                var activeSection = document.getElementById(sectionId);
                if (sectionId === "divAccount") {
                    activeSection.style.display = 'flex';
                } else if (activeSection) {
                    activeSection.style.display = 'block';
                }

                if (divAdsInLikesAttention.style.display === 'flex') {
                    activeSection.style.display = 'flex';
                }



                // Добавить класс 'set-active' к выбранному пункту меню
                if (element) {
                    element.classList.add('set-active');
                }

                // Обновить URL без перезагрузки страницы
                var newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname + '?section=' + sectionId;
                window.history.replaceState({ path: newUrl }, '', newUrl);
            }

            // Получаем параметры запроса из URL
            const urlParams = new URLSearchParams(window.location.search);
            const section = urlParams.get('section');

            // Добавляем обработчики событий для элементов с классом 'set-sidebar-item'
            var sidebarItems = document.querySelectorAll('.set-sidebar-item');
            sidebarItems.forEach(function (item) {
                item.addEventListener('click', function () {
                    var sectionId = this.getAttribute('data-section-id');
                    showSection(sectionId, this);
                });
            });

            // Вызываем функцию для отображения секции из параметра запроса или первой секции по умолчанию
            if (section) {
                const selectedElement = document.querySelector(`[data-section-id="${section}"]`);
                if (selectedElement) {
                    showSection(section, selectedElement);
                } else {
                    console.warn("Selected element not found for section:", section); // Отладочное сообщение
                    showSection('divAccount', document.querySelector('.set-sidebar-item'));
                }
            } else {
                showSection('divAccount', document.querySelector('.set-sidebar-item'));
            }

            // Чтение сообщения из localStorage
            const message = localStorage.getItem('closeAdvMessage');
            if (message) {
                alert(message); // Или используйте другой способ отображения сообщения
                localStorage.removeItem('closeAdvMessage'); // Удаляем сообщение из localStorage после отображения
            }
    });
    </script>    <%-- Перемещение блока безопасности и загрузка вкладок в Settings --%>


    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnChangePassword").click(function (event) {
                event.preventDefault(); // предотвращение обновления страницы

                var oldPasswordBool = false;
                var newPasswordBool = false;
                var newConfirmPasswordBool = false;
                var equalsOldAndNewPasswordBool = false;
                var notEqualsPasswordBool = false;

                var oldPassword = document.getElementById('oldPasswordSett');
                var newPassword = document.getElementById('newPasswordSett');
                var newConfirmPassword = document.getElementById('newConfirmPasswordSett');

                var lblOldPassword = document.getElementById('lblOldPasswordSett');
                var lblNewPassword = document.getElementById('lblNewPasswordSett');
                var lblNewConfirmPassword = document.getElementById('lblNewConfirmPasswordSett');
                var lblSaveOkSecurity = document.getElementById('lblSaveOkSecuritySett');

                lblOldPassword.innerText = "";
                lblNewPassword.innerText = "";
                lblNewConfirmPassword.innerText = "";

                lblSaveOkSecurity.innerText = "";

                if (oldPassword.value == newPassword.value && oldPassword.value != "" && newConfirmPassword.value != "") {
                    lblNewPassword.innerText = "Старый и новый пароли совпадают";
                    equalsOldAndNewPasswordBool = true;
                }
                else lblNewPassword.innerText = "";

                if (newPassword.value != newConfirmPassword.value && newPassword.value != "") {
                    lblNewConfirmPassword.innerText = "Пароли не совпадают";
                    notEqualsPasswordBool = true;
                }
                else lblNewConfirmPassword.innerText = "";

                if (oldPassword.value == "") {
                    lblOldPassword.innerText = "Введите старый пароль";
                    oldPasswordBool = true;
                }

                if (newPassword.value == "") {
                    lblNewPassword.innerText = "Введите новый пароль";
                    newPasswordBool = true;
                }

                if (newConfirmPassword.value == "") {
                    lblNewConfirmPassword.innerText = "Повторите новый пароль";
                    newConfirmPasswordBool = true;
                }

                if (oldPasswordBool || newPasswordBool || newConfirmPasswordBool || equalsOldAndNewPasswordBool || notEqualsPasswordBool)
                    return;

                $.ajax({
                    type: "POST",
                    url: "Settings.aspx/ChangePassword",
                    data: JSON.stringify({ oldPassword: oldPassword.value, newPassword: newPassword.value }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            lblSaveOkSecurity.innerText = "Пароль изменён";
                            oldPassword.value = "";
                            newPassword.value = "";
                            newConfirmPassword.value = "";
                        } else {
                            lblOldPassword.innerText = "Старый пароль неверный";
                            return;
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log(xhr.responseText);
                        alert("Error processing request: " + error);
                    }
                });
            });
        });
    </script>    <%-- Проверки смены пароля --%>


    <script type="text/javascript">
        function btnAddInLikes(button) {
            var adId = button.getAttribute('data-adid');

            $.ajax({
                type: "POST",
                url: "Settings.aspx/btnAddInLikes_Click",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ adId: adId }),
                dataType: "json",
                success: function (response) {
                    // Обработка успешного ответа
                    if (response.d) {
                        $(button).css('background-image', 'url("/Resources/heartFull-active.svg")'); // Устанавливаем изображение для true
                        console.log("Сердечко полное");
                    } else {
                        $(button).css('background-image', 'url("/Resources/heartEmpty.png")'); // Устанавливаем изображение для false
                        console.log("Сердечко пустое");
                    }
                },
                error: function (xhr, status, error) {
                    // Обработка ошибки
                    console.error(xhr.responseText);
                    alert("Произошла ошибка при добавлении объявления в избранное.");
                }
            });
        }
    </script>    <%-- Заполнение сердечка --%>


    <script>
        var tbHelp = document.getElementById('tbHelp');
        var txtDescription = document.getElementById('txtDescription');
        var setDivElementsHelp = document.getElementById('setDivElementsHelp');
        var lblResultEnter = document.getElementById('lblResultEnter');
        var lblHelpRed = document.getElementById('lblHelpRed');

        var tbHelp_ = false;
        var txtDescription_ = false;

        function btnHelp_Click() {

            if (tbHelp.value === "") {
                tbHelp.classList.add('placeholder-red');
                tbHelp_ = true;
            }
            else if (!validateEmail(tbHelp.value)) {
                lblHelpRed.innerText = "Введите корректную почту";
                tbHelp_ = true;
            }
            else {
                tbHelp_ = false;
                lblHelpRed.innerText = "";
            }

            if (txtDescription.value === "") {
                txtDescription.classList.add('placeholder-red');
                txtDescription_ = true;
            }
            else txtDescription_ = false;

            if (tbHelp_ || txtDescription_) return false;

            $.ajax({
                type: "POST",
                url: "Settings.aspx/btnHelp_Click",
                data: JSON.stringify({ tbHelp: tbHelp.value, txtDescription: txtDescription.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        setDivElementsHelp.style.display = 'flex';
                        setDivElementsHelp.classList.add('show');

                        setTimeout(function () {
                            setDivElementsHelp.style.display = 'none';
                            lblResultEnter.style.display = 'block';

                            setTimeout(function () {
                                lblResultEnter.classList.add('show');

                                setTimeout(function () {
                                    lblResultEnter.classList.remove('show');

                                    setTimeout(function () {
                                        lblResultEnter.style.display = 'none';
                                        setDivElementsHelp.style.display = 'flex';

                                        tbHelp.value = "";
                                        txtDescription.value = "";
                                        tbHelp.classList.remove('placeholder-red');
                                        txtDescription.classList.remove('placeholder-red');

                                        setTimeout(function () {
                                            setDivElementsHelp.classList.remove('show');
                                        });
                                    }, 500);
                                }, 4000);
                            }, 10);
                        }, 500);
                    }
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                    alert("Произошла ошибка при отправке сообщения.");
                }
            });
        }
    </script>    <%-- Отправка сообщения поддержке --%>


    <script>
        function validateEmail(email) {
            var re = /^[a-zA-Z0-9._%+-]+\u0040[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/;
            return re.test(email);
        }
    </script>    <%-- Проверка почты на корректность ввода --%>










    <%--                                                          Нижняя часть                                                                --%>


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