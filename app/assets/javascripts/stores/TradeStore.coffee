EventEmitter = require('events').EventEmitter
AppDispatcher = require('../AppDispatcher')
_ = require('underscore')

CHANGE_TRADE = "change_trade"

_trades = []

setTrades = (data) ->
  _trades = data

class TradeStore extends EventEmitter
  @emitChange: =>
    @prototype.emit(CHANGE_TRADE)

  @addListener: (callback) =>
    @prototype.on(CHANGE_TRADE, callback)

  @removeListener: (callback) =>
    @prototype.removeListener(CHANGE_TRADE, callback)

  @getTrades: ->
    return _trades

  @getTradeById: (id) ->
    _.find(_trades, (trade)-> trade.id == parseInt(id, 10))

AppDispatcher.register((payload) ->
    switch payload.action.type
      when 'RECEIVE_TRADES'
        setTrades(payload.action.trades)
        break

    TradeStore.emitChange()
  )

module.exports = TradeStore
