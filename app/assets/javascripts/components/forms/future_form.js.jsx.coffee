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
      <label>先物：</label>
      <div className="textFieldWP">
        <input type="text" placeholder="指数コード" ref="index_code" />
      </div>
      <div className="textFieldWP">
        <input type="text" placeholder="年" ref="year" />
      </div>
      <div className="textFieldWP">
        <input type="text" placeholder="月" ref="month" />
      </div>
    </div>`

module.exports = FutureForm
