window.FormDetail = React.createClass
  render: ->
    console.log "renderType is " + @props.renderType
    if @props.renderType is "0"
      return `<div>
              <select form="TradeForm" ref="action_type">
               <option value="">select action</option>
               <option value="0">buy</option>
               <option value="1">sell</option>
              </select>
              <input type="text" placeholder="銘柄コード" ref="target_code" />
              <input type="text" placeholder="単価" ref="invest_amount" />
              <input type="text" placeholder="数量" ref="invest_quantity" />
              <input type="text" placeholder="利益" ref="benefit_amount" />
              <input type="textarea" placeholder="理由" />
              <input type="submit" value="Post" /></div>`

    if @props.renderType is "1"
      return `<div>
              <select form="TradeForm" ref="action_type">
               <option value="">select action</option>
               <option value="0">buy</option>
               <option value="1">sell</option>
              </select>
              <input type="text" placeholder="指数コード" ref="target_code" />
              <input type="text" placeholder="年" ref="target_code" />
              <input type="text" placeholder="月" ref="target_code" />
              <input type="text" placeholder="単価" ref="invest_amount" />
              <input type="text" placeholder="数量" ref="invest_quantity" />
              <input type="text" placeholder="利益" ref="benefit_amount" />
              <input type="textarea" placeholder="理由" />
              <input type="submit" value="Post" /></div>`

    if @props.renderType is "2"
      return `<div>
              <select form="TradeForm" ref="action_type">
               <option value="">select action</option>
               <option value="0">buy</option>
               <option value="1">sell</option>
              </select>
              <input type="text" placeholder="指数コード" ref="target_code" />
              <input type="text" placeholder="行使価格" ref="target_code" />
              <input type="text" placeholder="年" ref="target_code" />
              <input type="text" placeholder="月" ref="target_code" />
              <input type="text" placeholder="単価" ref="invest_amount" />
              <input type="text" placeholder="数量" ref="invest_quantity" />
              <input type="text" placeholder="利益" ref="benefit_amount" />
              <input type="textarea" placeholder="理由" />
              <input type="submit" value="Post" /></div>`

    if @props.renderType is "3"
      return `<div>
              <select form="TradeForm" ref="action_type">
               <option value="">select action</option>
               <option value="0">buy</option>
               <option value="1">sell</option>
              </select>
              <input type="text" placeholder="ベース通貨" ref="target_code" />
              <input type="text" placeholder="相手通貨" ref="target_code" />
              <input type="text" placeholder="単価" ref="invest_amount" />
              <input type="text" placeholder="数量" ref="invest_quantity" />
              <input type="text" placeholder="利益" ref="benefit_amount" />
              <input type="textarea" placeholder="理由" />
              <input type="submit" value="Post" /></div>`

    else
      `<div>no thing selected</div>`
