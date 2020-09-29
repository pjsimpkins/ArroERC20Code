// SPDX-License-Identifier: MIT
/**
 * Source Code first verified at https://etherscan.io on Monday, July 30, 2018
 (UTC) */

pragma solidity ^0.6.2;

// ----------------------------------------------------------------------------
// 'ARRO' token contract
//
// Deployed to :
// Symbol      : ARRO
// Name        : Arro.io
// Total supply: 30,000,000,000
// Decimals    : 18
//
//
//
// ----------------------------------------------------------------------------

import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/access/Ownable.sol";

contract ArroToken is Initializable, ERC20UpgradeSafe, OwnableUpgradeSafe {

    uint256 private _totalSupply;

    // ------------------------------------------------------------------------
    // Gives Owner all tokens
    // ------------------------------------------------------------------------
    function initialize(address owner) public {
        // Defaults to 18 decimals
        __ERC20_init("Arro.io", "ARRO");
        __Ownable_init();

        _totalSupply = 30000000000 * (10 ** 18);

        _mint(owner, 10000 * (10 ** uint256(decimals())));
        transferOwnership(owner);
    }

    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------
    function transferAnyERC20Token(address tokenAddress, uint amount) public onlyOwner returns (bool) {
        _transfer(tokenAddress, owner(), amount);
        return true;
    }

}
