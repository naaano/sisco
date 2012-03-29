function update_column_value (controller, id, col,val) {
 new Ajax.Request(controller+'/update_select_column/'+id+'?column='+col+'&value='+val, {asynchronous:true, evalScripts:true})
 }