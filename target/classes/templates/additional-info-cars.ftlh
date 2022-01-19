<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>

<@c.page>



    <#list cars as car>
        <div class="col-sm-4">
            <div class="card mt-5" style="width: 18rem;">
                <div class="card-body">
                    <p class="card-text">${car.carBrand?ifExists} ${car.carModel?ifExists}</p>
                    <p class="card-text">Год выпуска: ${car.date?ifExists}</p>
                    <p class="card-text ">Гос номер: ${car.plateNum?ifExists}</p>
                    <p class="card-text ">Пробег: ${car.mileage?ifExists}</p>
                    <p class="card-text ">Грузоподъёмность: ${car.carrying_capacity?ifExists}</p>

                </div>

            </div>
        </div>
        <#if s.isAdmin>
            <a href="/cars/${car.id}/edit" class="btn btn-warning">Редактировать</a><br><br>
            <form action="/cars/${car.id}/delete"  method="post" >
                <button class="btn btn-warning" type="submit">Удалить</button>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
            </form>


        </#if>

    <#else>
        No message
    </#list>

    </div>


</@c.page>