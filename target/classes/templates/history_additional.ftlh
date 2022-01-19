<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>

<@c.page>



    <#list messages as message>
        <div class="col-sm-4">
            <div class="card mt-5" style="width: 18rem;">
                <div class="card-body">
                    <p class="card-text">Откуда: ${message.departure?ifExists}</p>
                    <p class="card-text">Куда: ${message.destination?ifExists}</p>
                    <p class="card-text ">Расстояние: ${message.distance?ifExists}</p>
                    <p class="card-text ">Цена: ${message.price?ifExists}</p>
                    <p class="card-text ">Тип авто: ${message.ordered_car?ifExists}</p>


                </div>

            </div>
        </div>
        <#if s.isAdmin>
            <a href="/history/${message.id}/edit" class="btn btn-warning">Редактировать</a><br><br>
            <form action="/history/${message.id}/delete"  method="post" >
                <button class="btn btn-warning" type="submit">Удалить</button>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
            </form>


        </#if>

    <#else>
        No message
    </#list>

    </div>


</@c.page>