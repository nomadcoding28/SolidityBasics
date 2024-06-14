// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts@1.1.1/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    mapping(address=>uint256)public addressToAmountFunded;
    address public owner;
    address[] public funders;

    constructor(){
        owner=msg.sender;
    }
    function Fund()public payable {
        uint256 minimumtoUsd=50*10**18;
        require(getConversionRate(msg.value)>=minimumtoUsd,"You need more ETH!!!");
        addressToAmountFunded[msg.sender]+=msg.value;
        funders.push(msg.sender);
    }
    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }
    function getPrice() public view returns(uint256){
        AggregatorV3Interface price=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer,,,)=price.latestRoundData();
        return uint256(answer*10000000000);
    }  
    function getConversionRate(uint256 ethamount) public view returns(uint256){
        uint256 ethprice=getPrice();
        uint256 ethtoUsd=(ethprice*ethamount)/1000000000000000000;
        return ethtoUsd;
    }
    //modifier is used to change the function in declarative way.
    modifier OnlyOwner {
        require(msg.sender == owner);
        _;
    }
    function withdraw() payable OnlyOwner public  {
        payable (msg.sender).transfer(address(this).balance);
        for (uint256 i=0; i<funders.length; i++) 
        {
            address funder=funders[i];
            addressToAmountFunded[funder]=0;

        }
        funders= new address[](0);

    }
}
