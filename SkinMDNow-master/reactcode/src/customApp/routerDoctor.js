import asyncComponent from '../helpers/AsyncFunc';

const routes = [
  {
    path: 'skincase',
    component: asyncComponent(() => import('../containers/Skincases')),
  },  
  {
    path: 'skincase/:skincaseId',
    component: asyncComponent(() => import('../containers/Skincases/singleSkincase')),
  },  
  {
    path: 'skincase/:skincaseId/addrx',
    component: asyncComponent(() => import('./containers/Prescriptions/addrx'))
  },  
  {
    path: 'skincase/:skincaseId/viewrx/:pid',
    component: asyncComponent(() => import('./containers/Prescriptions/viewrx'))
  },  
  {
    path: 'pendingcase/:skincaseId',
    component: asyncComponent(() => import('../containers/Skincases/singleSkincase')),
  }, 
  {
    path: 'pendingcase/:skincaseId/addrx',
    component: asyncComponent(() => import('./containers/Prescriptions/addrx'))
  },
  {
    path: 'pendingcase/:skincaseId/viewrx/:pid',
    component: asyncComponent(() => import('./containers/Prescriptions/viewrx'))
  },
  {
    path: 'pendingcase',
    component: asyncComponent(() => import('./containers/MyPendingcase'))
  },
];
export default routes;