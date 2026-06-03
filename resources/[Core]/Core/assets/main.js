$(function () {
    window.addEventListener('message', function (event) {
        var data = event.data;
        if (data.type === 'showClause') {
            showClause();
        }
    });

    function showClause() {
        var progressBar = document.getElementById('progressBar');
        var duration = 10000;
        var startTime = null;
        var audio = document.getElementById('audio');

        $(".container-clause").show();

        // Ajout de styles pour l'effet d'orange sur les coins de l'écran
        $('body').prepend('<div class="orange-gradient"></div>');
        $('.orange-gradient').css({
            position: 'fixed',
            top: 0,
            left: 0,
            width: '100%',
            height: '100%',
            background: 'linear-gradient(135deg, rgba(255, 87, 34, 0.3) 0%, rgba(255, 217, 61, 0.3) 100%)', // Réduction de l'opacité
            pointerEvents: 'none', // Empêcher l'élément de capturer les événements de souris
            zIndex: '-1' // Placer le dégradé en arrière-plan
        });

        $('body').css({
            margin: '0',
            padding: '0',
            fontFamily: 'Arial, sans-serif',
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            height: '100vh',
            transition: 'background-color 2s ease' // Transition douce pour le fond
        });

        function updateProgressBar() {
            var currentTime = new Date().getTime();
            if (!startTime) {
                startTime = currentTime;
                audio.play();
                audio.volume = 0.3;
            }

            var elapsedTime = currentTime - startTime;
            var progress = (elapsedTime / duration) * 100;

            if (progress <= 100) {
                progressBar.style.width = progress + '%';
            } else {
                clearInterval(interval);
                fadeOut();
            }
        }

        var interval = setInterval(updateProgressBar, 10);

        function fadeOut() {
            var opacity = 1;
            var fadeInterval = setInterval(function () {
                if (opacity > 0) {
                    opacity -= 0.01;
                    $('.container-clause').css({opacity: opacity});
                    $('.orange-gradient').css({opacity: opacity}); // Ajustement de l'opacité du dégradé d'orange
                } else {
                    clearInterval(fadeInterval);
                    $('.container-clause').hide();
                    $('.orange-gradient').remove(); // Supprimer l'élément de gradient orange
                    $('body').css({backgroundColor: 'rgba(0, 0, 0, 0)'});
                    $('body').show();
                    $('.container-clause').css({opacity: 1});
                    $('#progressBar').css({width: 0});
                    var audio = document.getElementById('audio');
                    audio.pause();
                }
            }, 50);
        }

    }
});