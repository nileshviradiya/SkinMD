import React, { Component } from 'react';
import { ContactCardWrapper } from './contactCard.style';

export default class extends Component {
  render() {
    const { contact, otherAttributes, others } = this.props;
    
    const name = contact.name ? contact.name : 'No Name';
    const display = others.class? `isoContactCardHead ${others.class}` : 'isoContactCardHead';
    const isoInfoLabel = others.textLabelClass? `isoInfoLabel ${others.textLabelClass}` : 'isoInfoLabel';    
    const extraInfos = [];
    otherAttributes.forEach(attribute => {
      const value = contact[attribute.value];
      const colorClass = attribute.class? attribute.class : '';
      if (value) {
        extraInfos.push(
          <div className="isoContactCardInfos" key={attribute.value}>
            <p className={`${isoInfoLabel} ${colorClass}`}>{`${attribute.title}`}</p>
            <p className={`isoInfoDetails ${colorClass} `}>{value}</p>
          </div>
        );
      }
    });
    return (
      <ContactCardWrapper className="isoContactCard">
        <div className={display}>
          <div className="isoPersonImage">
            {contact.avatar ? <img alt="#" src={contact.avatar} /> : ''}
          </div>
          <h1 className="isoPersonName">{name}</h1>
        </div>
        <div className="isoContactInfoWrapper">{extraInfos}</div>
      </ContactCardWrapper>
    );
  }
}
