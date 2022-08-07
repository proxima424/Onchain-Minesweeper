// SPDX-License-Identifier: GPL-3.0

//  ███╗░░░███╗██╗███╗░░██╗███████╗░██████╗░██╗░░░░░░░██╗███████╗███████╗██████╗░███████╗██████╗░
//  ████╗░████║██║████╗░██║██╔════╝██╔════╝░██║░░██╗░░██║██╔════╝██╔════╝██╔══██╗██╔════╝██╔══██╗
//  ██╔████╔██║██║██╔██╗██║█████╗░░╚█████╗░░╚██╗████╗██╔╝█████╗░░█████╗░░██████╔╝█████╗░░██████╔╝
//  ██║╚██╔╝██║██║██║╚████║██╔══╝░░░╚═══██╗░░████╔═████║░██╔══╝░░██╔══╝░░██╔═══╝░██╔══╝░░██╔══██╗
//  ██║░╚═╝░██║██║██║░╚███║███████╗██████╔╝░░╚██╔╝░╚██╔╝░███████╗███████╗██║░░░░░███████╗██║░░██║
//  ╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝

// If a player wants to play the game without staking, we would give him a fake ERC-20 dummy token to start with
pragma solidity >=0.7.0 <0.9.0;

contract factory{
    //global variables
    address playerA,playerB;
    mapping(address => bool) gameExists;
    mapping(address => uint256) amountStaked;
    //events
    event gameCreated( address indexed player1, address indexed amountA  );

    function createNewGame payable public (){
        // check the gameExists mapping
        // set the amountStaked mapping
        // emit gameCreated event
    }


     //This function will take address of the player who created the game.
     //This new player will be able to join this game only if he commits to a amount greater than or equal to what playerA commited
    function joinGame( address _playerA ){
        require( msg.value => amountStaked[address]);
        // A mapping to begin the game maybe?
    }                     
}

