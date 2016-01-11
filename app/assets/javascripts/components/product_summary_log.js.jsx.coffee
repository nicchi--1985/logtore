ActionCreator = require('../actions/ActionCreator.coffee')
TradesProdSummaryStore = require('../stores/TradesProdSummaryStore.coffee')
ProductSummaryTable = require('./logtables/product_summary_table')

class ProductSummaryLog extends React.Component
  constructor: (props) ->
    super
    ActionCreator.fetchProductSummaries(month_period: 1, target_period: moment().format("YYYY-MM-DD"))
    @state = {
      psummaries: TradesProdSummaryStore.getPSummaries()
    }

  _onPSummaryChange: =>
    console.log "CHANGE_PSUMMARY!!"
    psummaries = TradesProdSummaryStore.getPSummaries()
    @setState({psummaries: psummaries})

  componentDidMount: =>
    TradesProdSummaryStore.addListener(@_onPSummaryChange)

  componentWillUnmount: =>
    TradesProdSummaryStore.removeListener(@_onPSummaryChange)

  render: ->
    `<div>
      <ProductSummaryTable psummaries={this.state.psummaries} />
    </div>`

module.exports = ProductSummaryLog
