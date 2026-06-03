var timer = null;

$(function(){
    $(".container").removeClass("container-show").addClass("container-hide").hide();
    window.addEventListener("message", function(event){
        let v = event.data;
        if (v.message) {
            if (timer) {
                clearTimeout(timer);
                timer = null;
            }
            
            $(".container").removeClass("container-hide").addClass("container-show").show().html(v.message); 
            
            timer = setTimeout(function() {
                $(".container").removeClass("container-show").addClass("container-hide").hide();
                timer = null;
            }, 2000);
        }
    })
})