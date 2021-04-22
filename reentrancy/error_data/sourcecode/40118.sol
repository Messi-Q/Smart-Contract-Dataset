
contract DaoAccount {

    address owner;

	function withdrawEtherOrThrow(uint256 amount) private {
		bool result = owner.call.value(amount)();
		if (!result) { throw; }
	}
}