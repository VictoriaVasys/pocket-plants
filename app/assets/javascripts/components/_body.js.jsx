var Body = React.createClass({
  getInitialState() {
    return {
      currentUser: this.props.current_user
    }
  },
  
  render() {
    return (
      <div>
        <FavoriteFlowerPhotos currentUser="{this.state.currentUser}"/>
      </div>
    )
  }
})