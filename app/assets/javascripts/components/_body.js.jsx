var FavoriteFlowerPhotosBody = React.createClass({
  getInitialState() {
    return {
      currentUser: this.props.current_user
    }
  },
  
  render() {
    return (
      <div>
        <FavoriteFlowerPhoto currentUser="{this.state.currentUser}"/>
      </div>
    )
  }
})