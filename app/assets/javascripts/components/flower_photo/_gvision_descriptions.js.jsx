var GvisionDescriptions = React.createClass({
  getInitialState() {
    return {
      gvision_descriptions: []
    }
  },

  componentDidMount() {
    $.getJSON("/api/v1/users/flower_photos/" + this.props.id + "/gvision_descriptions.json", (response) => { 
      this.setState({ gvision_descriptions: response }) 
    })
  },
  
  render() {
    return (<GvisionDescriptionsContainer 
      gvision_descriptions={this.state.gvision_descriptions} />
    )
  }
})