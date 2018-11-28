pragma solidity >=0.4.22 <0.6.0;
contract Ballot {

    uint[] proposals;
    mapping(address => bool) voters;
    
    constructor(uint proposalsCount) public {
        proposals.length = proposalsCount;
    }
    
    function vote(uint proposal) public {
        bool hasVoted = voters[msg.sender];
        require(!hasVoted && proposal < proposals.length);
        voters[msg.sender] = true;
        proposals[proposal]++;
    }
    
    function winningProposal() public view returns (uint _winningProposal) {
        uint winningVoteCount = 0;
        for (uint prop = 0; prop < proposals.length; prop++) {
            uint voteCount = proposals[prop];
            if (voteCount > winningVoteCount) {
                winningVoteCount = voteCount;
                _winningProposal = prop;
            }
        }
    }
}

