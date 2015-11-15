$ ->

  converter = new Showdown.converter()

  TradeBox = React.createClass

    loadTradesFromServer: ->
      $.ajax
        url: @props.url
        dataType: 'json'
      .done (data) =>
        @setState(data: data)
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()

    handleTradeSubmit: (trade) ->
      # ajaxしてたらラグがあるので先に描画
      trades = @state.data
      newtrades = trades.concat([trade])
      @setState(data: newtrades)

      $.ajax
        url: @props.url
        dataType: 'json'
        type: 'POST'
        data: trade: trade
      .done (data) =>
        @setState(data: data)
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()

    getInitialState: -> data: []

    componentDidMount: ->
      @loadTradesFromServer()
      setInterval @loadtradesFromServer, @props.pollInterval()

    render: ->
      `<div className='TradeBox'>
        <h1>TradeLog</h1>
        <TradeList data={this.state.data} />
        <TradeForm onTradeSubmit={this.handleTradeSubmit}/>
      </div>`

  TradeList = React.createClass
    render: ->
      tradeNodes = @props.data.map (trade) ->
        `<Trade implimentation_date={trade.implimentation_date}
                invest_type={trade.invest_type}
                action_type={trade.action_type}
                target_code={trade.target_code}
                invest_amount={trade.invest_amount}
                invest_quantity={trade.invest_quantity}
                benefit_amount={trade.ibenefit_amount}>
        </Trade>`
      `<table className='TradeList'>
        <thead>
          <tr>
            <th>取引日</th>
            <th>取引種目</th>
            <th>取引タイプ</th>
            <th>識別コード</th>
            <th>単価</th>
            <th>数量</th>
            <th>利益</th>
          </tr>
        </thead>
        <tbody>
          {tradeNodes}
        </tbody>
      </table>`

  TradeForm = React.createClass
    handleSubmit: (e) ->
      e.preventDefault()
      implimentation_date = @refs.implimentation_date.getDOMNode().value.trim()
      invest_type = @refs.invest_type.getDOMNode().value.trim()
      action_type = @refs.action_type.getDOMNode().value.trim()
      target_code = @refs.target_code.getDOMNode().value.trim()
      invest_amount = @refs.invest_amount.getDOMNode().value.trim()
      invest_quantity = @refs.invest_quantity.getDOMNode().value.trim()
      benefit_amount = @refs.benefit_amount.getDOMNode().value.trim()
      # 必須項目がない場合は、何もしない
      return unless \
              implimentation_date and
              invest_type and
              action_type

      @props.onTradeSubmit(implimentation_date: implimentation_date, \
                           invest_type: invest_type, \
                           action_type: action_type, \
                           target_code: target_code, \
                           invest_amount: invest_amount, \
                           invest_quantity: invest_quantity, \
                           benefit_amount: benefit_amount
                           )
      # フォーム初期化
      @refs.implimentation_date.getDOMNode().value = ''
      @refs.invest_type.getDOMNode().value = ''
      @refs.action_type.getDOMNode().value = ''
      @refs.target_code.getDOMNode().value = ''
      @refs.invest_amount.getDOMNode().value = ''
      @refs.invest_quantity.getDOMNode().value = ''
      @refs.benefit_amount.getDOMNode().value = ''

    render: ->
       `<form className="TradeForm" onSubmit={ this.handleSubmit }>
         <input type="text" placeholder="取引日(xxxx/xx/xx)" ref="implimentation_date" />
         <select form="TradeForm" ref="invest_type">
          <option value="0">株式</option>
          <option value="1">先物</option>
          <option value="2">オプション</option>
          <option value="3">為替</option>
          <option value="4">不動産</option>
         </select>
         <select form="TradeForm" ref="action_type">
          <option value="0">buy</option>
          <option value="1">sell</option>
          <option value="2">stay</option>
         </select>
         <input type="text" placeholder="識別コード" ref="target_code" />
         <input type="text" placeholder="単価" ref="invest_amount" />
         <input type="text" placeholder="個数" ref="invest_quantity" />
         <input type="text" placeholder="利益" ref="benefit_amount" />
         <input type="submit" value="Post" />
       </form>`

  Trade = React.createClass
    render: ->
      `<tr>
        <td>{this.props.implimentation_date.substr(0,10)}</td>
        <td>{this.props.invest_type}</td>
        <td>{this.props.action_type}</td>
        <td>{this.props.target_code}</td>
        <td>{this.props.invest_amount}</td>
        <td>{this.props.invest_quantity}</td>
        <td>{this.props.benefit_amount}</td>
       </tr>`

  React.render(
    `<TradeBox url='/api/trades' pollInterval={2000} />`,
    $('#content')[0]
  )
