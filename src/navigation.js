const endpoint_url = {
  "portfolio.html": "https://jgyaniv.github.io/posts/post0001.html",
  "about.html": "https://jgyaniv.github.io/posts/post0001.html",
  "blog.html": "https://jgyaniv.github.io/posts/post0001.html",
  "about.html": "https://jgyaniv.github.io/posts/post0001.html"
};

window.onload = function() {
  var header = document.getElementById("navigation");
  var sticky = header.offsetTop;
  window.onscroll = function() {stickyHeader(sticky, header)};
  setListeners();
}

function setListeners(){
  const pages = ["about.html", "portfolio.html", "blog.html", "contact.html"];
  pages.forEach(function(page){
    $(`a[href='${page}']`).click(page, function(){
      event.preventDefault();
      getPage(page);
    });
  });
}

function getPage(page){
  // event.preventDefault();
  $.ajax({
    url: `https://jgyaniv.github.io/${page}`,
    success: function(result){
      $(".page").html(result);
    }
  })
}


// keeps header on top of page
function stickyHeader(sticky, header) {
  if (window.pageYOffset >= (sticky-10)) {
    header.classList.add("sticky");
    document.getElementById("content").setAttribute("style","margin-top:71px;");
  } else {
    header.classList.remove("sticky");
    document.getElementById("content").setAttribute("style","margin-top:0;");
  }
}
