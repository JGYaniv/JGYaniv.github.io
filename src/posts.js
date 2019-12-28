let listUrl = "https://jgyaniv.github.io/posts/post-list.json";
let samplePostUrl = "https://jgyaniv.github.io/posts/post0001.html";

const addListItem = function(url){
  $.ajax({
  url: url,
  cache: false
  })
  .done(function(html) {
    let $html = $(html);
    let url = samplePostUrl
    let title = $html.find("#post-title").prop('innerHTML');
    let description = $html.find("#post-description").prop('outerHTML');
    $( "#post-list" ).append(`<li id='listed-post'><a href='${url}'>${title}</a>\n${description}</li>`);
  })
};

const renderPosts = function() {
  $.ajax({
    url: "https://jgyaniv.github.io/posts/post-list.json",
    dataType: "json",
    cache: false
  }).done(function(json) {
    json.posts.forEach((fileName) => addListItem(compileUrl(fileName)));
  });
};

const compileUrl = function(title){
  return `https://jgyaniv.github.io/posts/${title}.html`
}

renderPosts();
