//files pushed to Github Pages are immediately published online!
const listUrl = "https://jgyaniv.github.io/posts/post-list.json";

//makes a JQuery Ajax HTTP GET request from the URL above, giving us our list of post file names.
const getPosts = function() {
  $.ajax({
    url: listUrl,
    dataType: "json",
    cache: false //It's helpful for testing to disable loading the page from cache.
  }).done(function(json){
    let posts = json.posts;
    renderPosts(posts); //renderPosts accepts an array of post file names and will iterate through them.
  });
};

//iterates through the array of posts and calls the renderPost function on each one.
const renderPosts = function(array) {
  for(let i=0; i<array.length; i++){
    renderPost(compileUrl(array[i])); //renderPost accepts the Post's URL as an argument.
  }
}

//extracts the title and description from the post and appends it to the ordered list object.
const renderPost = function(url){
  $.ajax({
  url: url,
  cache: false
  })
  .done(function(html) {  //'html' is the variable assigned for the returned value of the request.
    let $html = $(html);
    let title = $html.find("#post-title").prop('innerHTML');//finds the paragraph with id 'post-title.'
    let description = $html.find("#post-description").prop('outerHTML');//finds the paragraph with id 'post-description.'
    $( `ol` ).append(`<li><id='listed-post'><a href='${url}'>${title}</a>\n${description}</li>`);//appends a list item.
  })
};

//for readability just made this a separate function.
const compileUrl = function(title){
  return `https://jgyaniv.github.io/posts/${title}.html`
}

getPosts();
