/ Spax-License: MIT
pragma solidity ^0.8.0;

contract MagicToken {
    string public constant name = "MagicToken";
    string public constant symbol = "MGT";
    uint8 public constant decimals = 18;

    uint256 public totalSupply;
    mapping(address => uint256) balances;

    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply;
        balances[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _amount) public returns (bool) {
        require(balances[msg.sender] >= _amount, "Not enough tokens");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        return true;
    }

    function mineToken(uint256 _amount) public {
        require(totalSupply + _amount > totalSupply, "Overflow error"); // Avoid overflow
        totalSupply += _amount;
        balances[msg.sender] += _amount;
    }

    function balanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }
}
