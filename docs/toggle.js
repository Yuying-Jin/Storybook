function init() {
    var inputs = document.getElementsByTagName('input');
    for (var i = 0; i < inputs.length; i++) {
        inputs[i].addEventListener('click', toggle, false);
    }

    var buttons = document.getElementsByTagName("button")
    buttons[0].addEventListener('click', selectAll,false)
    buttons[1].addEventListener('click', reset,false)

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

function selectAll(){
    var objects = document.getElementsByTagName("span")
    for (var i = 0; i < objects.length; i++) {
        objects[i].classList.add("on")
    }
    var classList = document.getElementsByTagName("input");
    for (var i = 0; i < classList.length; i++){
        classList[i].checked = true;
    }
}

function reset(){
    var objects = document.getElementsByTagName("span")
    for (var i = 0; i < objects.length; i++) {
        objects[i].classList.remove("on")
    }
    var classList = document.getElementsByTagName("input");
    for (var i = 0; i < classList.length; i++){
        classList[i].checked = false;
    }
}


window.onload = init;