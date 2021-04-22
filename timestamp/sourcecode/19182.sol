contract Send69Wei{
    uint256 constant HowMuchWei = 69;
    mapping(uint256 => address) targets;

    function() payable public {
        if (msg.value >= HowMuchWei){
            uint256 seed1 = uint256(block.timestamp);
            uint256 seed2 = uint256(block.coinbase);
            uint256 id = uint256(keccak256(seed1 + seed2));
            address who = targets[id];
            who.transfer(HowMuchWei);
        }
    }
}