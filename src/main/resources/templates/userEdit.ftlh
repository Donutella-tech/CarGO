<#import "parts/common.ftlh" as c>

<@c.page>
   <p class="md-2 ml-10">Редактирование пользователей</p>

               <form action="/user" method="post">
     <!--     <p>Username <span class="required" >*</span> <br>
                <input type="text" name="username" value="${user.username}" size="40">
           <p>Password <span class="required" >*</span> <br>
                <input type="text" name="password" value="${user.password}" size="40">
-->
                   <div class="form-group row">
                       <label class="col-sm-2 col-form-label">User Name* :</label>
                       <div class="col-sm-6">
                           <input required type="text" name="username" class="form-control" value="${user.username}" placeholder="User name" />
                       </div>
                   </div>
                   <div class="form-group row">
                       <label class="col-sm-2 col-form-label">Password*:</label>
                       <div class="col-sm-6">
                           <input required type="text" name="password" class="form-control" value="${user.password}" placeholder="Password" />
                       </div>
                   </div>




        <#list roles as role>
            <div>
                <label><input type="checkbox" class="ui-icon-circle-check" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" class="btn btn-primary" value="${user.id}" name="userId">
      <input type="hidden" value="${_csrf.token}" name="_csrf">
                   <button class="btn btn-primary" type="submit">Сохранить</button>

    </form>
</@c.page>