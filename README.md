# LotterySmartContract
A very simple smart contract made with solidity during my Solidity training

Lottery algorithm:

- The lottery accepts ETH transactions.
- Anyone that has an Ethereum wallet can send only  0.1 ETH (fixed amount) to the contract's address.
- When someone sends ETH to the contract address, their Ethereum address is registered as a player in the lottery. 
- The manager is the account that deploys and therefore controls the contract.
- When there are at least 3 players, the manager is able pick a random winner from the player's list.
- The contract will transfer the entire balance to the winner's address and the lottery is reset.

