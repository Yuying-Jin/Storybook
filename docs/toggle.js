function init() {
    var fieldset = document.getElementsByTagName('input');
    for (var i = 0; i < fieldset.length; i++) {
        fieldset[i].addEventListener('click', toggle, false);
    }
}

function toggle() {
    var id = this.id;
    switch (id) {
        case "color": {
            var chars = document.getElementsByClassName("color");
            for (var i = 0; i < chars.length; i++) {
                chars[i].classList.toggle("on")
            }
        };
        break;
        case "nature": {
            var places = document.getElementsByClassName("nature");
            for (var i = 0; i < places.length; i++) {
                places[i].classList.toggle("on")
            }
        };
        break;
        case "shape": {
            var objects = document.getElementsByClassName("shape");
            for (var i = 0; i < objects.length; i++) {
                objects[i].classList.toggle("on")
            }
        };
        break;
        case "tech": {
            var objects = document.getElementsByClassName("tech");
            for (var i = 0; i < objects.length; i++) {
                objects[i].classList.toggle("on")
            }
        };
        break;
    }
}

window.onload = init;