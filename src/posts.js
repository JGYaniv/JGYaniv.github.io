let listUrl = "https://jgyaniv.github.io/posts/post-list.html";
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

let allPostFiles = ["post0001"]

const compileUrl = function(title){
  return `https://jgyaniv.github.io/posts/${title}.html`
}

allPostFiles.forEach((fileName) => addListItem(compileUrl(fileName)));
