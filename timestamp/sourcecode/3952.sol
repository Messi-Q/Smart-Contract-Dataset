contract HorseFutures {

    mapping(bytes32 => address) owner;

    function sellOffer(uint256 amount, uint256 price, address race, bytes32 horse) external returns (bytes32) {
        bytes32 id = keccak256(abi.encodePacked(amount,price,race,horse,true,block.timestamp));
        require(owner[id] == address(0));
        return id;
    }

}