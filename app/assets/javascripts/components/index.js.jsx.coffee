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
    ActionCreator.fetchSummaries(month: 1)
    ActionCreator.fetchProductSummaries(month: 1)
    @state = {
      trades: TradeStore.getTrades(),
      summaries: TradesSummaryStore.getSummaries(),
      psummaries: TradesProdSummaryStore.getPSummaries()
    }

  _onChange: =>
    console.log "CHANGE_TRADE!!"
    trades = TradeStore.getTrades()
    @setState({trades: trades})

  _onSummaryChange: =>
    console.log "CHANGE_SUMMARY!!"
    summaries = TradesSummaryStore.getSummaries()
    @setState({summaries: summaries})

  _onPSummaryChange: =>
    console.log "CHANGE_PSUMMARY!!"
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

$ ->
  ReactDOM.render(
    `<TradeLogContainer />`,
    document.getElementById('content')
  )
