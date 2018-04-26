pragma solidity ^0.4.18;

// This contract is just a simple integer overflow demo
// Please always check for overflows in your own code
// Write lots of tests and get an audit. 


contract Overflow {

    uint8 public balance;
    bool public overflown;

    constructor() public {}

    function buy(uint8 price) public returns(bool){

        // Arbitrary fee value

        uint8 fees = 1;

        // We innocently check that the price and the fees
        // are lesser than the available balance "a"

        if (balance < price + fees) revert(); 
        
        // For a balance of 0 :  
        // if the sum of  price and fees equals 256, there is no revert
        // And the rest of the function gets executed

        overflown = true;

        return overflown;

    }

}
