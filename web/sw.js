var CACHE_STATIC_NAME='static'
self.addEventListener('install',function(event){
    console.log('[Service Worker] Installing service worker....',event);
    event.waitUntil(
            caches.open(CACHE_STATIC_NAME)
            .then(function(){
                console.log('[Service Worker] precaching app shell');
                cache.addAll([
                    '/',
                    '/web/index.html',
                    '/web/offline.html',
                    '/web/adminlogin.html',
                    '/web/StudLogin.html',
                    '/web/TeacherLogin.html',
                    '/web/Student_personal.html',
                    '/web/Teacher_personal.html',
                    '/web/Student_edu.html',
                    '/web/Teacher_edu.html',
                    '/web/StudUserpass.html',
                    '/web/TeacherUserpass.html',
                    '/web/dashboard.html',
                    '/web/studDashboard.html',
                    '/web/teacherDashboard.html',
                    '/web/UploadTeacher.html',
                    '/web/studUpload.html',
                    '/web/forgotPassword.html',
                    '/web/index.html',
                    '/web/Help.html',
                    '/web/assets1/js/app1.js',
                    '/web/assets1/bootstrap/css/bootstrap.min.css',
                    '/web/assets1/bootstrap/js/bootstrap.min.js',
                    '/web/assets2/bootstrap/css/bootstrap.min.css',
                    '/web/assets2/bootstrap/js/bootstrap.min.js',
                    '/web/assets2/css/bootstrap-theme.min.css',
                    '/web/assets2/css/bootstrap.css',
                    '/web/assets2/css/font-awesome.css',
                    '/web/assets2/css/font-awesome.min.css',
                    '/web/assets2/css/my-block-ui.css',
                    '/web/assets2/css/bootstrap-theme.css',
                    '/web/assets2/css/bootstrap-theme.css',
                    '/web/assets2/js/blockui.js',
                    '/web/assets2/js/bootstrap.js',
                    '/web/assets2/js/bootstrap.min.js',
                    '/web/assets2/js/jquery.min.js',
                    '/web/assets2/js/jquery.sharrre.js',
                    '/web/assets2/js/my-block-ui.js',
                    '/web/assets2/js/npm.js',
                    '/web/assets2/js/validator.js',
                    '/web/assets2/js/validator.min.js',
                    '/web/assets9/images/bg1.jpg',
                    '/web/assets9/images/bg2.jpg',
                    '/web/assets9/images/bg3.jpg',
                    'https://fonts.googleapis.com/css?family=Roboto:400,700',
                    'https://fonts.googleapis.com/icon?family=Material+Icons',
                    'https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.3.0/material.indigo-pink.min.css',
                    '//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i&subset=latin-ext,vietnamese',
                    '//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900iSource+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese',
                    
                    '/web/assets1/js/fetch.js',
                    '/web/assets1/js/promise.js'
                    
                ]);
                
                
            })
            )
});
self.addEventListener('activate', function(event) {
  console.log('[Service Worker] Activating Service Worker ....', event);
  return self.clients.claim();
});

self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request)
      .then(function(response) {
        if (response) {
          return response;
        } else {
          return fetch(event.request)
            .then(function(res) {
              return caches.open('dynamic')
                .then(function(cache) {
                  cache.put(event.request.url, res.clone());
                  return res;
                })
            })
            .catch(function(err) {
              return caches.open(CACHE_STATIC_NAME)
                .then(function(cache) {
                  return cache.match('/offline.html');
                });
            });
        }
      })
  );
});
