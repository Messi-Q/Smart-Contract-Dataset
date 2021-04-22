contract Proxy {
    address callee;
    address owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function setCallee(address newCallee) public onlyOwner {
        callee = newCallee;
    }

    function forward(bytes _data) public {
        require(callee.delegatecall(_data));
    }
}