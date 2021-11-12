// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Simpletransaction {
    
    mapping(address => uint256) public accounts;

    modifier minFunds(uint256 _amount) {
        require(_amount <= accounts[msg.sender], "Not have enough funds.");
        _;
    }
    
    function deposit() public payable {
        accounts[msg.sender] += msg.value;
    }
    
    function withdrawMoney(uint256 _amount) public minFunds(_amount) {
        payable(msg.sender).transfer(_amount);
    }
    
    function checkBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
}
