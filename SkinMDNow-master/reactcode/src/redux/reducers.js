import Auth from './auth/reducer';
import App from './app/reducer';
import Mails from './mail/reducer';
import Calendar from './calendar/reducer';
import Box from './box/reducer';
import Notes from './notes/reducer';
import Todos from './todos/reducer';
import Contacts from './contacts/reducer';
import Cards from './card/reducer';
import Chat from './chat/reducers';
import DynamicChartComponent from './dynamicEchart/reducer';
import Ecommerce from './ecommerce/reducer';
import ThemeSwitcher from './themeSwitcher/reducer';
import Invoices from './invoice/reducer';
import Cases from './case/reducer';
import Skincases from './skincase/reducer';
import Users from './users/reducer';
import Questionanswers from './questionanswers/reducer';
import Questions from './questions/reducer';
import QuestionsChoice from './questionChoice/reducer';
import Prescriptions from './prescriptions/reducer';
import Transactionss from './transactions/reducer';
import Pharmacy from './pharmacy/reducer';
import Complaints from './complaints/reducer';
import SkinSpinner from './spinner/reducer';
import Dermaddress from './dermaddress/reducer';
import Emailtemplate from './email-template/reducer';
import LanguageSwitcher from './languageSwitcher/reducer';
import YoutubeSearch from './youtubeSearch/reducers';
import DevReducers from '../customApp/redux/reducers';
import Articles from './articles/reducers';
import Investors from './investors/reducers';
import scrumBoard from './scrumBoard/reducer';
import drawer from './drawer/reducer';
import modal from './modal/reducer';

export default {
  Auth,
  App,
  ThemeSwitcher,
  LanguageSwitcher,
  Mails,
  Calendar,
  Box,
  Notes,
  Todos,
  Contacts,
  Cards,
  Chat,
  DynamicChartComponent,
  Ecommerce,
  Invoices,
  Cases,
  Skincases,
  Users,
  Questionanswers,
  Questions,
  QuestionsChoice,
  Emailtemplate,
  Pharmacy,
  Prescriptions,
  Transactionss,
  Complaints,
  SkinSpinner,
  Dermaddress,
  YoutubeSearch,
  Articles,
  Investors,
  scrumBoard,
  modal,
  drawer,
  ...DevReducers,
};