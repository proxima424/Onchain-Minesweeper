// SPDX-License-Identifier: GPL-3.0

//  ███╗░░░███╗██╗███╗░░██╗███████╗░██████╗░██╗░░░░░░░██╗███████╗███████╗██████╗░███████╗██████╗░
//  ████╗░████║██║████╗░██║██╔════╝██╔════╝░██║░░██╗░░██║██╔════╝██╔════╝██╔══██╗██╔════╝██╔══██╗
//  ██╔████╔██║██║██╔██╗██║█████╗░░╚█████╗░░╚██╗████╗██╔╝█████╗░░█████╗░░██████╔╝█████╗░░██████╔╝
//  ██║╚██╔╝██║██║██║╚████║██╔══╝░░░╚═══██╗░░████╔═████║░██╔══╝░░██╔══╝░░██╔═══╝░██╔══╝░░██╔══██╗
//  ██║░╚═╝░██║██║██║░╚███║███████╗██████╔╝░░╚██╔╝░╚██╔╝░███████╗███████╗██║░░░░░███████╗██║░░██║
//  ╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝

// If a player wants to play the game without staking, we would give him a fake ERC-20 dummy token to start with

// This contract contains information of all the existing games 
// and supports functionalities such as creating new game and maintaining game info
// Creating a game would lead to the creation of a new smart contract which would take care of each game separately

pragma solidity ^0.8.10;

contract Ifactory {
    function createGame() payable public{}
    function forfeitGame(){} 
    function joinGame(){} 
}

contract factory{
    //global state variables
    mapping(address => gameData) gameInfo;          //Every player will be assigned this gameData struct
    mapping(address=>uint256) amountStaked;
    address immutable gameInstance;

    //Events
    event gameCreated( address indexed player1, address indexed amountA  );

    //Structs
    struct gameData{
        address gameAddress; //160bits
        uint96  gameState; //96bits  

    }
    // uint96 gameState gives two separate information bit packed together.
    // It tells whether game exists
    // It tells whether game has started

   

    constructor(){
       gameInstance = ;    
    }

    function createGame() payable public{
        require(msg.value > 0 );                                 // checks if player has given some money
        require(gameInfo[msg.sender].gameStarted == f);          // check if player is involved in another game                        
        amountStaked[msg.sender] = msg.value;                    // set the amountStaked mapping
        emit gameCreated(msg.sender, amountStaked[msg.sender]);        // emit gameCreated event

        // Implement creation of a new instance of the gameLogic contract.
    }

    function forfeitGame(){} 
    function joinGame(){} 
    
    
}

