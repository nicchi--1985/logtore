class SummaryTable extends React.Component
  renderSummaries: ->
    console.log "aaaaaaaaaaaaaaaaaa"
    console.log @props
    @props.summaries.map (summary) ->
      `<SummaryNode key={summary.period} summary={summary}/>`

  render: ->
    `<div className="tradeSummaryList">
      <label>月別サマリー</label>
      <table>
      <tbody>
      {this.renderSummaries()}
      </tbody>
      </table>
    </div>`


class SummaryNode extends React.Component
  render: ->
    plus = @props.summary.plus_benefit * 100
    minus = @props.summary.minus_benefit * 100
    sum = plus + minus
    `<tr className="tradeSummaryNode">
      <td>{this.props.summary.period.substr(0,7)}</td>
      <td>{plus + "%"}</td>
      <td>{"+"}</td>
      <td>{minus + "%"}</td>
      <td>{"= " + sum + "%"}</td>
    </tr>`

module.exports = SummaryTable
