_ = require('underscore')

class ProductSummaryTable extends React.Component
  renderSummaries: ->
    @props.psummaries.map (summary) ->
      `<ProductSummaryNode key={summary.product_type} summary={summary}/>`

  render: ->
    target = ""
    if @props.psummaries.length > 0
      target = _.first(@props.psummaries).period.substr(0,7)
    `<div className="tradeSummaryList">
      <label>当月商品別サマリー</label>
      <table>
      <tbody>
        <tr>
          <th colSpan="5">{target}</th>
        </tr>
      {this.renderSummaries()}
      </tbody>
      </table>
    </div>`


class ProductSummaryNode extends React.Component
  render: ->
    plus = @props.summary.plus_benefit * 100
    minus = @props.summary.minus_benefit * 100
    sum = plus + minus
    `<tr className="tradeSummaryNode">
      <td>{this.props.summary.product_type}</td>
      <td>{plus + "%"}</td>
      <td>{"+"}</td>
      <td>{minus + "%"}</td>
      <td>{"= " + sum + "%"}</td>
    </tr>`

module.exports = ProductSummaryTable
