// adds "selected" formatting to menu item when on page
window.onhashchange = function() {
  setSelected();
}

window.onload = function() {
  setSelected();
  var header = document.getElementById("navigation");
  var sticky = header.offsetTop;
  window.onscroll = function() {stickyHeader(sticky, header)};

  // document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  //     anchor.addEventListener('click', function (e) {
  //         e.preventDefault();
  //
  //         document.querySelector(this.getAttribute('href')).scrollIntoView({
  //             behavior: 'smooth'
  //         });
  //     });
  // });
}

const setSelected = function(){
  resetMenu();
  var pageName = window.location.hash;
  var menuItem = document.querySelectorAll(`[href="${pageName}"]`)[0];
  if (menuItem.className === 'menu-item') {
    menuItem.setAttribute("class","selected menu-item");
  }
}

const resetMenu = function(){
  var menuItems = document.querySelectorAll(`[class="selected menu-item"]`);
  menuItems.forEach(element => element.setAttribute("class", "menu-item"));
}

function stickyHeader(sticky, header) {
  if (window.pageYOffset >= (sticky-10)) {
    header.classList.add("sticky");
    document.getElementById("content").setAttribute("style","margin-top:71px;");
  } else {
    console.log('unsticking')
    header.classList.remove("sticky");
    document.getElementById("content").setAttribute("style","margin-top:0;");
  }
}
