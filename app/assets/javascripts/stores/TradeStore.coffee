EventEmitter = require('events').EventEmitter
AppDispatcher = require('../AppDispatcher')

CHANGE_TRADE = "change_trade"

_trades = []

setTrades = (data) ->
  console.log "TradeStrore.setTrades"
  console.log data
  _trades = data

class TradeStore extends EventEmitter
  @emitChange: =>
    console.log "emitting!!"
    @prototype.emit(CHANGE_TRADE)
    console.log "emitted!"

  @addListener: (callback) =>
    console.log "TradeStore: add Listener"
    @prototype.on(CHANGE_TRADE, callback)

  @removeListener: (callback) =>
    @removeListener(CHANGE_TRADE, callback)

  @getTrades: ->
    console.log "getting trades! " + @trades
    console.log _trades
    return _trades

AppDispatcher.register((payload) ->
    switch payload.action.type
      when 'RECEIVE_TRADES'
        console.log "RECEIVE_TRADES"
        setTrades(payload.action.trades)
        break

    TradeStore.emitChange()
  )

module.exports = TradeStore
