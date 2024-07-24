<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="MakeAd.aspx.cs" Inherits="LoseAndFind.MakeAd" %>

<!DOCTYPE html>

<html lang="ru">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minimum-scale=1" />
    <title>Lose and Find - сервис для нахождения потерянных животных</title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    
        <% if ((string)Page.Items["DeviceType"] == "mobile")
   { %>
    <link rel="stylesheet" href="/Content/Site_m.css" />
<% } else
   { %>
    <link rel="stylesheet" href="/Content/Site.css" />
<% }%>

    <link rel="stylesheet" href="~/LoseAndFind.styles.css" asp-append-version="true" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
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
                iconImageHref: '/Resources/imageGeo.png',
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
                    iconImageHref: '/Resources/imageGeo.png',
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

            makeAjaxRequest();
        }
    </script>                                      <%-- Скрипт для Яндекс.Карт --%>

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









    <form id="MakeAdForm" runat="server" style="padding: 20px" autocomplete="off">
        <asp:Button style="display: none" ID="hiddenButton" runat="server" OnClick="LinkButtonAd_Click" />
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
                        <asp:DropDownList ID="ddlType" AutoPostBack="false" runat="server" class="main-cb">
                            <asp:ListItem Text="Тип" Value="0" />
                        </asp:DropDownList>
                        <label id="lblType" runat="server" class="makead-attention-red"></label>
                    </div>

                    <div id="divBreed" class="makead-label-and-cb">
                        <asp:DropDownList ID="ddlBreed" runat="server" class="main-cb">
                            <asp:ListItem Text="Порода" Value="0" />
                        </asp:DropDownList>
                        <label id="lblBreed" runat="server" class="makead-attention-red"></label>
                    </div>

                    <div id="divColor" class="makead-label-and-cb">
                        <asp:DropDownList ID="ddlColor" runat="server" class="main-cb">
                            <asp:ListItem Text="Окрас" Value="0" />
                        </asp:DropDownList>
                        <label id="lblColor" runat="server" class="makead-attention-red"></label>
                    </div>

                    <div id="divMale" class="makead-label-and-cb-last">
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
                <div style="width: 500px; height: 150px; justify-content: space-between; margin-bottom: 40px; display: flex;">
                    <div class="file-upload-wrapper">
                        <asp:FileUpload ID="fileUpload" CssClass="file-upload-wrapper" onchange="checkFileFormat()" runat="server" AllowMultiple="true" />
                        <asp:Image class="file-upload-wrapper" AlternateText="Вставьте изображение" ID="imgAnimalChange" runat="server" />
                    </div>
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
                    <asp:Button runat="server" id="btnMakeAd" Text="Разместить" OnClientClick="uploadFile(); return false;" class="makead-btnMakeAd" />
                    <asp:Button ID="btnSaveChanges" runat="server" Text="Сохранить изменения" OnClientClick="editAd(); return false;" class="makead-btnMakeAd" />
                </div>
            </div>
            <%--<asp:Panel ID="pnlPopup" runat="server" CssClass="modal">
                <div class="modal-content">
                    <span class="close" onclick="closePopup()">&times;</span>
                    <asp:Label class="adv-title-name" ID="lblPhoneNumber" runat="server"></asp:Label>
                    <div class="form-group">
                        <div class="horizontal_label">
                            <label class="reg_label_left">Ваша порода</label>
                            <label id="lblCorrectCode" runat="server" class="attention_red"></label>
                        </div>
                        <asp:TextBox ID="tbCode" runat="server" CssClass="form-control" placeholder="Введите породу" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnCheckMailGood" runat="server" Text="Добавить" OnClientClick="btnCheckMail_Click(); return false;" CssClass="authorization-button" />
                    </div>
                </div>
            </asp:Panel>--%>
        </div>
    </form>


    <script type="text/javascript">
        var divMale = document.getElementById('divMale');
        var divColor = document.getElementById('divColor');
        var divBreed = document.getElementById('divBreed');
        var ddlType = document.getElementById('ddlType');
        var selectedType = ddlType.selectedIndex;

        document.addEventListener("DOMContentLoaded", function () {
            if (selectedType === 0) {
                $('#divMale, #divColor, #divBreed').hide();
            }
            else {
                $('#divMale, #divColor, #divBreed').show();
            }
        });

        $(document).ready(function () {
            $('#<%= ddlType.ClientID %>').change(function () {
                var selectedType = ddlType.selectedIndex;

                if (selectedType === 0) {
                    $('#divMale, #divColor, #divBreed').hide();
                }
                else {
                    $('#divMale, #divColor, #divBreed').show();
                }

            $.ajax({
                type: 'POST',
                url: 'MakeAd.aspx/GetDropdownData',
                data: JSON.stringify({ type: selectedType }),
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    var ddlBreed = $('#<%= ddlBreed.ClientID %>');
                    var ddlColor = $('#<%= ddlColor.ClientID %>');
                    var ddlMale = $('#<%= ddlMale.ClientID %>');

                    ddlBreed.empty();
                    ddlColor.empty();
                    ddlMale.empty();

                    ddlBreed.append($('<option></option>').val('').html('Порода'));
                    ddlColor.append($('<option></option>').val('').html('Окрас'));
                    ddlMale.append($('<option></option>').val('').html('Пол'));

                    if (response.d) {
                        $.each(response.d.breeds, function (index, breed) {
                            ddlBreed.append($('<option></option>').val(breed.value).html(breed.text));
                        });

                        $.each(response.d.colors, function (index, color) {
                            ddlColor.append($('<option></option>').val(color.value).html(color.text));
                        });

                        $.each(response.d.males, function (index, male) {
                            ddlMale.append($('<option></option>').val(male.value).html(male.text));
                        });

                        if (selectedType !== 0) {
                            divMale.style.display = 'inherit';
                            divColor.style.display = 'inherit';
                            divBreed.style.display = 'inherit';
                        }
                    } else {
                        console.log('No data returned.');
                    }
                },
                error: function (xhr, status, error) {
                    console.log('Error: ' + error);
                }
            });
            });
        });
    </script>    <%-- Вытаскивание элементов из комбобоксов --%>


    <script type="text/javascript">
        function uploadFile() {

            var image = false;
            var type = false;
            var breed = false;
            var color = false;
            var male = false;
            var loseOrFind = false;
            var mapIncorrect = false;
            var mapNull = false;
            var title = false;

            var tbTitle = document.getElementById('tbTitle');
            var tbAddress = document.getElementById('tbAddress');
            var imgAnimalChange = document.getElementById('imgAnimalChange');
            var fileUpload = document.getElementById('fileUpload');

            var ddlType = document.getElementById('ddlType').selectedIndex;
            var ddlBreed = document.getElementById('ddlBreed').selectedIndex;
            var ddlMale = document.getElementById('ddlMale').selectedIndex;
            var ddlColor = document.getElementById('ddlColor').selectedIndex;
            var ddlLoseOrFind = document.getElementById('ddlLoseOrFind').selectedIndex;

            var lblTitle = document.getElementById('lblTitle');
            var lblAddress = document.getElementById('lblAddress');
            var lblType = document.getElementById('lblType');
            var lblBreed = document.getElementById('lblBreed');
            var lblMale = document.getElementById('lblMale');
            var lblColor = document.getElementById('lblColor');
            var lblLoseOrFind = document.getElementById('lblLoseOrFind');
            var lblImage = document.getElementById('lblImage');
            var txtDescription = document.getElementById('txtDescription');

            var cbIsCollar = document.getElementById('cbIsCollar');
            var cbIsChipping = document.getElementById('cbIsChipping');
            var cbIsCastrated = document.getElementById('cbIsCastrated');

            lblTitle.innerText = "";
            lblAddress.innerText = "";
            lblType.innerText = "";
            lblBreed.innerText = "";
            lblMale.innerText = "";
            lblColor.innerText = "";
            lblLoseOrFind.innerText = "";

            if (tbTitle.value == "") {
                lblTitle.innerText = "Введите название";
                title = true;
            } else lblTitle.innerText = "";

            if (tbAddress.value == "") {
                lblAddress.innerText = "Введите адрес";
                mapNull = true;
            } else {
                if (hasCoordinatesChanged.value == "false" && tbAddress.value == "") {
                    lblAddress.innerText = "Выберите адрес из списка";
                    mapIncorrect = true;
                } else lblAddress.innerText = "";
            }

            if (imgAnimalChange.src == "" && fileUpload.files.length == 0) {
                lblImage.innerText = "Загрузите хотя бы одно изображение";
                image = true;
            } else lblImage.innerText = "";

            if (ddlType == 0) {
                lblType.innerText = "Выберите тип";
                type = true;
            } else lblType.innerText = "";

            if (ddlBreed == 0) {
                lblBreed.innerText = "Выберите породу";
                breed = true;
            } else lblBreed.innerText = "";

            if (ddlColor == 0) {
                lblColor.innerText = "Выберите окрас";
                color = true;
            } else lblColor.innerText = "";

            if (ddlMale == 0) {
                lblMale.innerText = "Выберите пол";
                male = true;
            } else lblMale.innerText = "";

            if (ddlLoseOrFind == 0) {
                lblLoseOrFind.innerText = "Выберите вид объявления";
                loseOrFind = true;
            } else lblLoseOrFind.innerText = "";

            if (image || breed || type || color || male || loseOrFind || mapNull || mapIncorrect || title) {
                return false;
            }

            // Получаем файл из input элемента
            const fileInput = document.getElementById('fileUpload');
            const file = fileInput.files[0];

            // Создаем объект FormData для передачи файла на сервер
            const formData = new FormData();

            formData.append("tbTitle", tbTitle.value);
            formData.append("txtDescription", txtDescription.value);
            formData.append("tbAddress", tbAddress.value);
            formData.append("ddlBreed", ddlBreed);
            formData.append("ddlColor", ddlColor);
            formData.append("ddlLoseOrFind", ddlLoseOrFind);
            formData.append("ddlMale", ddlMale);
            formData.append("ddlType", ddlType);
            formData.append("cbIsCollar", cbIsCollar.checked);
            formData.append("cbIsChipping", cbIsChipping.checked);
            formData.append("cbIsCastrated", cbIsCastrated.checked);
            formData.append('fileUpload', file);

            // Отправляем файл на сервер с помощью XMLHttpRequest
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'MakeAd.aspx/UploadFile'); // Замените на правильный URL
            xhr.onload = function () {
                if (xhr.status === 200) {
                    console.log('Файл успешно загружен на сервер');
                    window.location.href = "/Pages/Settings.aspx?section=divMyAds";
                } else {
                    console.error('Ошибка загрузки файла:', xhr.statusText);
                }
            };
            xhr.onerror = function () {
                console.error('Ошибка сети');
            };
            xhr.send(formData);
        }
    </script>    <%-- Создание объявления --%>


    <script>
        function editAd() {

            var image = false;
            var type = false;
            var breed = false;
            var color = false;
            var male = false;
            var loseOrFind = false;
            var mapIncorrect = false;
            var mapNull = false;
            var title = false;

            var tbTitle = document.getElementById('tbTitle');
            var tbAddress = document.getElementById('tbAddress');
            var imgAnimalChange = document.getElementById('imgAnimalChange');
            const fileInput = document.getElementById('fileUpload');

            var ddlType = document.getElementById('ddlType').selectedIndex;
            var ddlBreed = document.getElementById('ddlBreed').selectedIndex;
            var ddlMale = document.getElementById('ddlMale').selectedIndex;
            var ddlColor = document.getElementById('ddlColor').selectedIndex;
            var ddlLoseOrFind = document.getElementById('ddlLoseOrFind').selectedIndex;

            var lblTitle = document.getElementById('lblTitle');
            var lblAddress = document.getElementById('lblAddress');
            var lblType = document.getElementById('lblType');
            var lblBreed = document.getElementById('lblBreed');
            var lblMale = document.getElementById('lblMale');
            var lblColor = document.getElementById('lblColor');
            var lblLoseOrFind = document.getElementById('lblLoseOrFind');
            var lblImage = document.getElementById('lblImage');
            var txtDescription = document.getElementById('txtDescription');

            var cbIsCollar = document.getElementById('cbIsCollar');
            var cbIsChipping = document.getElementById('cbIsChipping');
            var cbIsCastrated = document.getElementById('cbIsCastrated');

            lblTitle.innerText = "";
            lblAddress.innerText = "";
            lblType.innerText = "";
            lblBreed.innerText = "";
            lblMale.innerText = "";
            lblColor.innerText = "";
            lblLoseOrFind.innerText = "";

            if (tbTitle.value == "") {
                lblTitle.innerText = "Введите название";
                title = true;
            } else lblTitle.innerText = "";

            if (tbAddress.value == "") {
                lblAddress.innerText = "Введите адрес";
                mapNull = true;
            } else {
                if (hasCoordinatesChanged.value == "false" && tbAddress.value == "") {
                    lblAddress.innerText = "Выберите адрес из списка";
                    mapIncorrect = true;
                } else lblAddress.innerText = "";
            }

            if (imgAnimalChange.src == "" && fileUpload.files.length == 0) {
                lblImage.innerText = "Загрузите хотя бы одно изображение";
                image = true;
            } else lblImage.innerText = "";

            if (ddlType == 0) {
                lblType.innerText = "Выберите тип";
                type = true;
            } else lblType.innerText = "";

            if (ddlBreed == 0) {
                lblBreed.innerText = "Выберите породу";
                breed = true;
            } else lblBreed.innerText = "";

            if (ddlColor == 0) {
                lblColor.innerText = "Выберите окрас";
                color = true;
            } else lblColor.innerText = "";

            if (ddlMale == 0) {
                lblMale.innerText = "Выберите пол";
                male = true;
            } else lblMale.innerText = "";

            if (ddlLoseOrFind == 0) {
                lblLoseOrFind.innerText = "Выберите вид объявления";
                loseOrFind = true;
            } else lblLoseOrFind.innerText = "";

            console.log(imgAnimalChange.src);

            if (image || breed || type || color || male || loseOrFind || mapNull || mapIncorrect || title) {
                return false;
            }

            // Создаем объект FormData для передачи файла на сервер
            const formData = new FormData();

            formData.append("tbTitle", tbTitle.value);
            formData.append("txtDescription", txtDescription.value);
            formData.append("tbAddress", tbAddress.value);
            formData.append("ddlBreed", ddlBreed);
            formData.append("ddlColor", ddlColor);
            formData.append("ddlLoseOrFind", ddlLoseOrFind);
            formData.append("ddlMale", ddlMale);
            formData.append("ddlType", ddlType);
            formData.append("cbIsCollar", cbIsCollar.checked);
            formData.append("cbIsChipping", cbIsChipping.checked);
            formData.append("cbIsCastrated", cbIsCastrated.checked);

            if (fileUpload.files.length != 0) {
                const file = fileInput.files[0];
                formData.append('fileUpload', file);
            }

            // Отправляем файл на сервер с помощью XMLHttpRequest
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'MakeAd.aspx/SaveChangesAdv'); // Замените на правильный URL
            xhr.onload = function () {
                if (xhr.status === 200) {
                    console.log('Файл успешно загружен на сервер');
                    window.location.href = "/Pages/Adv?advertisementId=" + '<%= LoseAndFind.Pages.Helper.advertisementId%>';
                } else {
                    console.error('Ошибка загрузки файла:', xhr.statusText);
                }
            };
            xhr.onerror = function () {
                console.error('Ошибка сети');
            };
            xhr.send(formData);
        }
    </script>    <%-- Изменение объявления --%>


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
        </script>    <%-- Проверка на jpg --%>


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
    </script>    <%-- Применение стилей к комбобоксам --%>


    <script>
            document.getElementById('<%= imgAnimalChange.ClientID %>').addEventListener('click', function () {
                document.getElementById('<%= fileUpload.ClientID %>').click();
        });

        document.getElementById('<%= fileUpload.ClientID %>').addEventListener('change', function (e) {
            var file = e.target.files[0];
            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('<%= imgAnimalChange.ClientID %>').src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
        </script>    <%-- Загрузка изображения животного и отображение --%>


    <%--<script>
        document.addEventListener('DOMContentLoaded', function () {
            var modal = document.getElementById('<%= pnlPopup.ClientID %>');

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
    </script>    <%-- Открытие модального окна с добавлением породы --%>


    <%--    <script type="text/javascript">
        $(document).ready(function () {
            var dropdown = $('#<%= ddlBreed.ClientID %>');

            // Добавляем обработчик событий на изменение выбора
            dropdown.change(function () {
                var selectedItem = $(this).find('option:selected');
                if (selectedItem.text() === "Добавить свою породу") {
                    // Сбрасываем выбор, чтобы пользователь мог кликнуть снова
                    $(this).prop('selectedIndex', 0);
                    openPopup();
                }
            });
        });
    </script>    <%-- Обработчик событий на последний элемент --%>









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