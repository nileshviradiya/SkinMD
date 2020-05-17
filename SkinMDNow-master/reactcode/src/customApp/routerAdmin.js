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
    path: 'pendingcase',
    component: asyncComponent(() => import('./containers/MyPendingcase'))
  },
  {
    path: 'pendingcase/:skincaseId',
    component: asyncComponent(() => import('../containers/Skincases/singleSkincase')),
  }, 
  {
    path: 'case-activities',
    component: asyncComponent(() => import('./containers/Caseactivities/')),
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
    path: 'users',
    component: asyncComponent(() => import('./containers/Users'))
  },
  {
    path: 'users/:userid',
    component: asyncComponent(() => import('./containers/Users/viewuser'))
  },
  {
    path: 'adduser',
    component: asyncComponent(() => import('./containers/Users/adduser'))
  },  
  {
    path: 'users/:userid/add-referrals',
    component: asyncComponent(() => import('./containers/ReferralCode/addreferrals'))
  },
  {
    path: 'users/:userid/referrals/:pid',
    component: asyncComponent(() => import('./containers/ReferralCode/view-referrals'))
  },
  {
    path: 'derm-address/:userid',
    component: asyncComponent(() => import('./containers/Dermaddress'))
  },
  {
    path: 'derm-address/view/:userid/:dermid',
    component: asyncComponent(() => import('./containers/Dermaddress/view'))
  },
  {
    path: 'derm-address/:userid/add',
    component: asyncComponent(() => import('./containers/Dermaddress/add'))
  },
  {
    path: 'prescription',
    component: asyncComponent(() => import('./containers/Prescriptions'))
  },
  {
    path: 'addrx',
    component: asyncComponent(() => import('./containers/Prescriptions/addrx'))
  },
  {
    path: 'prescription/:pid',
    component: asyncComponent(() => import('./containers/Prescriptions/viewrx'))
  },
  {
    path: 'pharmacy',
    component: asyncComponent(() => import('./containers/Pharmacies'))
  },
  {
    path: 'addpharmacy',
    component: asyncComponent(() => import('./containers/Pharmacies/addpharmacy'))
  },
  {
    path: 'pharmacy/:pid',
    component: asyncComponent(() => import('./containers/Pharmacies/viewpharmacy'))
  },
  {
    path: 'activity',
    component: asyncComponent(() => import('./containers/Activities'))
  },
  {
    path: 'chief-complaints',
    component: asyncComponent(() => import('./containers/Complaints'))
  },
  {
    path: 'addcomplaints',
    component: asyncComponent(() => import('./containers/Complaints/addcomplaints'))
  },
  {
    path: 'chief-complaints/:pid',
    component: asyncComponent(() => import('./containers/Complaints/viewcomplaints'))
  },
  {
    path: 'questions-answer-template',
    component: asyncComponent(() => import('./containers/QuestionsAnswersTemp'))
  },
  {
    path: 'addquestionanswer',
    component: asyncComponent(() => import('./containers/QuestionsAnswersTemp/addquesanstemp'))
  },
  {
    path: 'questions-answer-template/:pid',
    component: asyncComponent(() => import('./containers/QuestionsAnswersTemp/viewquesanstemp'))
  },
  {
    path: 'questions',
    component: asyncComponent(() => import('./containers/Questions'))
  },
  {
    path: 'addquestion',
    component: asyncComponent(() => import('./containers/Questions/addquestion'))
  },
  {
    path: 'questions/:pid',
    component: asyncComponent(() => import('./containers/Questions/viewquestion'))
  },
  {
    path: 'questions-choice',
    component: asyncComponent(() => import('./containers/QuestionsChoice'))
  },
  {
    path: 'addquestion-choice',
    component: asyncComponent(() => import('./containers/QuestionsChoice/addquestion-choice'))
  },
  {
    path: 'questions-choice/:pid',
    component: asyncComponent(() => import('./containers/QuestionsChoice/viewquestion-choice'))
  },
  {
    path: 'discounts',
    component: asyncComponent(() => import('./containers/Discounts'))
  },
  {
    path: 'add-discountlist',
    component: asyncComponent(() => import('./containers/Discounts/add-discountlist'))
  },
  {
    path: 'discounts/:pid',
    component: asyncComponent(() => import('./containers/Discounts/view-discountlist'))
  },
  {
    path: 'discounts/:pid/add-discount',
    component: asyncComponent(() => import('./containers/Discounts/add-discount'))
  },
  {
    path: 'discounts/:pid/viewdiscount/:pid',
    component: asyncComponent(() => import('./containers/Discounts/view-discount'))
  },
  {
    path: 'referrals',
    component: asyncComponent(() => import('./containers/ReferralCode'))
  },
  {
    path: 'addreferrals',
    component: asyncComponent(() => import('./containers/ReferralCode/addreferrals'))
  },
  {
    path: 'referrals/:pid',
    component: asyncComponent(() => import('./containers/ReferralCode/view-referrals'))
  },
  {
    path: 'email-template',
    component: asyncComponent(() => import('./containers/EmailTemplates'))
  },
  {
    path: 'add-template',
    component: asyncComponent(() => import('./containers/EmailTemplates/add-template'))
  },
  {
    path: 'email-template/:pid',
    component: asyncComponent(() => import('./containers/EmailTemplates/view-template'))
  },
  {
    path: 'transaction',
    component: asyncComponent(() => import('./containers/Transactions'))
  },
  {
    path: 'transaction/:tid',
    component: asyncComponent(() => import('./containers/Transactions/view-transaction'))
  },
];
export default routes;