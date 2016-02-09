AppDispatcher = require('../AppDispatcher')
http = require('http')

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
    new Promise (resolve, reject) ->
      $.ajax
        url: window.location.origin + "/api/trades/summary"
        dataType: 'json'
        type: 'GET'
        data: month
      .done (data) =>
        resolve(data)
      .fail (xhr, status, err) =>
        reject(xhr, status, err)


  fetchProductSummaries: (month) ->
    new Promise (resolve, reject) ->
      $.ajax
        url: window.location.origin + "/api/trades/product_summary"
        dataType: 'json'
        type: 'GET'
        data: month
      .done (data) =>
        resolve(data)
      .fail (xhr, status, err) =>
        reject(xhr, status, err)
}
