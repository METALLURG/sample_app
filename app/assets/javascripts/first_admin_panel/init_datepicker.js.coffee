$ ->
  initDatepicker = ->
    $('input[rel=date]').datepicker
      format: 'yyyy-mm-dd'

  $(document).on 'nested:fieldAdded', (event) ->
    initDatepicker()

  initDatepicker()