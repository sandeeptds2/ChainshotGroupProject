// // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct Trust { 
    uint level; // 
	address holder; // Address of the trust holder
	string proposal; // Immutable
	mapping (bytes32 => Trust) bonds; // Child trust node  
}

contract Mission {

	Trust public root;

	mapping (address => bytes32[]) chain; 

	constructor(address[] memory founders, string memory statement) payable {

		root.level = founders.length;
		root.holder = address(this);
		root.proposal = statement;

		for (uint i=0; i<founders.length; i++) {
			
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

	function establishTrust (address supporter, address leader, string memory proposal) external {
		
        // Find the trust node of the leader, and add a node underneath it by traversing to the base node. 

        // If any node isn't found, the transaction fails. 
	}

    
    function breakTrust (address supporter, address leader, string memory proposal) external {
		
        // Parameters needed: the address of the supported

        // Locate the supporter
        // Clear the holder value
        // Remove the supporter from the chain mapping 
        // Decrement the levels of the participant nodes in the chain
	}

    function getTrustLevel () external {
		
        // Juras is the name of the coin JRM

        // Calculate the value of Juras held by each node.
	}

    function getTrustNodeByAddresss () external { // Make this private
		
        // Get the node of the address hash passed.

	}

    function getJurasForAddresss () external { // Make this private
		
        // Get the Juras for the address hash passed.

	}

}
