<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>
<@c.page>


 <#list messages as message>
        <div class="container mt-5 mb-5">

                <form  method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input required type="text" value="${message.surname}" class="form-control" name="surname" placeholder="Фамилия">
                    </div>

                    <div class="form-group">
                        <input required type="text" class="form-control" value="${message.name}" name="name" placeholder="Имя" />
                    </div>

                    <div class="form-group">
                        <input required required type="text" class="form-control" value="${message.patronymic}" name="patronymic" placeholder="Отчество">
                    </div>
                    <div class="form-group">
                        <input required type="date" class="form-control" value="${message.dateName}" name="dateOfBirth" placeholder="Дата рождения">
                    </div>
                    <div class="form-group">
                        <input required type="text" class="form-control" value="${message.cityName}" name="city" placeholder="Город">
                    </div>
                    <div class="form-group">
                        <input required type="text" class="form-control" value="${message.streetName}" name="street" placeholder="Улица">
                    </div>
                    <div class="form-group">
                        <input required type="text" class="form-control"  value="${message.apartmentName}" name="apartment" placeholder="Номер квартиры">
                    </div>
                    <div class="form-group">
                        <input  required type="text" class="form-control" value="${message.positionName}" name="nameOfPosition" placeholder="Звание">
                    </div>
                    <div class="form-group">
                        <input required type="text" class="form-control" value="${message.salary}" name="salary" placeholder="Зарплата, BYN">
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Обновить</button>
                    </div>
                </form>

        </div>
 </#list>




</@c.page>