window.SelectInvestType = React.createClass
  render: ->
    `<select onChange={this.props.onChange}>
        <option value="">select invest target.</option>
        <option value="0">株式</option>
        <option value="1">先物</option>
        <option value="2">オプション</option>
        <option value="3">為替</option>
    </select>`
