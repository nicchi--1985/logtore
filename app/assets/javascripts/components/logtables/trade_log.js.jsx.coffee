class TradeLog extends React.Component
  renderProductLog: ->
    product = @props.product
    switch @props.product_type
      when "Stock"
        `<div>{product.brand_code}</div>`
      when "Future"
        `<div>
        <div>{product.index_code}</div>
        {product.year + "(年)/" + product.month + "(月)"}
        </div>`
      when "Option"
        `<div>
        <div>{product.index_code}</div>
        <div>{product.exercise_price + " 円"}</div>
        {product.year + "(年)/" + product.month + "(月)"}
        </div>`
      when "Exchange"
        `<div>{product.base_currency + "/" + product.quote_currency}</div>`

  basisTypeToStr: (basis_type) ->
    switch basis_type
      when 0
        "テ："
      when 1
        "ファ："
      when 2
        "ア："
      else
        "?"

  renderBasisLog: =>
    bases = @props.bases.map (basis) =>
      basistext = @basisTypeToStr(basis.basis_type) + basis.text
      `<div key={basis.id}>{basistext}</div>`

  renderAmountLog: =>
    amount = @props.invest_amount
    quantity = @props.invest_quantity
    `<div>
    <div>{amount + "(円)"}</div>
    <div>{"x " + quantity + " (枚)"}</div>
    </div>`

  render: ->
    `<tr className="tradeLogNode">
      <td>{this.props.action_type}</td>
      <td>{this.props.product_type.substr(0,2)}</td>
      <td>{this.renderProductLog()}</td>
      <td>{this.renderAmountLog()}</td>
     </tr>`

module.exports = TradeLog
