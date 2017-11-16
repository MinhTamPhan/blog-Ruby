@clientPage = new (->
  @modalControl = (government_name) ->
    unique_code = ''
    $('form').bind 'cocoon:before-insert', (e, item_to_be_added) ->
      unique_code = e.timeStamp
      item_to_be_added.find('div.modal').attr 'data-backdrop', 'static'
      item_to_be_added.find('div.modal').attr 'data-keyboard', 'false'
      item_to_be_added.find('div.view').addClass 'view' + unique_code
      item_to_be_added.find('div.modal').addClass 'modal' + unique_code
      item_to_be_added.find('#distribution_center_id').addClass 'distribution_center_id' + unique_code
      item_to_be_added.find('div.modal button').addClass 'btn' + unique_code
      item_to_be_added.find('.client_contracts_attributes_client_name').val government_name
      item_to_be_added.find('div.modal').append '<script>$(\'.btn' + unique_code + '\').click(function(){$(\'.view' + unique_code + ' .distribution_center_name\').val($(\'.distribution_center_id' + unique_code + '\').val());console.log($(\'#client_contracts_attributes_' + unique_code + '_distribution_center_id\').val());$(\'.modal' + unique_code + '\').modal(\'hide\');});</script>'
      return
    $('#frmMain').on 'cocoon:after-insert', (e, insertedItem) ->
      $('.modal' + unique_code).modal 'show'
      return

  return @
)