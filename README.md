# Onchain Two-player Minesweeper ( Under construction)

The famous old pc game Minesweeper with a little modification.
This will be a multi-level game.
Initially, both players stake a certain amount which will be pooled together. Winner gets this pooled amount, incase of draw, their amount
will be returned.

### Think of generalising it for grid size i.

A square grid of size 5*5  will have one  of the tile a trap ( faulty tile ). 
Index of this faulty single tile is to be derived from some randomness. The point being that this index shouldn't be deterministic.
### Think about randomness. More importantly, think of a random number generator which doesn't bias itself towards a subset of the sample space.
Player 1 and Player 2 will both select a single tile from this grid turn by turn.

## Bitmasking
Let's denote state of the gameBoard by 1 + 5*5 = 26 bits.

               0           00000      00000     00000    00000     00000
        [ player's turn] [5th row]  [4th row] [3rd row] [2nd row] [1st row]

        Left-most bit indicates which player has recently played. 
        0 for playerA and 1 for playerB.
        First 25 bits indicates state of the gameBoard. 
        0 means not yet marked and 1 stands for marked tile.
        After each turn, this gameBoard  will be checked against the "endgameBoard" bits. 

### How to determine this endgameBoard?
Faulty tile bit = Random number % 26


