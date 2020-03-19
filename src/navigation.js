window.onload = function() {
  var header = document.getElementById("navigation");
  var sticky = header.offsetTop;
  window.onscroll = function() {stickyHeader(sticky, header)};
  setSelected();
}

window.onhashchange = function(){
  setSelected();
}

function getPage(page){
  // event.preventDefault();
  $.ajax({
    url: `https://jgyaniv.github.io/${page.slice(1)}.html`,
    success: function(result){
      $("#content").html(result);
    }
  })
}

function setSelected(){
  resetMenu();
  var page = window.location.hash;
  var menuItem = document.querySelector(`[href="${page}"]`);
  if (menuItem.className === 'menu-item') {
    menuItem.setAttribute("class","selected menu-item");
  }
  getPage(page);
}

function resetMenu(){
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
