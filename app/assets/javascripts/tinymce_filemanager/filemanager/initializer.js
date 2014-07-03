var UploadImageDialog = {
  editor: undefined,

  init: function() {
    var editor = this.editor = top.tinymce.activeEditor;
    this.iframe = document.getElementById("hidden_upload");
  },


  insert: function(data,type) {
    if(type == 'image'){
      for(var i=0; i < data.length; i++){
        this.editor.execCommand('mceInsertContent', false, UploadImageDialog.buildHTMLImg(data[i]));
      }
    }else{
      for(var i=0; i < data.length; i++){
        this.editor.execCommand('mceInsertContent', false, UploadImageDialog.buildHTMLlink(data[i]));
      }
    }
    //this.editor.execCommand('mceInsertContent', false, UploadImageDialog.buildHTML(data));
    this.editor.windowManager.close();
  },

  buildHTMLImg: function(data) {
    var imgstr = '';
    if (data.alt){
      imgstr = "<a target='_self' href=" + data.url + " class='fancy' rel=group><img src='" + data.thumb + "' alt='"+data.alt+"'/></a>";
    }else{
      imgstr = "<a target='_self' href=" + data.url + " class='fancy' rel=group><img src='" + data.thumb + "'/></a>";
    }
    return imgstr;
  },

  buildHTMLlink: function(data) {
    var imgstr = '';
    if (data.link){
      imgstr = "<a target='_self' href=" + data.url + " download='"+data.link+"''>" + data.link + "</a>";
    }else{
      imgstr = "<a target='_self' href=" + data.url + " download='file'>" + data.url + "dfgdf</a>";
    }
    return imgstr;
  }

};

window.onload = function() {
  UploadImageDialog.init();
}

var imageUploader = angular.module('imageUploader', ['ng-rails-csrf','ngAnimate']);
