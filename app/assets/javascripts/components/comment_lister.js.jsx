var CommentLister = React.createClass({
	render() {
		current_user = this.props.current_user
		return(
			<div>
	      {this.props.posts.map(function(comment, i){
	        return <CommentPrinter key={i} comment={comment} current_user = {current_user}/>
	      })}
			</div>
		)
	}
})