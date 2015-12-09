EventEmitter = require('events').EventEmitter
AppDispatcher = require('../AppDispatcher')

class TradeStore extends EventEmitter
  constructor: () ->
    super
    @_dispatchToken = AppDispatcher.register()

  getDispatchToken: ->
    @_dispatchToken

  getMessages: ->
    @_trades

module.exports = new TradeStore()
