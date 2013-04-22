<@page title="Contactar a Dive and Green, Capurgana, Colombia" 
h1="Contacténos" 
keywords="Buceo Capurgana, Buceo Colombia, Buceo Caribe, Diving Capurgana, Diving Caribbean, Diving Colombia"
description="Dive and Green es ...">
<form class="well form-horizontal" action="/contact/" method="post" name="formulario" id="formulario">
<fieldset class="control-group error">
<@control "Nombre" "nombre">
<input name="nombre" type="text" id="nombre" autofocus="autofocus" required="required">
</@>
<@control "Pais" "pais">
<input name="pais" type="text" id="pais" size="40" required="required" value="Colombia">	 
</@>	
<@control "Eres buzo? Que nivel?" "buzo">
<input name="buzo" type="text" id="buzo" size="40">
</@>
<@control "E-mail" "email">
<input name="email" type="email" id="email" size="40" required="required">		 
</@>
<@control "Preguntas y comentarios" "comentarios">
<textarea name="comentarios" cols="55" rows="15" id="comentarios" required="required"></textarea>
</@>
<div class="form-actions">
<button class="btn btn-primary" name="Submit" type="submit">Enviar</button>
</div>
</fieldset>
</form>
</@page>