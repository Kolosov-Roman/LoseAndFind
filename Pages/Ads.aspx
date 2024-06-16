<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ads.aspx.cs" Inherits="LoseAndFind.Ads" %>

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









    <form id="AdsForm" runat="server" class="ads" autocomplete="off">
        <div class="ads-search">
            <asp:TextBox ID="tbSearchTitle" placeholder="Введите название" CssClass="ads-title" runat="server" AutoPostBack="true" OnTextChanged="ShowAllFilters"></asp:TextBox>
        </div>
        <div class="ads-filters-container">
            <asp:DropDownList ID="sortDate" runat="server" CssClass="main-cb" AutoPostBack="True" OnSelectedIndexChanged="ShowAllFilters">
                <asp:ListItem Text="По умолчанию"></asp:ListItem>
                <asp:ListItem Text="По возрастанию"></asp:ListItem>
                <asp:ListItem Text="По убыванию"></asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="filterLoseOrFind" runat="server" CssClass="main-cb" AutoPostBack="True" OnSelectedIndexChanged="ShowAllFilters">
            </asp:DropDownList>
            <asp:DropDownList ID="filterType" runat="server" CssClass="main-cb" AutoPostBack="True" OnSelectedIndexChanged="ChangeDDLType">
            </asp:DropDownList>
            <asp:DropDownList ID="filterBreed" runat="server" CssClass="main-cb" AutoPostBack="True" OnSelectedIndexChanged="ShowAllFilters">
            </asp:DropDownList>
            <asp:DropDownList ID="filterMale" runat="server" CssClass="main-cb" AutoPostBack="True" OnSelectedIndexChanged="ShowAllFilters">
            </asp:DropDownList>
            <asp:DropDownList ID="filterColor" runat="server" CssClass="main-cb" AutoPostBack="True" OnSelectedIndexChanged="ShowAllFilters">
            </asp:DropDownList>
            <div class="ads-checkbox">
                <span>
                    <asp:CheckBox ID="cbIsChipping" CssClass="main-chb" Text="Чипированный" runat="server" AutoPostBack="True" OnCheckedChanged="ShowAllFilters" />
                </span>
                <span>
                    <asp:CheckBox ID="cbIsCollar" CssClass="main-chb" Text="С ошейником" runat="server" AutoPostBack="True" OnCheckedChanged="ShowAllFilters" />
                </span>
                <span>
                    <asp:CheckBox ID="cbIsCastrated" CssClass="main-chb" Text="Кастрированный" runat="server" AutoPostBack="True" OnCheckedChanged="ShowAllFilters" />
                </span>
            </div>
        </div>

            <div runat="server" class="ads-card-container">
                <div runat="server" class="main-container" visible="false" id="divShow">
                    <asp:Label ID="lblAttentionMain" CssClass="ads-text-attention-main" runat="server">Объявления не найдены(</asp:Label>
                    <asp:Label ID="lblAttention" CssClass="ads-text-attention" runat="server">Попробуйте изменить фильтры или запрос.</asp:Label>
                </div>
                <asp:Repeater ID="AdsRepeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
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
                                    <asp:Button runat="server" ID="btnAddInLikes" CssClass="ads-card-heart" OnClientClick='<%# "btnAddInLikes(this); return false;" %>' />
                                </div>
                                <asp:Label ID="lblTownAd" Text='<%# Eval("town") %>' CssClass="ads-text-town" runat="server"></asp:Label>
                                <asp:Label ID="lblDataPublicationAd" Text='<%# FormatPublishDateToMinute((DateTime)Eval("dataPublication")) %>' CssClass="ads-text-time" runat="server"></asp:Label>
                                <asp:Label ID="lblDescriptionAd" Text='<%# Eval("description") %>' CssClass="ads-text-discription" runat="server"></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
    </form>


    <script type="text/javascript">    // Возвращение в верх страницы при перезагрузке
        document.addEventListener('DOMContentLoaded', function () {
            // Прокрутка страницы к началу
            window.scrollTo(0, 0);
        });
    </script>


    <script type="text/javascript">
        function btnAddInLikes(button) {
            var adId = button.getAttribute('data-adid');
            console.log("adId:", adId);  // Проверяем значение adId
            $.ajax({
                type: "POST",
                url: "Ads.aspx/btnAddInLikes_Click",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ adId: adId }),
                dataType: "json",
                success: function (response) {
                    if (!response.d.IsAuthorized) {
                        window.location.href = '<%= ResolveUrl("~/Pages/Authorization") %>';
                        console.log("Нет пользователя");
                    } else {
                        if (response.d.Result) {
                            $(button).css('background-image', 'url("/Resources/heartFull.png")'); // Устанавливаем изображение для true
                            console.log("Сердце полное");
                        } else {
                            $(button).css('background-image', 'url("/Resources/heartEmpty.png")'); // Устанавливаем изображение для false
                            console.log("Сердце пустое");
                        }
                    }
                },
                error: function (xhr, status, error) {
                    // Обработка ошибки
                    console.error(xhr.responseText);
                    alert("Произошла ошибка при выполнении запроса.");
                }
            });
        }
    </script>


    <script>
        $(document).ready(function () {
            $('#filterBreed').select2({
                dropdownCssClass: 'my-dropdown'
            });
            $('#filterMale').select2({
                dropdownCssClass: 'my-dropdown',
                minimumResultsForSearch: -1, // отключает поисковую строку
            });
            $('#filterLoseOrFind').select2({
                dropdownCssClass: 'my-dropdown',
                minimumResultsForSearch: -1, // отключает поисковую строку
            });
            $('#filterType').select2({
                dropdownCssClass: 'my-dropdown',
                minimumResultsForSearch: -1, // отключает поисковую строку
            });
            $('#filterColor').select2({
                dropdownCssClass: 'my-dropdown'
            });
            $('#sortDate').select2({
                dropdownCssClass: 'my-dropdown',
                minimumResultsForSearch: -1, // отключает поисковую строку
            });
        });
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