const deflections = [
    "Shoot me a slack message and I'll get back to you.",
    "That's a bit out of scope, let's table that for now.",
    "Let's address that if we have time later.",
    "You should definitely bring it up with your TA during circle time.",
    "I'd recommend testing it out in pry.",
    "There are some great resources like stackexchange.com which I'd recommend you check out."
]

function randQuote(quoteArray) {
    var quote = quoteArray[Math.floor(Math.random() * quoteArray.length)];
    return quote
}

window.onload = function () {
    (function reviewFormListener() {
        form = document.getElementById("review-form");
        form.addEventListener("submit", deflect);
    })();
};

const deflect = function(event){
    event.preventDefault();
    alert(`Thanks for the feedback! ${randQuote(deflections)}`);
}