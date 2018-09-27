<#import "/spring.ftl" as spring>
<html>
<h1>Messages</h1>
<ul>
<#list messages as message>
    <li>${message}</li>
</#list>
</ul>
<br>
<a href="/logout">Logout</a>
</html>