class SummaryTable extends React.Component
  renderSummary: ->
    if this.props.summaries
      `<div>{this.props.summaries.msg}</div>`

  render: ->
    `<div>
      <label>月別サマリー</label>
      {this.renderSummary()}
    </div>`

module.exports = SummaryTable
