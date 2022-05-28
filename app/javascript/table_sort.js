function post(){
  $('.listWrapper').sortable({
    axis: 'x',
    
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",

    update: (_, ui) => { 
      let item     = ui.item;
      let itemData = item.data();
      let params   = { _method: 'put' };
      params[itemData.modelName] = { row_order_position: item.index() }
      $.ajax({
        type: 'POST',
        url: itemData.updateUrl,
        dataType: 'json',
        data: params
      });
    },

    stop: (_, ui) => {
      return ui.item.children('list').effect('highlight')
    }
  });

  $('.tasks').sortable({
    axis: 'y',
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",
    connectWith : '.tasks',

    update: (_, ui) => {
      let item     = ui.item;
      let itemData = item.data();
      let columnID   = item.parents('.ui-sortable-handle').eq(0).data().id
      let params   = { _method: 'put' };
      params[itemData.modelName] = { row_order_position: item.index(), column_id: columnID}
      $.ajax({
        type: 'POST',
        url: itemData.updateUrl,
        dataType: 'json',
        data: params
      })
    },

    stop: (_, ui) => {
      return ui.item.children('task').effect('highlight')
    }
  });
};




window.addEventListener('load', post);



