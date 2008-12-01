/* mult-select */
function register_selection(tr) {
  /* un-select all */
   tr.down('.selection').checked = false;

   /* define tr functions */
   tr.onmouseover = function(){
     this.addClassName("selecting");
   }
   tr.onmouseout = function(){
     this.removeClassName('selecting');
   }
   tr.onclick = function(){
     select = this.down('.selection');
     select.checked = !select.checked
     if (select.checked) 
       this.addClassName('selected');
     else
       this.removeClassName('selected');
   }
}

function register_macros(macros) {
  var length = macros.length;

  for (var i = 0; i < length; i++) {
    action = macros[i];
    action.observe('click', function(event) {
      if (!find_selection(action)) {
        alert('You have to select something, before running the macro.');
        if (event) Event.stop(event);
        return false;
      }

      if (confirm('Are you sure to run ' + action.text + '?')) {
          window.location = action.href;
      };
      if (event) Event.stop(event);
    }.bind(action));
    action.onclick = '';
  }
}

function find_selection(action) {
  var selections = $$('.selection');
  var length = selections.length;
  var params = '';

  for (var i = 0; i < length; i++) {
    sel = selections[i];
    param = sel.name + '=' + sel.value;
    if (sel.checked) params += '&' + param;
  }
  
  action.href += params;
  if (params != '') return true;
}

function select_all(tbody_id) {
  var trs = $$('#' + tbody_id + ' tr.record');
  var length = trs.length;

  for (var i = 0; i < length; i++) {
    tr = trs[i];
    tr.addClassName('selected');
    select = tr.down('.selection');
    select.checked = true;
  }
}

function select_none(tbody_id) {
  var trs = $$('#' + tbody_id + ' tr.record');
  var length = trs.length;

  for (var i = 0; i < length; i++) {
    tr = trs[i];
    tr.removeClassName('selected');
    select = tr.down('.selection');
    select.checked = false;
  }
}
