<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>

<@c.page>



    <#list employees as employee>
        <div class="col-sm-4">
            <div class="card mt-5" style="width: 18rem;">
                <div class="card-body">
                    <p class="card-text">${employee.name?ifExists} ${employee.surname?ifExists}</p>
                    <p class="card-text">Год выпуска: ${employee.address?ifExists}</p>
                    <p class="card-text ">Гос номер: ${employee.address?ifExists}</p>


                </div>

            </div>
        </div>
        <#if s.isAdmin>
            <a href="/employees/${employee.id}/edit" class="btn btn-warning">Редактировать</a><br><br>
            <form action="/employees/${employee.id}/delete"  method="post" >
                <button class="btn btn-warning" type="submit">Удалить</button>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
            </form>


        </#if>

    <#else>
        No message
    </#list>

    </div>


</@c.page>