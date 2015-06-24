/* globals React */
'use strict';
var Navigation = React.createClass({
  render: function () {
    return (
      <nav>
        <NavLink name='Home' url='/' />
        <NavLink name='Sign Up' url='/users/new' />
        <NavLink name='Log In' url='/login' />
        <NavLink name='Log Out' url='/logout' />
        <NavLink name='All Cheeses' url='/cheeses' />
        <NavLink name='New Cheese' url='/cheeses/new' />
      </nav>
    );
  }
});

var NavLink = React.createClass({
  render: function () {
    return (<a onClick={this.clicked} className='btn btn-default'>{this.props.name}</a>);
  },
  clicked: function () {
    window.location.href = this.props.url;
  }
});
