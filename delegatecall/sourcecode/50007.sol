contract FibonacciBalance {

    address public fibonacciLibrary;
    uint public calculatedFibNumber;
    uint public withdrawalCounter;
    bytes4 constant fibSig = bytes4(sha3("setFibonacci(uint256)"));

    function withdraw() {
        withdrawalCounter += 1;
        require(fibonacciLibrary.delegatecall(fibSig, withdrawalCounter));
        msg.sender.transfer(calculatedFibNumber * 1 ether);
    }
}