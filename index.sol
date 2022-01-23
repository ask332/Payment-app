//SPDX-License-Identifier: UNLICENSED
pragma solidity >0.7.0;

contract Friends{
    address private owner = msg.sender;
    string[] private names;
//modifier
    modifier onlyOwner {
      require(msg.sender == owner);
      _;
   }
//mapping of names and address
    mapping(string => address payable) public paymentOptions;
//event
    event payment(address, address , uint);
//adding new friend
    function addFriend(string memory name, address payable newAddress) public{
        names.push(name);
        paymentOptions[name] = newAddress;
    }
//paying friend
    function payFriend(string memory name) public payable onlyOwner{
        require(msg.sender.balance >= msg.value);
            uint amount = msg.value;
            paymentOptions[name].transfer(amount);
            emit payment(owner, paymentOptions[name], amount);    
        }
//fallback function
    receive() external payable{
       
    }
    
}
