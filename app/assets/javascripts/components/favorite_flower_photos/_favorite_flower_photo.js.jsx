var FavoriteFlowerPhoto = React.createClass({
  getInitialState() {
    return {
      favorite_flower_photos: [] 
    }
  },

  componentDidMount() {
    $.getJSON("/api/v1/users/" + this.props.currentUser.id + "/favorite_flower_photos.json", (response) => { 
      this.setState({ favorite_flower_photos: response }) 
    })
  },
  
  render() {
    return < FavoriteFlowerPhotos favorite_flower_photos={this.state.favorite_flower_photos} />
  }
})