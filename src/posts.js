let listUrl = "https://jgyaniv.github.io/posts/post-list.txt";
let samplePostUrl = "https://jgyaniv.github.io/posts/post0001.html";

const addListItem = function(url){
  $.ajax({
  url: url,
  cache: false
  })
  .done(function( html ) {
    let $html = $(html);
    let title = $html.find("#post-title").prop('innerHTML');
    let description = $html.find("#post-description").prop('outerHTML');
    $( "#post-list" ).append(`<li id='listed-post'><a href='${url}'>${title}</a>\n${description}</li>`);
  });
}

const compileUrl = function(title){
  console.log(title);
}

addListItem(samplePostUrl);
