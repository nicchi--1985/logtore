class OptionForm extends React.Component
  getTargetParams: =>
    index_code = @refs.index_code.value
    exercise_price = @refs.exercise_price.value
    year = @refs.year.value
    month = @refs.month.value
    return unless index_code and exercise_price and year and month
    {
      index_code: index_code,
      exercise_price: exercise_price,
      year: year,
      month: month
    }

  clearTargetParams: =>
    @refs.index_code.value = ""
    @refs.exercise_price.value = ""
    @refs.year.value = ""
    @refs.month.value = ""

  render: ->
    `<div>
      <label>オプション：</label>
      <div className="textFieldWP">
        <input type="text" placeholder="指数コード" ref="index_code" />
      </div>
      <div className="textFieldWP">
        <input type="text" placeholder="行使価格" ref="exercise_price" />
      </div>
      <div className="textFieldWP">
        <input type="text" placeholder="年" ref="year" />
      </div>
      <div className="textFieldWP">
        <input type="text" placeholder="月" ref="month" />
      </div>
    </div>`

module.exports = OptionForm
