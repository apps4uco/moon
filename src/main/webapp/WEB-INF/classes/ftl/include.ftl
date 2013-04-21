
<#macro modalLink id label>
 <a href="#${id}" role="button" class="btn btn-primary btn-large ${class}" data-toggle="modal">${label}</a>     
</#macro>

<#macro modal id label title icon="" class="">
   
    <!-- Modal -->
    <div class="modal hide fade" id="${id}" tabindex="-1" 
     role="dialog" aria-labelledby="${id}Label" aria-hidden="true">
    <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <#if icon?has_content><img src="${icon}" style="width:30px;height:30px;margin-right:5px;" class="pull-left"/></#if>
    <h3 id="${id}Label">${title}</h3>
    </div>
    <div class="modal-body">
 <#nested />    
    </div>
    </div>
</#macro>

<#macro qrModal>
<@modal id="qrModal" label="View QRCode" title="QRCode for ${url}" class="pull-right">
   <h2>What is this?</h2>
   <img class="pull-right" src="http://chart.apis.google.com/chart?cht=qr&amp;chs=350x350&amp;chld=L&amp;choe=UTF-8&amp;chl=${url}" alt="QRCode" />
    <p>To avoid typing the URL for this page in your mobile phone some phones have a special software which enables you to take a photo of a 2D barcode of the URL and navigate directly to the page.
   </p>
</@modal>
</#macro>

<#macro menu menuHrefs>
     <ul>  
       <#list menuHrefs as href>
       	<li ><!-- class="selected" --><a href="${href.url}">${href.label}</a></li>
       </#list>
     </ul>     
</#macro>

<#macro oldpage title id>
<html>
<head>  
  <title>${title}</title>
  <link rel="stylesheet" type="text/css" href="style.css"/>
</head>  
<body>
	<div id="header">
		<h1>${title}</h1>
  		<@menu id/>
	</div>
	<div id="content">
  <#nested />
	</div>
  <div id="footer">
	  <div class="center">
	  Sitio Web: <a href="http://${website}/">${website}</a> Email: ${email} Teléfono: ${telephone}
  	</div>
  </div>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '${analyticsaccount}']);
  _gaq.push(['_setDomainName', '${analyticsdomain}']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>
</#macro>

<#macro imagemenu id>
<#list images as image>
<#if image.id!=id>
<a href="${image.id+".html"}">${image.alt}</a>
<#else>
<span class="selected">${image.alt}</span>

</#if>
</#list>
<br />
</#macro>

<#macro menuYui menuHrefs>
<nav>
     <ul>  
       <#list menuHrefs as href>
       	<li ><!-- class="selected" --><a href="${href.url}">${href.label}</a></li>
       </#list>
     </ul>     
</nav>
</#macro>

<#macro article>
<section>
				<article class="blogPost">
					<header>
						<h2>This is the title of a blog post</h2>
						<p>Posted on <time datetime="2009-06-29T23:31+01:00">June 29th 2009</time> by <a href="#">Mads Kjaer</a> - <a href="#comments">3 comments</a></p>
					</header>
					<div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin 
euismod tellus eu orci imperdiet nec rutrum lacus blandit. Cras enim 
nibh, sodales ultricies elementum vel, fermentum id tellus. Proin metus 
odio, ultricies eu pharetra dictum, laoreet id odio. Curabitur in odio 
augue. Morbi congue auctor interdum. Phasellus sit amet metus justo. 
Phasellus vitae tellus orci, at elementum ipsum. In in quam eget diam 
adipiscing condimentum. Maecenas gravida diam vitae nisi convallis 
vulputate quis sit amet nibh. Nullam ut velit tortor. Curabitur ut elit 
id nisl volutpat consectetur ac ac lorem. Quisque non elit et elit 
lacinia lobortis nec a velit. Sed ac nisl sed enim consequat porttitor.</p>
					
						<img src="/images/flower.png" alt="Flower">

						<p>Pellentesque ut sapien arcu, egestas mollis massa. Fusce lectus
 leo, fringilla at aliquet sit amet, volutpat non erat. Aenean molestie 
nibh vitae turpis venenatis vel accumsan nunc tincidunt. Suspendisse id 
purus vel felis auctor mattis non ac erat. Pellentesque sodales 
venenatis condimentum. Aliquam sit amet nibh nisi, ut pulvinar est. Sed 
ullamcorper nisi vel tortor volutpat eleifend. Vestibulum iaculis 
ullamcorper diam consectetur sagittis. Quisque vitae mauris ut elit 
semper condimentum varius nec nisl. Nulla tempus porttitor dolor ac 
eleifend. Proin vitae purus lectus, a hendrerit ipsum. Aliquam mattis 
lacinia risus in blandit.</p>

						<p>Vivamus vitae nulla dolor. Suspendisse eu lacinia justo. 
Vestibulum a felis ante, non aliquam leo. Aliquam eleifend, est viverra 
semper luctus, metus purus commodo elit, a elementum nisi lectus vel 
magna. Praesent faucibus leo sit amet arcu vehicula sed facilisis eros 
aliquet. Etiam sodales, enim sit amet mollis vestibulum, ipsum sapien 
accumsan lectus, eget ultricies arcu velit ut diam. Aenean fermentum 
luctus nulla, eu malesuada urna consequat in. Pellentesque habitant 
morbi tristique senectus et netus et malesuada fames ac turpis egestas. 
Pellentesque massa lacus, sodales id facilisis ac, lobortis sed arcu. 
Donec hendrerit fringilla ligula, ac rutrum nulla bibendum id. Cras 
sapien ligula, tincidunt eget euismod nec, ultricies eu augue. Nulla 
vitae velit sollicitudin magna mattis eleifend. Nam enim justo, 
vulputate vitae pretium ac, rutrum at turpis. Aenean id magna neque. Sed
 rhoncus aliquet viverra.</p></div>
 <p>
 Connect with <a href="">Author name</a> on Google+ 
 </p>
				</article>
			</section>
			
<#assign openGraphMeta>
<meta property="article:published_time"  content="DateTime"> 
     <meta property="article:modified_time"   content="DateTime"> 
     <meta property="article:expiration_time" content="DateTime">
     <meta property="article:author"          content="URL to Author object">
     <meta property="article:section"         content="Section of article">
     <meta property="article:tag"             content="Keyword1">
      <meta property="article:tag"             content="Keyword2">
<#--     
article - Namespace URI: http://ogp.me/ns/article#

    article:published_time - datetime - When the article was first published.
    article:modified_time - datetime - When the article was last changed.
    article:expiration_time - datetime - When the article is out of date after.
    article:author - profile array - Writers of the article.
    article:section - string - A high-level section name. E.g. Technology
    article:tag - string array - Tag words associated with this article.
-->
</#assign>			
</#macro>

<#macro book>
<#assign openGraphMeta>
book - Namespace URI: http://ogp.me/ns/book#

    book:author - profile array - Who wrote this book.
    book:isbn - string - The ISBN
    book:release_date - datetime - The date the book was released.
    book:tag - string array - Tag words associated with this book.
</#assign>
</#macro>

<#macro profile>
<#assign openGraphMeta>
profile - Namespace URI: http://ogp.me/ns/profile#

    profile:first_name - string - A name normally given to an individual by a parent or self-chosen.
    profile:last_name - string - A name inherited from a family or marriage and by which the individual is commonly known.
    profile:username - string - A short unique string to identify them.
    profile:gender - enum(male, female) - Their gender.
</#assign>
</#macro>

<#macro comments>
<section id="comments">
				<h3>Comments</h3>
				<article>
					<header>
						<a href="#">George Washington</a> on <time datetime="2009-06-29T23:35:20+01:00">June 29th 2009 at 23:35</time>
					</header>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
 eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad 
minim veniam, quis nostrud exercitation ullamco laboris nisi ut.</p>
				</article>
				<article>
					<header>
						<a href="#">Benjamin Franklin</a> on <time datetime="2009-06-29T23:40:09+01:00">June 29th 2009 at 23:40</time>
					</header>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
 eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad 
minim veniam, quis nostrud exercitation ullamco laboris nisi ut.</p>
				</article>
				<article>
					<header>
						<a href="#">Barack Obama</a> on <time datetime="2009-06-29T23:59:00+01:00">June 29th 2009 at 23:59</time>
					</header>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
 eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad 
minim veniam, quis nostrud exercitation ullamco laboris nisi ut.</p>
				</article>
			</section>
</#macro>

<#macro sidebar>
<aside>
			<section>
				<header>
					<h3>Categories</h3>
				</header>
				<ul>
					<li><a href="#">Lorem ipsum dolor</a></li>
					<li><a href="#">Sit amet consectetur</a></li>
					<li><a href="#">Adipisicing elit sed</a></li>
					<li><a href="#">Do eiusmod tempor</a></li>
					<li><a href="#">Incididunt ut labore</a></li>
				</ul>
			</section>
			<section>
				<header>
					<h3>Archives</h3>
				</header>
				<ul>
					<li><a href="#">December 2008</a></li>
					<li><a href="#">January 2009</a></li>
					<li><a href="#">February 2009</a></li>
					<li><a href="#">March 2009</a></li>
					<li><a href="#">April 2009</a></li>
					<li><a href="#">May 2009</a></li>
					<li><a href="#">June 2009</a></li>
				</ul>
			</section>
		</aside>
</#macro>

<#macro header>
<header>
		<h2>${h2}</h2>
	</header>
</#macro>

<#macro footer>
	<footer>
		<div>
			<section id="about">
				<header>
					<h3>About</h3>
				</header>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do 
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad 
minim veniam, quis nostrud exercitation ullamco <a href="#">laboris nisi ut aliquip</a>
 ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur 
sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
 mollit anim id est laborum.</p>
			</section>
			<section id="blogroll">
				<header>
					<h3>Blogroll</h3>
				</header>
				<ul>
					<li><a href="#">NETTUTS+</a></li>
					<li><a href="#">FreelanceSwitch</a></li>
					<li><a href="#">In The Woods</a></li>
					<li><a href="#">Netsetter</a></li>
					<li><a href="#">PSDTUTS+</a></li>
				</ul>
			</section>
			<section id="popular">
				<header>
					<h3>Popular</h3>
				</header>
				<ul>
					<li><a href="#">This is the title of a blog post</a></li>
					<li><a href="#">Lorem ipsum dolor sit amet</a></li>
					<li><a href="#">Consectetur adipisicing elit, sed do eiusmod</a></li>
					<li><a href="#">Duis aute irure dolor</a></li>
					<li><a href="#">Excepteur sint occaecat cupidatat</a></li>
					<li><a href="#">Reprehenderit in voluptate velit</a></li>
					<li><a href="#">Officia deserunt mollit anim id est laborum</a></li>
					<li><a href="#">Lorem ipsum dolor sit amet</a></li>
				</ul>
			</section>
		</div>
	</footer>
</#macro>

<#macro form>
<form action="#" method="post">
				<h3>Post a comment</h3>
				<p>
					<label for="name">Name</label>
					<input name="name" id="name" required="" type="text">
				</p>
				<p>
					<label for="email">E-mail</label>
					<input name="email" id="email" required="" type="email">
				</p>
				<p>
					<label for="website">Website</label>
					<input name="website" id="website" type="url">
				</p>
				<p>
					<label for="comment">Comment</label>
					<textarea name="comment" id="comment" required=""></textarea>
				</p>
				<p><input value="Post comment" type="submit"></p>
			</form>
</#macro>

<#macro applet width height codebase>
<object>
<applet>
</applet>
</object>
</#macro>

<#macro jnlp>

</#macro>

<#-- include just after body -->
<#macro facebookInit language>
<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '${facebookAppId}', // App ID
      channelUrl : '//${websiteDomain}/channel.html', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });

    // Additional initialization code here
  };

  // Load the SDK Asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/${language}/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));
</script>
</#macro>

<#macro facebookSdkV1>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=170967929648437";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
</#macro>



<#macro facebookLike url="" width="200" layout="standard">
<fb:like send="true" width="${width}" layout="${layout}" show_faces="true"></fb:like>
<#--
<div class="fb-like" data-href="${url}" data-send="true" data-layout="${layout}" data-width="450" data-show-faces="true"></div>
-->
<#-- data-layout=standard/box_count/button_count data-action="recommend" -->
</#macro>

<#macro facebookUsersConnected>
<#-- display users that have signed up for your site. -->
<fb:facepile></fb:facepile>
<#--
<div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js
#appId={YOUR_APP_ID}&amp;xfbml=1"></script><fb:facepile></fb:facepile>
-->
</#macro>

<#macro facebookActivity>
<fb:activity site="${websiteDomain}">
<#-- app_id="${facebookAppId}" -->
</fb:activity>
</#macro>

<#macro facebookFriendsLike pageUrl width="300" max_rows="1">
<#-- displays the Facebook profile pictures of users who have connected with your page via a global or custom action -->
<fb:facepile href="${pageUrl}"  width="${width}" max_rows="${max_rows}"></fb:facepile>
<#-- action="og_recipebox:planning_to_make" -->
</#macro>

<#macro twitterFollow id language="en">
<a href="https://twitter.com/${id}" class="twitter-follow-button" data-show-count="false" data-lang="${language}" data-size="large">
Follow / Seguir a 
@${id}</a>
</#macro>

<#macro twitterUrl language="en">
<#--  Via: data-via="apps4u" Recommend: data-related="apps4u" -->
<a href="https://twitter.com/share" class="twitter-share-button" data-lang="${language}" data-size="large">Tweet</a>
</#macro>

<#macro twitterTo language="en">
<a href="https://twitter.com/intent/tweet?screen_name=support" class="twitter-mention-button" data-lang="${language}" data-size="large">
Tweet to @support
Twittear a @ayuda
</a>
</#macro>

<#macro image relUrl title width height alt>
<#assign mime="image/jpeg"/>
<#assign url="${websiteUrl+relUrl}"/>
<figure>
  <img src="${relUrl}" alt="${alt}"
  width="${width}" height="${height}" />
  <figcaption>${title}</figcaption>
</figure> 
<#assign openGraphMeta>
<meta property="og:title" content="${title}" />
<meta property="og:type" content="video.movie" />
<meta property="og:url" content="${url}" />
<meta property="og:image" content="${url}" />
<#--
<meta property="og:image:secure_url" content="https://secure.example.com/ogp.jpg" />
-->
<meta property="og:image:type" content="${mime}" />
<meta property="og:image:width" content="${width}" />
<meta property="og:image:height" content="${height}" />
</#assign>
</#macro>

<#macro video movie width height title ext="mp4" imageUrl="">
<#assign mime="video/mp4"/>
<#assign url="${websiteUrl+movie}"/>
<!--
TODO add video microdata
http://support.google.com/webmasters/bin/answer.py?hl=en&answer=162163
 -->
 <h2>${title}</h2>
<video width="${width}" height="${height}" controls="controls">
  <source src="${movie}.mp4" type="video/mp4" />
  <source src="${movie}.ogv" type="video/ogg" />
  <source src="${movie}.webm" type="video/webm" />
<#--
  <object width="640" height="360" type="application/x-shockwave-flash" data="__FLASH__.SWF">
		<param name="movie" value="__FLASH__.SWF" />
		<param name="flashvars" value="controlbar=over&amp;image=__POSTER__.JPG&amp;file=__VIDEO__.MP4" />
		<img src="__VIDEO__.JPG" width="640" height="360" alt="__TITLE__"
		     title="No video playback capabilities, please download the video below" />
	</object>
	-->
Your browser does not support the video tag.
</video>
<#--
<p>	<strong>Download Video:</strong>
	Closed Format:	<a href="__VIDEO__.MP4">"MP4"</a>
	Open Format:	<a href="__VIDEO__.OGV">"Ogg"</a>
</p>
-->
<#assign openGraphMeta>
<meta property="og:title" content="${title}" />
<meta property="og:type" content="video.movie" />
<meta property="og:url" content="${url}" />
<meta property="og:image" content="${imageUrl}" />

<meta property="og:video" content="${url}" />
<#--
<meta property="og:video:secure_url" content="https://secure.example.com/movie.swf" />
-->
<meta property="og:video:type" content="${mime}" />
<meta property="og:video:width" content="${width}" />
<meta property="og:video:height" content="${height}" />
<!--
    video:actor - profile array - Actors in the movie.
    video:actor:role - string - The role they played.
    video:director - profile array - Directors of the movie.
    video:writer - profile array - Writers of the movie.
    video:duration - integer >=1 - The movie's length in seconds.
    video:release_date - datetime - The date the movie was released.
    video:tag - string array - Tag words associated with this movie.
if type=video.episode    
    video:series - video.tv_show -
-->
</#assign>
</#macro>

<#macro pdf>

</#macro>

<#macro svg>

</#macro>

<#macro audio file>
<audio controls="controls">
  <source src="${file}.ogg" type="audio/ogg" />
  <source src="${file}.mp3" type="audio/mpeg" />
  Your browser does not support the audio element.
</audio> 
<#assign openGraphMeta>
<meta property="og:title" content="The Rock" />
<meta property="og:type" content="music.song" />
<meta property="og:url" content="http://www.imdb.com/title/tt0117500/" />
<meta property="og:image" content="http://ia.media-imdb.com/images/rock.jpg" />

<meta property="og:audio" content="http://example.com/sound.mp3" />
<meta property="og:audio:secure_url" content="https://secure.example.com/sound.mp3" />
<meta property="og:audio:type" content="audio/mpeg" />
<#-- 

    music:duration - integer >=1 - The song's length in seconds.
    music:album - music.album array - The album this song is from.
    music:album:disc - integer >=1 - Which disc of the album this song is on.
    music:album:track - integer >=1 - Which track this song is.
    music:musician - profile array - The musician that made this song.

-->
</#assign>
</#macro>

<#macro event>
<div itemscope itemtype="http://data-vocabulary.org/Event">
  ​<a href="http://www.example.com/events/spinaltap" itemprop="url" >
    <span itemprop="summary">Spinal Tap</span>
  </a>
   <img itemprop="photo" src="spinal_tap.jpg" />

  <span itemprop="description">After their highly-publicized search for a new drummer,
   Spinal Tap kicks off their latest comeback tour with a San
   Francisco show.</span>

  When:
  <time itemprop="startDate" datetime="2015-10-15T19:00-08:00">Oct 15, 7:00PM</time>—
  <time itemprop="endDate" datetime="2015-10-15T19:00-08:00">Oct 15, 9:00PM</time>

  Where:
  ​<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
     ​<span itemprop="name">Warfield Theatre</span>
     ​<span itemprop="address" itemscope itemtype="http://data-vocabulary.org/Address">
         <span itemprop="street-address">982 Market St</span>, 
         <span itemprop="locality">San Francisco</span>, 
         <span itemprop="region">CA</span>
     </span>
     <span itemprop="geo" itemscope itemtype="http://data-vocabulary.org/​Geo">
        <meta itemprop="latitude" content="37.774929" />
        <meta itemprop="longitude" content="-122.419416" />
     </span>
  </span>

  Category: <span itemprop="eventType">Concert</span>
  <span itemprop="ticketAggregate" itemscope itemtype="http://data-vocabulary.org/Offer-aggregate"> 
    Tickets from $<span itemprop="lowPrice">10.00</span>-$<span itemprop="highPrice">11.00</span>
    <span itemprop="currency" content="USD" /> 
    <span itemprop="offerCount">2,000</span> tickets available
    <a href="http://www.example.com/events/spinaltap/alltickets" itemprop="offerurl">
      http://google.com/ticket</span>See all available tickets</a>
  </span>
  <span itemprop="tickets" itemscope itemtype="http://data-vocabulary.org/Offer"> 
    <a href="http://www.example.com/events/spinaltap/presale" itemprop="offerurl">Presale tickets</a> 
    <span itemprop="price">$10</span><span itemprop="currency" content="USD" /> 
      till <time itemprop="priceValidUntil" datetime="2015-11-10">10 November 2015</time> 
      (<span itemprop="quantity">1000</span> available)  
  </span> 
  <span itemprop="tickets" itemscope itemtype="http://data-vocabulary.org/Offer"> 
    <a href="http://www.example.com/events/spinaltap/tickets" itemprop="offerurl">Full-price tickets</a> 
    <span itemprop="price">$11</span><span itemprop="currency" content="USD" /> 
  </span>
</div>
</#macro>

<#macro person>
<#--
name (fn) 	Name
nickname 	Nickname
photo 	An image link
title 	The person's title (for example, Financial Manager)
role 	The person's role (for example, Accountant)
url 	Link to a web page, such as the person's home page
affiliation (org) 	The name of an organization with which the person is associated (for example, an employer). If fn and org have the exact same value, Google will interpret the information as referring to a business or organization, not a person.
friend 	Identifies a social relationship between the person described and another person.
contact 	Identifies a social relationship between the person described and another person.
acquaintance 	Identifies a social relationship between the person described and another person.
address (adr) 	The location of the person. Can have the subproperties street-address, locality, region, postal-code, and country-name.
-->
<div itemscope itemtype="http://data-vocabulary.org/Person">
  My name is <span itemprop="name">Bob Smith</span>, 
  but people call me <span itemprop="nickname">Smithy</span>.
  Here is my homepage: 
  <a href="http://www.example.com" itemprop="url">www.example.com</a>.
  I live in 
  <span itemprop="address" itemscope
    itemtype="http://data-vocabulary.org/Address">
    <span itemprop="locality">Albuquerque</span>, 
    <span itemprop="region">NM</span> 
  </span>
  and work as an <span itemprop="title">engineer</span>
  at <span itemprop="affiliation">ACME Corp</span>.
  My friends:
  <a href="http://darryl-blog.example.com" rel="friend">Darryl</a>, 
  <a href="http://edna-blog.example.com" rel="friend">Edna</a>
</div>
</#macro>

<#--
Microdata format recommended by google
http://support.google.com/webmasters/bin/answer.py?hl=en&answer=99170

    Reviews
    People
    Products
    Businesses and organizations
    Recipes
    Events
    Music
    
    Applications
    Authors
    Products with many offers
 
Test them here
http://www.google.com/webmasters/tools/richsnippets?url=https%3A%2F%2Fmarket.android.com%2Fdetails%3Fid%3Dcom.zeptolab.ctr.paid%26hl%3Den

Product
http://support.google.com/webmasters/bin/answer.py?hl=en&answer=146750#usage

Event
http://support.google.com/webmasters/bin/answer.py?hl=en&answer=164506
-->

<#macro recipe>
<div itemscope itemtype="http://data-vocabulary.org/Recipe" >
  <h1 itemprop="name">Grandma's Holiday Apple Pie</h1>
  <img itemprop="photo" src="apple-pie.jpg" /> 
  By <span itemprop="author">Carol Smith</span>
  Published: <time datetime="2009-11-05" itemprop="published">
    November 5, 2009</time>
  <span itemprop="summary">This is my grandmother's apple pie recipe. I like to add a
    dash of nutmeg.</span>
  <span itemprop="review" itemscope itemtype="http://data-vocabulary.org/Review-aggregate">
    <span itemprop="rating">4.0</span> stars based on
    <span itemprop="count">35</span> reviews </span>
  Prep time: <time datetime="PT30M" itemprop="prepTime">30 min</time>
  Cook time: <time datetime="PT1H" itemprop="cookTime">1 hour</time>
  Total time: <time datetime="PT1H30M" itemprop="totalTime">1 hour 30 min</time>
  Yield: <span itemprop="yield">1 9" pie (8 servings)</span>
  <span itemprop="nutrition" itemscope itemtype="http://data-vocabulary.org/Nutrition">
    Serving size: <span itemprop="servingSize">1 medium slice</span>
    Calories per serving: <span itemprop="calories">250</span>
    Fat per serving: <span itemprop="fat">12g</span>
  </span>
  Ingredients:
    <span itemprop="ingredient" itemscope itemtype="http://data-vocabulary.org/RecipeIngredient">
      Thinly-sliced <span itemprop="name">apples</span>:
      <span itemprop="amount">6 cups</span>
    </span>
    <span itemprop="ingredient" itemscope itemtype="http://data-vocabulary.org/RecipeIngredient">
      <span itemprop="name">White sugar</span>:
      <span itemprop="amount">3/4 cup</span>
    </span>
  Directions:
    <div itemprop="instructions">
      1. Cut and peel apples
      2. Mix sugar and cinnamon. Use additional sugar for tart apples.
     
    </div>
</div>
</#macro>

<#macro breadcrumb>
<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
  <a href="http://www.example.com/dresses" itemprop="url">
    <span itemprop="title">Dresses</span>
  </a> ›
</div>  
<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
  <a href="http://www.example.com/dresses/real" itemprop="url">
    <span itemprop="title">Real Dresses</span>
  </a> ›
</div>  
<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
  <a href="http://www.example.com/clothes/dresses/real/green" itemprop="url">
    <span itemprop="title">Real Green Dresses</span>
  </a>
</div>
</#macro>

<#macro openGraph type="image">
<#-- type can be video/audio -->
<meta property="fb:app_id" content="${facebookAppId}"> 
<meta property="og:${type}" content="http://example.com/ogp.jpg" />
<meta property="og:${type}:secure_url" content="https://secure.example.com/ogp.jpg" />
<meta property="og:${type}:type" content="image/jpeg" />
<#--
<meta property="og:video:type" content="application/x-shockwave-flash" />
<meta property="og:audio:type" content="audio/mpeg" />
-->
<#if type!="audio">
<meta property="og:${type}:width" content="400" />
<meta property="og:${type}:height" content="300" />
</#if>

<meta property="og:site_name" content="${websiteName}" />
<meta property="og:latitude" content="34.10178" />
<meta property="og:longitude" content="-118.340969" />
<meta property="og:street-address" content="6925 Hollywood Blvd" />
<meta property="og:locality" content="Los Angeles" />
<meta property="og:region" content="CA" />
<meta property="og:postal-code" content="90028" />
<meta property="og:country-name" content="USA" />

<meta property="og:email" content="me@example.com" />
<meta property="og:phone_number" content="650-123-4567" />
<meta property="og:fax_number" content="+1-415-123-4567" />
...

<#--
    og:latitude
    og:longitude
    og:street-address
    og:locality
    og:region
    og:postal-code
    og:country-name
    og:email
    og:phone_number
    og:fax_number
    og:type
-->
</#macro>

<#macro rating value max="10">
<div itemprop="rating" itemscope itemtype="http://data-vocabulary.org/Rating">
   Rating: <span itemprop="value">8.5</span>
   <meta itemprop="best" content="10" />
</div>
</#macro>

<#macro duration>
Duration: 
<span>1 hour 30 minutes<meta itemprop="duration" content="PT1H30M" />
</span>
</#macro>

<#macro organization name street locality region tel url>
<div itemscope itemtype="http://data-vocabulary.org/Organization"> 
    <span itemprop="name">${name}</span>
    Located at 
    <span itemprop="address" itemscope 
      itemtype="http://data-vocabulary.org/Address">
      <span itemprop="street-address">${street}</span>, 
      <span itemprop="locality">${locality}</span>, 
      <span itemprop="region">${region}</span>.
    </span>
    Phone: <span itemprop="tel">${tel}</span>.
    <a href="http://www.example.com" itemprop="url">${url}</a>.
</div>
</#macro>

<#-- Linked in http://developer.linkedin.com/plugins -->

<#macro googlePlusOne><#-- see https://developers.google.com/+/plugins/+1button/ -->
<g:plusone size="tall"></g:plusone>
</#macro>

<#macro googlePlusShare>
<#-- see https://developers.google.com/+/plugins/share/ -->
<g:plus action="share" annotation="vertical-bubble"></g:plus>
</#macro>

<#macro googlePlusBadge>
<#-- https://developers.google.com/+/plugins/badge/ -->
<#-- Place this tag where you want the badge to render. -->
<div class="g-plus" data-height="69" data-href="//plus.google.com/113427831130010379193?rel=author"></div>
</#macro>

<#macro googlePlusInit>
<#-- Place this tag after the last badge tag. -->
<script type="text/javascript">
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
</#macro>


<#macro skype>
<a href="skype:cpghotel?call">Skype</a>
</#macro>

<#macro facebookPage id>
<a href="http://www.facebook.com/${id}">
<img href="http://static.ak.fbcdn.net/rsrc.php/zB6N8/hash/4li2k73z.gif" alt="Facebook"/>
</a>
</#macro>

<#macro flickrPage id>
<a href="http://www.flickr.com/photos/${id}">
Flickr
</a>
</#macro>

<#macro qrcode>
<#--
Calendar event
BEGIN:VEVENT
SUMMARY:ddd
DTSTART:20120821T192600Z
DTEND:20120821T202600Z
LOCATION:fff
DESCRIPTION:fff
END:VEVENT


Contact information
MECARD:N:dd;ORG:dd;TEL:1221;URL:http\://www.x.vo;EMAIL:dd@x.com;ADR:dd da;NOTE:ddddd;;

BEGIN:VCARD
N:dd
ORG:dd
TITLE:dd
TEL:1221
URL:http://www.x.vo
EMAIL:dd@x.com
ADR:dd da
NOTE:ddd
END:VCARD

Email address   mailto:sss@x.com
Geo location    geo:5,5
Phone number	tel:123123
SMS				smsto:12331:ddddd
Text			plain text
URL				http://localhost/es/capurgana.html
Wifi: SSID Password Type=WEP,WPA   WIFI:S:ggg;T:WEP;P:dddd;;
 -->
</#macro>