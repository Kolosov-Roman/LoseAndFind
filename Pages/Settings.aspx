<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="LoseAndFind.Settings" %>

<!DOCTYPE html>

<html lang="ru">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Личный кабинет - Настройки аккаунта - Lose and Find</title>
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


    <%--                                                          Верхняя часть                                                                --%>









    <form id="settings" class="set-formm" runat="server" autocomplete="off">
        <div class="set-form">
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
                    <div data-section-id="divMyAds" class="set-sidebar-item">
                        <asp:Label runat="server">Мои объявления</asp:Label>
                    </div>
                    <div data-section-id="divMessages" class="set-sidebar-item">
                        <asp:Label runat="server">Сообщения</asp:Label>
                    </div>
                    <div data-section-id="divAdsInLikes" onclick="setOpacity();" class="set-sidebar-item">
                        <asp:Label runat="server">Избранное</asp:Label>
                    </div>
                    <div data-section-id="divBells" class="set-sidebar-item">
                        <asp:Label runat="server">Уведомления</asp:Label>
                    </div>
                </div>
            </div>


            <div class="set-right-container">
                <div class="set-sidebar" id="divAccount">    <%-- Информация об аккаунте --%>
                    <h3 class="set-title-margin">Информация об аккаунте</h3>
                    <div class="set-all">
                        <div class="set-account-1">
                            <div class="set-horizontal-namemail" id="divShowingSetAccount" runat="server">
                                <asp:Label ClientIDMode="Static" ID="lblNameSidebar" runat="server"></asp:Label>
                                <asp:TextBox ClientIDMode="Static" ID="tbNameSidebar" runat="server" class="set-form-control placeholder-red" placeholder="Имя пользователя" MaxLength="100" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnChangeName" OnClientClick="btnChangeName_Click(); return false;" ImageUrl="~/Resources/edit.png" runat="server" CssClass="set-save-data" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnSaveName" OnClientClick="btnSaveName_Click(); return false;" ImageUrl="~/Resources/save.png" runat="server" CssClass="set-save-data" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnCancelName" OnClientClick="btnCancelName_Click(); return false;" ImageUrl="~/Resources/cancel.png" runat="server" CssClass="set-save-data" />
                            </div>
                            <div class="set-horizontal-namemail">
                                <asp:Label ClientIDMode="Static" ID="lblMailSidebar" runat="server"></asp:Label>
                                <asp:TextBox ClientIDMode="Static" ID="tbMailSidebar" runat="server" class="set-form-control placeholder-red" placeholder="Email" MaxLength="100" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnChangeMail" OnClientClick="btnChangeMail_Click(); return false;" ImageUrl="~/Resources/edit.png" runat="server" CssClass="set-save-data" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnSaveMail" OnClientClick="btnSaveMail_Click(); return false;" ImageUrl="~/Resources/save.png" runat="server" CssClass="set-save-data" />
                                <asp:ImageButton ClientIDMode="Static" ID="btnCancelMail" OnClientClick="btnCancelMail_Click(); return false;" ImageUrl="~/Resources/cancel.png" runat="server" CssClass="set-save-data" />
                            </div>
                            <div class="set-horizontal-label-none">
                                <asp:Label ID="lblNumberPhone" runat="server"></asp:Label>
                            </div>
                            <div class="set-horizontal-label-none">
                                <asp:Label ID="lblTypeUserSidebar" runat="server"></asp:Label>
                            </div>
                            <div class="set-horizontal-label-none">
                                <asp:Label ID="lblIdSidebar" runat="server"></asp:Label>
                            </div>
                            <div class="set-horizontal-label-none">
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
                </div>
                <div class="set-sidebar" id="divSecurity">    <%-- Изменение пароля --%>
                    <div class="set-account-set">
                        <h3 class="set-title-margin">Изменение пароля</h3>
                        <div class="set-horizontal-label">
                            <asp:TextBox type="password" TextMode="Password" autocomplete="new-password" ID="oldPasswordSett" runat="server" class="set-form-control" placeholder="Старый пароль" />
                            <asp:Label ID="lblOldPasswordSett" runat="server" class="set-attention_red"></asp:Label>
                        </div>
                        <div class="set-horizontal-label">
                            <asp:TextBox type="password" ID="newPasswordSett" runat="server" class="set-form-control" placeholder="Новый пароль" />
                            <asp:Label ID="lblNewPasswordSett" runat="server" class="set-attention_red"></asp:Label>
                        </div>
                        <div class="set-horizontal-label">
                            <asp:TextBox type="password" ID="newConfirmPasswordSett" runat="server" class="set-form-control" placeholder="Подтвердите новый пароль" />
                            <asp:Label ID="lblNewConfirmPasswordSett" runat="server" class="set-attention_red"></asp:Label>
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
                    <div runat="server" class="main-container-message-attention" visible="false" id="divMyAdsAttention">
                        <asp:Label CssClass="main-text-attention-hight" runat="server">У вас ещё нет объявлений</asp:Label>
                        <asp:Label CssClass="main-text-attention-low" runat="server">Но это легко исправить - разместите первое</asp:Label>
                        <asp:Button ID="btnMakeAd" OnClick="MakeAd_Click" runat="server" CssClass="myads-btn-make-ad" Text="Разместить объявление" />
                    </div>
                    <div runat="server" class="myads-card-container">
                        <asp:Repeater ID="MyAdsRepeater" runat="server" OnItemDataBound="MyAdsRepeater_ItemDataBound">
                            <ItemTemplate>
                                <div class="ads-card">
                                    <a id="urlImage" class="card-link" runat="server" href='<%# ResolveUrl("~/Pages/Adv?advertisementId=" + Eval("id")) %>'>
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
                                        <asp:Label ID="lblDescriptionAd" Text='<%# Eval("description") %>' CssClass="ads-text-discription" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="set-sidebar" id="divMessages">    <%-- Сообщения --%>
                    <h3 class="set-title-margin">Сообщения</h3>
                </div>
                <div class="set-sidebar" id="divAdsInLikes">    <%-- Избранное --%>
                    <h3 class="set-title-margin">Избранное</h3>
                    <div runat="server" class="main-container-message-attention" visible="false" id="divAdsInLikesAttention">
                        <asp:Label CssClass="main-text-attention-hight" runat="server">У вас ещё нет избранных</asp:Label>
                        <asp:Label CssClass="main-text-attention-low" runat="server">Но это легко исправить - добавьте первое</asp:Label>
                        <asp:Button runat="server" ID="btnAds" OnClick="Ads_Click" CssClass="myads-btn-make-ad" Text="Перейти к объявлениям" />
                    </div>
                    <div class="ads-card-container-settings">
                        <asp:Repeater ID="AdsInLikeRepeater" runat="server" OnItemDataBound="AdsInLikeRepeater_ItemDataBound">
                            <ItemTemplate>
                                <div class="ads-card">
                                    <a id="urlImage" class="card-link" runat="server" href='<%# ResolveUrl("~/Pages/Adv?advertisementId=" + Eval("id")) %>'>
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
                                        <asp:Label ID="lblDescriptionAd" Text='<%# Eval("description") %>' Visible='<%# Eval("idStatus").ToString() != "2" %>' CssClass="ads-text-discription" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="set-sidebar" id="divBells">    <%-- Уведомления --%>
                    <h3 class="set-title-margin">Уведомления</h3>
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


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


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

        document.addEventListener("DOMContentLoaded", function () {
            btnCancelName.style.display = 'none';
            btnCancelMail.style.display = 'none';
            btnSaveName.style.display = 'none';
            btnSaveMail.style.display = 'none';
            tbNameSidebar.style.display = 'none';
            tbMailSidebar.style.display = 'none';
        });

        function btnChangeName_Click() {
            $.ajax({
                type: "POST",
                url: "Settings.aspx/btnChangeName_Click",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var currentUserName = response.d;

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
                    alert("Произошла ошибка при получении имени пользователя.");
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
                    alert("Произошла ошибка при получении имени пользователя.");
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
                    alert("Произошла ошибка при получении имени пользователя.");
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
                    alert("Произошла ошибка при получении имени пользователя.");
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
                    alert("Произошла ошибка при получении имени пользователя.");
                }
            });
        }
</script>    <%-- Изменение имени и почты --%>


    <script>
        function setOpacity() {
            var ads = document.getElementsByClassName("favourite");
            Array.from(ads).forEach(ad => {
                if (ad.getAttribute("data-style") == 1) {
                    ad.classList.add("adinlike-deleted-opacity");
                }
            });
        }
    </script>    <%-- Сделать фон изображения объявления сероватым, в случае снятии объявления с публикации --%>


    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        // Проверяем наличие параметра message в URL-адресе
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');
        if (message) {
            // Показываем сообщение
            showMessage(message);
            console.log('Message from URL:', message);

            // Удаляем параметр message из URL
            urlParams.delete('message');
            window.history.replaceState({}, document.title, window.location.pathname);
        }

        // Проверяем наличие сообщения в localStorage при загрузке страницы
        var deletionMessage = localStorage.getItem('deletionMessage');
        if (deletionMessage) {
            // Удаляем сообщение из localStorage перед его показом
            localStorage.removeItem('deletionMessage');
            console.log('Found and removed deletionMessage from localStorage:', deletionMessage);
            showMessage(deletionMessage);
        }

        // Отслеживаем изменения в localStorage
        window.addEventListener('storage', function (event) {
            if (event.key === 'deletionMessage' && event.newValue) {
                // Удаляем сообщение из localStorage перед его показом
                localStorage.removeItem('deletionMessage');
                console.log('Detected deletionMessage change in localStorage:', event.newValue);
                showMessage(event.newValue);
            }
        });
    });

    function showMessage(message) {
        console.log('Displaying message:', message);
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
                    console.log('Message hidden');
                }, 1000); // Время для завершения анимации скрытия (1 секунда)
            }, 4000); // Через 4000 миллисекунд (4 секунды)
        } else {
            console.log('Message container not found');
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
    document.addEventListener("DOMContentLoaded", function () {
        function showSection(sectionId, element) {
            console.log("Switching to section:", sectionId); // Отладочное сообщение
            var sidebarItems = document.getElementsByClassName('set-sidebar-item');
            var sections = document.getElementsByClassName('set-sidebar');

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
            if (activeSection) {
                activeSection.style.display = 'block';
            } else {
                console.warn("Section not found:", sectionId); // Отладочное сообщение
            }

            // Добавить класс 'set-active' к выбранному пункту меню
            if (element) {
                element.classList.add('set-active');
            }

            // Обновить URL без перезагрузки страницы
            var newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname + '?section=' + sectionId;
            window.history.replaceState({ path: newUrl }, '', newUrl);

            // Выполнить дополнительные действия, если вкладка "Избранное"
            if (sectionId === 'divAdsInLikes') {
                setOpacity();
            }
        }

        // Получаем параметры запроса из URL
        const urlParams = new URLSearchParams(window.location.search);
        const section = urlParams.get('section');
        console.log("URL section parameter:", section); // Отладочное сообщение

        console.log("Current URL:", window.location.href); // Дополнительное отладочное сообщение
        console.log("URL Params:", urlParams.toString()); // Дополнительное отладочное сообщение

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

        // Выполняем дополнительные действия при загрузке страницы, если выбрана секция "Избранное"
        if (section === 'divAdsInLikes') {
            setOpacity();
        }

        // Чтение сообщения из localStorage
        const message = localStorage.getItem('closeAdvMessage');
        if (message) {
            alert(message); // Или используйте другой способ отображения сообщения
            localStorage.removeItem('closeAdvMessage'); // Удаляем сообщение из localStorage после отображения
        }
    });

    function setOpacity() {
        // Сделать фон изображения объявления сероватым, в случае снятия объявления с публикации
        var ads = document.getElementsByClassName("favourite");
        Array.from(ads).forEach(ad => {
            if (ad.getAttribute("data-style") == 1) {
                ad.classList.add("adinlike-deleted-opacity");
            }
        });
        console.log('setOpacity called');
    }
</script>    <%-- Загрузка вкладок в Settings --%>


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
                        if (response.d) { // Проверка ответа от сервера
                            lblSaveOkSecurity.innerText = "Пароль изменён";
                            // Очистите поля ввода
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
            console.log("adId:", adId);  // Проверяем значение adId
            $.ajax({
                type: "POST",
                url: "Settings.aspx/btnAddInLikes_Click",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ adId: adId }),
                dataType: "json",
                success: function (response) {
                    // Обработка успешного ответа
                    if (response.d) {
                        $(button).css('background-image', 'url("/Resources/heartFull.png")'); // Устанавливаем изображение для true
                        console.log("Сердечко полное");
                    } else {
                        $(button).css('background-image', 'url("/Resources/heartEmpty.png")'); // Устанавливаем изображение для false
                        console.log("Сердечко пустое");
                    }
                },
                error: function (xhr, status, error) {
                    // Обработка ошибки
                    console.error(xhr.responseText);
                    alert("Произошла ошибка при выполнении запроса.");
                }
            });
        }
    </script>    <%-- Заполнение сердечка --%>









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