$.ajax({
url: "https://jgyaniv.github.io/posts/post0001.html",
cache: false
})
.done(function( html ) {
  let $html = $(html);
  let title = $html.find("#post-title").prop('outerHTML');
  let $description = $html.find("#post-description");
  $( "#posts" ).append( `<a href='https://jgyaniv.github.io/posts/post0001.html'>${title}</a>` );
  $( "#posts" ).append( $description );
});
