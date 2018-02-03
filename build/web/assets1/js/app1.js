    var deferredPrompt;
    if(!window.Promise){
        window.Promise=Promise;
    }
    if('serviceWorker' in navigator){
        // Register service worker
        navigator.serviceWorker.register('sw.js').then(function(reg){
            console.log("SW registration succeeded. Scope is "+reg.scope);
        }).catch(function(err){
            console.error("SW registration failed with error "+err);
        });
    }
    window.addEventListener('beforeinstallprompt', function(event){
        console.log('beforeinstallprompt fired');
        event.preventDefault();
        deferredPrompt=event;
        return false;
    });
    