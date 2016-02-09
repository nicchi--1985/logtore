ActionCreator = require('../actions/ActionCreator.coffee')
TradesSummaryStore = require('../stores/TradesSummaryStore.coffee')
SummaryTable = require('./logtables/summary_table')

class SummaryLog extends React.Component
  constructor: (props) ->
    super
    ActionCreator.fetchSummaries(month_period: 1)
    @state = {
      summaries: TradesSummaryStore.getSummaries()
    }

  _onSummaryChange: =>
    summaries = TradesSummaryStore.getSummaries()
    @setState({summaries: summaries})

  componentDidMount: =>
    TradesSummaryStore.addListener(@_onSummaryChange)

  componentWillUnmount: =>
    TradesSummaryStore.removeListener(@_onSummaryChange)

  render: ->
    `<div>
      <SummaryTable summaries={this.state.summaries} />
    </div>`

module.exports = SummaryLog
