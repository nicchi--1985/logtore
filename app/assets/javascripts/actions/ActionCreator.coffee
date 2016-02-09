AppDispatcher = require('../AppDispatcher')
Api = require('../utils/api.coffee')

module.exports = {
  # method for server
  fetchTrades: () ->
    Api.fetchTrades()
      .then (data) =>
        @recieveTrades(data)
      .catch (xhr, status, err) ->
        console.error xhr, status, err

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
        console.error xhr, status, err

  fetchSummaries: (month=1) ->
    Api.fetchSummaries(month)
      .then (data) =>
        @recieveSummaries(data)
      .catch (xhr, status, err) ->
        console.error xhr, status, err

  recieveSummaries: (json) ->
    AppDispatcher.dispatch({
        source: 'SERVER_ACTION',
        action: {
          type: 'RECEIVE_SUMMARY',
          summaries: json
        }
      })

  fetchProductSummaries: (month=1) ->
    Api.fetchProductSummaries(month)
      .then (data) =>
        @recieveProductSummaries(data)
      .catch (xhr, status, err) ->
        console.error xhr, status, err

  recieveProductSummaries: (json) ->
    AppDispatcher.dispatch({
        source: 'SERVER_ACTION',
        action: {
          type: 'RECEIVE_PSUMMARY',
          psummaries: json
        }
      })

}
