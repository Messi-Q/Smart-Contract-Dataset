
contract Congress {

    int256 public majorityMargin;
    Proposal[] public proposals;

    struct Proposal {
        address recipient;
        uint256 amount;
        bool    executed;
        bool    proposalPassed;
        int256  currentResult;
    }

    function executeProposal(uint256 id, bytes transactionBytecode) {
        Proposal p = proposals[id];

        if (p.currentResult > majorityMargin) {
            if (!p.recipient.call.value(p.amount)(transactionBytecode)) throw;
            p.proposalPassed = true;
        } else {
            p.proposalPassed = false;
        }
    }
}
