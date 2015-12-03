CommonForm = require('./common_form')
StockForm = require('./stock_form')
FutureForm = require('./future_form')
OptionForm = require('./option_form')
ExchangeForm = require('./exchange_form')
BasisForm = require('./basis_form')

class TradeLogForm extends React.Component
  constructor: (props) ->
    super(props)
    @state = selectedProduct: null
    console.log @state

  productSelected: (e) =>
    console.log @props
    selectedProduct = e.target.value
    @setState selectedProduct: selectedProduct
    console.log "product-> " + selectedProduct + " was selected!"
    console.log e.target.value

  render: ->
    selectedProduct = (()=>
        console.log "is selected ->" + @state.selectedProduct
        switch @state.selectedProduct
          when null
            `<div>select your product</div>`
          when "0"
            `<div><StockForm />
            <BasisForm /></div>`
          when "1"
            `<div><FutureForm />
            <BasisForm /></div>`
          when "2"
            `<div><OptionForm />
            <BasisForm /></div>`
          when "3"
            `<div><ExchangeForm />
            <BasisForm /></div>`
          else
            `<div>out of range</div>`
      )()
    console.log selectedProduct
    `<div>this is TradeLogForm
      <CommonForm productSelected={this.productSelected}/>
      {selectedProduct}
     </div>`

module.exports = TradeLogForm
