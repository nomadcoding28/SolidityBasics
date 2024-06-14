// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract SimpleStorage{
    uint256 favnum;
    //to create a own seperate class type or data type
    struct People{
        uint256 favnum;
        string name;
    }
    //dynamic array 
    People[] public people;
    //mapping datastructure helps in identify the related attributes maybe, 
    mapping(string => uint256) public nametofavnum;
    //it acts as constructor
    //Syntax: <data type><access modifier><ref_var>=<datatype>({attributes of the data type or class})
    // People public person=People({favnum: 34,name: "kushal"});
    //store function is used to store a value in public accessable variable.
    function store(uint256 _favnum) public{
        favnum=_favnum;
    }
    //view and pure are non-state changing functions
    //view just reads the state of the blockchain it does'nt affect the state of blockchain
    //pure function is used for just for doing purly math operations
    function retrieve() public view returns(uint256){
        return favnum;
    }
    // function addPerson(string memory _name,uint256 _favnum)public{
    //     people.push(People({favnum:_favnum,name:_name}));
    //     nametofavnum[_name]=_favnum;
    // }
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nametofavnum[_name]=_favoriteNumber;
    }


}
