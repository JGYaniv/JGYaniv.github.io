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

  var links = document.querySelectorAll("#navigation a")
for( link of links) {link.addEventListener("click",
          changepage.bind(null, link.getAttribute("href") )
        );
      }
}

function changepage(endpoint, event){ event.preventDefault();
  var xhr = new XMLHttpRequest();
  xhr.addEventListener("load", appendResponse);
  xhr.open("GET",endpoint_url[ endpoint ]);
  xhr.responseType = 'document';
  xhr.send();
}

function appendResponse() {
  var tempContent = this.responseXML.getElementById("post").innerHTML;
  console.log("//// response/// ", tempContent);
  document.querySelector(".page").innerHTML = tempContent;
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


//
// function makeRequest( req_url ){
//   var xhr = new XMLHttpRequest();
//   xhr.addEventListener("load", appendResponse);
//   xhr.open("GET","https://jgyaniv.github.io/posts/post0001.html");
//   xhr.responseType = 'document';
//   xhr.send();
// }
