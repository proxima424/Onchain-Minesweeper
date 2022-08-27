// SPDX-License-Identifier: GPL-3.0

//  ███╗░░░███╗██╗███╗░░██╗███████╗░██████╗░██╗░░░░░░░██╗███████╗███████╗██████╗░███████╗██████╗░
//  ████╗░████║██║████╗░██║██╔════╝██╔════╝░██║░░██╗░░██║██╔════╝██╔════╝██╔══██╗██╔════╝██╔══██╗
//  ██╔████╔██║██║██╔██╗██║█████╗░░╚█████╗░░╚██╗████╗██╔╝█████╗░░█████╗░░██████╔╝█████╗░░██████╔╝
//  ██║╚██╔╝██║██║██║╚████║██╔══╝░░░╚═══██╗░░████╔═████║░██╔══╝░░██╔══╝░░██╔═══╝░██╔══╝░░██╔══██╗
//  ██║░╚═╝░██║██║██║░╚███║███████╗██████╔╝░░╚██╔╝░╚██╔╝░███████╗███████╗██║░░░░░███████╗██║░░██║
//  ╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝

pragma solidity ^0.8.10;

contract gameLogic{
    //global variables

    address immutable factory;

    address playerA,playerB;
    uint256 StakedMoney=0;
    uint256 gameState = 0;

    bool gameStarted;
    uint turn = 0;     //0->game not started, 1-> playera, 2->playerb, 3->gameover


    event gameOver( address winner, address loser);


    constructor(address _playerA, uint256 _amountStaked){
        playerA = _playerA;
        StakedMoney += _amountStaked;
    }

    function joinGame( address _playerB, uint256 _amountStaked ){
        // This function is only callable by the factory contract
        require( msg.sender == factory );
        StakedMoney += _amountStaked;
    }

    //////////////////////// Implementing the game logic ////////////////////////////////// 
    

}