var FlowerPhotos = React.createClass({
  
  render() {
    var flower_photos= this.props.flower_photos.map((flower_photo) => {
      return (
        <div key={flower_photo.id} className='flower-photo' tabIndex='0'>
          <h3>{flower_photo.assigned_name}</h3>
          <h5>{flower_photo.plant_family}</h5>
          <img src={flower_photo.storage_url} className="flower-photo-pic" alt={flower_photo.assigned_name + " Photo"} />
          <p>Photographer: {flower_photo.photographer}</p>
        </div>
      )
    })
  
    return(
      <div className="container">
        <h1>All Flower Photos</h1>
        <div className="flower-photos">
          {flower_photos}
        </div>
      </div>
    )
  }
})