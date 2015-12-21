class ProductSummaryTable extends React.Component
  renderProductSummary: ->
    if this.props.psummaries
      `<div>{this.props.psummaries.msg}</div>`

  render: ->
    `<div>
      <label>商品別サマリー</label>
      {this.renderProductSummary()}
    </div>`

module.exports = ProductSummaryTable
