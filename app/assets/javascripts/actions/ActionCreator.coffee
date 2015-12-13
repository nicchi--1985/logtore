AppDispatcher = require('../AppDispatcher')
Api = require('../utils/Api.coffee')

module.exports = {
  # method for server
  fetchTrades: () ->
    console.log "ActionCreator.fetchTrades()"
    Api.fetchTrades()
      .then (data) =>
        @recieveTrades(data)
      .catch (xhr, status, err) ->
        console.error xhr, status, err.toString()

  recieveTrades: (json) ->
    AppDispatcher.dispatch({
        source: 'SERVER_ACTION',
        action: {
          type: 'RECEIVE_TRADES',
          trades: json
        }
      })

  createTrade: (postdata) ->
    Api.createTrade(postdata)
      .then (data) =>
        @recieveTrades(data)
      .catch (xhr, status, err) ->
        console.error xhr, status, err.toString()
    ###
    AppDispatcher.dispatch({
        source: 'SERVER_ACTION',
        action: {
          type: 'CREATE_TRADES',
          data: postdata
        }
      })
    ###
}


###
    console.log data
    console.log window.location.protocol
    console.log window.location.host
    console.log window.location.origin

    $.ajax
        url: window.location.origin + "/api/trades"
        dataType: 'json'
        type: 'POST'
        data: data
      .done (data) =>
        @setState(data: data)
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()
###
