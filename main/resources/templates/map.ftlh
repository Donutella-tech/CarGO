<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title>Расчет стоимости доставки</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!--
        Укажите свой API-ключ. Тестовый ключ НЕ БУДЕТ работать на других сайтах.
        Получить ключ можно в Кабинете разработчика: https://developer.tech.yandex.ru/keys/
    -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;apikey=a29ee2c2-18bf-419a-9040-06a700e8509f"
            type="text/javascript"></script>

    <style>
        body, html, #map {
            width: 80%;
            height: 80%;
            padding: 0;
            margin: 0;
            position: relative;
        }

        #order_form {
            margin-left: 40px;

        }

        #contactChoice2, #contactChoice3 {
            margin-left: 10px;
        }
    </style>
</head>
<body>

<#include "parts/navbar.ftlh">
<div class="container mt-5"></div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>


<form method="post" enctype="multipart/form-data" id="order_form">

    <div class="form-group">
        <input required type="text" id="input6" class="form-control" name="departure" placeholder="хуйня " readonly>
    </div>


    <div class="form-group">
        <input required type="text" id="input1" class="form-control" name="departure" placeholder="Откуда  " readonly>
    </div>

    <div class="form-group">
        <input required type="text" id="input2" class="form-control" name="destination" placeholder="Куда " readonly/>
    </div>

    <div class="form-group">
        <input required type="text" id="input3" class="form-control" name="distance" placeholder="Расстояние" readonly>
    </div>

    <div class="form-group">
        <input required type="text" id="input4" class="form-control" name="price" placeholder="Цена " oninput="recalc()"
               readonly>
    </div>
    <div class="form-group">
        <input required type="text" class="form-control" name="ordered_car" placeholder="Авто ">
    </div>


    <p>Выбеерите необходимый тип транспорта</p>
    <div>
        <input type="radio" checked id="contactChoice1"
               name="contact" value="1">
        <label for="contactChoice1">До 1.5 тонны(до 12м^3)</label>

        <input type="radio" id="contactChoice2"
               name="contact" value="2.5 тонны">
        <label for="contactChoice2">До 2.5 тонны(20м^3)</label>

        <input type="radio" id="contactChoice3"
               name="contact" value="3.5 тонны">
        <label for="contactChoice3">До 3.5 тонны(25м^3)</label>
        <input type="radio" id="contactChoice3"
               name="contact" value="5 тонн">
        <label for="contactChoice3">До 5 тонн(40м^3)</label>
    </div>


    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Создать заказ</button>
    </div>
</form>


<div id="map"></div>


<script type="text/javascript">
    var DELIVERY_TARIFF = 0.65,
        // Минимальная стоимость.
        MINIMUM_COST = 40


    ymaps.ready(function () {

        // Стоимость за километр.


        var myMap = new ymaps.Map('map', {
            center: [55.753994, 37.622093],
            zoom: 9,
            // Добавим панель маршрутизации.
            controls: ['routePanelControl']
        });

        zoomControl = new ymaps.control.ZoomControl({
            options: {
                size: 'small',
                float: 'none',
                position: {
                    bottom: 145,
                    right: 10
                }
            }
        });


        var control = myMap.controls.get('routePanelControl');

        // Зададим состояние панели для построения машрутов.
        control.routePanel.state.set({
            // Выключим возможность задавать пункт отправления в поле ввода.
            fromEnabled: true,
            // Адрес или координаты пункта отправления.
            from: 'Солигорск',
            // Включим возможность задавать пункт назначения в поле ввода.
            toEnabled: true,
            // Адрес или координаты пункта назначения.
            to: 'Минск'
        });
        // Пользователь сможет построить только автомобильный маршрут.

        // Зададим опции панели для построения машрутов.
        control.routePanel.options.set({
            // Запрещаем показ кнопки, позволяющей менять местами начальную и конечную точки маршрута.
            allowSwitch: true,
            // Включим определение адреса по координатам клика.
            // Адрес будет автоматически подставляться в поле ввода на панели, а также в подпись метки маршрута.
            reverseGeocoding: true,
            // Зададим виды маршрутизации, которые будут доступны пользователям для выбора.
            types: {
                auto: true,
            }
        });

        myMap.controls.add(control).add(zoomControl);

        var length, price;


        control.routePanel.getRouteAsync().then(function (route) {


            // Зададим максимально допустимое число маршрутов, возвращаемых мультимаршрутизатором.
            route.model.setParams({results: 1}, true);

            // Повесим обработчик на событие построения маршрута.
            route.model.events.add('requestsuccess', function () {

                var activeRoute = route.getActiveRoute();
                if (activeRoute) {
                    // Получим протяженность маршрута.

                    length = route.getActiveRoute().properties.get("distance");
                    // Вычислим стоимость доставки.
                    price = calculate(Math.round(length.value / 1000));
                    // Создадим макет содержимого балуна маршрута.


                    var balloonContentLayout = ymaps.templateLayoutFactory.createClass(
                        '<span>Расстояние: ' + length.text + '.</span><br/>' +
                        '<span style="font-weight: bold; font-style: italic">Стоимость доставки: ' + price + ' р.</span>');
                    // Зададим этот макет для содержимого балуна.
                    route.options.set('routeBalloonContentLayout', balloonContentLayout);
                    // Откроем балун.
                    activeRoute.balloon.open();
                    $("#input3").val(length.text);
                    $("#input4").val(price);
                    $("#input1").val(control.routePanel.state.get('from'));
                    $("#input2").val(control.routePanel.state.get('to'));


                }
            });


        });


        // Функция, вычисляющая стоимость доставки.
        function calculate(routeLength) {
            var check = $('input[name=contact]:checked', '#order_form').val();
            if (check == 1)

                return Math.max(routeLength * DELIVERY_TARIFF, MINIMUM_COST);

            else if (check == "2.5 тонны") {

                return Math.max(routeLength * 0.75, MINIMUM_COST);

            } else if (check == "3.5 тонны") {

                return Math.max(routeLength * 0.85, MINIMUM_COST);


            } else return Math.max(routeLength * 1.3, MINIMUM_COST);
        }

// Получим ссылку на маршрут.
        control.routePanel.getRouteAsync().then(function (route) {


            // Зададим максимально допустимое число маршрутов, возвращаемых мультимаршрутизатором.
            route.model.setParams({results: 1}, true);

            //Искать оптимальный маршрут с учетом пробок
            route.model.setParams({avoidTrafficJams: true}, true);

            // Повесим обработчик на событие построения маршрута.
            route.model.events.add('requestsuccess', function () {
                var activeRoute = route.getActiveRoute();
                if (activeRoute) {
                    activeRoute.balloon.open();
                }
            });
        });

        // Создадим элемент управления "Пробки".
        var trafficControl = new ymaps.control.TrafficControl({
            state: {
                // Отображаются пробки "Сейчас".
                providerKey: 'traffic#actual',
                // Начинаем сразу показывать пробки на карте (true) или после нажатия на кнопку (false)
                trafficShown: false
            }
        });

        // Добавим контрол на карту.
        myMap.controls.add(trafficControl);

        // Получим ссылку на провайдер пробок "Сейчас" и включим показ инфоточек.
        trafficControl.getProvider('traffic#actual').state.set('infoLayerShown', true);


    });

  


</script>


<script type="text/javascript">

</script>


</body>
</html>
