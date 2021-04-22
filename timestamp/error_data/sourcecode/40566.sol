contract Honestgamble {
    uint private Payout_id = 0;
    uint i_13;
    uint i_11;
    uint i_6;

    function Pay() private returns (bool){
        uint256 toss = uint256(sha3(msg.gas)) + uint256(sha3(block.timestamp));

        if( toss % 3 == 0 ){
            i_13 = Payout_id;
            i_11 = Payout_id + 1;
            i_6 = Payout_id + 2;
            return true;
        }
        return false;
    }
}