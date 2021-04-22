contract TeamToken  {

    uint64 public gameTime;

    function() payable public {
        if (gameTime > 1514764800) {
            require(gameTime - 300 > block.timestamp);
        }
        return;
    }
}