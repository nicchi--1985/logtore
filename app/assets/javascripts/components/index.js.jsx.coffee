TradeLogForm = require('./forms/trade_log_form')
TradeLogTable = require('./logtables/trade_log_table')
SummaryTable = require('./logtables/summary_table')
ProductSummaryTable = require('./logtables/product_summary_table')
ActionCreator = require('../actions/ActionCreator.coffee')
TradeStore = require('../stores/TradeStore.coffee')
TradesSummaryStore = require('../stores/TradesSummaryStore.coffee')
TradesProdSummaryStore = require('../stores/TradesProdSummaryStore.coffee')

class TradeLogContainer extends React.Component
  constructor: (props) ->
    super
    ActionCreator.fetchTrades()
    ActionCreator.fetchSummaries(month_period: 1)
    ActionCreator.fetchProductSummaries(month_period: 1, target_period: moment().format("YYYY-MM-DD"))
    @state = {
      trades: TradeStore.getTrades(),
      summaries: TradesSummaryStore.getSummaries(),
      psummaries: TradesProdSummaryStore.getPSummaries()
    }

  _onChange: =>
    trades = TradeStore.getTrades()
    @setState({trades: trades})

  _onSummaryChange: =>
    summaries = TradesSummaryStore.getSummaries()
    @setState({summaries: summaries})

  _onPSummaryChange: =>
    psummaries = TradesProdSummaryStore.getPSummaries()
    @setState({psummaries: psummaries})

  componentDidMount: =>
    TradeStore.addListener(@_onChange)
    TradesSummaryStore.addListener(@_onSummaryChange)
    TradesProdSummaryStore.addListener(@_onPSummaryChange)

  componentWillUnmount: =>
    TradeStore.removeListener(@_onChange)
    TradesSummaryStore.removeListener(@_onSummaryChange)
    TradesProdSummaryStore.removeListener(@_onPSummaryChange)

  createTrade: (data) ->
    ActionCreator.createTrade(data)

  render: ->
    `<div>
      <TradeLogForm createTrade={this.createTrade} />
      <TradeLogTable trades={this.state.trades} />
      <SummaryTable summaries={this.state.summaries} />
      <ProductSummaryTable psummaries={this.state.psummaries} />
    </div>`

module.exports = TradeLogContainer
