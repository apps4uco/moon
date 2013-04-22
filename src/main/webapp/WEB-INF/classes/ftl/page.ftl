<#macro page title h1 keywords description lead="">
<#assign sectionList = pp.newWritableSequence() />
<#assign content>
<#nested>
</#assign>
<!DOCTYPE html>
<html lang="en" xmlns:fb="http://ogp.me/ns/fb#">
  <head>
    <meta charset="utf-8" />
    <title>${title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="${description}" />
    <meta name="keywords" content="${keywords}" />
   
    <meta name="author" content="" />
    
    <#list languages?keys as langId>
    <#assign langLabel=languages[langId]/>
	<#if resource.language!=langId>
	<link rel="alternate" hreflang="${langId}" href="${site.url}${langId}/${resource.id}.html" />
	</#if>
	</#list>

    <link href="/css/bootstrap.css" rel="stylesheet" />
    
    <link href="/css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="/css/style.css" rel="stylesheet" />
    	
<#--
<link href="/css/docs.css" rel="stylesheet" />
    <link href="/js/google-code-prettify/prettify.css" rel="stylesheet" />
   -->
    <#-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js">
      </script>
    <![endif]-->
     <script src="/js/jquery.js"></script>

    <#-- fav and touch icons -->
    <link rel="shortcut icon" href="/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/ico/apple-touch-icon-144-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/ico/apple-touch-icon-114-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/ico/apple-touch-icon-72-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" href="/ico/apple-touch-icon-57-precomposed.png" />
  </head>

  <body data-spy="scroll" data-target=".subnav">
   <div id="fb-root"></div>
   <script>
   var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '${site.analyticsaccount}']);
  _gaq.push(['_setDomainName', '${site.analyticsdomain}']);
  _gaq.push(['_trackPageview']);
  
   $.ajax({
  url: '//connect.facebook.net/en_US/all.js',
  dataType: 'script',
  cache: true, // otherwise will get fresh copy every page load
  success: function() {
     FB.init({
     appId  : '1234',
     status: true, // check login status
     cookie: true, // enable cookies to allow server to access session,
     xfbml: true, // enable XFBML and social plugins
     oauth: true, // enable OAuth 2.0
     channelUrl: 'http://localhost/channel.html' //custom channel
   });
  }
});

$.ajax({
  url: 'https://apis.google.com/js/plusone.js',
  dataType: 'script',
  cache: true});

$.ajax({
  url: ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js',
  dataType: 'script',
  cache: true});
  
$.ajax({
  url: '//platform.twitter.com/widgets.js',
  dataType: 'script',
  cache: true});
  
$.ajax({
  url: '//platform.linkedin.com/in.js',
  dataType: 'script',
  cache: true});
</script>
   <#--
 <script src="//connect.facebook.net/en_US/all.js"></script>
 <script>
   FB.init({
     appId  : '1234',
     status: true, // check login status
     cookie: true, // enable cookies to allow server to access session,
     xfbml: true, // enable XFBML and social plugins
     oauth: true, // enable OAuth 2.0
     channelUrl: 'http://localhost/channel.html' //custom channel
   });
 </script>
<script>
(function(doc, script) {
    var js, 
        fjs = doc.getElementsByTagName(script)[0],
        add = function(url, id) {
            if (doc.getElementById(id)) {return;}
            js = doc.createElement(script);
            js.src = url;
            id && (js.id = id);
            fjs.parentNode.insertBefore(js, fjs);
        };

    // Google Analytics
    add(('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js', 'ga');
    // Google+ button
    add('https://apis.google.com/js/plusone.js');
    // Facebook SDK
    add('//connect.facebook.net/en_US/all.js', 'facebook-jssdk');
    // Twitter SDK
    add('//platform.twitter.com/widgets.js', 'twitter-wjs');
}(document, 'script'));
</script>
    -->
    
<#--      
<@modal "betterplace"   "betterplace"   "betterplace" "/ico/social/betterplace.png">Text</@modal>
<@modal "blogger"       "blogger"       "blogger" "/ico/social/blogger.png">Text</@modal>
<@modal "facebook"      "facebook"      "facebook" "/ico/social/facebook.png">
<div>
<@facebookLike/>
</div>
<div>    
    <@facebookActivity/>
    </div>
    <div>
    <@facebookUsersConnected/>
    </div>
</@modal>
<@modal "flickr"        "flickr"        "flickr" "/ico/social/flickr.png">Text</@modal>
<@modal "friendfeed"    "friendfeed"    "friendfeed" "/ico/social/friendfeed.png">Text</@modal>
<@modal "google"        "google"        "google" "/ico/social/google.png">
<div>
 <@googlePlusOne/>
 </div>
 <div>
    <@googlePlusShare/>
    </div>
    <div>
    <@googlePlusBadge/>
    </div>
    <@googlePlusInit/>
</@modal>
<@modal "lastfm"        "lastfm"        "lastfm" "/ico/social/lastfm.png">Text</@modal>
<@modal "linkedin"      "linkedin"      "linkedin" "/ico/social/linkedin.png">Text</@modal>
<@modal "myspace"       "myspace"       "myspace" "/ico/social/myspace.png">Text</@modal>
<@modal "myvideo"       "myvideo"       "myvideo" "/ico/social/myvideo.png">Text</@modal>
<@modal "picasa"        "picasa"        "picasa" "/ico/social/picasa.png">Text</@modal>
<@modal "rss"   "rss"   "rss" "/ico/social/rss.png">Text</@modal>
<@modal "studivz"       "studivz"       "studivz" "/ico/social/studivz.png">Text</@modal>
<@modal "twitter"       "twitter"       "twitter" "/ico/social/twitter.png">
<@twitterFollow id=twitterId language=language/>
    <@twitterUrl language=language/>
</@modal>
<@modal "xing"  "xing"  "xing" "/ico/social/xing.png">Text</@modal>
<@modal "youtube"       "youtube"       "youtube" "/ico/social/youtube.png">Text</@modal>
-->    
    
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">${site.name}</a>
          <div class="nav-collapse">
<#if resource.language?has_content>          
            <ul class="nav">
             <#list navmenu[resource.language] as menuItem>
             <#if resource.id+".html"!=menuItem.url>
             <#assign href="/"+menuItem.url/>
				<#assign class=""/>
				<#else>
					<#assign href="#"/>
					<#assign class=" class=\"active\""/>				
				</#if>
              <li${class}><a href="${href}">${menuItem.label}</a></li>
              </#list>
            </ul>
</#if>
<#-- Not implemented
            <form class="navbar-search pull-left">
   			 <input type="text" class="search-query" placeholder="Search" />
    		</form>
-->    		
    		<ul class="nav pull-right">
    		 <#list languages?keys as langId>
    		<#assign langLabel=languages[langId]/>
    		 <#if ".html"!=langId>
             <#assign href=langId/>
				<#assign class=""/>
				<#else>
					<#assign href="#"/>
					<#assign class=" class=\"active\""/>				
				</#if>
              <li${class}><a href="/${langId}/">${langLabel}</a></li>
              <#-- TODO add <#if resource.id?has_content>${resource.id}.html</#if> with a lookup from the id in lang1 to the id in lang2 -->
              </#list>    		
    		</ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
 <#if resource.language?has_content><#-- if we are on the root page no language + no breadcrumbs -->    
  <ul class="breadcrumb">
    <li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
    <#-- if / use /index.html -->
    <a href="/index.html" itemprop="url"><span itemprop="title">Principal</span></a> <span class="divider">/</span>
    </li>
    <li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
    <a href="/${resource.language}/"><span itemprop="title">${languages[resource.language]}</span></a> <span class="divider">/</span>
    </li>
    <#-- TODO for google should the last breadcrumb be a hyperlink -->
    <li class="active" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb"><span itemprop="title">${h1}</span></li>
    </ul>
 <#--       
    <div class="pull-right">
    </div>
    -->
</#if>    
<#--
<a data-original-title="A Title" href="#" class="btn btn-large btn-danger" rel="popover" data-content="And here's some amazing content. It's very engaging. right?">Click to toggle popover</a>
-->    
    <div class="container-fluid">
<header class="subhead" id="overview">
  <h1>${h1}</h1>
  <#if lead?has_content>
  <p class="lead">${lead}</p>
  </#if>
  </header>
  <#if sectionList?has_content>
  <div class="subnav">
    <ul class="nav nav-pills">    
<#list sectionList as sect>    
      <li><a href="#${sect.id}">${sect.title}</a></li>      
</#list>
    </ul>
  </div>
  </#if> <#-- subnav -->
<div class="row-fluid">
    <div class="span10">${content}</div>
    <div class="span2">
    <div style="height:100px;width:auto;overflow:hidden;"> 
    <@facebookLike layout="box_count" width="100"/>
    </div><div style="height:75px;width:auto;overflow:hidden;">
    <@googlePlusOne/>
    </div><div style="height:70px;width:auto;overflow:hidden;">
    <@googlePlusShare/>
    </div><div style="height:60px;width:auto;overflow:hidden;">
    <@twitterUrl language=language/>
	</div>
	<div style="height:60px;width:auto;overflow:hidden;"><script type="IN/Share" data-counter="top"></script></div>
<#--       
    <#list [
"facebook",
"google",
"friendfeed",

"twitter",
"youtube",
"blogger",

"linkedin",
"flickr",
"picasa",

"rss",

"lastfm",
"myspace",
"myvideo",

"betterplace",
"studivz",
"xing"
] as social>
     <a href="#${social}" style="display:block" title="${social}" data-toggle="modal"><img src="/ico/social/${social}.png" alt="${social}"/></a>
    </#list>
-->    
    </div>
    </div>
     <footer class="footer">
        <p><#-- &copy; --> ${site.name} ${site.copyright}</p>
      </footer>
    </div> <!-- /container -->
    <!-- javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <#--
    <script src="/js/jquery.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
   
    -->
    <script src="/js/google-code-prettify/prettify.js"></script>
    <script src="/js/bootstrap-transition.js"></script>
    <script src="/js/bootstrap-alert.js"></script>
    <script src="/js/bootstrap-modal.js"></script>
    <script src="/js/bootstrap-dropdown.js"></script>
    <script src="/js/bootstrap-scrollspy.js"></script>
    <script src="/js/bootstrap-tab.js"></script>
    <script src="/js/bootstrap-tooltip.js"></script>
    <script src="/js/bootstrap-popover.js"></script>
    <script src="/js/bootstrap-button.js"></script>
    <script src="/js/bootstrap-collapse.js"></script>
    <script src="/js/bootstrap-carousel.js"></script>
    <script src="/js/bootstrap-typeahead.js"></script>
    <script src="/js/application.js"></script>
  </body>
</html>
</#macro>

<#macro control label id>
<div class="control-group">
<label class="control-label" for="${id}">${label}: </label>
<div class="controls">
<#nested />
</div>
</div>
</#macro>

<#macro section title id>
<#assign thisSection = pp.newWritableHash() />

<@pp.set hash=thisSection key="id" value=id />
<@pp.set hash=thisSection key="title" value=title />
<@pp.add seq=sectionList value=thisSection/>

<section id="${id}">
  <div class="page-header">
    <h2>${title}</h2>
  </div>
  
  <div class="row-fluid">
  <div class="span12">
  <#nested/>
  	</div>
  </div>
  <small><a href="#" onclick="$('html, body').animate({ scrollTop: 0 }, 0);return false;">Top</a></small>
  </section>
</#macro>
