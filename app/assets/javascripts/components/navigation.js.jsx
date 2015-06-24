/* globals React */
'use strict';
var Navigation = React.createClass({
    render: function () {
        if (this.props.logged_in) {
            return (<LoggedIn />);
        } else {
            return (<LoggedOut />);
        }
    }
});
