$(function() {
    let page = document.getElementById("page");
    let carree = document.getElementById("carree");

    document.body.addEventListener("keydown", (event) => {
        let which = event.which;
        let isShift = event.shiftKey;
        let left = 0;
        let top = 0;

        if (isShift) {
            switch (which) {
                case 37: // left arrow
                    left = parseInt(getComputedStyle(carree).left);
                    if (left > 0) {
                        left -= 2;
                        carree.style.left = left + "px";
                    }
                    break;
                case 36: // home
                    carree.style.left = "0px";
                    carree.style.top = "0px";
                    break;
                case 35: // end
                    carree.style.left = "650px";
                    carree.style.top = "650px";
                    break;
                case 38: // up arrow
                    top = parseInt(getComputedStyle(carree).top);
                    if (top > 0) {
                        top -= 2;
                        carree.style.top = top + "px";
                    }
                    break;
                case 39: // right arrow
                    left = parseInt(getComputedStyle(carree).left);
                    if (left < 650) {
                        left += 2;
                        carree.style.left = left + "px";
                    }
                    break;
                case 40: // down arrow
                    top = parseInt(getComputedStyle(carree).top);
                    if (top < 650) {
                        top += 2;
                        carree.style.top = top + "px";
                    }
                    break;
                default:
                    // Do nothing for other keys
            }
        }
    });

    $.ajax({
        type: "GET",
        url: "index.php",
        dataType: "json",
        success: function(response) {
            console.log(response);
        },
        error: function() {
            console.error("An error occurred");
        }
    });
});
