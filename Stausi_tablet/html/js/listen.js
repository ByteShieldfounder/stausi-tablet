var isOpen = false

window.addEventListener("message", function(event) {
    if (event.data.action == "open") {
        $(".tablet").css('opacity', 1)
        isOpen = true
    } else if (event.data.action == "close") {
        $(".tablet").css('opacity', 0)
        isOpen = false
    }
})

document.onkeydown = function(data) {
    if (data.which == 27 && isOpen === true) {
        $.post("http://tablet_tablet/escape", JSON.stringify({}))
    }
}

$("#closehungry").click(function() {
    $.post("http://tablet_tablet/escape", JSON.stringify({}))
})

$("#refreshhungry").click(function() {
    const iframe = $('iframe')[0]
    const loc = iframe.src
    iframe.src = ''
    setTimeout(() => iframe.src = loc, 250)
})