// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";
contract StorageFactory is SimpleStorage{
    SimpleStorage[] public simple_storage_arr;


    function createSimpleStorageContract()public{
        SimpleStorage simplestr=new SimpleStorage();
        simple_storage_arr.push(simplestr);
    }
    function stfstore(uint256 arr_index,uint256 _simpleStorageNumber)public {
        //to store a number or a value we need "address" and"ABI"
        SimpleStorage(address(simple_storage_arr[arr_index])).store(_simpleStorageNumber);
    }
    function sfGet(uint256 arr_index)public view returns(uint256){
        return SimpleStorage(address(simple_storage_arr[arr_index])).retrieve();
    }
}
