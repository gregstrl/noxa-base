let canRespawn = false;
let gotpressed = false;
let reportModalVisible = false;

function isInNui() {
    try {
        return typeof GetParentResourceName === 'function';
    } catch (e) {
        return false;
    }
}

function postNui(endpoint, payload = {}) {
    if (isInNui()) {
        fetch(`https://${GetParentResourceName()}/${endpoint}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payload)
        });
    } else {
        console.log(`[Preview] POST ${endpoint}`, payload);
    }
}

function createUI() {
    const body = document.body;
    body.setAttribute('unselectable', 'on');
    body.style.userSelect = 'none';
    body.style.webkitUserSelect = 'none';
    body.style.msUserSelect = 'none';
    body.style.mozUserSelect = 'none';

    const blurBackground = document.createElement('div');
    blurBackground.className = 'blur-background';
    blurBackground.setAttribute('unselectable', 'on');
    body.appendChild(blurBackground);

    const content = document.createElement('div');
    content.className = 'content';
    content.setAttribute('unselectable', 'on');
    body.appendChild(content);

    const logoContainer = document.createElement('div');
    logoContainer.className = 'logo-container';
    logoContainer.setAttribute('unselectable', 'on');
    content.appendChild(logoContainer);

    const logo = document.createElement('img');
    logo.src = 'assets/Oziris-DmMla4gK.png';
    logo.alt = 'Logo';
    logo.className = 'logo';
    logo.setAttribute('unselectable', 'on');
    logoContainer.appendChild(logo);

    const timer = document.createElement('div');
    timer.id = 'timer';
    timer.className = 'timer';
    timer.setAttribute('unselectable', 'on');
    function createDigit(id) {
        const digit = document.createElement('div');
        digit.className = 'digit';
        const span = document.createElement('span');
        span.id = id;
        span.textContent = '0';
        digit.appendChild(span);
        return digit;
    }
    timer.appendChild(createDigit('digit-m1'));
    timer.appendChild(createDigit('digit-m2'));
    const spacer = document.createElement('span');
    spacer.className = 'spacer';
    spacer.textContent = ':';
    timer.appendChild(spacer);
    timer.appendChild(createDigit('digit-s1'));
    timer.appendChild(createDigit('digit-s2'));
    content.appendChild(timer);

    const killerInfo = document.createElement('div');
    killerInfo.id = 'killerInfo';
    killerInfo.className = 'killer-info';
    killerInfo.setAttribute('unselectable', 'on');
    content.appendChild(killerInfo);

    const buttons = document.createElement('div');
    buttons.className = 'buttons';
    buttons.setAttribute('unselectable', 'on');
    content.appendChild(buttons);

    const reappearBtn = document.createElement('button');
    reappearBtn.id = 'reappear';
    reappearBtn.disabled = true;
    reappearBtn.setAttribute('unselectable', 'on');
    reappearBtn.setAttribute('tabindex', '-1');
    const reK = document.createElement('span');
    reK.className = 'keyboard';
    reK.textContent = 'ESPACE';
    const reD = document.createElement('span');
    reD.className = 'details';
    reD.textContent = 'Réapparaitre';
    reappearBtn.appendChild(reK);
    reappearBtn.appendChild(reD);
    buttons.appendChild(reappearBtn);

    const ambulanceBtn = document.createElement('button');
    ambulanceBtn.id = 'ambulance';
    ambulanceBtn.setAttribute('unselectable', 'on');
    ambulanceBtn.setAttribute('tabindex', '-1');
    const amK = document.createElement('span');
    amK.className = 'keyboard';
    amK.textContent = 'G';
    const amD = document.createElement('span');
    amD.className = 'details';
    amD.textContent = 'Appeler un Ambulancier';
    ambulanceBtn.appendChild(amK);
    ambulanceBtn.appendChild(amD);
    buttons.appendChild(ambulanceBtn);

    const reportBtn = document.createElement('button');
    reportBtn.id = 'report';
    reportBtn.setAttribute('unselectable', 'on');
    reportBtn.setAttribute('tabindex', '-1');
    const rpK = document.createElement('span');
    rpK.className = 'keyboard';
    rpK.textContent = 'Y';
    const rpD = document.createElement('span');
    rpD.className = 'details';
    rpD.textContent = 'Faire un Report';
    reportBtn.appendChild(rpK);
    reportBtn.appendChild(rpD);
    buttons.appendChild(reportBtn);

    reappearBtn.addEventListener('click', () => {
        postNui('reappear', {});
    });

    ambulanceBtn.addEventListener('click', () => {
        if (!gotpressed) {
            postNui('ambulance', {});
            gotpressed = true;
            ambulanceBtn.disabled = true;
            ambulanceBtn.textContent = "Signal envoyé (5min)";
        }
    });

    document.addEventListener('selectstart', function(e) {
        e.preventDefault();
        return false;
    });

    document.addEventListener('keydown', function(e) {
        if (e.key === 'Tab') {
            e.preventDefault();
        }
        const key = e.key.toLowerCase();
        if (key === 'g') {
            const btn = document.getElementById('ambulance');
            if (btn && !btn.disabled) {
                btn.click();
            }
        } else if (key === 'y') {
            const btn = document.getElementById('report');
            if (btn) {
                btn.click();
            }
        } else if (e.code === 'Space') {
            const btn = document.getElementById('reappear');
            if (btn && !btn.disabled) {
                btn.click();
            }
        }
    });

    const reportModal = document.createElement('div');
    reportModal.id = 'reportModal';
    reportModal.className = 'report-modal';
    reportModal.style.display = 'none';
    
    const reportContent = document.createElement('div');
    reportContent.className = 'report-content';
    
    const reportTitle = document.createElement('h2');
    reportTitle.textContent = 'Faire un Report';
    reportContent.appendChild(reportTitle);
    
    const reportTextarea = document.createElement('textarea');
    reportTextarea.id = 'reportText';
    reportTextarea.placeholder = 'Décrivez votre problème...';
    reportContent.appendChild(reportTextarea);
    
    const reportButtons = document.createElement('div');
    reportButtons.className = 'report-buttons';
    
    const submitBtn = document.createElement('button');
    submitBtn.id = 'submitReport';
    submitBtn.textContent = 'Envoyer';
    submitBtn.addEventListener('click', () => {
        const message = reportTextarea.value.trim();
        if (message) {
            postNui('report', { message: message });
            reportModal.style.display = 'none';
            reportModalVisible = false;
            reportTextarea.value = '';
        }
    });
    
    const cancelBtn = document.createElement('button');
    cancelBtn.id = 'cancelReport';
    cancelBtn.textContent = 'Annuler';
    cancelBtn.addEventListener('click', () => {
        reportModal.style.display = 'none';
        reportModalVisible = false;
        reportTextarea.value = '';
    });
    
    reportButtons.appendChild(submitBtn);
    reportButtons.appendChild(cancelBtn);
    reportContent.appendChild(reportButtons);
    reportModal.appendChild(reportContent);
    body.appendChild(reportModal);

    reportBtn.addEventListener('click', () => {
        reportModal.style.display = 'block';
        reportModalVisible = true;
    });

    const style = document.createElement('style');
    style.textContent = `
        .report-modal {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 5px;
            width: 80%;
            max-width: 500px;
            z-index: 1000;
        }

        .report-content {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .report-content h2 {
            color: white;
            text-align: center;
            margin: 0;
        }

        #reportText {
            width: 100%;
            height: 150px;
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            resize: none;
        }

        .report-buttons {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        #submitReport, #cancelReport {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        #submitReport {
            background-color: #4CAF50;
            color: white;
        }

        #cancelReport {
            background-color: #f44336;
            color: white;
        }

        #submitReport:hover, #cancelReport:hover {
            opacity: 0.8;
        }
    `;
    document.head.appendChild(style);
}

document.addEventListener('DOMContentLoaded', function() {
    createUI();
    // QUE POUR HIPPO SA LE SANG
    // if (!isInNui()) {
    //     document.body.style.display = 'block';
    //     const baseData = {
    //         type: 'show',
    //         canRespawn: false,
    //         gotpressed: false,
    //         ambulanceCooldown: 300,
    //         timer: 75,
    //         killerId: 123
    //     };
    //     let remaining = baseData.timer;
    //     updateUI(baseData);
    //     const intervalId = setInterval(() => {
    //         if (remaining > 0) {
    //             remaining -= 1;
    //             updateUI({
    //                 ...baseData,
    //                 timer: remaining,
    //                 canRespawn: false
    //             });
    //         } else {
    //             clearInterval(intervalId);
    //             updateUI({
    //                 ...baseData,
    //                 timer: 0,
    //                 canRespawn: true
    //             });
    //         }
    //     }, 1000);
    // }
});

window.addEventListener('message', function(event) {
    const data = event.data;
    
    if (data.type === 'show') {
        document.body.style.display = 'block';
        updateUI(data);
    } else if (data.type === 'hide') {
        document.body.style.display = 'none';
    } else if (data.type === 'update') {
        updateUI(data);
    }
});

function updateUI(data) {
    canRespawn = data.canRespawn;
    gotpressed = data.gotpressed;

    const reappearBtn = document.getElementById('reappear');
    const ambulanceBtn = document.getElementById('ambulance');
    const ambulanceDetails = ambulanceBtn ? ambulanceBtn.querySelector('.details') : null;
    const killerInfo = document.getElementById('killerInfo');

    reappearBtn.disabled = !canRespawn;
    
    if (ambulanceBtn && ambulanceDetails) {
        if (gotpressed) {
            const minutes = Math.floor(data.ambulanceCooldown / 60);
            const seconds = data.ambulanceCooldown % 60;
            ambulanceDetails.textContent = `Signal envoyé (${minutes}:${seconds.toString().padStart(2, '0')})`;
            ambulanceBtn.disabled = true;
        } else {
            ambulanceDetails.textContent = "Appeler un Ambulancier";
            ambulanceBtn.disabled = false;
        }
    }

    const m1 = document.getElementById('digit-m1');
    const m2 = document.getElementById('digit-m2');
    const s1 = document.getElementById('digit-s1');
    const s2 = document.getElementById('digit-s2');
    if (m1 && m2 && s1 && s2) {
        const minutes = Math.floor(data.timer / 60);
        const seconds = data.timer % 60;
        const str = `${minutes.toString().padStart(2, '0')}${seconds.toString().padStart(2, '0')}`;
        m1.textContent = str[0];
        m2.textContent = str[1];
        s1.textContent = str[2];
        s2.textContent = str[3];
    }

    if (data.type === "show" || killerInfo.textContent === "" || killerInfo.textContent === "Cause: Inconnue") {
        killerInfo.style.display = 'block';

        if (data.killerId) {
            killerInfo.textContent = `Tué par: ID Unique #${data.killerId}`;
        } else if (data.deathCause) {
            killerInfo.textContent = `Cause: ${data.deathCause}`;
        } else {
            killerInfo.textContent = `Cause: Inconnue`;
        }    
    }
} 