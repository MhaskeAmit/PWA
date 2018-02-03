function openCreatePostModal(){
    createPostArea.style.display='block';
    if(deferredPrompt){
        deferredPrompt.prompt(); 
        
        deferredPrompy.userChoice.then(function(choiceResult){
            console.log(choiceResult.outcome);
            
            if(choiceResult.outcome==='dismissed'){
                console.log('User cancelled installation....');
                
            }else
            {
                console.log('User added to home screen..');
            }
        });
        deferredPrompt=null;
    }
    
}
function closeCreatePostModal(){
    createPostArea.style.display=none;
}
shareImageButton.addEventListener('click',openCreatePostModal);

closeCreatePostModalButton.addEventListener('click',closeCreatePostModal);