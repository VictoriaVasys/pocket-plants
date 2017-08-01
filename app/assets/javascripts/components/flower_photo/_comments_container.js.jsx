var CommentsContainer = React.createClass({
  
  render() {
      var comments = this.props.comments.map((comment)=> {
        return(
          <div className='row comment' key={comment.id}>
            <div className='col-md-8 col-md-offset-2 main-info'>
              <p tabIndex='0'>{comment.body}</p>
              <h5 tabIndex='0'>{'-' + comment.author}</h5>
            </div>
          </div>
        )
      })

    return(
      <div className="comments">
        {comments}
      </div>
    )
  }
})