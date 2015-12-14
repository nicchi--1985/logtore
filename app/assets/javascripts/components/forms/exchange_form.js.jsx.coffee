class ExchangeForm extends React.Component
  getTargetParams: =>
    base_currency = @refs.base_currency.value
    quote_currency = @refs.quote_currency.value
    return unless base_currency and quote_currency
    {
      base_currency: base_currency,
      quote_currency: quote_currency
    }

  clearTargetParams: =>
    @refs.base_currency.value = ""
    @refs.quote_currency.value = ""

  render: ->
    `<div>
      <h4>this is ExchangeForm</h4>
      <input type="text" placeholder="ベース通貨" ref="base_currency" />
      <input type="text" placeholder="相手通貨" ref="quote_currency" />
    </div>`

module.exports = ExchangeForm
