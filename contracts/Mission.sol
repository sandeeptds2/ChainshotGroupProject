// // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

struct Trust {
    uint level;
    address holder;
    string proposal;
    mapping (bytes32 => Trust) bonds;
}

contract Mission {
    Trust public root;
    mapping (address => bytes32[]) chain;

    constructor(address[] memory founders, string memory statement) payable {
        root.level = founders.length;
        root.holder = address(this);
        root.proposal = statement;

        for (uint i=0; i < founders.length; i++) {
            bytes32 key = sha256(abi.encodePacked(founders[i], address(this)));

            root.bonds[key].level = 1;
            root.bonds[key].holder = founders[i];
            root.bonds[key].proposal = statement;

            chain[founders[i]] = [key];
        }
    }

    function transferToken () external {
        // The tokens that are transferred from the supporters to the leaders.

        // A way to lookup if the supporter is already affiliated to the leader.


    }

    function establishTrust (address leader, string memory proposal) external {
        root.level += 1;
        Trust storage leaderNode = root;
        for (uint i=0; i < chain[leader].length; i++) {
            chain[msg.sender].push(chain[leader][i]);
            leaderNode = leaderNode.bonds[chain[leader][i]];
            leaderNode.level += 1;
        }

        bytes32 key = sha256(abi.encodePacked(msg.sender, leaderNode.holder));

        leaderNode.bonds[key].level = 1;
        leaderNode.bonds[key].holder = msg.sender;
        leaderNode.bonds[key].proposal = proposal;
        chain[msg.sender].push(key);
    }

    function breakTrust (address supporter, address leader, string memory proposal) external {

        // Parameters needed: the address of the supported

        // Locate the supporter
        // Clear the holder value
        // Remove the supporter from the chain mapping
        // Decrement the levels of the participant nodes in the chain
    }

    function getTrustChain (address supporter) external view returns(bytes32[] memory) {
        return chain[supporter];
    }

    function getTrustLevel (address supporter) external view returns(uint) {
        Trust storage supporterNode = root;

        for (uint i=0; i < chain[supporter].length; i++) {
            supporterNode = supporterNode.bonds[chain[supporter][i]];
        }

        return supporterNode.level;
    }

    function getJurasForAddresss () external { // Make this private

        // Get the Juras for the address hash passed.

    }

}
