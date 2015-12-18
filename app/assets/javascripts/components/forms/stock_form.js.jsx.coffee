class StockForm extends React.Component
  getTargetParams: =>
    brand_code = @refs.brand_code.value
    return unless brand_code
    {brand_code: brand_code}

  clearTargetParams: =>
    @refs.brand_code.value = ""

  render: ->
    `<div>
      <label>株：</label>
      <div className="textFieldWP">
        <input type="number" pattern="\d*" placeholder="銘柄コード" ref="brand_code" />
      </div>
    </div>`

module.exports = StockForm
