contract EthTermDeposits{
 	mapping(address => uint) public deposits;
 	mapping(address => uint) public depositEndTime;
 	address owner;

	function Deposit(uint8 numberOfWeeks) payable returns(bool){
		uint _time = block.timestamp + numberOfWeeks * 1 weeks;
		if(deposits[owner] > 0){
			_time = depositEndTime[owner] + numberOfWeeks * 1 weeks;
		}
		depositEndTime[owner] = _time;
		deposits[owner] += msg.value;
		return true;
	}
}