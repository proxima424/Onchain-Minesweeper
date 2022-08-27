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

contract factory{
    //global variables
    
    mapping(address => bool) gameExists;
    mapping(address => bool) gameStarted;
    mapping(address => address) currentgameAddress;
   


    //events
    event gameCreated( address indexed player1, address indexed amountA  );

    constructor(){
       
    }

    function createGame() payable public{
        require(msg.value > 0 );                                 // checks if player has associated some money
        require(gameExists[msg.sender] == false);                // check if player is involved in another game 
        gameExists[playerA] =  true;                             
        amountStaked[playerA] = msg.value;                       // set the amountStaked mapping
        emit gameCreated(playerA, amountStaked[playerA]);        // emit gameCreated event

        // Implement creation of a new instance of the gameLogic contract.
    }

    function forfeitGame(){
        // A player can end the game by forfeiting at any time
        // Amount staked will go to the other player. Hahahahahhahaha
    } 

    
    function joinGame( address _playerA ){
        //This function will take address of the player who created the game.
        //This new player will be able to join this game only if he commits to a amount greater than or equal to what playerA commited
        require( msg.value => amountStaked[address]);
        require( gameStarted[_playerA] == false );
        
        // call the gameLogic contract associated with playerA and associate the msg.sender with it
    } 
    
    
}

