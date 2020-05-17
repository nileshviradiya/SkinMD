import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import moment from 'moment';
import Box from '../../components/utility/box';
import SingleContactView from '../../components/contacts/singleView';
import PageHeader from "../../components/utility/pageHeader";
import { ViewTable } from '../../components/skincase/skincaseTable';
import Button from '../../components/uielements/button';
import LayoutWrapper from '../../components/utility/layoutWrapper.js';
import SkincaseAddress from '../../components/skincase/address';
import InvoicePageWrapper from './singleSkincase.style';
import { Typography, Row,Form,Col,Input,Icon,Checkbox} from 'antd';


const formItemLayout = {
  labelCol: { span: 4 },
  wrapperCol: { span: 8 },
};
const { Title } = Typography;

export default class extends Component {
  render() {
    const { currentSkincase, toggleView, redirectPath } = this.props;
    const otherAttributes = [
      { title: 'Patient', value: 'mobile', type: 'phoneNumber' },
      { title: 'DOB(mm/dd/yyyy)', value: 'dob', type: 'phoneNumber' },
      { title: 'Consult Entered on', value: 'company', type: 'company' },
      { title: 'Best Phone#', value: 'work', type: 'phoneNumber' },
      { title: 'Email', value: 'email', type: 'company' }
    ];

    const otherAttributesRight = [
      { title: 'Credit Card#', value: 'card', type: 'phoneNumber' },
      { title: 'Auth. Code', value: 'authcode', type: 'phoneNumber' },
      { title: 'Paid On', value: 'paidon', type: 'company' },
    ];

    const drugAttributes = [
      {title: 'Drug Allergies', value: 'drugs',class: 'colorRed'},
      {title: 'Patient Medical History', value: 'patientMedHist'},
      {title: 'Family Medical History', value: 'FamilyMedHist'},
      {title: 'Current Meds', value: 'curMed'},
    ];
    const chiefAttributes = [
      {title: 'Chief Compaint', value: 'chief'},
      {title: 'Affected Areas Selected on Body Map', value: 'selectedArea'},      
    ]
    const pragAttributes = [
      {title: 'Is the patient pregnant, trying to become pregnant, or nursing?', value: 'pragnent'},
    ]
    const styleClass={ "class": "hide", "textLabelClass": "minWidth" }    
    const selectedContact = {
          "id": 22143,
          "avatar": "",
          "firstName": "Benjamin",
          "lastName": "Jacobi",
          "email": "cartermenthorn@gmail.com",
          "dob": "11/25/2009 Male",
          "name": "",
          "mobile": "Menthorn, Carter Michael",
          "home": "(136) 403-0476 x8388",
          "company": "08/12/2018 by Manthorne, Carter Michael(Self)",
          "work": "7215487888",
          "card": "XXXX6116",
          "authcode": "01138",
          "paidon": "2/13/2019 10:13:58 PM",
          "drugs": "none",
          "patientMedHist": "none",
          "FamilyMedHist": "none",
          "curMed": "none",
          "chief": "Acne",
          "selectedArea": "L posterior shoulder, L shoulder, R posterior shoulder, R shoulder, Upper back",
          "pragnent": "No"
        }
    return (
      <LayoutWrapper>  
        <Box>
          <InvoicePageWrapper className="InvoicePageWrapper">
            <div className="PageHeader">
              <Link to={redirectPath}>
                <Button className="isoGoInvoBtn" icon="rollback">
                  <span>Go To Case List</span>
                </Button>
              </Link>
              <Button color="secondary" icon="edit" onClick={() => toggleView(true)}>
                <span>Save Case</span>
              </Button>
              <Button type="primary" icon="check-circle" className="isoInvoPrint">
                <span>Resolve Case</span>
              </Button>
              <Button type="danger" icon="close-circle" className="isoInvoPrint">
                <span>Cancel Case</span>
              </Button>
            </div>

            <div className="PageContent">
                <div className="OrderInfo noBotpadding">
                  <div className="LeftSideContent">
                    <span className="InvoiceNumber">My Pending Case</span>
                    <h3 className="Title">{currentSkincase.number}</h3>                  
                  </div>
                  <div className="RightSideContent">
                    <p>
                      <span className="orderStatusSpan">Case Status: </span>
                      <span className="orderStatus">
                        {currentSkincase.orderStatus}
                      </span>
                    </p>
                  </div>
                </div>
                <div>
                  <h3 className="Title"></h3>                  
                </div>
            </div>
            <PageHeader className="marginTop">Overview</PageHeader>
            <div className="overview">
              <Col span={24} key={1}>
                <Form.Item {...formItemLayout} label="Case#">                
                  {(<Input placeholder="" disabled="true" value="CAS-454DF-45D4-893SD"/>)}
                </Form.Item>
              </Col>
              <Col span={24} key={2}>
                  <Form.Item {...formItemLayout} label="Consult Cost" className="unsetClear">                
                  {(<Input placeholder="Consult Cost" defaultValue="$30.65"/>)}
                  </Form.Item>                  
                  <Form.Item {...formItemLayout} label="Referral Code"  className="unsetClear">                
                  {(<Input placeholder="Referral Code"/>)}
                  </Form.Item>
              </Col>
            </div>
            <PageHeader>Patient Information</PageHeader>
            <Col span={24} key={6} className="caseViewGap">
              <Col span={12} key={5}>
                <SingleContactView
                  contact={selectedContact}
                  otherAttributes={otherAttributes}
                  others={styleClass}
                />
              </Col>
              <Col span={12} key={7}>
                <SingleContactView
                  contact={selectedContact}
                  otherAttributes={otherAttributesRight}
                  others={styleClass}
                />
              </Col>
            </Col>
            <Col span={24} key={11}  className="caseViewGap">
                <SingleContactView
                  contact={selectedContact}
                  otherAttributes={pragAttributes}
                  others={styleClass}
                />
            </Col>
            <Col span={24} key={8}  className="caseViewGap">
                <Col span={12} key={10}>
                  <SingleContactView
                    contact={selectedContact}
                    otherAttributes={drugAttributes}
                    others={styleClass}
                  />
                </Col>
                <Col span={12} key={9}>
                  <SingleContactView
                    contact={selectedContact}
                    otherAttributes={chiefAttributes}
                    others={styleClass}
                  />
                </Col>
            </Col>            
            <Col span={24} key={11}  className="caseViewGap">
                <Title level={3}>h3. Ant Design</Title>
            </Col>
              <div className="InvoiceTable">
                <ViewTable skincaseList={currentSkincase.skincaseList} />
              </div>
          </InvoicePageWrapper>
        </Box>
      </LayoutWrapper>
    );
  }
}
