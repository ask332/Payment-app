//SPDX-License-Identifier: UNLICENSED
pragma solidity >0.7.0 <0.9.0;

contract Friends{
    address payable private owner;
    string[] private names;

    mapping(string => address payable) public paymentOptions;
    event payment(address sender, address receiver, uint amount);
    function addFriend(string memory name, address payable newAddress) public{
        names.push(name);
        paymentOptions[name] = newAddress;
    }

    function payFriend(string memory name, uint amount) public payable{
        if(msg.sender.balance >= amount){
            paymentOptions[name].transfer(amount);
            emit payment(msg.sender, paymentOptions[name], amount);
        }

    }
}
