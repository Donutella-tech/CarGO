<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>
<@c.page>



<#list messages as message>
<div class="container mt-5 mb-5">

    <form  method="post" enctype="multipart/form-data">
        <div class="form-group">
            <input required type="text" value="${message.departure}" class="form-control" name="departure" placeholder="Откуда">
        </div>

        <div class="form-group">
            <input required type="text" class="form-control" value="${message.destination}" name="destination" placeholder="Куда" />
        </div>

        <div class="form-group">
            <input required type="text" class="form-control" value="${message.distance}" name="distance" placeholder="Расстояние">
        </div>
        <div class="form-group">
            <input required type="text" class="form-control" value="${message.price}" name="price" placeholder="Цена">
        </div>
        <div class="form-group">
            <input required type="text" class="form-control" value="${message.ordered_car}" name="ordered_car" placeholder="Тип авто">
        </div>



        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Обновить</button>
        </div>
    </form>

</div>
</#list>




</@c.page>