import React, { Component } from 'react';
import { connect } from 'react-redux';
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
import { Upload, Modal, Typography,Table, Row,Col,Input,Icon,Checkbox} from 'antd';
import Form from '../../components/uielements/form';
import skincaseActions from '../../redux/skincase/actions';
import Prescriptions from '../../customApp/containers/Prescriptions';
import Caseactivities from '../../customApp/containers/Caseactivities';
import { jwtConfig } from '../../settings';


const { TextArea } = Input;
const FormItem = Form.Item;

const formItemLayout = {
  labelCol: { span: 4 },
  wrapperCol: { span: 8 },
};
const { Title } = Typography;
const columnsPres = [{
  title: 'Prescription',
  dataIndex: 'name',
}, {
  title: 'PharmacyRx',
  dataIndex: 'rx',
}, {
  title: 'Pharmacy Fax',
  dataIndex: 'fax',
}, {
  title: 'Created On',
  dataIndex: 'createdOn',
}];

const dataPres = [];
for (let i = 0; i < 46; i++) {
  dataPres.push({
    key: i,
    name: `Leeds NorthSide Pharmacy ${i}`,
    age: ` Pharmacy Rx ${i}`,
    rx: `Leeds NorthSide Pharmacy ${i}`,
    fax: `715489567${i}`,
    createdOn: `02/02/2019 ${i}:15`,
  });
}

class ViewEditCases extends Component {
  state = {
    selectedRowKeys: [], // Check here to configure the default column
    previewVisible: false,
    previewImage: '',
    fileList: [],
  };

  constructor(props) {
    super(props);
    localStorage.setItem("case_editcount", 0);
  }

  componentWillMount(){
    const { editCase, caseId, SingleCasesDetails} = this.props;    
    // API call
    editCase(caseId);// Load case details here
  }
    
  componentDidUpdate(){
    const { SingleCasesDetails} = this.props;
    console.log('hello there');
    console.log(SingleCasesDetails);
    const { fileList } = this.state;    
    if(SingleCasesDetails != undefined && SingleCasesDetails.length>0){
      if(SingleCasesDetails.getCasePhotos != undefined){      
        let count = parseInt(localStorage.getItem("case_editcount"));
        //alert(count);
        localStorage.setItem("case_editcount", count + 1);
        let count1 = localStorage.getItem("case_editcount");
        if(count1 == 3){  
          if((SingleCasesDetails.getCasePhotos).length > 0 && fileList.length == 0){
              (SingleCasesDetails.getCasePhotos).forEach(function (photos) {
                fileList.push({ uid: photos.id, name: photos.imagename, status: 'done', url: photos.strUrl });
              });
              this.setState({ fileList })
          }else{
            this.setState({ fileList })
          }
        }
      }
    }
  }

  handleCancel = () => this.setState({ previewVisible: false });

  handlePreview = file => {
    this.setState({
      previewImage: file.url || file.thumbUrl,
      previewVisible: true,
    });
  };
  
  handleChange = ({ fileList }) => this.setState({ fileList });

  onSelectChange = (selectedRowKeys) => {
    this.setState({ selectedRowKeys });
  }

  handleDeleteCase = () => {
    const { SingleCasesDetails, deleteSkincase} = this.props;
    const caseId = SingleCasesDetails.case_id;
    var r = window.confirm("Do you want to Delete this case?");
    if (r == true) {
      deleteSkincase({'caseid': caseId, 'type': 'delete'});
    }    
  }
  
  handleResolveCase = () => {
    const { SingleCasesDetails, deleteSkincase} = this.props;
    const caseId = SingleCasesDetails.case_id;
    var r = window.confirm("Do you want to Resolve this case?");
    if (r == true) {
      deleteSkincase({'caseid': caseId, 'type': 'resolve'});
    }        
  }

  handleCancelCase = () => {
    const { SingleCasesDetails, deleteSkincase} = this.props;
    const caseId = SingleCasesDetails.case_id;
    var r = window.confirm("Do you want to Cancel this case?");
    if (r == true) {
      deleteSkincase({'caseid': caseId, 'type': 'cancel'});
    }    
  }

  handleSubmit = e => { 
    console.log(e.target.id);
    const { SingleCasesDetails, updateNwCase} = this.props;
    const { fileList } = this.state;    
    var caseImages = [];
    var caseOldImages = [];
    e.preventDefault();
    
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        if(fileList.length > 0){
            (fileList).forEach(function (photos) {
              console.log(photos);
              if(photos.status != 'error'){
                if(photos.response != undefined){
                  caseImages.push(photos.response); 
                }else{
                  caseOldImages.push(photos.uid); 
                }
              }
            });
        }
        values.patientCaseImages = caseImages;  
        values.patientCaseOldImages = caseOldImages;  
        values.id = SingleCasesDetails.case_id;  
        updateNwCase(values);
      }
    });
  }
  render() {
    // debugger;
    console.log("params",this.props.match.params);
    const { getFieldDecorator } = this.props.form;
    const { previewVisible, previewImage, fileList, selectedRowKeys } = this.state;
    const { SingleCasesDetails, currentSkincase} = this.props;
    const api_url = jwtConfig.fetchUrl;
    const imgupload_api = api_url + 'uploadimage';    
    const patientQuestions = (SingleCasesDetails.patientQuestionAnswer == undefined)? [] : SingleCasesDetails.patientQuestionAnswer;
    const patientDetails = (patientQuestions.patientDetails == undefined)? [] : patientQuestions.patientDetails;   
    const pregDetails = (patientDetails.pregnantStatusValue == undefined)? [] : patientDetails.pregnantStatusValue;
    const quesList = (patientQuestions.CaseQuesANswers == undefined)? [] : patientQuestions.CaseQuesANswers;

    const uploadButton = (
      <div>
        <Icon type="plus" />
        <div className="ant-upload-text">Upload</div>
      </div>
    );
    
    const rowSelection = {
      selectedRowKeys,
      onChange: this.onSelectChange,
      hideDefaultSelections: true,
      selections: [{
        key: 'all-data',
        text: 'Select All Data',
        onSelect: () => {
          this.setState({
            selectedRowKeys: [...Array(46).keys()], // 0...45
          });
        },
      }, {
        key: 'odd',
        text: 'Delete All Selected',
        onSelect: (changableRowKeys) => {
          let newSelectedRowKeys = [];
          newSelectedRowKeys = changableRowKeys.filter((key, index) => {
            if (index % 2 !== 0) {
              return false;
            }
            return true;
          });
          this.setState({ selectedRowKeys: newSelectedRowKeys });
        },
      }, {
        key: 'even',
        text: 'Select Even Row',
        onSelect: (changableRowKeys) => {
          let newSelectedRowKeys = [];
          newSelectedRowKeys = changableRowKeys.filter((key, index) => {
            if (index % 2 !== 0) {
              return true;
            }
            return false;
          });
          this.setState({ selectedRowKeys: newSelectedRowKeys });
        },
      }],
      onSelection: this.onSelection,
    };
    const otherAttributes = [
      { title: 'Patient', value: 'PatientName', type: 'phoneNumber' },
      { title: 'DOB(mm/dd/yyyy)', value: 'dob', type: 'phoneNumber' },
      { title: 'Consult Entered on', value: 'consult_in', type: 'company' },
      { title: 'Best Phone#', value: 'work', type: 'phoneNumber' },
      { title: 'Email', value: 'email', type: 'company' }
    ];

    const otherAttributesRight = [
      { title: 'Credit Card#', value: 'card', type: 'phoneNumber' },
      { title: 'Auth. Code', value: 'authcode', type: 'phoneNumber' },
      { title: 'Paid On', value: 'paidon', type: 'company' },
    ];

    const drugAttributes = [
      {title: 'Drug Allergies', value: 'drugs', class: 'colorRed'},
      {title: 'Patient Medical History', value: 'patientMedHist'},
      {title: 'Family Medical History', value: 'FamilyMedHist'},
      {title: 'Current Meds', value: 'curMed'},
    ];
    const chiefAttributes = [
      {title: 'Chief Compaint', value: 'chief'},
      {title: 'Affected Areas Selected on Body Map', value: 'selectedArea'},      
    ]
    
    const CaseAttr = [
      {title: 'Case#', value: 'case_number'},
      {title: 'Consult Cost', value: 'consult_const'},
    ]

    const Refferal_code = [
      {title: 'Referral Code', value: 'refferal_code'},
    ]

    const pregClass = ((patientDetails.gender == 'Male')? "hide" : (pregDetails.key == undefined)? '' : ( ((pregDetails.value).toLowerCase() == 'no')? '' : 'colorRed'));

    const pragAttributes = [
      {title: ((pregDetails.key == undefined)? '' : pregDetails.key), value: 'pragnent', class: pregClass},]

    const styleClass={ "class": "hide", "textLabelClass": "minWidth" }     
    
    const selectedContact = {
          "id": 22143,
          "email": patientDetails.strEmail,
          "dob": `${patientDetails.strDateOfBirth} ${ ' ' } ${patientDetails.gender}`,
          "mobile": SingleCasesDetails.strCareGiverFullName,
          "case_number": SingleCasesDetails.case_number,
          "consult_const": `${ '$' }${ parseFloat(SingleCasesDetails.intConsultingCost).toFixed( 2 ) } `,
          "PatientName": patientDetails.strPatientName,
          "consult_in": patientDetails.consult_in,
          "work": patientDetails.strPhone,          
          "refferal_code": SingleCasesDetails.strReferralCode,
          "card": SingleCasesDetails.card,
          "authcode": SingleCasesDetails.authcode,
          "paidon": SingleCasesDetails.paidon,
          "drugs": SingleCasesDetails.listDrugAllergies,
          "patientMedHist": SingleCasesDetails.listMedicalHistory,
          "FamilyMedHist": SingleCasesDetails.listFamilyMedicalHistory,
          "curMed": SingleCasesDetails.listCurrentMedicine,
          "chief": SingleCasesDetails.strChiefComplaint,
          "selectedArea": patientQuestions.strBodyMapList,
          "pragnent": ((pregDetails.key == undefined)? '' : pregDetails.value)
        };
    const columns = [
      {
        title: 'Questions',
        className: 'column-money',
        dataIndex: 'question',
        width: 100,
      }, 
      {
        title: 'Answers',
        dataIndex: 'answers',
        width: 100,
      }
    ];

    return (
      <LayoutWrapper>        
        <Form onSubmit={this.handleSubmit}>
          <Box>
          <InvoicePageWrapper className="InvoicePageWrapper">
            <div className="PageHeader">
              <Button className="isoGoInvoBtn" icon="form" htmlType="submit" id="onlysave" disabled={(SingleCasesDetails.strCaseStatus != 'Active' ?  true : false)} >
                <span>Save</span>
              </Button>
              <Button className="isoGoInvoBtn" icon="form" htmlType="submit"  id="saveclose" disabled={(SingleCasesDetails.strCaseStatus != 'Active' ?  true : false)} >
                <span> Save & Close</span>
              </Button>              
              <Button color="danger" icon="delete" onClick={this.handleDeleteCase}>
                <span> Delete Case</span>
              </Button>
              <Button type="primary" icon="check-circle" className={`${'isoInvoPrint'} ${(SingleCasesDetails.strCaseStatus != 'Active' ? 'hide' : '') }`} onClick={this.handleResolveCase}>
                <span>Resolve Case</span>
              </Button>
              <Button type="danger" icon="close-circle" className={`${'isoInvoPrint'} ${(SingleCasesDetails.strCaseStatus != 'Active' ? 'hide' : '') }`}  onClick={this.handleCancelCase}>
                <span>Cancel Case</span>
              </Button>
            </div>

            <div className="PageContent">
                <div className="OrderInfo noBotpadding">
                  <div className="LeftSideContent">
                    <span className="InvoiceNumber">My Pending Case</span>
                    <h3 className="Title">{SingleCasesDetails.case_number}</h3>                  
                  </div>
                  <div className={ "RightSideContent" + (SingleCasesDetails.strCaseStatus == 'Active' ? ' colorGreen' : ' colorRed')}>
                    <p>
                      <span className="orderStatusSpan">Case Status: </span>
                      <span className="orderStatus">
                        {SingleCasesDetails.strCaseStatus}
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
              <Col span={24} key={6} className="caseViewGap">
                <Col span={12} key={5}>
                  <SingleContactView
                    contact={selectedContact}
                    otherAttributes={CaseAttr}
                    others={styleClass}
                  />
                </Col>
                <Col span={12} key={7}>
                  <SingleContactView
                    contact={selectedContact}
                    otherAttributes={Refferal_code}
                    others={styleClass}
                  />
                </Col>
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
            <Col span={24} key={21}  className="caseViewGap">
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
            <Col span={24} key={12}  className="caseViewGap">
                <Title level={4} style={{margin: '0 35px 10px 35px'}}>Additional Info:</Title>
                <Table
                  style={{margin: '0 35px'}}
                  columns={columns}
                  dataSource={quesList}
                  bordered
                  pagination= {false}
                />
            </Col>
            <div className="InvoiceTable">
              <ViewTable skincaseList={currentSkincase.skincaseList} />
            </div>
            <PageHeader>Diagnosis & Impression, Patient Instructions & Follow-Up Plan</PageHeader>
            <Col span={24} key={22}  className="caseViewGap">
                {getFieldDecorator('diagnosis', {initialValue: SingleCasesDetails.diagnosis})
                (<TextArea disabled={(SingleCasesDetails.strCaseStatus != 'Active' ?  true : false)} rows={4}  placeholder="Diagnosis & Impression, Patient Instructions & Follow-Up Plan"  />)}
            </Col>
            <PageHeader>Patient Images</PageHeader>
            <Col span={24} key={23}  className="caseViewGap">
                <div className="clearfix">
                  <Upload
                    action={imgupload_api}
                    listType="picture-card"
                    fileList={fileList}
                    onPreview={this.handlePreview}
                    onChange={this.handleChange}                     
                  >
                    {(SingleCasesDetails.strCaseStatus != 'Active' ?  '' : uploadButton )}
                  </Upload>
                  <Modal visible={previewVisible} footer={null} onCancel={this.handleCancel}>
                    <img alt="example" style={{ width: '100%' }} src={previewImage} />
                  </Modal>
                </div>
            </Col>
            {/* Prescription implementaiton */}
            <Prescriptions preIds={this.props.match.params} typeOfPage={this.props.match.url}/>
            
            {/* Caseactivity implementaiton */}
            <Caseactivities caseid={this.props.match.params} />
          </InvoicePageWrapper>
        </Box>
        </Form>
      </LayoutWrapper>
    );
  }
}

function mapStateToProps(state) {
  return {
    ...state.Skincases,
  };
}

const ViewEditCasesEdit = Form.create()(ViewEditCases);

export default connect(
  mapStateToProps,
  skincaseActions 
)(ViewEditCasesEdit);