class OptionForm extends React.Component
  render: ->
    `<div>
      <h4>this is OptionForm</h4>
      <select form="TradeForm" ref="action_type">
       <option value="">select action</option>
       <option value="0">新規</option>
       <option value="1">損益確定</option>
      </select>
      <input type="text" placeholder="指数コード" ref="target_code" />
      <input type="text" placeholder="行使価格" ref="target_code" />
      <input type="text" placeholder="年" ref="target_code" />
      <input type="text" placeholder="月" ref="target_code" />
      <input type="text" placeholder="単価" ref="invest_amount" />
      <input type="text" placeholder="数量" ref="invest_quantity" />
      <input type="text" placeholder="利益" ref="benefit_amount" />
    </div>`

module.exports = OptionForm
