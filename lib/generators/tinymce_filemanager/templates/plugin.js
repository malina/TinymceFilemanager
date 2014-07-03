(function() {
  tinymce.PluginManager.requireLangPack('uploadimage');

  tinymce.create('tinymce.plugins.UploadImage', {
    UploadImage: function(ed, url) {
      var form, iframe, win, editor = ed;
      function showDialog() {
        if(window.innerWidth < 1300) {
          this.widTh = window.innerWidth * 0.98;
        }
        else{
          this.widTh = window.innerWidth * 0.8;
        }
        this.win = editor.windowManager.open({
          //width:  1050 + parseInt(editor.getLang('uploadimage.delta_width', 0), 10),
          width:  this.widTh,
          height: 600 + parseInt(editor.getLang('uploadimage.delta_height', 0), 10),
          url: '/filemanager',
        }, {
          plugin_url: url
        });
      };

      editor.addButton('uploadimage', {
        tooltip: ed.translate('Менеджер файлов'),
        icon : 'browse',
        onclick: showDialog
      });

      editor.addMenuItem('uploadimage', {
        text: ed.translate('Менеджер файлов'),
        icon : 'browse',
        context: 'insert',
        onclick: showDialog
      });
    }
  });

  tinymce.PluginManager.add('uploadimage', tinymce.plugins.UploadImage);
})();
