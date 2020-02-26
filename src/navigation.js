// adds "selected" formatting to menu item when on page
window.onhashchange = function() {
  resetMenu();
  var pageName = window.location.hash;
  var menuItem = document.querySelectorAll(`[href="${pageName}"]`)[0];
  menuItem.setAttribute("class","selected-menu-item");
}

const resetMenu = function(){
  var menuItems = document.querySelectorAll(`[class="selected-menu-item"]`);
  menuItems.forEach(element => element.setAttribute("class", "menu-item"));
}
