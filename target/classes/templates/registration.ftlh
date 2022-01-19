<#import "parts/common.ftlh" as c>
<#import 'parts/login.ftlh' as l>
    <#import  'parts/registration.ftlh ' as r>
<@c.page>
    <div class="mb-1">Добавить нового пользователя</div>
    ${message?ifExists}

  <@r.registration "/registration"/>
</@c.page>