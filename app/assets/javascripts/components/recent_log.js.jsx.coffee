ActionCreator = require('../actions/ActionCreator.coffee')
TradeStore = require('../stores/TradeStore.coffee')
TradeLogTable = require('./logtables/trade_log_table')

class RecentLog extends React.Component
  constructor: (props) ->
    super
    ActionCreator.fetchTrades()
    @state = {
      trades: TradeStore.getTrades()
    }

  _onChange: =>
    trades = TradeStore.getTrades()
    @setState({trades: trades})

  componentDidMount: =>
    TradeStore.addListener(@_onChange)

  componentWillUnmount: =>
    TradeStore.removeListener(@_onChange)

  render: ->
    `<div>
      <TradeLogTable trades={this.state.trades} />
    </div>`

module.exports = RecentLog
