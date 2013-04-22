<#macro menu menuHrefs menuLabels>
<nav>
     <ul>  
       <#list menuHrefs as href>
       	<li ><!-- class="selected" --><a href="${href}">${href}</a></li>
       </#list>
     </ul>     
</nav>
</#macro>