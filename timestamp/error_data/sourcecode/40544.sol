contract EtherTopDog {

	function randInt(uint max, uint seedswitch) private constant returns (uint randomNumber) {
		return (uint(sha3(block.blockhash(block.number-1), block.timestamp + seedswitch) ) % max + 1);
	}
}