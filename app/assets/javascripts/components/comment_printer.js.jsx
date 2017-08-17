var CommentPrinter = React.createClass({
	render() {
		current_user = this.props.current_user
		comment = this.props.comment
		return (
			<table>
				<td>{this.props.comment.icon_url}</td>
			</table>
		)
	}
})