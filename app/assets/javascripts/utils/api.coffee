ActionCreator = require('../actions/ActionCreator.coffee')
console.log ActionCreator

module.exports =
  fetchTrades: (ActionCreator) ->
    $.ajax
        url: window.location.origin + "/api/trades"
        dataType: 'json'
        type: 'GET'
      .done (data) =>
        ActionCreator.recieveTrades(data)
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()

###
console.log "aaaaaaaaaaaaaaaaa"
console.log ActionCreator
console.log "bbbbbbbbbbbbbbbbbb"
class Api
  @AC = ActionCreator
  console.log ActionCreator.recieveTrades
  @fetchTrades: ->

    console.log ActionCreator

    $.ajax
        url: window.location.origin + "/api/trades"
        dataType: 'json'
        type: 'GET'
      .done (data) =>
        console.log "------------"
        console.log @AC
        ActionCreator.recieveTrades(data)
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()

  @createTrade: (data) =>
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
        return data
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()

module.exports = Api
###
