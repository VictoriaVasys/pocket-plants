var FavoriteFlowerPhotos = React.createClass({
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
    var favorite_flower_photos= this.state.favorite_flower_photos.map((favorite_flower_photo) => {
      return (
        <div key={favorite_flower_photo.id} className='flower-photo'>
          <h3>{favorite_flower_photo.assigned_name}</h3>
          <h5>Plant Family: {favorite_flower_photo.plant_family}</h5>
          <img src={favorite_flower_photo.storage_url} className="flower-photo-pic" alt={favorite_flower_photo.assigned_name + " Photo"} />
          <p>Photographer: {favorite_flower_photo.photographer}</p>
        </div>
      )
    })
  
    return(
      <div className="flower-photos">
        {favorite_flower_photos}
      </div>
    )
  }
})