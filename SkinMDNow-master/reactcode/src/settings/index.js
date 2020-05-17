export default {
  apiUrl: 'http://34.235.116.137:8080/public/api/'
  /* apiUrl: 'http://192.168.10.26/SkinMDNow/server/public/api/', */
};
const siteConfig = {
  siteName: 'SkinMDNow',
  siteIcon: 'ion-flash',
  footerText: 'SkinMDNow ©2019 Created by TechExtensor'
};

const themeConfig = {
  topbar: 'themedefault',
  sidebar: 'themedefault',
  layout: 'themedefault',
  theme: 'themedefault'
};
const language = 'english';
const AlgoliaSearchConfig = {
  appId: '',
  apiKey: ''
};
const Auth0Config = {
  domain: '',
  clientID: '',
  allowedConnections: ['Username-Password-Authentication'],
  rememberLastLogin: true,
  language: 'en',
  closable: true,
  options: {
    auth: {
      autoParseHash: true,
      redirect: true,
      redirectUrl: 'http://localhost:3000/auth0loginCallback'
    },
    languageDictionary: {
      title: 'Isomorphic',
      emailInputPlaceholder: 'demo@gmail.com',
      passwordInputPlaceholder: '123456'
    },
    theme: {
      labeledSubmitButton: true,
      logo: '',
      primaryColor: '#E14615',
      authButtons: {
        connectionName: {
          displayName: 'Log In',
          primaryColor: '#b7b7b7',
          foregroundColor: '#000000'
        }
      }
    }
  }
};
const firebaseConfig = {
  apiKey: '',
  authDomain: '',
  databaseURL: '',
  projectId: '',
  storageBucket: '',
  messagingSenderId: ''
};
const googleConfig = {
  apiKey: '' //
};
const mapboxConfig = {
  tileLayer: '',
  maxZoom: '',
  defaultZoom: '',
  center: []
};
const youtubeSearchApi = '';

const jwtConfig = {
  fetchUrl: 'https://skinmdnow.nuvolatek.net/server/public/api/',
  /*fetchUrl: 'http://127.0.0.1:8000/server/public/api/',*/
  secretKey: 'secretKey',
};

export {
  siteConfig,
  themeConfig,
  language,
  AlgoliaSearchConfig,
  Auth0Config,
  firebaseConfig,
  googleConfig,
  mapboxConfig,
  youtubeSearchApi,
  jwtConfig
};