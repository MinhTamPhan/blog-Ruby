$(document).ready ->
  $('#pallet_request_transportation_method').change(->
    value = $(this).val()
    $('.driver-line').toggle(value == 'client')
    $('.driver-line input').prop('disabled', value != 'client')
  ).trigger('change')