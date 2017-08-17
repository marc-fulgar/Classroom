const divStyle = {
	padding: '10px'
};

var CommentPrinter = React.createClass({
	render() {
		current_user = this.props.current_user
		comment = this.props.comment
		return (
			<div className="col-md-3">
				<table>
					<td><img src={icon_url} /></td>
					<td style={divStyle}>
						<a href={"/users/" + user.id }>{user.first_name} {user.last_name}</a><br />
					</td>
				</table>
			</div>
		)
	}
})