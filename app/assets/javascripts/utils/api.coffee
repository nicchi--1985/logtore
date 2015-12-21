AppDispatcher = require('../AppDispatcher')
http = require('http')

console.log "API!!!!!"
module.exports = {
  fetchTrades: () ->
    new Promise (resolve, reject) ->
      $.ajax
          url: window.location.origin + "/api/trades"
          dataType: 'json'
          type: 'GET'
        .done (data) =>
          resolve(data)
        .fail (xhr, status, err) =>
          reject(xhr, status, err)


  createTrade: (postdata) ->
    console.log "API.createTrade"
    new Promise (resolve, reject) ->
      $.ajax
          url: window.location.origin + "/api/trades"
          dataType: 'json'
          type: 'POST'
          data: postdata
        .done (data) =>
          resolve(data)
        .fail (xhr, status, err) =>
          reject(xhr, status, err)


  fetchSummaries: (month) ->
    console.log "API.createTrade"
    new Promise (resolve, reject) ->
      $.ajax
        url: window.location.origin + "/api/trades/summary"
        dataType: 'json'
        type: 'GET'
        data: {"month": month}
      .done (data) =>
        resolve(data)
      .fail (xhr, status, err) =>
        reject(xhr, status, err)


  fetchProductSummaries: (month) ->
    console.log "API.createTrade"
    new Promise (resolve, reject) ->
      $.ajax
        url: window.location.origin + "/api/trades/product_summary"
        dataType: 'json'
        type: 'GET'
        data: {"month": month}
      .done (data) =>
        resolve(data)
      .fail (xhr, status, err) =>
        reject(xhr, status, err)
}
###
AppDispatcher.register((payload) =>
    console.log "dispatch"
    console.log payload
    switch payload.action.type
      when 'FETCH_TRADES'
        console.log "FETCH_TRADES"
        fetchTrades()
        break
      when 'CREATE_TRADES'
        console.log "CREATE_TRADES"
        createTrade(payload.action.data)
        break
  )
###
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
