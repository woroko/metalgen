var genre = 1; //genre metal

function loadLyrics(){
  var lyricsDict = {
    genre : String(genre)
  };
  var data = JSON.stringify(lyricsDict);

  $("#textarea").load("ajax/loadlyrics", lyricsDict);
  //alert("LoadLyrics");
}

function loadIntro(){
  $("#textarea").load("static/html/introtext.html");
  //alert("loadIntro");
}

function setGenre(number) {
  genre = number;
  if (genre == 1) {
    //alert("metal")
    $("#genrebutton").html("Metal <span class=\"caret\"></span>");
    loadIntro();
  }
  if (genre == 2) {
    //alert("pop")
    $("#genrebutton").html("Pop <span class=\"caret\"></span>");
    loadIntro();
  }
}
