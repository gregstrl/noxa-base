$(document).ready(function() {
    function copyToClipboard(text) {
        var node = document.createElement('textarea');
        node.textContent = text;
        document.body.appendChild(node);
        var selection = document.getSelection();
        selection.removeAllRanges();
        node.select();
        document.execCommand('copy');
        selection.removeAllRanges();
        document.body.removeChild(node);
    }
    window.addEventListener('message', function(event) {
        const data = event.data;

        if (data.tool) {
            copyToClipboard(data.tool);
        }
    });
});
