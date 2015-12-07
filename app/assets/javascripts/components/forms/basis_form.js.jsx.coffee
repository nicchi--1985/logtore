class BasisForm extends React.Component
  constructor: (props) ->
    super props
    @bases = []

  getBasesToSubmit: =>
    refIDs = Object.keys(@refs)
    res = refIDs.map (refID) =>
      {
        basis_type: @refs[refID].refs.basis_type.value,
        text: @refs[refID].refs.basis_text.value
      }
    return res

  render: =>
    @bases = @props.bases.map (id) ->
      `<Basis key={id} ref={id} />`

    `<div>
      <h4>this is BasisForm</h4>
      {this.bases}
      <input type="button" value="+" onClick={this.props.addBasis} />
    </div>`

class Basis extends React.Component
  constructor: (props) ->
    super props

  render: ->
    `<div id={this.props.key}>
      <select ref="basis_type">
        <option value="0">テクニカル</option>
        <option value="1">ファンダメンタルズ</option>
        <option value="2">感情</option>
      </select>
      <input type="textarea" placeholder="理由" ref="basis_text"/>
     </div>`

module.exports = BasisForm
