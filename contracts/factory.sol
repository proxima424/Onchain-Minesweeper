// SPDX-License-Identifier: GPL-3.0

//  ███╗░░░███╗██╗███╗░░██╗███████╗░██████╗░██╗░░░░░░░██╗███████╗███████╗██████╗░███████╗██████╗░
//  ████╗░████║██║████╗░██║██╔════╝██╔════╝░██║░░██╗░░██║██╔════╝██╔════╝██╔══██╗██╔════╝██╔══██╗
//  ██╔████╔██║██║██╔██╗██║█████╗░░╚█████╗░░╚██╗████╗██╔╝█████╗░░█████╗░░██████╔╝█████╗░░██████╔╝
//  ██║╚██╔╝██║██║██║╚████║██╔══╝░░░╚═══██╗░░████╔═████║░██╔══╝░░██╔══╝░░██╔═══╝░██╔══╝░░██╔══██╗
//  ██║░╚═╝░██║██║██║░╚███║███████╗██████╔╝░░╚██╔╝░╚██╔╝░███████╗███████╗██║░░░░░███████╗██║░░██║
//  ╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝

// If a player wants to play the game without staking, we would give him a fake ERC-20 dummy token to start with
pragma solidity ^0.8.10;

contract factory{
    //global variables
    address playerA;
    address playerB;
    bool gameStarted = false;
    uint turn = 0; //0->game not started, 1-> playera, 2->playerb, 3->gameover
    mapping(address => bool) gameExists;
    mapping(address => uint256) amountStaked;
    mapping(uint => address) gameState; //1 to 25
    uint bomb_tile = 0;

    //events
    event gameCreated( address indexed player, uint amount );
    event gameOver( address indexed player); //player lost
    event next_player_turn(address player); //turn of player
    event game_started();

    constructor(){
        playerA = msg.sender;
        gameStarted = false;
        bomb_tile = returnRandomNumber();
    }

    function createNewGame() payable public {
        require(playerA != address(0));
        gameStarted = false;
        gameExists[playerA] =  true;
        amountStaked[playerA] = msg.value;
        emit gameCreated(playerA, amountStaked[playerA]);
    }
 
    function joinGame( address _playerB ) payable public {
        playerB = _playerB;
        require(msg.value >= amountStaked[playerA]);
        gameExists[playerB] =  true;
        amountStaked[playerB] = msg.value;
        emit gameCreated(playerB, amountStaked[playerB]);
    } 

    function start_game() public {
        require(playerA != address(0));
        require(playerB != address(0));
        gameStarted = true;
        emit game_started();
    }

    function get_player_id(address player) public view returns (uint){
        require(gameStarted == true);
        require(turn != 0 && turn != 3);
        if(player == playerA) {
            return 1;
        }
        else{
            return 2;
        }
    }
    
    function returnRandomNumber() public returns(uint256){
        return 4;
    }

    function updateGameState() public returns(uint) {
        if(gameState[bomb_tile] != address(0)) {
            return 3;
        }
        else if(turn == 1){
            emit next_player_turn(playerB);
            return 2;
        }
        else{
            emit next_player_turn(playerA);
            return 1;
        }
    }

    function move(uint pos) public {
        require(gameStarted == true, "Wait for player 2 to join.");
        require(msg.sender == playerA || msg.sender == playerB, "You are not a participant.");
        require(turn!=0 && turn!=3);
        require(turn == get_player_id(msg.sender));
        require(pos>=1 && pos<=25);
        require(gameState[pos] == address(0), "This tile is already used");
        gameState[pos] = msg.sender;
        turn = updateGameState();
        if(turn == 3){
            emit gameOver(msg.sender);
            //transfer money
            //stop game
        }
    } 

}
