EventEmitter = require('events').EventEmitter
AppDispatcher = require('../AppDispatcher')

CHANGE_PSUMMARY = "change_psummary"

_psummaries = []

setPSummaries = (data) ->
  console.log "TradesProdSummary.setSummaries"
  _psummaries = data

class TradesProdSummaryStore extends EventEmitter
  @emitChange: =>
    console.log "emitting!!"
    @prototype.emit(CHANGE_PSUMMARY)
    console.log "emitted!"

  @addListener: (callback) =>
    console.log "TradesProdSummary: add Listener"
    @prototype.on(CHANGE_PSUMMARY, callback)

  @removeListener: (callback) =>
    @removeListener(CHANGE_PSUMMARY, callback)

  @getPSummaries: ->
    console.log "getting psummaries! "
    return _psummaries

AppDispatcher.register((payload) ->
    switch payload.action.type
      when 'RECEIVE_PSUMMARY'
        console.log "RECEIVE_PSUMMARY"
        setPSummaries(payload.action.psummaries)
        break

    TradesProdSummaryStore.emitChange()
  )

module.exports = TradesProdSummaryStore
