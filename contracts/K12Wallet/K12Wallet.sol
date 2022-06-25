// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract K12Wallet {


        address owner; 

        /**
        * @dev creates a list of allowed Users 
        * 
        */
        struct NonOwner {
            string name;
            address userAddress;
            bool isExists;
            uint amountAllowed;
            uint withdrawBalance;
        }
        mapping (address => NonOwner) allowedUsers;
    
        constructor () {
            owner = msg.sender;
        }


        /**
        * @dev Function depositFunds allows wallet to receive ether 
        */
        function depositFunds () public payable {}

        
        /**
        * @dev This function creates a new user object and sets the object property using external parameters from the owner
        * 
        */
        function permitUserToWithdraw (address _userAddress, uint _permittedAmount, string memory _allowedUserName) public {
            require(msg.sender == owner, "only the owner can call this function");
            NonOwner memory newUser = NonOwner(_allowedUserName, _userAddress, true, _permittedAmount, _permittedAmount);
            allowedUsers[_userAddress] = newUser;
        }

        /**
        * @dev This function uses msg.sender to check the allowedUsers mapping and return the name of the msg.sender
        */
        function returnNameOfAllowedUser (address _userAddress) public view returns (string memory) {
           return allowedUsers[_userAddress].name;
        } 

        /**
        * @dev This function checks to see if address provided is on the allowlist
        */
        function isPermitted (address _nonOwner) public view returns (bool) {
            require(allowedUsers[_nonOwner].userAddress == _nonOwner, "user is not permitted");
            return true;
        } 

        /**
        * @dev This function enables non Owners to withdraw within their specified withdrawal limit
        * a temp variable is used to store user's withdrawal balance and calculate cummulative withdrawals
        * 
        */
        function nonOwnerWithdraw (uint _withdrawAmount) public payable returns (bool) {
            require(allowedUsers[msg.sender].isExists ==  true, "You are not permitted to withdraw");
            require(_withdrawAmount <= allowedUsers[msg.sender].amountAllowed, "Please enter a valid amount"); 
            uint tempUserBalance = allowedUsers[msg.sender].withdrawBalance;

            payable(msg.sender).transfer(address(this).balance - (address(this).balance - _withdrawAmount));

            allowedUsers[msg.sender].withdrawBalance = tempUserBalance - _withdrawAmount;
            return
             true;
        }

        function getWalletBalance () public view returns (uint) {
            return address(this).balance;
        }


        /**
        * This function tells you your available withdrawal balance 
        */
        function availablePermittedBalancePerUser () public view returns (uint) {
           return allowedUsers[msg.sender].withdrawBalance;
        }

        

}