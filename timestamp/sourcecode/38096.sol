contract Sale {
	uint public end;
	uint public cap;
	bool public live;

	function () payable {
		if (block.timestamp > end || this.balance > cap) {
			require(live);
			live = false;
		} else if (!live) {
			live = true;
		}
	}
}