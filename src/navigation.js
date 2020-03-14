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
      setSelected(page);
      getPage(page);
    });
  });
}

function getPage(page){
  // event.preventDefault();
  $.ajax({
    url: `https://jgyaniv.github.io/${page}`,
    success: function(result){
      $("#content").html(result);
    }
  })
}

function setSelected(page){
  resetMenu();
  var menuItem = document.querySelectorAll(`[href="${page}"]`)[0];
  if (menuItem.className === 'menu-item') {
    menuItem.setAttribute("class","selected menu-item");
  }
}

const resetMenu = function(){
  var menuItems = document.querySelectorAll(`[class="selected menu-item"]`);
  menuItems.forEach(element => element.setAttribute("class", "menu-item"));
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
