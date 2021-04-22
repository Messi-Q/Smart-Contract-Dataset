contract MamaToken {
    uint public openingTime = 1527638401;  
    uint public closingTime = 1546214399;  

    function () external payable {
        require(block.timestamp >= openingTime && block.timestamp <= closingTime);
    }
}