CKEDITOR.editorConfig = (config) ->
  config.language = "en"
  config.width = "550"
  config.height = "90"
  true
  config.toolbar = 'Full';
 
  config.toolbar_Full =
  [
    { name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
    { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    { name: 'editing', items : [ ] },
    { name: 'forms', items : [ ] },
    '/',
    { name: 'basicstyles', items : [ ] },
    { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent'] },
    { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
    { name: 'insert', items : [ ] },
    '/',
    { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
    { name: 'colors', items : [ 'TextColor','BGColor' ] },
    { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
  ];