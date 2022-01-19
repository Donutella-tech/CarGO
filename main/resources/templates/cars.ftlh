<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>
<@c.page>
    <#if s.isAdmin>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/cars" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по марке автомобиля">
                <button type="submit" class="btn btn-primary ml-2">Поиск</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Добавить автомобиль
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input required type="text" class="form-control" name="carBrand" placeholder="Бренд автомобиля">
                </div>

                <div class="form-group">
                    <input required type="text" class="form-control" name="car_model" placeholder="Модель автомобиля" />
                </div>

                <div class="form-group">
                    <input required type="text" class="form-control" name="release_date" placeholder="Год выпуска">
                </div>
                <div class="form-group">
                    <input required type="text" class="form-control" name="plate_num" placeholder="Гос. номер">
                </div>
                <div class="form-group">
                    <input required type="text" class="form-control" name="mileage" placeholder="Пробег">
                </div>
                <div class="form-group">
                    <input required type="text" class="form-control" name="carrying_capacity" placeholder="Грузоподъёмность">
                </div>



               <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <div class="row">
        <#list cars as car>
            <div class="col-sm-4">
                <div class="card mt-5" style="width: 18rem;">
                    <div class="card-body">
                        <p class="card-text">${car.carBrand?ifExists} ${car.carModel?ifExists}</p>
                        <a href="/cars/${car.id}" class="btn btn-primary">Детальнее</a>
                    </div>

               </div>

            </div>
        <#else>
            No message
        </#list>

    </div>
</#if>

</@c.page>