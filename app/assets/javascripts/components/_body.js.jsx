var Body = React.createClass({
  getInitialState() {
    return { items: [] }
  },

  componentDidMount() {
    $.getJSON('/users_favorite_flower_photos.json', (response) => { this.setState({ items: response }) });
  },

  render() {
    return (
      <div>
        <allitems items="{this.state.items}" />
      </div>
    )
  }
})