class CommonForm extends React.Component
  ###
  @props
  productSelected()
  ###
  constructor: (props) ->
    super props

  getSubmitValues: ->
    implimented_date = @refs.implimented_date.value
    return implimented_date

  render: ->
    `<div>
      <h3>this is CommonForm</h3>
      <input type="text" placeholder="取引日" ref="implimented_date"/>
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
      <option value="stock">株式</option>
      <option value="future">先物</option>
      <option value="option">オプション</option>
      <option value="exchange">為替</option>
     </select>`

module.exports = CommonForm
