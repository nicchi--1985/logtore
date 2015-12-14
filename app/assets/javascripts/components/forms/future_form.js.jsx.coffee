class FutureForm extends React.Component
  getTargetParams: =>
    index_code = @refs.index_code.value
    year = @refs.year.value
    month = @refs.month.value
    return unless index_code and year and month
    {
      index_code: index_code,
      year: year,
      month: month
    }

  clearTargetParams: =>
    @refs.index_code.value = ""
    @refs.year.value = ""
    @refs.month.value = ""

  render: ->
    `<div>
      <h4>this is FutureForm</h4>
      <select form="TradeForm" ref="action_type">
       <option value="">select action</option>
       <option value="0">新規</option>
       <option value="1">損益確定</option>
       <option value="2">予想</option>
      </select>
      <input type="text" placeholder="指数コード" ref="index_code" />
      <input type="text" placeholder="年" ref="year" />
      <input type="text" placeholder="月" ref="month" />
      <input type="text" placeholder="単価(円)" ref="invest_amount" />
      <input type="text" placeholder="数量(株)" ref="invest_quantity" />
      <input type="text" placeholder="利益(円)" ref="benefit_amount" />
      <input type="text" placeholder="騰落率(%)" ref="benefit_amount" />
      <input type="text" placeholder="利益率(%)" ref="benefit_amount" />
    </div>`

module.exports = FutureForm
