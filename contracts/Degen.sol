// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Degen is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function checkBalance() public view returns(uint) {
        return this.balanceOf(msg.sender);
    }
    function transferDT(address to,  uint256 amount) public{
        _transfer(msg.sender, to, amount);
    }

    function redeem(uint8 _choice) public returns(string memory details) {
        if(_choice==1) {
            _burn(msg.sender, 50);
            return " You Win a Iphone 20";
        }

        else if(_choice==2) {
            _burn(msg.sender, 150);
            return "You Win a Samsung S44 !";
        }
        
        else if(_choice==3) {
            _burn(msg.sender, 250);
            return "You Win Nothing...!";
        }
    }

    function burnDT(uint amt) public {
        _burn(msg.sender, amt);
    }
}