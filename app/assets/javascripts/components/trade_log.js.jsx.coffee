class TradeLog extends React.Component
  createProductLog: ->
    switch @props.product_type
      when "Stock"
        @props.product.brand_code
      when "Future"
        @props.product.index_code + "\n" \
        + @props.product.year + "\n" \
        + @props.product.month
      when "Option"
        @props.product.index_code
      when "Exchange"
        @props.product.base_currency

  basisTypeToStr: (basis_type) ->
    switch basis_type
      when 0
        "テクニカル"
      when 1
        "ファンダメンタル"
      when 2
        "アノマリー"
      else
        "?"

  createBasisLog: =>
    basis = @props.bases.map (basis) =>
      @basisTypeToStr(basis.basis_type) + ": " + basis.text
    basis.join("\n")

  render: ->
    product = @createProductLog()
    basis = @createBasisLog()
    console.log product

    `<tr>
      <td>{this.props.trade_id}</td>
      <td>{this.props.implimentation_date}</td>
      <td>{this.props.action_type}</td>
      <td>{this.props.product_type}</td>
      <td>{product}</td>
      <td>{this.props.invest_amount}</td>
      <td>{this.props.invest_quantity}</td>
      <td>{basis}</td>
     </tr>`

module.exports = TradeLog
