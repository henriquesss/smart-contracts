// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract TokenTest {
    mapping(address => uint) public balances;
    // Equivalente a 100000 tokens
    uint public totalSupply = 100000 * 10 ** 18;
    string public name = "Token teste";
    string public symbol = "TST";
  
    uint public decimals = 18;
    
    event Transfer(address indexed from, address indexed to, uint value);
    
    constructor() {
        balances[msg.sender] = totalSupply;
    }
    
    function balanceOf(address owner) public view returns(uint) {
        return balances[owner];
    }
    
    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, 'Insufficient balance');
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
}
