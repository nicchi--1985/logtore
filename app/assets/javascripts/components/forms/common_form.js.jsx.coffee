class CommonForm extends React.Component
  ###
  @props
  productSelected()
  ###
  constructor: (props) ->
    super props

  render: ->
    `<div>
      <h3>this is CommonForm</h3>
      <input type="text" placeholder="取引日" />
      <ProductTypeSelector productSelected={this.props.productSelected} />
    </div>`

class ProductTypeSelector extends React.Component
  ###
  @props
  productSelected
  ###
  render: ->
    `<select onChange={this.props.productSelected}>
      <option value="">商品種類を選択して下さい</option>
      <option value="0">株式</option>
      <option value="1">先物</option>
      <option value="2">オプション</option>
      <option value="3">為替</option>
     </select>`

module.exports = CommonForm
