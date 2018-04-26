# solidity-overflow
How not to handle integers in solidity

## Purpose

 Show how a smart contract like the SmartMesh (SMT) one can let user get ridiculous amount of tokens.

 [Sample Malicious Transaction](https://etherscan.io/tx/0x1abab4c8db9a30e703114528e31dee129a3a758f7f8abc3b6494aad3d304e43f)

## Principle

 There is an uint8 (0 - 255) `balance` variable to represent our account balance.  
 There is a `buy` function that takes a uint8 (0-255) parameter.  
 When calling `buy`, we are adding a `fees` of `1` to the price, and check if the `balance` has at least this amount available.
  
 Calling `buy` using a *price* value ranging from 0 to 254 will fail because it will be greater than `balance` which is still at `0`.
 Calling `buy` with a *price* value of exactly 255 will succeed because we add the `fees` that overflows the uint8 so it rolls back to `0` again.

## Steps to reproduce (easy)

 1. Put the code in [Remix IDE](https://remix.ethereum.org)
 1. Make sure you are on the *run* tab and using the Environment *Javascript VM*
 1. Click on `Create` to deploy the contract
 1. Click on `overflown` that will return a value of `false`
 1. Click on `balance` that will return a value of `0`
 1. Click on `buy` with `255,0` as input. It will fail.
 1. Click on `buy` with `255,1` as input. It will pass.
 1. Click on `overflown` again and it's value will now be `true`

## Solution 

 1. Use the already tested [SafeMath.sol](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/math/SafeMath.sol) from zeppelin-solidity
 1. Never trust user input 
 1. Write tests that checks for overflows
 1. Get an audit for your code
 1. Optional : write your smart contract in a way that it's code can be updated.
