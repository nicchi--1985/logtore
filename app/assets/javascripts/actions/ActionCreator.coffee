AppDispatcher = require('../AppDispatcher')
API = require('../utils/Api.coffee')

class ActionCreator
  # method for server
  @fetchTrades: ->
    console.log "ActionCreator.fetchTrades()"
    API.fetchTrades(@)

  @recieveTrades: (json) ->
    AppDispatcher.dispatch({
        source: 'SERVER_ACTION',
        action: {
          type: 'RECEIVE_TRADES',
          trades: json
        }
      })
###
  createTrade: (data) =>
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
module.exports = ActionCreator
