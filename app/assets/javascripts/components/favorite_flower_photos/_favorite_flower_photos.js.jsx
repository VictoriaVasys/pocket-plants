var FavoriteFlowerPhotos = React.createClass({
  getInitialState() {
    return {
      currentUser: this.props.current_user,
      favorite_flower_photos: [] 
    }
  },

  componentDidMount() {
    $.getJSON("/api/v1/users/" + this.state.currentUser.id + "/favorite_flower_photos.json", (response) => { 
      this.setState({ favorite_flower_photos: response }) 
    })
  },
  
  render() {
    return (
      <FavoriteFlowerPhotosContainer favorite_flower_photos={this.state.favorite_flower_photos} />
    )
  }
})