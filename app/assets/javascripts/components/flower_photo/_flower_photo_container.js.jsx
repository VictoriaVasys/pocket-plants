var FlowerPhotoContainer = React.createClass({
  
  mainInfo(){
    var flower_photo = this.props.flower_photo
    
    return (
      <div className='row'>
        <div className='col-md-8 col-md-offset-2' key={flower_photo.id}>
          <img src={flower_photo.storage_url} className="flower-photo-pic-lg" alt={flower_photo.assigned_name + " Photo"} />
          <p tabIndex='0'>Photographer: {flower_photo.photographer}</p>
        </div>
      </div>
    )
  },
  
  render() {
    return(
      <div className="main-info">
        {this.mainInfo()}
      </div>
    )
  }
})