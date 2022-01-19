<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>
<@c.page>



    <#list employees as employee>
        <div class="container mt-5 mb-5">

            <form  method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input required type="text" value="${employee.name}" class="form-control" name="name" placeholder="Имя">
                </div>

                <div class="form-group">
                    <input required type="text" class="form-control" value="${employee.surname}" name="surname" placeholder="Фамилия" />
                </div>

                <div class="form-group">
                    <input required type="text" class="form-control" value="${employee.address}" name="address" placeholder="Адресс">
                </div>
                <div class="form-group">
                    <input required type="text" class="form-control" value="${employee.passport_id}" name="passport_id" placeholder="Номер паспорта">
                </div>



                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Обновить</button>
                </div>
            </form>

        </div>
    </#list>




</@c.page>