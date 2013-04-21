<@page title="Contact Dive and Green, Capurgana, Colombia" 
h1="Contact us" 
keywords="Buceo Capurgana, Buceo Colombia, Buceo Caribe, Diving Capurgana, Diving Caribbean, Diving Colombia"
description="Dive and Green es ...">
<form class="well form-horizontal" action="/contact/" method="post" name="formulario" id="formulario">
<fieldset class="control-group error">
<@control "Name" "nombre">
<input name="nombre" type="text" id="nombre" autofocus="autofocus" required="required" value="Fulano">
</@>
<@control "Country" "pais">
<input name="pais" type="text" id="pais" size="40" required="required" value="Colombia">	 
</@>	
<@control "Already a diver? What level?" "buzo">
<input name="buzo" type="text" id="buzo" size="40">
</@>
<@control "E-mail" "email">
<input name="email" type="email" id="email" size="40" required="required" value="xxx@gmail.com">		 
</@>
<@control "Questions or Comments" "comentarios">
<textarea name="comentarios" cols="55" rows="15" id="comentarios" required="required">Me interesa bucear en Capurgana</textarea>
</@>
<div class="form-actions">
<button class="btn btn-primary" name="Submit" type="submit">Send</button>
</div>
</fieldset>
</form>
</@page>