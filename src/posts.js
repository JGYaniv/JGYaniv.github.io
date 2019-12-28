let listUrl = "https://jgyaniv.github.io/posts/post-list.json";
let samplePostUrl = "https://jgyaniv.github.io/posts/post0001.html";

const renderPost = function(url){
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

const getPosts = function() {
  $.ajax({
    url: "https://jgyaniv.github.io/posts/post-list.json",
    dataType: "json",
    cache: false
  }).done(function(json){
    let posts = json.posts;
    renderPosts(posts);
    console.log(posts.length);
  });
};

const renderPosts = function(array) {
  renderPost(compileUrl(array[0]));
  setTimeout(function() {renderPost(compileUrl(array[1]))}, 2);
  // for(let i=0; i<2; i++){
  //   renderPost(compileUrl(array[i]));
  // }
}

const compileUrl = function(title){
  return `https://jgyaniv.github.io/posts/${title}.html`
}

getPosts();
