const localDataName = 'mateCase';
const orderStatusOptions = ['Pending', 'Shipped', 'Delivered'];

const fakedata = [
  {
    key: 1,
    id: '151871398165412',
    number: 'Ethan - Growth - Friday, January 04, 2019',
    orderStatus: 'Shipped',
    orderDate: 1518849188360,
    currency: '$',
    billTo: 'Normal',
    billToAddress:
      'redq@company.com\n\n405 Mulberry Rd, Mc Grady, \nNC, 28649 \n\nFax: +0(863) 228-7064 \nPhone: +(740) 927-9284',
    billFrom: 'CAS-04399-C1L3D6',
    billFromAddress:
      'pineapple@company.com\n\n86781 547th Ave, Osmond, \nNE, 68765 \n\nPhone: +(402) 748-3970',
    caseList: [
      {
        key: 1,
        itemName: 'A box of happiness',
        costs: 200,
        qty: 14,
        price: 2800
      },
      { key: 2, itemName: 'Unicorn Tears', costs: 500, qty: 14, price: 7000 },
      { key: 3, itemName: 'Rainbow Machine', costs: 700, qty: 5, price: 3500 }
    ],
    subTotal: 13300,
    vatRate: 'Carter',
    vatPrice: 'Indy Chabra',
    totalCost: '1/4/2019 10:41 PM'
  },
  {
    key: 2,
    id: '151871398165512',
    number: 'Carter - Acne - Friday, October 26, 2018',
    orderStatus: 'Pending',
    orderDate: 1518849188360,
    currency: '$',
    billTo: 'Normal',
    billToAddress:
      'redq@company.com\n\n405 Mulberry Rd, Mc Grady, \nNC, 28649 \n\nFax: +0(863) 228-7064 \nPhone: +(740) 927-9284',
    billFrom: 'CAS-09647-Z1L3D8',
    billFromAddress:
      'pineapple@company.com\n\n86781 547th Ave, Osmond, \nNE, 68765 \n\nPhone: +(402) 748-3970',
    caseList: [
      {
        key: 1,
        itemName: 'A box of happiness',
        costs: 200,
        qty: 14,
        price: 2800
      },
      { key: 2, itemName: 'Unicorn Tears', costs: 500, qty: 14, price: 7000 },
      { key: 3, itemName: 'Rainbow Machine', costs: 700, qty: 5, price: 3500 }
    ],
    subTotal: 13300,
    vatRate: 'Erica',
    vatPrice: 'Indy Chabra',
    totalCost: '1/4/2019 10:41 PM'
  },
  {
    key: 3,
    id: '151871398165612',
    number: 'Brenden - Acne - Thursday, October 11, 2018',
    orderStatus: 'Delivered',
    orderDate: 1518849188360,
    currency: '$',
    billTo: 'Normal',
    billToAddress:
      'redq@company.com\n\n405 Mulberry Rd, Mc Grady, \nNC, 28649 \n\nFax: +0(863) 228-7064 \nPhone: +(740) 927-9284',
    billFrom: 'CAS-98745-C1L9G36',
    billFromAddress:
      'pineapple@company.com\n\n86781 547th Ave, Osmond, \nNE, 68765 \n\nPhone: +(402) 748-3970',
    caseList: [
      {
        key: 1,
        itemName: 'A box of happiness',
        costs: 200,
        qty: 14,
        price: 2800
      },
      { key: 2, itemName: 'Unicorn Tears', costs: 500, qty: 14, price: 7000 },
      { key: 3, itemName: 'Rainbow Machine', costs: 700, qty: 5, price: 3500 }
    ],
    subTotal: 13300,
    vatRate: 'Tom',
    vatPrice: 'Indy Chabra',
    totalCost: '1/4/2019 10:41 PM'
  }
];
const newCase = {
  orderStatus: 'Pending',
  orderDate: new Date().getTime(),
  currency: '$',
  billTo: '',
  billToAddress: '',
  billFrom: '',
  billFromAddress: '',
  caseList: [
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
const createDemoData = () => {
  const localData = localStorage.getItem(localDataName);
  if (localData) {
    try {
      const cases = JSON.parse(localData);
      if (cases && cases.length > 0) {
        return cases;
      }
    } catch (e) {}
  }
  return fakedata;
};

export {
  fakedata,
  createDemoData,
  localDataName,
  newCase,
  orderStatusOptions
};
