
contract Puppet {
    
    mapping (uint256 => address) public target;

	function test() public payable{
	    if(msg.sender != target[0]){
			target[0].call.value(msg.value).gas(600000)();
		}
    }
}
