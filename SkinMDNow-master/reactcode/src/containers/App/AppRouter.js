import React, { Component } from 'react';
import { Route } from 'react-router-dom';
import asyncComponent from '../../helpers/AsyncFunc';
import customRoutesAdmin from '../../customApp/routerAdmin';
import customRoutesDoctor from '../../customApp/routerDoctor';
import { connect } from 'react-redux';

class AppRouter extends Component {
  routesAdmin = [
    {
      path: '',
      component: asyncComponent(() => import('../Skincases')),
    },
    ...customRoutesAdmin,
  ];

  routesDoctor = [
    {
      path: '',
      component: asyncComponent(() => import('../Skincases')),
    },
    ...customRoutesDoctor,
  ];
  render() {
    const { url, style, Auth } = this.props;
    const routes = (Auth.userType == 2)? this.routesDoctor : this.routesAdmin;
    return (
      <div style={style}>
        {routes.map(singleRoute => {
          const { path, exact, ...otherProps } = singleRoute;
          return (
            <Route
              exact={exact === false ? false : true}
              key={singleRoute.path}
              path={`${url}/${singleRoute.path}`}
              {...otherProps}
            />
          );
        })}
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    ...state,
  };
}
export default connect(
  mapStateToProps,
)(AppRouter);