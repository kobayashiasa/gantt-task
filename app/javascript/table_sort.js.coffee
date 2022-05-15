$(function(){
  console.log("イベント発火");
  $('.listWrapper').sortable({
    axis: 'y',
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",

    update: (e, ui) {
      let item     = ui.item;
      let itemData = item.data();
      let params   = { _method: 'put' };
      params[itemData.modelName] = { row_order_position: item.index() };
      $.ajax({
        type: 'POST'
        url: itemData.updateUrl,
        dataType: 'json',
        data: params
    });
  },

  $('.cardWrapper').sortable({
    axis: 'y',
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",
    connectWith : '.listWrapper',

    update: (e, ui) {
      let item     = ui.item;
      let itemData = item.data();
      let columsID   = item.parents('.ui-sortable-handle').eq(0).data().id
      let params   = { _method: 'put' };
      params[itemData.modelName] = { row_order_position: item.index(),colums_id: columsID };
      $.ajax({
        type: 'POST'
        url: itemData.updateUrl,
        dataType: 'json',
        data: params
      });
    },
    stop: function(e, ui){ 
      return ui.item.children('task').effect('highlight');
    },
  });
});