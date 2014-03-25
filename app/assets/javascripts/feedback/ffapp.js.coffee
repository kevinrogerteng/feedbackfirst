ffApp = angular.module("ffApp", [
  "ffAppService",
  "ffAppCtrl", 
  "ffAppRouter",
  "ui.bootstrap",
  "logIn"
  ])

ffApp.config(["$httpProvider",($httpProvider)->
     $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
])

