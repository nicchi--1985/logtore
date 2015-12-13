AppDispatcher = require('../AppDispatcher')
ActionCreator = require('../actions/ActionCreator.coffee')

fetchTrades = () ->
  console.log "Api.fetchTrades!!!!!"
  $.ajax
      url: window.location.origin + "/api/trades"
      dataType: 'json'
      type: 'GET'
    .done (data) =>
      console.log ActionCreator
      ActionCreator.recieveTrades(data)
    .fail (xhr, status, err) =>
      console.error @props.url, status, err.toString()

createTrade = (data) ->
  console.log "API.createTrade"
  $.ajax
      url: window.location.origin + "/api/trades"
      dataType: 'json'
      type: 'POST'
      data: data
    .done (data) =>
      ActionCreator.recieveTrades(data)
    .fail (xhr, status, err) =>
      console.error @props.url, status, err.toString()

AppDispatcher.register((payload) =>
    switch payload.action.type
      when 'FETCH_TRADES'
        console.log "FETCH_TRADES"
        fetchTrades()
      when 'CREATE_TRADES'
        console.log "CREATE_TRADES"
        createTrade(payload.action.data)
  )

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
