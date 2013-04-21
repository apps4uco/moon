<@page title="Fotos de Buceo en el Caribe con Dive and Green, Capurgana, Colombia" 
h1="Fotos de Buceo en Capurgana" 
keywords="Buceo Capurgana, Buceo Colombia, Buceo Caribe, Diving Capurgana, Diving Caribbean, Diving Colombia"
description="Dive and Green es ...">

<div class="row">
    <div class="span4">
<div id="carousel" class="carousel slide">
    <!-- Carousel items -->
    <div class="carousel-inner">
<#list 10..39 as i>
<#assign active><#if i==10> active<#else></#if></#assign>
    <div class="item${active}">
                    <img src="/images/dive${i}.jpg" alt="">
                    <#--
                    <div class="carousel-caption">
                      <h4>Second Thumbnail label</h4>
                      <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    </div>
                    -->
                  </div>
</#list>                  
    </div>
    <!-- Carousel nav -->
    <a class="carousel-control left" href="#carousel" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#carousel" data-slide="next">&rsaquo;</a>
    </div>

</div>
<div class="span8">
<ul class="thumbnails">
<#list 10..39 as i>
    <li class="span2">
    <a href="javascript:void(0);" onclick="$('#carousel').carousel(${i-10})" class="thumbnail">
    <img src="/images/fot0${i}.jpg" alt="">
    </a>
    </li>
    </#list>
 </ul>
</div>
    </div>


<div class="row">

<ul class="thumbnails">
<#list 10..39 as i>
    <li class="span2">
    <a href="/images/dive${i}.jpg" class="thumbnail">
    <img src="/images/fot0${i}.jpg" alt="">
    </a>
    </li>
    </#list>
 </ul>
    </div>
</@page>