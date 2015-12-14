class CommonForm extends React.Component
  constructor: (props) ->
    super props

  getSubmitValues: ->
    implimented_date = @refs.implimented_date.value
    return implimented_date

  clearForm: ->
    @refs.implimented_date.value = ""
    @refs.product.refs.selector.value = ""
    @refs.action.refs.selector.value = ""

  render: ->
    `<div>
      <h3>this is CommonForm</h3>
      <input type="text" placeholder="取引日" ref="implimented_date"/>
      <ProductTypeSelector productSelected={this.props.productSelected}
                           ref="product" />
      <ActionTypeSelector actionSelected={this.props.actionSelected}
                          ref="action" />
    </div>`

class ProductTypeSelector extends React.Component

  render: ->
    `<select onChange={this.props.productSelected} ref="selector">
      <option value="">商品種類を選択して下さい</option>
      <option value="stock">株式</option>
      <option value="future">先物</option>
      <option value="option">オプション</option>
      <option value="exchange">為替</option>
     </select>`

class ActionTypeSelector extends React.Component

  render: ->
    `<select form="TradeForm" onChange={this.props.actionSelected} ref="selector">
       <option value="">投資行動を選択して下さい</option>
       <option value="0">新規</option>
       <option value="1">損益確定</option>
       <option value="2">予想</option>
      </select>`

module.exports = CommonForm
