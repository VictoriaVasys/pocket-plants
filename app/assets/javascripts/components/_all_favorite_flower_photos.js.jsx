var AllFavoriteFlowerPhotos = React.createClass({
  render() {
    var favorite_flower_photos= this.props.favorite_flower_photos.map((favorite_flower_photo) => {
      return (
        <div className="flower_photo" key="{favorite_flower_photo.id}">
          <h3>{favorite_flower_photo.name}</h3>
          <p>{favorite_flower_photo.description}</p>
        </div>
      )
    });

    return(
      <div className="flower_photos">
        {favorite_flower_photos}
      </div>
    )
  }
})