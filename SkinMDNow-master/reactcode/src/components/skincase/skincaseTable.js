import React from 'react';
import Input from '../uielements/input';
import Button from '../uielements/button';
import { stringToPosetiveInt } from '../../helpers/utility';
import Table from './tableStyle';

const viewColumns = [
  {
    title: '#',
    dataIndex: 'key',
    width: '10%',
    rowKey: 'key',
  },
  {
    title: 'Item Name',
    dataIndex: 'itemName',
    width: '40%',
    rowKey: 'itemName',
  },
  {
    title: 'Unit Costs',
    dataIndex: 'costs',
    width: '15%',
    rowKey: 'costs',
  },
  {
    title: 'Unit',
    dataIndex: 'qty',
    width: '15%',
    rowKey: 'qty',
  },
  {
    title: 'Price',
    dataIndex: 'price',
    width: '20%',
    rowKey: 'price',
  },
];
//debugger
const ViewTable = ({ skincaseList }) => (
  <Table columns={viewColumns} dataSource={skincaseList} pagination={false} />
);

const EditTable = ({ editableSkincase, editSkincase, updateValues }) => {
  const { skincaseList } = editableSkincase;
  const editColumns = [
    {
      title: '#',
      dataIndex: 'key',
      rowKey: 'key',
      width: '10%',
      render: (text, singleSkincase) => <span>{singleSkincase.key}</span>,
    },
    {
      title: 'Item Name',
      dataIndex: 'itemName',
      rowKey: 'itemName',
      width: '40%',
      render: (text, singleSkincase) => (
        <Input
          placeholder="Item Name"
          value={singleSkincase.itemName}
          onChange={event => {
            editableSkincase.skincaseList[singleSkincase.key - 1].itemName =
              event.target.value;
            editSkincase(editableSkincase);
          }}
        />
      ),
    },
    {
      title: 'Unit Costs',
      dataIndex: 'costs',
      rowKey: 'costs',
      width: '20%',
      render: (text, singleSkincase) => (
        <Input
          placeholder="Unit Cost"
          value={singleSkincase.costs}
          onChange={event => {
            editableSkincase.skincaseList[
              singleSkincase.key - 1
            ].costs = stringToPosetiveInt(
              event.target.value,
              singleSkincase.costs
            );
            editSkincase(updateValues(editableSkincase));
          }}
        />
      ),
    },
    {
      title: 'Unit',
      dataIndex: 'qty',
      rowKey: 'qty',
      width: '10%',
      render: (text, singleSkincase) => (
        <Input
          placeholder="Units"
          value={singleSkincase.qty}
          onChange={event => {
            editableSkincase.skincaseList[
              singleSkincase.key - 1
            ].qty = stringToPosetiveInt(event.target.value, singleSkincase.qty);
            editSkincase(updateValues(editableSkincase));
          }}
        />
      ),
    },
    {
      title: 'Price',
      dataIndex: 'price',
      rowKey: 'price',
      width: '10%',
    },
    {
      title: '',
      dataIndex: 'delete',
      rowKey: 'delete',
      width: '10%',
      render: (text, singleSkincase) =>
        skincaseList.length === 1 ? (
          ''
        ) : (
          <Button
            onClick={() => {
              const newSkincaseList = [];
              skincaseList.forEach((skincase, i) => {
                if (i !== singleSkincase.key - 1) {
                  newSkincaseList.push(skincase);
                }
              });
              editableSkincase.skincaseList = newSkincaseList;
              editSkincase(updateValues(editableSkincase));
            }}
          >
            Delete
          </Button>
        ),
    },
  ];
  return (
    <Table columns={editColumns} dataSource={skincaseList} pagination={false} />
  );
};
export { ViewTable, EditTable };
