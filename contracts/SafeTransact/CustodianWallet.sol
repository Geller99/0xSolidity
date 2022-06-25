// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract CustodianWallet {

        address owner;
        constructor (address safeTransact) {
            owner = safeTransact;
        }

}