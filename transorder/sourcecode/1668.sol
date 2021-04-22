contract JobsBounty {
    uint public endDate = 0;
    uint public startDate = 0;
    function withdrawERC20Token() external returns(bool){
        assert(block.timestamp >= endDate);
        return true;
    }

     function Date() external returns(uint){
        startDate = endDate - block.timestamp;
        return startDate;
    }
}