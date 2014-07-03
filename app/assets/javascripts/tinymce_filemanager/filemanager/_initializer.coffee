UploadImageDialog =
  editor: `undefined`
  init: ->
    editor = @editor = top.tinymce.activeEditor
    @iframe = document.getElementById("hidden_upload")
    return

  insert: (data, type) ->
    if type is "image"
      i = 0

      while i < data.length
        @editor.execCommand "mceInsertContent", false, UploadImageDialog.buildHTMLImg(data[i])
        i++
    else
      i = 0

      while i < data.length
        @editor.execCommand "mceInsertContent", false, UploadImageDialog.buildHTMLlink(data[i])
        i++
    
    #this.editor.execCommand('mceInsertContent', false, UploadImageDialog.buildHTML(data));
    @editor.windowManager.close()
    return

  buildHTMLImg: (data) ->
    imgstr = ""
    if data.alt
      imgstr = "<a href=" + data.url + " class='fancy' rel=group><img src='" + data.thumb + "' alt='" + data.alt + "'/></a>"
    else
      imgstr = "<a href=" + data.url + " class='fancy' rel=group><img src='" + data.thumb + "'/></a>"
    imgstr

  buildHTMLlink: (data) ->
    imgstr = ""
    if data.link
      imgstr = "<a href=" + data.url + ">" + data.link + "</a>"
    else
      imgstr = "<a href=" + data.url + ">" + data.url + "</a>"
    imgstr

window.onload = ->
  UploadImageDialog.init()
  return

@imageUploader = angular.module("imageUploader", [
  "ng-rails-csrf"
  "ngAnimate"
  "ngCookies"
  "ngResource"
  "ngSanitize"
  "ngRoute"
  ])
.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/main.html'
      controller: 'MainCtrl'
    .when '/about',
      templateUrl: 'views/about.html'
      controller: 'MainCtrl'
    .otherwise
      redirectTo: '/'