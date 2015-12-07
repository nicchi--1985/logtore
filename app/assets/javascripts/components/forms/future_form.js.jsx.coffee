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

  render: ->
    `<div>
      <h4>this is FutureForm</h4>
      <select form="TradeForm" ref="action_type">
       <option value="">select action</option>
       <option value="0">新規</option>
       <option value="1">損益確定</option>
      </select>
      <input type="text" placeholder="指数コード" ref="index_code" />
      <input type="text" placeholder="年" ref="year" />
      <input type="text" placeholder="月" ref="month" />
      <input type="text" placeholder="単価" ref="invest_amount" />
      <input type="text" placeholder="数量" ref="invest_quantity" />
      <input type="text" placeholder="利益" ref="benefit_amount" />
    </div>`

module.exports = FutureForm
