module DesarrollosHelper
  def descripcion2_form_column(record, input_name)
    ret = text_area :record, :descripcion, :name => input_name, :cols => 80, :rows => 30 , :class => "rich_text_editor"
    ret << <<EOF;
    <script type="text/javascript">
//<![CDATA[
YAHOO.util.Event.onDOMReady(function(){
  new YAHOO.util.Element(document.getElementsByTagName('body')[0]).addClass('yui-skin-sam');
  
  var textAreas = document.getElementsByTagName('textarea');
  for (var i=0; i<textAreas.length; i++) {
    var textArea = textAreas[i];
    if (new YAHOO.util.Element(textArea).hasClass('rich_text_editor')) {
      var editor = new YAHOO.widget.Editor(textArea.id, { handleSubmit: true, autoHeight: false, dompath: false, collapse: true, toolbar: { collapse: true, titlebar: 'Text Editing Tools', draggable: false, buttonType: 'advanced', buttons: [ { group: 'textstyle', label: 'Font Style', buttons: [ { type: 'push', label: 'Bold CTRL + SHIFT + B', value: 'bold' }, { type: 'push', label: 'Italic CTRL + SHIFT + I', value: 'italic' }, { type: 'push', label: 'Underline CTRL + SHIFT + U', value: 'underline' }, { type: 'separator' }, { type: 'push', label: 'Subscript', value: 'subscript', disabled: true }, { type: 'push', label: 'Superscript', value: 'superscript', disabled: true }, { type: 'separator' }, { type: 'color', label: 'Font Color', value: 'forecolor', disabled: true }, { type: 'color', label: 'Background Color', value: 'backcolor', disabled: true }, { type: 'separator' }, { type: 'push', label: 'Remove Formatting', value: 'removeformat', disabled: true }, { type: 'push', label: 'Show/Hide Hidden Elements', value: 'hiddenelements' } ] }, { type: 'separator' }, { group: 'alignment', label: 'Alignment', buttons: [ { type: 'push', label: 'Align Left CTRL + SHIFT + [', value: 'justifyleft' }, { type: 'push', label: 'Align Center CTRL + SHIFT + |', value: 'justifycenter' }, { type: 'push', label: 'Align Right CTRL + SHIFT + ]', value: 'justifyright' }, { type: 'push', label: 'Justify', value: 'justifyfull' } ] }, { type: 'separator' }, { group: 'parastyle', label: 'Paragraph Style', buttons: [ { type: 'select', label: 'Normal', value: 'heading', disabled: true, menu: [ { text: 'Normal', value: 'none', checked: true }, { text: 'Header 1', value: 'h1' }, { text: 'Header 2', value: 'h2' }, { text: 'Header 3', value: 'h3' }, { text: 'Header 4', value: 'h4' }, { text: 'Header 5', value: 'h5' }, { text: 'Header 6', value: 'h6' } ] } ] }, { type: 'separator' }, { group: 'indentlist', label: 'Indenting and Lists', buttons: [ { type: 'push', label: 'Indent', value: 'indent', disabled: true }, { type: 'push', label: 'Outdent', value: 'outdent', disabled: true }, { type: 'push', label: 'Create an Unordered List', value: 'insertunorderedlist' }, { type: 'push', label: 'Create an Ordered List', value: 'insertorderedlist' } ] }, { type: 'separator' }, { group: 'insertitem', label: 'Insert Item', buttons: [ { type: 'push', label: 'HTML Link CTRL + SHIFT + L', value: 'createlink', disabled: true }, { type: 'push', label: 'Insert Image', value: 'insertimage' } ] } ] } });
      // MyExtension.install(editor);;
      editor.render();
    }
  }
});

//]]>
</script>

EOF
  return ret  
  end

end