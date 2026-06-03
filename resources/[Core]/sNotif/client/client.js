function sendNotification({ title, subtitle, icon, message, duration = 10, location = "left" }, type = 'Notification') {
    SendNUIMessage({
        action: type,
        data: {
            title,
            subtitle,
            icon,
            body: message,
            duration,
            location
        }
    });
}

Tools.registerClientEvent('RNotification:showNotification', (message, duration = 10, location = "left") => {
    sendNotification({ message, duration, location });
});

Tools.registerClientEvent('RNotification:showAdvancedNotification', (title, subtitle, message, icon, duration = 10, location = "left") => {
    sendNotification({ title, subtitle, icon, message, duration, location });
});

Tools.registerClientEvent('RNotification:showHelpNotification', (message, duration = 10, location = "left") => {
    sendNotification({ message, duration, location }, 'HelpNotification');
});

Tools.registerClientEvent('RNotification:showAdvancedHelpNotification', (title, message, icon, duration = 10, location = "left") => {
    sendNotification({ title, icon, message, duration, location }, 'HelpNotification');
});

// Exports

exports("showNotification", (message, duration = 10, location = "left") => {
    sendNotification({ message, duration, location });
});

exports("showAdvancedNotification", (title, subtitle, message, icon, duration = 10, location = "left") => {
    sendNotification({ title, subtitle, icon, message, duration, location });
});

exports("showHelpNotification", (message, duration = 10, location = "left") => {
    sendNotification({ message, duration, location }, 'HelpNotification');
});

exports("showAdvancedHelpNotification", (title, message, icon, duration = 10, location = "left") => {
    sendNotification({ title, icon, message, duration, location }, 'HelpNotification');
});
