<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ads.aspx.cs" Inherits="LoseAndFind.Ads" %>

<!DOCTYPE html>

<html lang="ru">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minimum-scale=1" />
    <title>Lose and Find - сервис для нахождения потерянных животных</title>
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />

    <% if ((string)Page.Items["DeviceType"] == "mobile")
        { %>
    <link rel="stylesheet" href="/Content/Site_m.css" />
    <% }
        else
        { %>
    <link rel="stylesheet" href="/Content/Site.css" />
    <% }%>

</head>
<body>
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









    <form id="AdsForm" runat="server" class="ads" autocomplete="off">
        <asp:Button style="display: none" ID="hiddenButton" runat="server" OnClick="LinkButtonAd_Click" />
        <div class="ads-search">
            <div class="ads-search-el">
                <asp:TextBox ID="tbSearch" placeholder="Введите название" CssClass="ads-title ads-search-ph" runat="server"></asp:TextBox>
                <asp:Button ID="btnGoSearch" CssClass="ads-search-button" runat="server" Text="Найти" OnClientClick="filterAds(); return false;" />
            </div>
            <div id="ddlTown" class="hidden-m">
                <label class="ads-filters-text hidden">Где искать</label>
                <asp:DropDownList ID="filterTown" runat="server" CssClass="main-cb">
            </asp:DropDownList>
            </div>

            <div id="divShowFilters" class="ads-img-filters" onclick="openPopup(); return false;">
                <img class="ads-img-filter" id="openFilters" src="/Resources/filters.svg" runat="server" />
            </div>
        </div>


        <asp:Panel ID="pnlPopup" runat="server" CssClass="ads-modal">
            <div class="ads-modal-content">
                <div class="ads-filters-top fixed-top hidden">
                    <label class="total-text">Фильтры</label>
                    <span class="ads-close" onclick="closePopup()">&times;</span>
                </div>
                <div id="adsFiltersContainer" class="hidden-m ads-filters">
                    <div class="ads-filters-c">
                        <label class="ads-filters-text">Сортировка по дате</label>
                        <asp:DropDownList ID="sortDate" runat="server" CssClass="main-cb">
                            <asp:ListItem Text="По умолчанию"></asp:ListItem>
                            <asp:ListItem Text="По возрастанию"></asp:ListItem>
                            <asp:ListItem Text="По убыванию"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="ads-filters-c">
                        <label class="ads-filters-text">Тип животного</label>
                        <asp:DropDownList ID="filterType" runat="server" CssClass="main-cb">
                        </asp:DropDownList>
                    </div>
                    <div class="ads-filters-c">
                        <label class="ads-filters-text">Вид объявления</label>
                        <asp:DropDownList ID="filterLoseOrFind" runat="server" CssClass="main-cb">
                        </asp:DropDownList>
                    </div>
                    <div id="ddlBreed-div" class="ads-filters-c">
                        <label class="ads-filters-text">Порода</label>
                        <div id="ddlBreed">
                            <asp:DropDownList ID="filterBreed" runat="server" CssClass="main-cb">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="ads-filters-c">
                        <label class="ads-filters-text">Окрас животного</label>
                        <asp:DropDownList ID="filterColor" runat="server" CssClass="main-cb">
                        </asp:DropDownList>
                    </div>
                    <div id="ddlMale-div" class="ads-filters-c">
                        <label class="ads-filters-text">Пол</label>
                        <div id="ddlMale">
                            <asp:DropDownList ID="filterMale" runat="server" CssClass="main-cb">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="ads-checkbox">
                        <span>
                            <asp:CheckBox ID="cbIsChipping" CssClass="main-chb" Text="Чипированный" runat="server" />
                        </span>
                        <span>
                            <asp:CheckBox ID="cbIsCollar" CssClass="main-chb" Text="С ошейником" runat="server" />
                        </span>
                        <span>
                            <asp:CheckBox ID="cbIsCastrated" CssClass="main-chb" Text="Кастрированный" runat="server" />
                        </span>
                    </div>
                    <div class="ads-div-fixed-buttons-m fixed-bottom ads-div-fixed-buttons">
                        <asp:Button ID="FilterButton" runat="server" Text="Найти" CssClass="register-button" />
                        <asp:Button ID="clearFilterButton" runat="server" Text="Сбросить фильтры" CssClass="authorization-button" />
                    </div>
                </div>
            </div>
        </asp:Panel>


        <div runat="server" class="ads-card-container">
            <div runat="server" class="ads-main-container" id="hiddenEmpty">
                <asp:Label ID="lblAttentionMain" CssClass="ads-text-attention-main" runat="server">Объявления не найдены(</asp:Label>
                <asp:Label ID="lblAttention" CssClass="ads-text-attention" runat="server">Попробуйте изменить фильтры или запрос.</asp:Label>
            </div>
            <div id="ads-card-container" class="myads-card-container">

            </div>
        </div>
    </form>


    <script>
        window.addEventListener('popstate', function (event) {
            // Событие, которое будет вызвано при нажатии кнопки "Назад"
            alert("Вы нажали кнопку 'Назад'!");
        });
    </script>    <%-- Тестирование кнопки назад (плохо) --%>


    <script>
        const divShowFilters = document.getElementById('divShowFilters');
        const adsFiltersContainer = document.getElementById('adsFiltersContainer');

        divShowFilters.addEventListener('click', function () {
            adsFiltersContainer.classList.toggle('ads-filters-container');
            document.body.classList.toggle('no-scroll');
        });
    </script>    <%-- Смена стилей для боди и дива фильтров --%>


    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var modal = document.getElementById('<%= pnlPopup.ClientID %>');

        function openPopup() {
            
                if (modal && !modal.classList.contains('show')) {
                    modal.style.display = 'block';
                    // Добавляем класс через setTimeout, чтобы анимация началась с задержкой
                    setTimeout(function () {
                        modal.classList.add('show');
                        // Добавляем обработчик события transitionend для завершения анимации
                        modal.addEventListener('transitionend', onTransitionEnd);
                    }, 10);
                }
                return false;
        }

        function closePopup() {
            if (modal && modal.classList.contains('show')) {
                modal.classList.remove('show');
                // Добавляем обработчик события transitionend для завершения анимации
                modal.addEventListener('transitionend', onTransitionEnd);
                adsFiltersContainer.classList.toggle('ads-filters-container');
                document.body.classList.toggle('no-scroll');
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
    </script>    <%-- Открытие модального окна с фильтрами --%>


    <script>
        function handleEnterKey(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                document.getElementById('btnGoSearch').click();
                document.getElementById('btnGoSearch').focus();
                document.getElementById('btnGoSearch').blur();
            }
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            const tbSearch = document.getElementById('tbSearch');
            tbSearch.addEventListener('keydown', handleEnterKey);
            const checkboxes = document.querySelectorAll('.main-chb');
            checkboxes.forEach(checkbox => {
                checkbox.addEventListener('keydown', handleEnterKey);
            });
        });
    </script>    <%-- События клика по enter --%>


    <script type="text/javascript">
        var filterType = document.getElementById('filterType');
        var filterMale = document.getElementById('filterMale');
        var filterBreed = document.getElementById('filterBreed');
        var filterColor = document.getElementById('filterColor');
        var filterTown = document.getElementById('filterTown');
        var filterLoseOrFind = document.getElementById('filterLoseOrFind');
        var sortDate = document.getElementById('sortDate');
        var cbIsChipping = document.getElementById('cbIsChipping');
        var cbIsCollar = document.getElementById('cbIsCollar');
        var cbIsCastrated = document.getElementById('cbIsCastrated');
        var selectedType = filterType.selectedIndex;
        var btnSearch = document.getElementById('FilterButton');
        var btnClear = document.getElementById('clearFilterButton');
        var tbSearch = document.getElementById('tbSearch');

        document.addEventListener("DOMContentLoaded", function () {
            filterAds();
            $('#hiddenEmpty').hide();
            btnClear.style.display = 'none';
            btnSearch.style.display = 'none';
            if (selectedType === 0) {
                $('#ddlBreed-div, #ddlMale-div').hide();
            } else {
                $('#ddlBreed-div, #ddlMale-div').show();
            }
        });

        $('.main-cb').change(function () {
            btnClear.style.display = 'inline';
            btnSearch.style.display = 'inline';
        });

        // Отслеживание изменений для всех чекбоксов с классом .main-chb
        $('.main-chb').change(function () {
            btnClear.style.display = 'inline';
            btnSearch.style.display = 'inline';
        });

        $(document).ready(function () {
            $('#<%= filterType.ClientID %>').change(function () {
                selectedType = filterType.selectedIndex;

                if (selectedType === 0) {
                    $('#ddlBreed-div, #ddlMale-div').hide();
                } else {
                    $('#ddlBreed-div, #ddlMale-div').show();
                }

                $.ajax({
                    type: 'POST',
                    url: 'Ads.aspx/ChangeDDLType',
                    data: JSON.stringify({ selectedType: filterType.selectedIndex }),
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var ddlBreed = $('#<%= filterBreed.ClientID %>');
                        var ddlMale = $('#<%= filterMale.ClientID %>');

                        ddlBreed.empty();
                        ddlMale.empty();

                        ddlBreed.append($('<option></option>').val('').html('Порода'));
                        ddlMale.append($('<option></option>').val('').html('Пол'));

                        if (response.d) {

                            $.each(response.d.breeds, function (index, breed) {
                                ddlBreed.append($('<option></option>').val(breed.value).html(breed.text));
                            });

                            $.each(response.d.males, function (index, male) {
                                ddlMale.append($('<option></option>').val(male.value).html(male.text));
                            });

                            if (selectedType !== 0) {
                                $('#ddlBreed-div, #ddlMale-div').show();
                            }
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log('Error: ' + error);
                    }
                });
            });
        });

        function filterAds() {
            var selectedType = filterType.selectedIndex;
            var selectedMale = filterMale.selectedIndex;
            var selectedBreed = filterBreed.selectedIndex;
            var selectedColor = filterColor.selectedIndex;
            var selectedTown = filterTown.value;
            var selectedLoseOrFind = filterLoseOrFind.selectedIndex;
            var selectedDate = sortDate.selectedIndex;
            var selectedChipping = cbIsChipping.checked;
            var selectedCollar = cbIsCollar.checked;
            var selectedCastrated = cbIsCastrated.checked;
            var selectedSearch = tbSearch.value;

            $.ajax({
                type: "POST",
                url: "Ads.aspx/ShowAllFilters",
                data: JSON.stringify({
                    selectedType: selectedType,
                    selectedMale: selectedMale,
                    selectedBreed: selectedBreed,
                    selectedColor: selectedColor,
                    selectedTown: selectedTown,
                    selectedLoseOrFind: selectedLoseOrFind,
                    selectedDate: selectedDate,
                    selectedChipping: selectedChipping,
                    selectedCollar: selectedCollar,
                    selectedCastrated: selectedCastrated,
                    selectedSearch: selectedSearch
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $('#hiddenEmpty').hide();
                    var adsContainer = $('#ads-card-container');
                    adsContainer.html(response.d);
                    btnSearch.style.display = 'none';

                    if (!response.d) {
                        $('#hiddenEmpty').show();
                    }
                },
                error: function (xhr, status, error) {
                    console.log("AJAX Error: " + status + " - " + error);
                }
            });
        };

        $(document).ready(function () {
            $('#FilterButton').click(function () {
                filterAds();
                window.closePopup();
                return false;
            });
        });
        $(document).ready(function () {
            $('#clearFilterButton').click(function () {
                location.reload();
                return false;
            });
        });
    </script>    <%-- Вытаскивание элементов из комбобоксов --%>


    <script type="text/javascript">
        function btnAddInLikes(button) {
            var adId = button.closest('.ads-card').querySelector('.ads-full-size').getAttribute('data-adid');
            console.log(adId);
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
                        console.log("user ", response.d.user);
                        if (response.d.Result) {
                            $(button).css('background-image', 'url("/Resources/heartFull-active.svg")'); // Устанавливаем изображение для true
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
    </script>    <%-- Добавление объявления в избранное --%>


    <script>
        $(document).ready(function () {
            $('#filterBreed').select2({
                dropdownCssClass: 'my-dropdown'
            });
            $('#filterTown').select2({
                dropdownCssClass: 'my-dropdown'
            });
            $('#filterMale').select2({
                dropdownCssClass: 'my-dropdown',
                minimumResultsForSearch: -1,
            });
            $('#filterLoseOrFind').select2({
                dropdownCssClass: 'my-dropdown',
                minimumResultsForSearch: -1,
            });
            $('#filterType').select2({
                dropdownCssClass: 'my-dropdown',
                minimumResultsForSearch: -1,
            });
            $('#filterColor').select2({
                dropdownCssClass: 'my-dropdown'
            });
            $('#sortDate').select2({
                dropdownCssClass: 'my-dropdown',
                minimumResultsForSearch: -1,
            });
        });
    </script>    <%-- Применение стилей к комбобоксам --%>


    <script>
        function isMobile() {
            return /Mobi|Android/i.test(navigator.userAgent);
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            if (isMobile()) {
                var child = document.getElementById('ddlTown');
                var parent2 = document.querySelector('.ads-filters');
                parent2.insertBefore(child, parent2.firstChild);
            }
        });
    </script>    <%-- Перемещение фильтра городов --%>









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
            <li>
                <a href="Ads.aspx" class="nav-link header div-li">
                    <img class="header-img header" src="/Resources/search-passive.svg" />
                    <asp:Label runat="server">Главная</asp:Label>
                </a>
            </li>
            <li>
                <a href="Settings.aspx?section=divAdsInLikes" class="nav-link header div-li">
                    <img class="header-img header" src="/Resources/heartFull-passive.svg" />
                    <asp:Label runat="server">Избранное</asp:Label>
                </a>
            </li>
            <li>
                <a href="Settings.aspx?section=divMyAds" class="nav-link header div-li">
                    <img class="header-img header" src="/Resources/ads-passive.svg" />
                    <asp:Label runat="server">Объявления</asp:Label>
                </a>
            </li>
            <li>
                <a href="Settings.aspx?section=divMessages" class="nav-link header div-li">
                    <img class="header-img header" src="/Resources/message-passive.svg" />
                    <asp:Label runat="server">Сообщения</asp:Label>
                </a>
            </li>
            <li id="ulAuthorizationFooter" runat="server">
                <a href="Authorization.aspx" class="nav-link header div-li">
                    <img class="header-img header" src="/Resources/pictureClient-passive.svg" />
                    <asp:Label runat="server">Аккаунт</asp:Label>
                </a>
            </li>
            <li id="imageAClientFooter" runat="server">
                <a href="Settings.aspx" class="nav-link header div-li">
                    <asp:Image ID="imgClientFooter" runat="server" CssClass="header-img header header-image-link"></asp:Image>
                    <asp:Label runat="server">Аккаунт</asp:Label>
                </a>
            </li>
        </ul>
    </header>
</body>
</html>