const localDataName = 'mateSkincase';
const orderStatusOptions = ['Pending', 'Shipped', 'Delivered'];

const fakedata = 
[
    {
      key: 1,
      id: '1518713981654',
      title: 'Ethan - Growth - Friday, January 04, 2019',
      case_number: '#CAS-5656-45LD45',
      priority: ['Normal'],
      owner: ['Indy Chabra'],
      customer: 'Carter',
      status: 'Active',
      created_on: '01/04/2019 10:41 PM',
      actions: '',
  
    },{
      key: 2,
      id: '1518713981655',
      title: 'Ethan - Growth - Friday, January 04, 2019',
      case_number: '#CAS-5656-45LD45',
      priority: ['Normal'],
      owner: ['Indy Chabra'],
      customer: 'Carter',
      status: 'Resolved',
      created_on: '08/04/2019 10:41 PM',
      actions: '',
  
    },{
      key: 3,
      id: '1518713981656',
      title: 'Ethan - Growth - Friday, January 04, 2019',
      case_number: '#CAS-5656-45LD45',
      priority: ['Normal'],
      owner: ['Indy Chabra'],
      customer: 'Carter',
      status: 'Active',
      created_on: '07/08/2019 12:41 PM',
      actions: '',
  
    },{
      key: 4,
      id: '1518713981656',
      title: 'Ethan - Growth - Friday, January 04, 2019',
      case_number: '#CAS-5656-45LD45',
      priority: ['Normal'],
      owner: ['Indy Chabra'],
      customer: 'Carter',
      status: 'Active',
      created_on: '07/08/2019 12:41 PM',
      actions: '',
  
    },{
      key: 5,
      id: '1518713981656',
      title: 'Ethan - Growth - Friday, January 04, 2019',
      case_number: '#CAS-5656-45LD45',
      priority: ['Normal'],
      owner: ['Indy Chabra'],
      customer: 'Carter',
      status: 'Active',
      created_on: '07/08/2019 12:41 PM',
      actions: '',
  
    }
  ];    

const newSkincase = {
  orderStatus: 'Pending',
  orderDate: new Date().getTime(),
  currency: '$',
  billTo: '',
  billToAddress: '',
  billFrom: '',
  billFromAddress: '',
  skincaseList: [
    {
      key: 1,
      itemName: '',
      costs: 0,
      qty: 0,
      price: 0
    }
  ],
  subTotal: 0,
  vatRate: 10,
  vatPrice: 0,
  totalCost: 0
};
const createDemoData = abc => {
  const localData = localStorage.getItem(localDataName);
  if (localData) {
    try {
      const skincases = JSON.parse(localData);
      if (skincases && skincases.length > 0) {
        return skincases;
      }
    } catch (e) {}
  }
  return fakedata;
};

export {
  fakedata,
  createDemoData,
  localDataName,
  newSkincase,
  orderStatusOptions
};




