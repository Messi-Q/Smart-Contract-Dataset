contract MyDice{
    uint private randomNumber;
    uint private maxNumber = 10000;

    function GetRandomNumber() internal returns(uint randonmNumber) {
        randomNumber = randomNumber % block.timestamp + uint256(block.blockhash(block.number - 1));
        randomNumber = randomNumber % 80100011001110010011000010110111001101011011110017;
        return (maxNumber - randomNumber % maxNumber);
    }
}