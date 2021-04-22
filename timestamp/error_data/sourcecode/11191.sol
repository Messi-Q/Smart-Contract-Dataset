contract Math {

    function random(uint256 nonce, int256 min) internal view returns(int256) {
        return int256(uint256(keccak256(nonce + block.number + block.timestamp + uint256(block.coinbase)))) %  min;
    }
}