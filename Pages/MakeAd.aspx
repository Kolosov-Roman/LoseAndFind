<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakeAd.aspx.cs" Inherits="LoseAndFind.MakeAd" %>

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

    <%--<script src="https://api-maps.yandex.ru/2.1/?apikey=8eaafcc7-f3c1-4c9c-8d8d-fd268b267bbc&lang=ru_RU" type="text/javascript"></script>--%>
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&apikey=8eaafcc7-f3c1-4c9c-8d8d-fd268b267bbc&suggest_apikey=2b862a1c-38be-4bb4-99c2-db5eb6fddd37" type="text/javascript"></script>

    <script type="text/javascript">
    var myPlacemark = null;
        var initialCoords = [55.755864, 37.617698]; // Начальные координаты метки

    ymaps.ready(init);

    function init() {
        var myMap = new ymaps.Map("map", {
            center: initialCoords,
            zoom: 9,
            controls: ['geolocationControl', 'zoomControl']
        });

        var suggestView = new ymaps.SuggestView('tbAddress');

        suggestView.events.add('select', function (e) {
            var selectedItem = e.get('item');
            var selectedAddress = selectedItem.value;

            ymaps.geocode(selectedAddress, { kind: 'house' })
                .then(function (res) {
                    if (res.geoObjects.getLength()) {
                        var firstGeoObject = res.geoObjects.get(0);
                        var selectedCoordinates = firstGeoObject.geometry.getCoordinates();

                        setPlacemarkCoordinates(selectedCoordinates);

                        var zoom = 17;
                        myMap.setZoom(zoom);
                        myMap.setCenter(selectedCoordinates);
                    } else {
                        console.log('Не удалось найти координаты для адреса: ' + selectedAddress);
                    }
                });

            suggestView.state.set('expanded', false);
        });

        myPlacemark = new ymaps.Placemark(initialCoords, {}, {
            iconLayout: 'default#image',
            iconImageHref: 'https://localhost:44385/Resources/imageGeo.png',
            iconImageSize: [35, 38],
            iconImageOffset: [-17.5, -38],
            draggable: true
        });

        myPlacemark.events.add('dragend', function () {
            checkCoordinatesChanged();
        });

        myMap.geoObjects.add(myPlacemark);

        myMap.events.add('boundschange', function (e) {
            var newCenter = e.get('newCenter');
            animateCoords(myPlacemark.geometry.getCoordinates(), newCenter, myPlacemark, 100);

            var addressUpdateTimer = setTimeout(function () {
                var coordinates = myPlacemark.geometry.getCoordinates();
                ymaps.geocode(coordinates, { kind: 'house' })
                    .then(function (res) {
                        if (res.geoObjects.getLength()) {
                            var firstGeoObject = res.geoObjects.get(0);
                            var tbAddress = firstGeoObject.getAddressLine();
                            document.getElementById('tbAddress').value = tbAddress;
                        } else {
                            console.log('Не удалось найти адрес для координат: ' + coordinates);
                        }
                    });
            }, 100);
        });
    }

    function animateCoords(startCoords, endCoords, placemark, duration) {
        var startTime = Date.now();
        function step() {
            var progress = Math.min((Date.now() - startTime) / duration, 1);
            var currentCoords = [
                startCoords[0] + (endCoords[0] - startCoords[0]) * progress,
                startCoords[1] + (endCoords[1] - startCoords[1]) * progress
            ];
            placemark.geometry.setCoordinates(currentCoords);
            if (progress < 1) {
                requestAnimationFrame(step);
            }
        }

        step();
    }

    function roundToHundredths(coord) {
        return parseFloat(coord.toFixed(2));
    }

    function setPlacemarkCoordinates(coords) {
        if (myPlacemark) {
            myPlacemark.geometry.setCoordinates(coords);
        } else {
            myPlacemark = new ymaps.Placemark(coords, {}, {
                iconLayout: 'default#image',
                iconImageHref: 'https://localhost:44385/Resources/imageGeo.png',
                iconImageSize: [35, 38],
                iconImageOffset: [0, -30],
                draggable: true
            });
            myPlacemark.events.add('dragend', function () {
                checkCoordinatesChanged();
            });
            myMap.geoObjects.add(myPlacemark);
        }
        checkCoordinatesChanged();
    }

    function checkCoordinatesChanged() {
        if (!myPlacemark) return;

        var newCoords = myPlacemark.geometry.getCoordinates();
        var roundedInitialCoords = initialCoords.map(roundToHundredths);
        var roundedNewCoords = newCoords.map(roundToHundredths);

        console.log("Initial Coords: ", roundedInitialCoords);
        console.log("New Coords: ", roundedNewCoords);

        if (roundedNewCoords[0] !== roundedInitialCoords[0] || roundedNewCoords[1] !== roundedInitialCoords[1]) {
            document.getElementById('<%= hasCoordinatesChanged.ClientID %>').value = "true";
        } else {
            document.getElementById('<%= hasCoordinatesChanged.ClientID %>').value = "false";
        }
    }
    </script>                                      <%-- Скрипт для Яндекс.Карт --%>

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









    <form id="MakeAdForm" runat="server" style="padding: 20px" autocomplete="off">
        <div class="makead-form-container">
            <asp:HiddenField ID="hasCoordinatesChanged" runat="server" />
            <div class="makead-info-flex">
                <div class="makead-title">
                    <asp:TextBox class="makead-title-input form-control" ID="tbTitle" placeholder="Введите название" runat="server"></asp:TextBox>
                    <label id="lblTitle" runat="server" class="makead-attention-red"></label>
                </div>
                <div class="adv-separator-bottom"></div>
                <div class="makead-charact">
                    <div class="makead-label-and-cb">
                        <asp:DropDownList ID="ddlLoseOrFind" runat="server" class="main-cb">
                            <asp:ListItem Text="Вид объявления" Value="0" />
                        </asp:DropDownList>
                        <label id="lblLoseOrFind" runat="server" class="makead-attention-red"></label>
                    </div>

                    <div class="makead-label-and-cb">
                        <asp:DropDownList ID="ddlType" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" runat="server" class="main-cb">
                            <asp:ListItem Text="Тип" Value="0" />
                        </asp:DropDownList>
                        <label id="lblType" runat="server" class="makead-attention-red"></label>
                    </div>

                    <div class="makead-label-and-cb">
                        <asp:DropDownList ID="ddlBreed" runat="server" class="main-cb">
                            <asp:ListItem Text="Порода" Value="0" />
                        </asp:DropDownList>
                        <label id="lblBreed" runat="server" class="makead-attention-red"></label>
                    </div>

                    <div class="makead-label-and-cb">
                        <asp:DropDownList ID="ddlColor" runat="server" class="main-cb">
                            <asp:ListItem Text="Окрас" Value="0" />
                        </asp:DropDownList>
                        <label id="lblColor" runat="server" class="makead-attention-red"></label>
                    </div>

                    <div class="makead-label-and-cb-last">
                        <asp:DropDownList ID="ddlMale" runat="server" class="main-cb">
                            <asp:ListItem Text="Пол" Value="0" />
                        </asp:DropDownList>
                        <label id="lblMale" runat="server" class="makead-attention-red"></label>
                    </div>
                    <div class="checkboxes">
                        <div class="main-chb">
                            <asp:CheckBox ID="cbIsChipping" Text="Чипированный" runat="server" />
                        </div>
                        <div class="main-chb">
                            <asp:CheckBox ID="cbIsCollar" Text="С ошейником" runat="server" />
                        </div>
                        <div class="main-chb">
                            <asp:CheckBox ID="cbIsCastrated" Text="Кастрированный" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="adv-separator-bottom"></div>
                <div class="file-upload-wrapper">
                    <asp:FileUpload ID="fileUpload" CssClass="file-upload-wrapper" onchange="checkFileFormat()" runat="server" AllowMultiple="true" />
                    <asp:Image class="file-upload-wrapper" AlternateText="Вставьте изображение" ID="imgClientChangee" runat="server" />
                    <label id="lblImage" runat="server" class="makead-attention-red"></label>
                </div>
                <div class="makead-description">
                    <asp:TextBox ID="txtDescription" runat="server" class="makead-description-input" TextMode="MultiLine" placeholder="Описание"></asp:TextBox>
                </div>
                <div class="adv-separator-bottom"></div>
                <div class="makead-label-and-tb">
                    <asp:TextBox runat="server" class="makead-title-input-form-control" type="text" ID="tbAddress"></asp:TextBox>
                    <label id="lblAddress" runat="server" class="makead-attention-red"></label>
                </div>
                <div id="map" class="makead-map"></div>
                <div class="makead-submit-button">
                    <asp:Button ID="btnMakeAd" runat="server" Text="Разместить" OnClientClick="checkCoordinatesChanged()" OnClick="MakeAdv" class="makead-btnMakeAd" />
                </div>
            </div>
        </div>
    </form>


    <script>
        $(document).ready(function () {
            $('#ddlBreed').select2({
                dropdownCssClass: 'my-dropdown'
            });
            $('#ddlMale').select2({
                dropdownCssClass: 'my-dropdown',
                minimumResultsForSearch: -1, // отключает поисковую строку
            });
            $('#ddlLoseOrFind').select2({
                dropdownCssClass: 'my-dropdown',
                minimumResultsForSearch: -1, // отключает поисковую строку
            });
            $('#ddlType').select2({
                dropdownCssClass: 'my-dropdown',
                minimumResultsForSearch: -1, // отключает поисковую строку
            });
            $('#ddlColor').select2({
                dropdownCssClass: 'my-dropdown'
            });
        });
    </script>


    <script>
        var cbLoseOrFind = document.getElementById('<%= ddlLoseOrFind.ClientID %>');
        var cbType = document.getElementById('<%= ddlType.ClientID %>');
        var cbBreed = document.getElementById('<%= ddlBreed.ClientID %>');
        var cbColor = document.getElementById('<%= ddlColor.ClientID %>');
        var cbMale = document.getElementById('<%= ddlMale.ClientID %>');
        var indexToHide = 0;

        // Скрываем элемент из выпадающего списка
        cbLoseOrFind.options[indexToHide].style.display = 'none';
        cbType.options[indexToHide].style.display = 'none';
        cbBreed.options[indexToHide].style.display = 'none';
        cbColor.options[indexToHide].style.display = 'none';
        cbMale.options[indexToHide].style.display = 'none';

    </script>                                      <%-- Скрытие нужных элементов из комбобокса --%>


    <script type="text/javascript">
        function checkFileFormat() {
            var fileInput = document.getElementById('<%= fileUpload.ClientID %>');
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
    </script>                                      <%-- Проверка на jpg --%>


    <script>
            document.getElementById('<%= imgClientChangee.ClientID %>').addEventListener('click', function () {
                document.getElementById('<%= fileUpload.ClientID %>').click();
        });

        document.getElementById('<%= fileUpload.ClientID %>').addEventListener('change', function (e) {
            var file = e.target.files[0];
            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('<%= imgClientChangee.ClientID %>').src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
        </script>    <%-- Загрузка изображения животного и отображение --%>







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