class StockForm extends React.Component
  getTargetParams: =>
    brand_code = @refs.brand_code.value
    return unless brand_code
    {brand_code: brand_code}

  clearTargetParams: =>
    @refs.brand_code.value = ""

  render: ->
    `<div>
      <h4>this is StockForm</h4>
      <input type="text" placeholder="銘柄コード" ref="brand_code" />
    </div>`

module.exports = StockForm
