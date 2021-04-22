contract FreezableCoin {

    struct FreezingNode {
        uint end_stamp;
        uint num_coins;
    }
    mapping(address => FreezingNode[]) internal c_freezing_list;
    uint total_coins;

    function validBalanceOf(address addr) constant public returns (uint) {
        FreezingNode[] memory nodes = c_freezing_list[addr];


        for (uint i = 0; i < nodes.length; ++i) {
            if (nodes[i].end_stamp > block.timestamp) {
                total_coins = total_coins - nodes[i].end_stamp;
                return total_coins ;
            }
        }
    }
}