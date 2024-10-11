// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

contract STRANGE {

    // Atributos del token
    string public constant name = "Strange Currencies";
    string public constant symbol = "STRANGE";
    uint8 public constant decimals = 18;

    // Owner del contrato y cantidad de tokens
    address private ownerAddress;
    uint private cantidadTokens;

    // Mapping para saber cuántos tokens tiene una address
     mapping(address => uint256) private balances;

    // Mapping para saber las aprobaciones
     mapping(address => mapping(address => uint)) private allowances;

    constructor (uint256 _cantidadTokens) {
        // establece propietario del contrato y cantidad inicial de tokens
        ownerAddress = msg.sender;
        cantidadTokens = _cantidadTokens;
        balances[msg.sender] = _cantidadTokens;
    }


    // ERC-20

    // Eventos

    event Transfer(address indexed from, address indexed to, uint256 _value);
    event Approval(address indexed owner, address indexed spender, uint256 _value);


    // Métodos

    function totalSupply() public view returns(uint256) {
        return cantidadTokens;
    }

    function balanceOf(address account) external view returns(uint256 balance) {
        return balances[account];
    }

    function transfer(address recipient, uint256 amount) external returns (bool success) {
        require(amount <= balances[msg.sender], "Insufficient funds");

        balances[recipient] =  balances[recipient] += amount;
        balances[msg.sender] =  balances[msg.sender] -= amount;

        emit Transfer(msg.sender, recipient, amount);

        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool success) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function allowance(address owner, address spender) external view returns (uint256 remaining) {
        return allowances[owner][spender];
    }

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool success) {
        require(amount <= balances[sender], "Insufficient funds");

        // El monto supera lo permitido, o el msg.sender no ha sido autorizado por el sender
        require(amount <= allowances[sender][msg.sender], "Transfer not allowed");

        balances[recipient] += amount;
        balances[sender] -= amount;

        emit Transfer(sender, recipient, amount);

        return true;
    }


}
