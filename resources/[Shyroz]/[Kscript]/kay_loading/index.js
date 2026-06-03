const images = [
    'public/bg1.png', 'public/bg2.png', 'public/bg3.png', 'public/bg4.png',
    'public/bg5.png', 'public/bg6.png', 'public/bg7.png', 'public/bg8.png'
];

const songs = [
    'music/song1.mp3', 'music/song2.mp3', 'music/song3.mp3', 
    'music/song4.mp3', 'music/song5.mp3'
];

const trackInfo = [
    { name: "C'est réel", author: "Jul" },
    { name: "Cullinan", author: "Guy2Bezbar" },
    { name: "KAT", author: "Gazo, La Rafleuse" },
    { name: "Mardi Gras", author: "Maes" },
    { name: "YESTERDAY", author: "Hamza" }
];

let currentTrackIndex = 0;

const loadingText = 'Chargement en cours...';
const imageChangeInterval = 5000; 
const progressBarDuration = 35000; 
const defaultVolume = 0.5;

let imageInterval;
let currentImageIndex = 0;
let imageOrder = [];
let usedSongs = [];
let progressInterval;
let currentProgress = 0;

const backgroundEl = document.getElementById('background');
const bgMusic = document.getElementById('bgMusic');
const progressFill = document.getElementById('progressFill');

function initializeImageOrder() {
    imageOrder = [...Array(images.length).keys()];
    
    for (let i = imageOrder.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [imageOrder[i], imageOrder[j]] = [imageOrder[j], imageOrder[i]];
    }
    
    currentImageIndex = 0;
}

function changeToNextImage() {
    const imageIndexToShow = imageOrder[currentImageIndex];
    const imagePath = images[imageIndexToShow];

    if (!imagePath) return;

    const img = new Image();
    img.onload = function() {
        if (backgroundEl) {
            backgroundEl.style.backgroundImage = `url('${imagePath}')`;
            backgroundEl.style.opacity = '1';
        }
    };
    img.src = imagePath;
    
    currentImageIndex++;
    
    if (currentImageIndex >= imageOrder.length) {
        initializeImageOrder();
    }
}

function startImageSlideshow() {
    if (imageInterval) {
        clearInterval(imageInterval);
    }
    
    initializeImageOrder();
    changeToNextImage();
    
    imageInterval = setInterval(() => {
        changeToNextImage();
    }, imageChangeInterval);
}

function getRandomSong() {
    if (usedSongs.length === songs.length) {
        usedSongs = [];
    }
    
    const availableSongs = songs.filter(song => !usedSongs.includes(song));
    const randomSong = availableSongs[Math.floor(Math.random() * availableSongs.length)];
    usedSongs.push(randomSong);
    
    return randomSong;
}

function playRandomSong() {
    const randomIndex = Math.floor(Math.random() * songs.length);
    const randomSong = songs[randomIndex];
    currentTrackIndex = randomIndex;
    
    if (bgMusic) {
        bgMusic.src = randomSong;
        bgMusic.play().then(() => {
            setTimeout(() => {
                updatePlayPauseIcon();
            }, 100);
        }).catch(error => {
        });
        
        updateTrackDisplay();
    }
}

function updateTrackDisplay() {
    const trackNameEl = document.getElementById('displayTrackName');
    const trackArtistEl = document.getElementById('displayTrackArtist');
    
    if (trackNameEl && trackInfo[currentTrackIndex]) {
        trackNameEl.textContent = trackInfo[currentTrackIndex].name;
    }
    
    if (trackArtistEl && trackInfo[currentTrackIndex]) {
        trackArtistEl.textContent = trackInfo[currentTrackIndex].author;
    }
}

function startProgressBar() {
    const updateInterval = 50;
    const increment = (100 / progressBarDuration) * updateInterval;
    
    progressInterval = setInterval(() => {
        currentProgress += increment;
        
        if (progressFill) {
            progressFill.style.width = currentProgress + '%';
        }
        
        if (currentProgress >= 100) {
            clearInterval(progressInterval);
        }
    }, updateInterval);
}

function initializeLoadingScreen() {
    if (bgMusic) {
        bgMusic.volume = defaultVolume;
    }
    
    const loadingTextEl = document.querySelector('.loading-text');
    if (loadingTextEl) {
        loadingTextEl.textContent = loadingText;
    }
}

function updatePlayPauseIcon() {
    const playIcon = document.querySelector('.play-icon');
    const pauseIcon = document.querySelector('.pause-icon');
    
    if (playIcon && pauseIcon && bgMusic) {
        if (bgMusic.paused) {
            playIcon.style.display = 'block';
            pauseIcon.style.display = 'none';
        } else {
            playIcon.style.display = 'none';
            pauseIcon.style.display = 'block';
        }
    }
}

function initializeMusicControls() {
    const playPauseBtn = document.getElementById('playPause');
    const nextTrackBtn = document.getElementById('nextTrack');
    const prevTrackBtn = document.getElementById('prevTrack');
    const volumeSlider = document.getElementById('volumeSlider');
    
    if (playPauseBtn) {
        playPauseBtn.addEventListener('click', () => {
            if (bgMusic && bgMusic.paused) {
                bgMusic.play();
            } else if (bgMusic) {
                bgMusic.pause();
            }
            updatePlayPauseIcon();
        });
    }
    
    if (nextTrackBtn) {
        nextTrackBtn.addEventListener('click', () => {
            playRandomSong();
        });
    }
    
    if (prevTrackBtn) {
        prevTrackBtn.addEventListener('click', () => {
            playRandomSong();
        });
    }
    
    if (volumeSlider) {
        volumeSlider.value = defaultVolume * 100;
        volumeSlider.addEventListener('input', (e) => {
            if (bgMusic) {
                bgMusic.volume = e.target.value / 100;
            }
        });
    }
    
    const playIcon = document.querySelector('.play-icon');
    const pauseIcon = document.querySelector('.pause-icon');
    if (playIcon && pauseIcon) {
        playIcon.style.display = 'none';
        pauseIcon.style.display = 'block';
    }
    
    playRandomSong();
}

function openExternalLink(url) {
    if (typeof invokeNative !== 'undefined') {
        invokeNative('openUrl', url);
    } 
    else {
        window.open(url, '_blank');
    }
}

document.addEventListener('click', function(e) {
    if (e.target.closest('[data-link="discord"]')) {
        e.preventDefault();
        openExternalLink('https://discord.gg/destinyfa');
    }
    if (e.target.closest('[data-link="boutique"]')) {
        e.preventDefault();
        openExternalLink('');
    }
    if (e.target.closest('[data-link="reglement"]')) {
        e.preventDefault();
        openExternalLink('Wiki : https://noxxs-organization.gitbook.io/reglement-destiny-rp/');
    }
});

document.addEventListener('DOMContentLoaded', function() {
    if (backgroundEl) {
        backgroundEl.style.backgroundImage = `url('${images[0]}')`;
        backgroundEl.style.opacity = '1';
    }
    
    initializeLoadingScreen();
    startImageSlideshow();
    initializeMusicControls(); 
    startProgressBar();
});

document.addEventListener('keydown', (event) => {
    if (event.target.tagName === 'INPUT' || event.target.tagName === 'TEXTAREA') {
        return;
    }
    
    if (event.code === 'Space') {
        event.preventDefault();
        if (bgMusic && bgMusic.paused) {
            bgMusic.play();
        } else if (bgMusic) {
            bgMusic.pause();
        }
        updatePlayPauseIcon();
    }
});

document.addEventListener('visibilitychange', function() {
    if (document.hidden && bgMusic) {
        bgMusic.pause();
    } else if (bgMusic && bgMusic.src) {
        bgMusic.play().catch(error => {});
    }
});

document.addEventListener('click', function() {
    if (bgMusic && bgMusic.paused && bgMusic.src) {
        bgMusic.play().catch(error => {});
    }
}, { once: true });
