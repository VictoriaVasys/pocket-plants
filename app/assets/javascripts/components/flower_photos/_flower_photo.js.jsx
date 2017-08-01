var FlowerPhotosContainer = React.createClass({
  getInitialState() {
    return {
      flower_photos: [] 
    }
  },

  componentDidMount() {
    $.getJSON("/api/v1/flower_photos.json", (response) => { 
      this.setState({ flower_photos: response }) 
    })
  },
  
  render() {
    return (
      < FlowerPhotos flower_photos={this.state.flower_photos} />
    )
  }
})