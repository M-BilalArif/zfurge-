// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Z_Fight_Token is ERC20, Ownable { 
    uint256 public  constant maxSupply  = 1000000000*1e18;
    constructor() ERC20("Z_Fight_Token", "ZFT") Ownable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) {  
     }

    function mint(address to, uint256 amount) public onlyOwner {
        require (amount+totalSupply() <= maxSupply, "Max Supply reached");
        _mint(to, amount);
    }

    function transferFromContract(address _to,uint256 amount) external onlyOwner {
        require(amount > 0 , "Amount must be greater than 0");
        _transfer(address(this),_to,amount);
    }

    function burn( uint256 amount) public   {
        _burn(msg.sender, amount);
    }
}