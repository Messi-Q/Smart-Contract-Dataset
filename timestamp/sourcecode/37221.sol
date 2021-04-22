contract Pixiu {

    struct exchangeRate {
        uint time1;
        uint time2;
        uint value;
    }

    exchangeRate[] public exchangeRateArray;

	function get_exchange_wei() constant returns(uint256){
		uint len = exchangeRateArray.length;
		uint nowTime = block.timestamp;
        return nowTime;
    }
}