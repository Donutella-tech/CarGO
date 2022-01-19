<#import "parts/common.ftlh" as c>

<@c.page>
   <p>Список пользователей</p>

    <table>
        <thead>
        <tr>
            <th class="card-text mr-1">Name</th>
            <th class="card-text">Role</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
        <div class="container mt-5">
            <tr>
                <td class="card-text">${user.username}</td>
                <td class="card-text"><#list user.roles as role>${role}<#sep>, </#list></td>
        </div>
                <td><a href="/user/${user.id}">
                        <button type="button" class="ml-2 btn btn-primary btn-sm">Редактирование</button>
                    </a>
                </td>
                <td>
                    <a href="/user/${user.id}/delete">
                    <button type="button" class="ml-2 btn btn-primary btn-sm"> Удалить</button>
                    </a>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
    <a href="/registration">
    <button type="button" class="mt-2 btn btn-primary btn-sm"> Добавить пользователя</button>
    </a>
</@c.page>