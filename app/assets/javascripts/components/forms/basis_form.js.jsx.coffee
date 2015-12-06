class BasisForm extends React.Component
  constructor: (props) ->
    super props

  render: ->
    bases = @props.bases.map (id) ->
      `<Basis key={id} />`

    `<div>
      <h4>this is BasisForm</h4>
      {bases}
      <input type="button" value="+" onClick={this.props.addBasis} />
      <input type="button" value="記録"/>
    </div>`

class Basis extends React.Component
  constructor: (props) ->
    super props

  render: ->
    `<div id={this.props.key}>
      <select>
        <option value="0">テクニカル</option>
        <option value="1">ファンダメンタルズ</option>
        <option value="2">感情</option>
      </select>
      <input type="textarea" placeholder="理由" />
     </div>`

module.exports = BasisForm
