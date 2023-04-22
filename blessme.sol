// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract blessMe{
    struct Memo{
        string name;
        string message;
        uint256 timestamp;
        address from;
    }

    Memo[] memos; //Struct Memo is going to be in an Array
    address payable owner; //Address to receive eth

    constructor(){
        owner = payable (msg.sender); //Owner is attributed to the address Sender
    }

    function blessChairman(string calldata name, string calldata message) external payable {
        require(msg.value>0,"Chairman, send something ergh! lol");
        owner.transfer(msg.value);
        memos.push(Memo(name, message, block.timestamp, msg.sender));
    }

    function getBlessChairman() public view returns(Memo[] memory){
        return memos;
    }

}