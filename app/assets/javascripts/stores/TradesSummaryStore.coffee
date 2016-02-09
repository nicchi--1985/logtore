EventEmitter = require('events').EventEmitter
AppDispatcher = require('../AppDispatcher')

CHANGE_SUMMARY = "change_summary"

_summaries = []

setSummaries = (data) ->
  _summaries = data

class TradesSummaryStore extends EventEmitter
  @emitChange: =>
    @prototype.emit(CHANGE_SUMMARY)

  @addListener: (callback) =>
    @prototype.on(CHANGE_SUMMARY, callback)

  @removeListener: (callback) =>
    @prototype.removeListener(CHANGE_SUMMARY, callback)

  @getSummaries: ->
    return _summaries

AppDispatcher.register((payload) ->
    switch payload.action.type
      when 'RECEIVE_SUMMARY'
        setSummaries(payload.action.summaries)
        break

    TradesSummaryStore.emitChange()
  )

module.exports = TradesSummaryStore
