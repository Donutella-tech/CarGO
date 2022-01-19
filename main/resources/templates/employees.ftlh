<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>
<@c.page>
    <#if s.isAdmin>
        <div class="form-row">
            <div class="form-group col-md-6">
                <form method="get" action="/cars" class="form-inline">
                    <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по фамилии">
                    <button type="submit" class="btn btn-primary ml-2">Поиск</button>
                </form>
            </div>
        </div>

        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Добавить работника
        </a>
        <div class="collapse" id="collapseExample">
            <div class="form-group mt-3">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input required type="text" class="form-control" name="name" placeholder="Имя">
                    </div>

                    <div class="form-group">
                        <input required type="text" class="form-control" name="surname" placeholder="Фамилия" />
                    </div>

                    <div class="form-group">
                        <input required type="text" class="form-control" name="address" placeholder="Адрес ">
                    </div>
                    <div class="form-group">
                        <input required type="text" class="form-control" name="passport_id" placeholder="Номер паспорта">
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="row">
            <#list employees as employee>
                <div class="col-sm-4">
                    <div class="card mt-5" style="width: 18rem;">
                        <div class="card-body">
                            <p class="card-text">${employee.name?ifExists} ${employee.surname?ifExists}</p>
                            <p class="card-text">Адрес: ${employee.address?ifExists} </p>
                            <p class="card-text">Номер паспорта: ${employee.passport_id?ifExists} </p>
                            <a href="/employees/${employee.id}" class="btn btn-primary">Детальнее</a>
                        </div>

                    </div>

                </div>
            <#else>
                No message
            </#list>

        </div>
    </#if>

</@c.page>