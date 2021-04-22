contract CrowdsaleRC {
    uint public createdTimestamp;

    function CrowdsaleRC () public {
        createdTimestamp = block.timestamp;
    }
}