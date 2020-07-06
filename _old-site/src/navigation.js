window.onload = function() {
  Navigation.stickyHeader();
  Page.setByHash();
  $(document).tooltip({ show: null });
}

window.onhashchange = function() {
  Page.setByHash();
  Navigation.setSelected();
}

class Page {
  static setByHash(){
    var currentHash = window.location.hash;
    $.ajax({
      url: `https://jgyaniv.github.io/${currentHash.slice(1)}.html`,
      success: function(result){
        $("#content").html(result);
      }
    })
  }
}

class Navigation{
  static stickyHeader() {
    var header = document.getElementById("navigation");
    var sticky = header.offsetTop;
    window.onscroll = function() {
      if (window.pageYOffset >= (sticky-10)) {
        header.classList.add("sticky");
        document.getElementById("content").setAttribute("style","margin-top:35px;");
      } else {
        header.classList.remove("sticky");
        document.getElementById("content").setAttribute("style","margin-top:0;");
      }
    };
  }

  static setSelected(){
    Navigation.resetMenu();
    var page = window.location.hash;
    var menuItem = document.querySelector(`[href="${page}`);
    if (menuItem.className === 'menu-item') {
      menuItem.setAttribute("class","selected menu-item");
    } else {
      document.querySelector("[href='/']").setAttribute("class", "selected menu-item")
    }
  }

  static resetMenu(){
    var menuItems = document.querySelectorAll(`[class="selected menu-item"]`);
    menuItems.forEach(element => element.setAttribute("class", "menu-item"));
  }
}
