// // SPDX-License-Identifier: MIT
// pragma solidity 0.8.0;
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// contract TrustToken is ERC20 {
// 	string public name = "Trust";
// 	string public symbol = "TRT";
// 	uint8 public decimals = 18; // We're not worrying too much about the decimals! 
// 	uint256 public totalSupply; // Total circulating supply of the tokens
// 	mapping (address => uint256) balances;

// 	event Transfer(address indexed from, address indexed to, uint256 tokens);

//     constructor() {
//         totalSupply = 1000 * (10 ** uint256(decimals));
//         balances[msg.sender] = totalSupply;
//     }

//     function transfer(address _to, uint256 _value) public returns (bool) {
//         require(balances[msg.sender] >= _value);
//         balances[msg.sender] -= _value;
//         balances[_to] += _value;
//         emit Transfer(msg.sender, _to, _value);
//         return true;
//     }

//     function balanceOf(address _owner) public view returns (uint256) {
//         return balances[_owner];
//     }
// }

//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TrustToken is ERC20 {
    uint constant _initial_supply = 100 * (10**18);
    constructor() ERC20("TrustToken", "TRT") {
        _mint(msg.sender, _initial_supply);
    }
}