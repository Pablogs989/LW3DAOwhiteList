//SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

contract Whitelist {

    uint8 public maxWhiteListAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhiteListAddresses) {
        maxWhiteListAddresses = _maxWhiteListAddresses;
    }

    function addAddressesToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhiteListAddresses, "More addresses cant be added, limit reached");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted++;
    }

}