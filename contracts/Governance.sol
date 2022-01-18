//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Governance {
    ERC20 votingToken;

    struct Proposal {
        uint votesFor;
        uint votesAgainst;
        bytes payload;
        address to;
        uint value;
        uint deadline;
        bool executed;
        mapping(address => bool) hasVoted;
    }

    Proposal[] proposals;

    constructor(ERC20 _votingToken) {
        votingToken = _votingToken;
    }

    function createProposal(bytes calldata payload, address to, uint value) external {
        Proposal storage prop = proposals.push();
        prop.payload = payload;
        prop.to = to;
        prop.value = value;
        // 5 minute deadline to get votes in
        prop.deadline = block.timestamp + (60 * 5);
    }

    function vote(uint proposalId, bool support) external {
        require(proposals[proposalId].deadline > block.timestamp);
        require(!proposals[proposalId].hasVoted[msg.sender]);

        if(support) {
            proposals[proposalId].votesFor += votingToken.balanceOf(msg.sender);
        }
        else {
            proposals[proposalId].votesFor -= votingToken.balanceOf(msg.sender);
        }
    }

    function execute(uint proposalId) external {
        Proposal storage prop = proposals[proposalId];

        require(prop.deadline < block.timestamp);
        require(!prop.executed);

        prop.executed = true;

        (bool success, ) = prop.to.call{ value: prop.value }(prop.payload);

        require(success);
    }
}