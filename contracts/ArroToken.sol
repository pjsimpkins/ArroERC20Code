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
// Name        : Arro
// Total supply: 30,000,000,000
// Decimals    : 18
//
//
//
// ----------------------------------------------------------------------------

import "@openzeppelin/contracts-ethereum-package/contracts/GSN/Context.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/access/Ownable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20Pausable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/Initializable.sol";

contract ArroToken is Initializable, ContextUpgradeSafe, OwnableUpgradeSafe, ERC20PausableUpgradeSafe {

    // ------------------------------------------------------------------------
    // Gives Owner all tokens
    // ------------------------------------------------------------------------
    function initialize(address owner) public {
        __Context_init_unchained();
        __Ownable_init_unchained();
        __ERC20_init_unchained("Arro", "ARRO");
        __Pausable_init_unchained();
        __ERC20Pausable_init_unchained();

        _mint(owner, 30000000000 * (10 ** uint256(decimals())));
        transferOwnership(owner);
    }

    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------
    function transferAnyERC20Token(address tokenAddress, uint amount) public onlyOwner returns (bool) {
        _transfer(tokenAddress, owner(), amount);
        return true;
    }

    // ------------------------------------------------------------------------
    // Owner can pause all transfers
    // ------------------------------------------------------------------------
    function pause() public onlyOwner {
        _pause();
    }

    // ------------------------------------------------------------------------
    // Owner can unpause all transfers
    // ------------------------------------------------------------------------
    function unpause() public onlyOwner {
        _unpause();
    }

    // ------------------------------------------------------------------------
    // Owner can migrate balances from a previous contract
    // ------------------------------------------------------------------------
    function migrateBalances(address[] memory addresses, uint256[] memory balances) public onlyOwner {
        uint256 i = 0;
        while (i < addresses.length) {
            _transfer(owner(), addresses[i], balances[i]);
            i++;
        }
    }
}
