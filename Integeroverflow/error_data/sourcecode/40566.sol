contract Honestgamble {
    uint private Payout_id = 0;
    uint i_13;

    function Pay() private returns (bool){
        uint256 toss = uint256(sha3(msg.gas)) + uint256(sha3(block.timestamp));

        if( toss % 3 == 0 ){
            i_13 = Payout_id;
            return true;
        }
        return false;
    }
}