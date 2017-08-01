var GvisionDescriptionsContainer = React.createClass({
  
  render() {
    var gvision_descriptions = this.props.gvision_descriptions.map((gvision_description)=> {
      return(
        <div className='row gvision-description' key={gvision_description.id}>
          <div className='col-md-8 col-md-offset-2'>
            <h5 tabIndex='0'>{gvision_description.name}</h5>
          </div>
        </div>
      )
    })
    
    return(
      <div className="gvision-descriptions">
        {gvision_descriptions}
      </div>
    )
  }
})