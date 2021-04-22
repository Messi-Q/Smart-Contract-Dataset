contract FipsNotary {

    function fipsGenerate() internal returns (bytes20 fips) {
        fips = ripemd160(block.blockhash(block.number), sha256(msg.sender, block.number, block.timestamp, msg.gas));
        return fips;
    }
}