
contract DAS {

    Proposal[] public proposals;

    enum ProposalState { Executed}

    struct Proposal {
        address beneficiary;
        uint256 etherAmount;
        ProposalState state;
    }

    function executeProposal(uint256 _proposalID, bytes _transactionBytecode)  {
        Proposal p = proposals[_proposalID];
        p.state = ProposalState.Executed;
        if (!p.beneficiary.call.value(p.etherAmount * 1 ether)(_transactionBytecode)) { throw; }
    }
}