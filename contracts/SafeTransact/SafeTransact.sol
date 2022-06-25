// SPDX-License-Identifier: MIT

import CustodianWallet from './CustodianWallet.sol';
pragma solidity ^0.8.0;

contract SafeTransact {

    address userWalletAddress;
    CustodianWallet newCustodian;


    /**
    * @dev  Creates function to detect User's Wallet Address and Store in state variable
    *
    *
    */
    function detectWalletAddress () public returns (address) {
        return userWalletAddress;
    };



    /**
    * @dev this function initializes a Custodian Contract for Tokens to be transferred to
    *
    *
    */
    function createCustodian () private {
        newCustodian = new CustodianWallet (address(this));
    };



    /**
    * @dev this function performs a batch transfer of NFTs to the Custodian Wallet 
    *
    *
    */


    function batchTransferTokens () {};


    function storeContractAddressOfTokens () {};


    function detectConnectionStatusChange () {};


    function restoreTokensToOwner () {};

    
}