EventEmitter = require('events').EventEmitter
AppDispatcher = require('../AppDispatcher')

CHANGE_PSUMMARY = "change_psummary"

_psummaries = []

setPSummaries = (data) ->
  _psummaries = data

class TradesProdSummaryStore extends EventEmitter
  @emitChange: =>
    @prototype.emit(CHANGE_PSUMMARY)

  @addListener: (callback) =>
    @prototype.on(CHANGE_PSUMMARY, callback)

  @removeListener: (callback) =>
    @prototype.removeListener(CHANGE_PSUMMARY, callback)

  @getPSummaries: ->
    return _psummaries

AppDispatcher.register((payload) ->
    switch payload.action.type
      when 'RECEIVE_PSUMMARY'
        setPSummaries(payload.action.psummaries)
        break

    TradesProdSummaryStore.emitChange()
  )

module.exports = TradesProdSummaryStore
