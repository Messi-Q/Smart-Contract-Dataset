contract NewCratePreSale {

    function _migrate(address a) external {
        bytes4 selector = bytes4(keccak256("setData()"));
        require(a.delegatecall(selector));
    }
}