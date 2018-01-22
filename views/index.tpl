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
	<script type="text/javascript" src="/static/js/inference.js"></script>
</head>
<body>
	<!-- Static navbar -->
	<div class="animsition">
		<nav class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="row">
					<div class="navbar-header" style="">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand animsition-link" href="./" style=""><span class="glyphicon glyphicon-chevron-left"></span></a>
						<a class="navbar-brand" href="#">Lyrics Generator</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#">Main</a></li>
							<li style="background-color:#33332F;"><a href="#">Login</a></li>
						</ul>
					</div><!--/.nav-collapse -->
				</div>
			</div>
		</nav>
		<div class="container" style="padding-left: 3em; padding-right: 2em;">
			<div class="row">
				<div class="btn-group">
					<div class="btn-group">
						<button type="button" id="genrebutton" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
						Genre <span class="caret"></span></button>
				    <ul class="dropdown-menu" role="menu">
				      <li><a href="#" onclick="setGenre(1)">Metal</a></li>
				      <li><a href="#" onclick="setGenre(2)">Pop</a></li>
				    </ul>
					</div>
					<button type="button" class="btn btn-primary" onclick="loadLyrics()">Generate lyrics</button>
				</div>

				<div id="textarea">
					<p>Loading...</p>
				</div>
			</div>
			<!--./row-->
			<div class="row">
				<hr>
				<footer>
					<p>&copy; 2017 Lyrics Generator.</p>
				</footer>
			</div>
		</div>
		<!-- /container -->
	</div>
	<script>
		$(document).ready(function() {
			$('.animsition').animsition();
			loadIntro();
		});
	</script>
</body>
</html>
