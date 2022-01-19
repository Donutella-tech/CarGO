<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>
<@c.page>



    <#list cars as car>
        <div class="container mt-5 mb-5">

            <form  method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input required type="text" value="${car.carBrand}" class="form-control" name="car_brand" placeholder="Марка автомобиля">
                </div>

                <div class="form-group">
                    <input required type="text" class="form-control" value="${car.carModel}" name="car_model" placeholder="Модель автомобиля" />
                </div>

                <div class="form-group">
                    <input required type="text" class="form-control" value="${car.date}" name="release_date" placeholder="Год выпуска">
                </div>
                <div class="form-group">
                    <input required type="text" class="form-control" value="${car.plateNum}" name="plate_num" placeholder="Номерной знак автомобиля">
                </div>
                <div class="form-group">
                    <input required type="text" class="form-control" value="${car.mileage}" name="mileage" placeholder="Пробег,км">
                </div>
                <div class="form-group">
                    <input required type="text" class="form-control" value="${car.carrying_capacity}" name="carrying_capacity" placeholder="Грузоподъёмность,кг">
                </div>


            <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Обновить</button>
                </div>
            </form>

        </div>
    </#list>




</@c.page>