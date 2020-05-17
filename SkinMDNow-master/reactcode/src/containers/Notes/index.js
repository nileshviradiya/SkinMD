import React, { Component } from 'react';
import { Upload, Icon, Modal,Layout } from 'antd';
import { connect } from 'react-redux';
import noteActions from '../../redux/notes/actions';
import NoteList from './noteList';
import { ColorChoser } from '../../components/';
import Button from '../../components/uielements/button';
import IntlMessages from '../../components/utility/intlMessages';
import NoteComponentWrapper from './noteComponent.style';
import { Textarea } from '../../components/uielements/input';

const { changeNote, addNote, editNote, deleteNote, changeColor } = noteActions;
const { Header, Content } = Layout;
class Notes extends Component {
  constructor(props) {
    super(props);
    this.updateNote = this.updateNote.bind(this);
  }
  updateNote(event) {
    const { editNote, selectedId } = this.props;
    editNote(selectedId, event.target.value);
  }
  state = {
    previewVisible: false,
    previewImage: '',
    fileList: [{
      uid: '-1',
      name: 'xxx.png',
      status: 'done',
      url: 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
    }],
  };

  handleCancel = () => this.setState({ previewVisible: false })

  handlePreview = (file) => {
    this.setState({
      previewImage: file.url || file.thumbUrl,
      previewVisible: true,
    });
  }

  handleChange = ({ fileList }) => this.setState({ fileList })

  render() {
    const { previewVisible, previewImage, fileList } = this.state;
    const uploadButton = (
      <div>
        <Icon type="plus" />
        <div className="ant-upload-text">Upload</div>
      </div>
    );

    const {
      notes,
      selectedId,
      changeNote,
      deleteNote,
      addNote,
      colors,
      seectedColor,
      changeColor,
    } = this.props;
    const selectedNote =
      selectedId !== undefined
        ? notes.filter(note => note.id === selectedId)[0]
        : null;
    return (
      <NoteComponentWrapper className="isomorphicNoteComponent">
        <div style={{ width: '440px' }} className="isoNoteListSidebar">
          <NoteList
            notes={notes}
            selectedId={selectedId}
            changeNote={changeNote}
            deleteNote={deleteNote}
            colors={colors}
          />
        </div>
        <Layout className="isoNotepadWrapper">
          <Header className="isoHeader">
            {selectedId !== undefined ? (
              <div className="isoColorChooseWrapper">
                <ColorChoser
                  colors={colors}
                  changeColor={changeColor}
                  seectedColor={seectedColor}
                />{' '}
                <span>
                  <IntlMessages id="notes.ChoseColor" />
                </span>
              </div>
            ) : (
              ''
            )}
            <Button type="primary" className="isoAddNoteBtn" onClick={addNote}>
              <IntlMessages id="notes.addNote" />
            </Button>
          </Header>
          <Content className="isoNoteEditingArea">
            {selectedId !== undefined ? (
              
              <div className="clearfix">
              <Textarea
                className="isoNoteTextbox"
                value={selectedNote.note}
                onChange={this.updateNote}
                autoFocus
              />
                <Upload
                  action="//jsonplaceholder.typicode.com/posts/"
                  listType="picture-card"
                  fileList={fileList}
                  onPreview={this.handlePreview}
                  onChange={this.handleChange}
                >
                  {fileList.length >= 3 ? null : uploadButton}
                </Upload>
                <Modal visible={previewVisible} footer={null} onCancel={this.handleCancel}>
                  <img alt="example" style={{ width: '100%' }} src={previewImage} />
                </Modal>
              </div>
            ) : (
              ''
            )}
            {/*{selectedId !== undefined ? <span>{`created at ${selectedNote.createTime}`}</span> : ''}*/}
          </Content>
        </Layout>
      </NoteComponentWrapper>
    );
  }
}

function mapStateToProps(state) {
  const { notes, selectedId, colors, seectedColor } = state.Notes;
  return {
    notes,
    selectedId,
    colors,
    seectedColor,
  };
}
export default connect(
  mapStateToProps,
  {
    addNote,
    editNote,
    deleteNote,
    changeNote,
    changeColor,
  }
)(Notes);
