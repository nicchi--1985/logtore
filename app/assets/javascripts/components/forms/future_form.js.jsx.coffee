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
      <input type="text" placeholder="指数コード" ref="index_code" />
      <input type="text" placeholder="年" ref="year" />
      <input type="text" placeholder="月" ref="month" />
    </div>`

module.exports = FutureForm
