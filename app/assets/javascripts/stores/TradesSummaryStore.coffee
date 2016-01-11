EventEmitter = require('events').EventEmitter
AppDispatcher = require('../AppDispatcher')

CHANGE_SUMMARY = "change_summary"

_summaries = []

setSummaries = (data) ->
  console.log "TradesSummary.setSummaries"
  _summaries = data

class TradesSummaryStore extends EventEmitter
  @emitChange: =>
    console.log "emitting!!"
    @prototype.emit(CHANGE_SUMMARY)
    console.log "emitted!"

  @addListener: (callback) =>
    console.log "TradesSummary: add Listener"
    @prototype.on(CHANGE_SUMMARY, callback)

  @removeListener: (callback) =>
    @prototype.removeListener(CHANGE_SUMMARY, callback)

  @getSummaries: ->
    console.log "getting summaries! "
    return _summaries

AppDispatcher.register((payload) ->
    switch payload.action.type
      when 'RECEIVE_SUMMARY'
        console.log "RECEIVE_SUMMARY"
        setSummaries(payload.action.summaries)
        break

    TradesSummaryStore.emitChange()
  )

module.exports = TradesSummaryStore
