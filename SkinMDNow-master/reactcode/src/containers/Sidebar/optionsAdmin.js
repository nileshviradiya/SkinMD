import getDevSidebar from '../../customApp/sidebar';
const options = [
  {
    key: 'skincase',
    label: 'sidebar.skincase',
    leftIcon: 'ion-clipboard',
  }
  ,
  { 
    key: 'pendingcase',
    label: 'sidebar.pendingcase',
    leftIcon: 'ion-document'
  },
  ...getDevSidebar,
];
export default options;