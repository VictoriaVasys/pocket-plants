var FlowerPhoto = React.createClass({
  getInitialState() {
    return {
      flower_photo: {},
      current_user: this.props.current_user
    }
  },

  componentDidMount(){
    $.getJSON("/api/v1/users/flower_photos/" + this.props.id + ".json", (response) => { 
      this.setState({ flower_photo: response }) 
    })
  },
  
  render() {
    return (<FlowerPhotoContainer 
      flower_photo={this.state.flower_photo} />
    )
  }
})