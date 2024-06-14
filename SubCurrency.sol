// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract IPLcoin{
    string  public name;
    string public symbol;
    uint256 public totalsupply;
    uint256 public pubkey;
    // uint256 private pvtkey;

    struct Person{
        uint256 pukey;
        string name;
    }

    Person[]public people;

    mapping(string => uint256) public balanceof;

    constructor(string memory _name,string memory _symbol,uint256 _totalsupply,uint256 _balanceof) {
        name=_name;
        symbol=_symbol;
        totalsupply=_totalsupply;
        balanceof[_name]=_balanceof;


    }
}
