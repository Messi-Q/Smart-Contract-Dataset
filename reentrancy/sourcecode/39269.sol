
contract Bakt {

    struct TX {
        bool blocked;
        address to;
        uint value;
        bytes data;
    }

    TX[256] public pendingTxs;
    uint public committedEther;
    uint8 public ptxTail;

    function sendPending() public returns (bool) {

        TX memory tx = pendingTxs[ptxTail];

        if(!tx.blocked) {
            if(tx.to.call.value(tx.value)(tx.data)) {
                committedEther -= tx.value;
                return true;
            }
        }
        return false;
    }
}
