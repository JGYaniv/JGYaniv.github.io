let listUrl = "https://jgyaniv.github.io/posts/post-list.json";
let samplePostUrl = "https://jgyaniv.github.io/posts/post0001.html";

const renderPost = function(url){
  $.ajax({
  url: url,
  cache: false
  })
  .done(function(html) {
    let $html = $(html);
    let title = $html.find("#post-title").prop('innerHTML');
    let description = $html.find("#post-description").prop('outerHTML');
    $( `#${url.slice(-9,-5)}` ).append(`<div><id='listed-post'><a href='${url}'>${title}</a>\n${description}</div>`);
  })
};

const getPosts = function() {
  $.ajax({
    url: "https://jgyaniv.github.io/posts/post-list.json",
    dataType: "json",
    cache: false
  }).done(function(json){
    let posts = json.posts;
    renderPosts(posts);
  });
};

const renderPosts = function(array) {
  for(let i=0; i<array.length; i++){
    renderPost(compileUrl(array[i]));
  }
}

const compileUrl = function(title){
  return `https://jgyaniv.github.io/posts/${title}.html`
}

getPosts();
