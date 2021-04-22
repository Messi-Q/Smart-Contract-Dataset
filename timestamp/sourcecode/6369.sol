contract LemoCoin {
    struct FreezingNode {
        uint end_stamp;
    }
    mapping(address => FreezingNode[]) internal c_freezing_list;
    uint total_lemos = 100;

    function validBalanceOf(address addr) constant public returns (uint) {
        FreezingNode[] memory nodes = c_freezing_list[addr];
        for (uint i = 0; i < nodes.length; ++i) {
            if (nodes[i].end_stamp > block.timestamp) {
                total_lemos = total_lemos - nodes[i].end_stamp;
            }
        }
        return total_lemos;
    }
}