class CommonForm extends React.Component
  constructor: (props) ->
    super props

  clearForm: ->
    @refs.implimentation_date.value = ""
    @refs.product.refs.selector.value = ""
    @refs.action.refs.selector.value = ""

  render: ->
    `<div>
      <div className="datePickerWP">
      <label>取引日：</label>
      <DatePicker selected={this.props.startDate}
                   onChange={this.props.changeStartDate}
                   dateFormat="YYYY/MM/DD"
                   placeholderText="select trade date"
                   ref="implimentation_date"
                   className="datePicker" />
      </div>
      <ProductTypeSelector productSelected={this.props.productSelected}
                           ref="product" />
      <ActionTypeSelector actionSelected={this.props.actionSelected}
                          ref="action" />
    </div>`

class ProductTypeSelector extends React.Component

  render: ->
    `<div className="productSelectorWP">
    <label>商品種類：</label>
    <select className="productSelector"
             onChange={this.props.productSelected}
             ref="selector">
      <option value="">商品種類を選択して下さい</option>
      <option value="stock">株式</option>
      <option value="future">先物</option>
      <option value="option">オプション</option>
      <option value="exchange">為替</option>
     </select>
     </div>`

class ActionTypeSelector extends React.Component

  render: ->
    `<div className="actionSelectorWP">
    <label>アクションタイプ：</label>
    <select className="actionSelector"
             onChange={this.props.actionSelected}
             ref="selector">
       <option value="">アクションタイプを選択して下さい</option>
       <option value="0">新規</option>
       <option value="1">損益確定</option>
       <option value="2">予想</option>
      </select>
      </div>`

module.exports = CommonForm
