<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as s>
<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по фамилии">
                <button type="submit" class="btn btn-primary ml-2">Поиск</button>
            </form>
        </div>
    </div>
    <script src="{{asset('../static/js/test.js')}}"></script>

    <div class="row">
        <#list messages as message>
            <div class="col-sm-4">
                <div class="card mt-5" style="width: 18rem;">
                    <div class="card-body">
                        <p class="card-text">Откуда: ${message.departure?ifExists} </p>
                        <p class="card-text">Куда: ${message.destination?ifExists}</p>
                        <p class="card-text text-muted">Расстояние: ${message.distance}</p>
                        <p class="card-text text-muted">Цена: ${message.price}</p>



                    </div>





                </div>

            </div>
        <#else>
            No message
        </#list>

    </div>


</@c.page>