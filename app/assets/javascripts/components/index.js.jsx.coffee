TradeLogForm = require('./forms/trade_log_form')
TradeLogTable = require('./trade_log_table')
ActionCreator = require('../actions/ActionCreator.coffee')
TradeStore = require('../stores/TradeStore.coffee')
API = require('../utils/Api.coffee')

class TradeLogContainer extends React.Component
  constructor: (props) ->
    super
    ActionCreator.fetchTrades()
    initData = TradeStore.getTrades()
    @state = {data: initData}

  _onChange: =>
    console.log "CHANGE_TRADE!!"
    trades = TradeStore.getTrades()
    @setState({data: trades})

  componentDidMount: =>
    TradeStore.addListener(@_onChange)

  componentWillUnmount: =>
    TradeStore.removeListener(@onChange)

  createTrade: (data) ->
    @api.createTrade(data)

  render: ->
    `<div>
      <TradeLogForm createTrade={this.createTrade} />
      <TradeLogTable trades={this.state.data} />
    </div>`

$ ->
  ReactDOM.render(
    `<TradeLogContainer />`,
    document.getElementById('content')
  )
