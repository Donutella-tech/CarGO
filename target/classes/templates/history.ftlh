<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>
<@c.page>





    <#if !s.isAdmin>
        <div class="row">
        <#list messages as message>
            <#if s.name==message.author>

                <div class="col-sm-4">
                    <div class="card mt-5" style="width: 18rem;">
                        <div class="card-body">
                            <p class="card-text">Откуда: ${message.departure?ifExists} </p>
                            <p class="card-text">Куда: ${message.destination?ifExists}</p>
                            <p class="card-text">Расстояние: ${message.distance}</p>
                            <p class="card-text ">Тип автомобиля: ${message.ordered_car?ifExists} </p>
                            <p class="font-weight-bold">Цена: ${message.price} бел.руб</p>
                            <a href="/history/${message.id}" class="btn btn-primary">Детальнее</a>
                           <#-- <p class="card-text text-muted">Добавил ${message.author?ifExists}</p>-->
                        </div>
                    </div>
                </div>

            </#if>
        <#else>
            No message
        </#list>
        </div>

    <#else>
      <#--  <div class="form-row">
            <div class="form-group col-md-6">
                <form method="get" action="/history" class="form-inline">
                    <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по username">
                    <button type="submit" class="btn btn-primary ml-2">Поиск</button>
                </form>
            </div>
        </div>-->




        <div class="row">
        <#list messages as message>

                <div class="col-sm-4">
                    <div class="card mt-5" style="width: 18rem;">
                        <div class="card-body">
                            <p class="card-text">Номер заказа:${message.id?ifExists} </p>
                            <p class="card-text">Откуда: ${message.departure?ifExists} </p>
                            <p class="card-text">Куда: ${message.destination?ifExists}</p>
                            <p class="card-text ">Расстояние: ${message.distance}</p>
                            <p class="font-weight-bold ">Цена: ${message.price} бел.руб</p>
                            <p class="card-text">Тип автомобиля: ${message.ordered_car?ifExists} </p>
                            <p class="card-text text-muted">Добавил ${message.author?ifExists}</p>
                            <a href="/history/${message.id}" class="btn btn-primary">Детальнее</a>
                        </div>
                    </div>
                </div>

        <#else>
            No message
        </#list>
        </div>
    </#if>



</@c.page>