CommonForm = require('./common_form')
StockForm = require('./stock_form')
FutureForm = require('./future_form')
OptionForm = require('./option_form')
ExchangeForm = require('./exchange_form')
BasisForm = require('./basis_form')

class TradeLogForm extends React.Component
  constructor: (props) ->
    super(props)
    @state = {
              selectedProduct: null,
              bases: ["basis_1"]
            }

  productSelected: (e) =>
    console.log @props
    selectedProduct = e.target.value
    @setState selectedProduct: selectedProduct
    console.log "product-> " + selectedProduct + " was selected!"

  addBasis: (e) =>
    console.log "addBasis triggered"
    bases = @state.bases
    next_basis = "basis_" + (bases.length + 1)
    bases.push next_basis
    @setState bases: bases

  render: ->
    selectedProduct = (()=>
        console.log "is selected ->" + @state.selectedProduct
        bases = @state.bases
        addBasis = @addBasis
        switch @state.selectedProduct
          when null
            `<div>select your product</div>`
          when "0"
            `<div><StockForm />
            <BasisForm addBasis={addBasis} bases={bases} /></div>`
          when "1"
            `<div><FutureForm />
            <BasisForm addBasis={addBasis} bases={bases} /></div>`
          when "2"
            `<div><OptionForm />
            <BasisForm addBasis={addBasis} bases={bases} /></div>`
          when "3"
            `<div><ExchangeForm />
            <BasisForm addBasis={addBasis} bases={bases} /></div>`
          else
            `<div>out of range</div>`
      )()
    console.log selectedProduct
    `<div>this is TradeLogForm
      <CommonForm productSelected={this.productSelected}/>
      {selectedProduct}
     </div>`

module.exports = TradeLogForm
