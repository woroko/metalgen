<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Songwriting ideas on demand. Generate lyrics
	 and pick your favourite phrases with the aid of our machine learning algorithms.">
	<meta name="author" content="John Mäkelä">
	<title>Lyrics Generator</title>
	<link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="/static/css/custom.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animsition/4.0.2/css/animsition.min.css">
	<script type="text/javascript" src="/static/js/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/animsition/4.0.2/js/animsition.min.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/static/js/strapping.min.js"></script>
</head>
<body>
	<!-- Static navbar -->
	<div class="animsition">
		<video autoplay loop muted poster="/static/images/splash.jpg" id="background">
            <img src="/static/images/splash.jpg">
        </video>
		<div>
            <div class="centering">
                <img src="/static/images/logo.png" alt="Lyrics Generator" class="logosize" style="margin-top: 20vh; margin-bottom: 2em;">
            </div>
			<div class="centering">
				<a class="btn transparent-btn animsition-link" style="margin-top: 0.5em;" href="./generate" >Generate lyrics</a>
			</div>
		</div>
		<footer class="navbar-fixed-bottom splashfooter">
			<div class="" style="color: #EAEAEA; !important">
				<span class="glyphicon glyphicon-envelope" style="font-size: 2em; top: 0.35em; margin-right: 0.3em;"></span>
				<span style="color: #EAEAEA; !important">john@Lyrics Generator.com</span>
			</div>
		</footer>
		<script>
        if( navigator.userAgent.match(/Android/i)
        || navigator.userAgent.match(/webOS/i)
        || navigator.userAgent.match(/iPhone/i)
        || navigator.userAgent.match(/iPad/i)
        || navigator.userAgent.match(/iPod/i)
        || navigator.userAgent.match(/BlackBerry/i)
        || navigator.userAgent.match(/Windows Phone/i)
        ){

            // If mobile, then we do all this

        }
        else {

            // If not mobile then do this
            document.getElementById("background").innerHTML = '<source src="/static/images/splash.webm" type="video/webm"><source src="/static/images/splash.mp4" type="video/mp4"><img src="/static/images/splash.jpg">';

        }
		  $(document).ready(function() {
		    $('.animsition').animsition();
		  });
	  </script>
	</div>
</body>
</html>
