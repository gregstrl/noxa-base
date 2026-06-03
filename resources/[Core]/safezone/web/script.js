window.addEventListener('message', function(event) {
    const data = event.data;
    const container = document.getElementById('zone-container');
    console.log("developed by Kay");
    if (data.type === "showZone") {
        container.classList.remove('hidden');
    } else if (data.type === "hideZone") {
        container.classList.add('hidden');
    }
});