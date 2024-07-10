// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract CustomToken is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("ABRA", "ABR") {
        initialSupply = initialSupply * 1 * 10**uint(decimals());
        _mint(msg.sender, initialSupply);
    }

    function decimals() public pure override returns (uint8) {
        return 4;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function transferToken(address destination, uint256 amount) public {
        _transfer(msg.sender, destination, amount);
    }
}