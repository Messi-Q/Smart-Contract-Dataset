contract FunFairSale {
    uint public deadline =  1499436000;  
    uint public startTime = 1498140000;  
    uint constant MAX_GAS_PRICE = 50 * 1024 * 1024 * 1024 wei;

    function () payable {
    	if (tx.gasprice > MAX_GAS_PRICE) throw;
        if (block.timestamp < startTime || block.timestamp >= deadline) throw;
        return;
    }
}