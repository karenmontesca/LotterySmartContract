//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;
//deploy using javascriptVM in Remix
contract Lottery{
    address payable[] public players;
    //dynamic array called players, type address. The elements of the array will be
    //the player's addresses
    //only a payable address can send ETH, if it was a plain address we could
    //not send ETH to that address
    address public manager;

    constructor(){
        manager = msg.sender;
        //msg.sender global variable holds the address of the account that is interacting
        //(in this case deploying) the contract
    }

    receive() external payable{
        //recibe 0.1 ETH
        //require(msg.value == 100000000000000000);
        // without a suffix it is considered as wei as default
        require(msg.value == 0.1 ether);
        players.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        //only manager can see balance
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));

    }
    function pickWinner() public {
        require(msg.sender == manager);
        require(players.length >= 3);

        uint r = random();
        address payable winner;

        uint index = r % players.length;
        winner = players[index];
       
       winner.transfer(getBalance());

       //resetting for another game
       players = new address payable[](0)
    }
}