$ ->
  window.DataTable = do ->
    settings=
      datatables: $('.dataTable')
      datatableConfig:
        aaSorting: []
        iDisplayLength: 10
        bLengthChange: false
        processing: true
        serverSide: true

    configDatatable=(e)->
      config=
        sAjaxSource: $(e).data('url')
        aoColumns: sortColumns(e)

      $(e).dataTable $.extend(config, settings.datatableConfig)

    reload=->
      settings.datatables.each (i, e)->
        $(e).dataTable().ajax.reload()

    sortColumns=(e)->
      columns = $(e).data('columns')
      sortedColumns = []

      if columns
        columns = columns.toString().split(',')

        $.each columns, (i, col) ->
          sortedColumns.push({'bSortable': $.trim(col) == 'true'})
      else
        columns = $(e).find('th')
        $.each columns, (i, col) ->
          sortedColumns.push({'bSortable': true })

      return sortedColumns

    init = ->
      settings.datatables.each (i, e)->
        configDatatable(e)

    # Public Interface
    reload: reload
    init: init


