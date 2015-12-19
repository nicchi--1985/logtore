TradeLogForm = require('./forms/trade_log_form')
TradeLogTable = require('./logtables/trade_log_table')
ActionCreator = require('../actions/ActionCreator.coffee')
TradeStore = require('../stores/TradeStore.coffee')

console.log TradeStore

class TradeLogContainer extends React.Component
  constructor: (props) ->
    super
    console.log ActionCreator
    ActionCreator.fetchTrades()
    @state = {data: TradeStore.getTrades()}

  _onChange: =>
    console.log "CHANGE_TRADE!!"
    trades = TradeStore.getTrades()
    @setState({data: trades})

  componentDidMount: =>
    TradeStore.addListener(@_onChange)

  componentWillUnmount: =>
    TradeStore.removeListener(@onChange)

  createTrade: (data) ->
    ActionCreator.createTrade(data)

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
