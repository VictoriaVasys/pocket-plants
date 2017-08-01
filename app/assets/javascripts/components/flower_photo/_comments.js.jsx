var Comments = React.createClass({
  getInitialState() {
    return {
      comments: []
    }
  },

  componentDidMount() {
    $.getJSON("/api/v1/users/flower_photos/" + this.props.id + "/comments.json", (response) => { 
      this.setState({ comments: response }) 
    })
  },
  
  render() {
    return (<CommentsContainer
      comments={this.state.comments} />
    )
  }
})