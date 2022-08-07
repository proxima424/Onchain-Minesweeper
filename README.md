# Onchain Two-player Minesweeper ( Under construction)

The famous old pc game Minesweeper with a little modification.
This will be a multi-level game.
Initially, both players stake a certain amount which will be pooled together. Winner gets this pooled amount, incase of draw their amount
will be returned.

In a level L, a square grid of size I will have one  of the tile a trap ( faulty tile ). 
Index of this faulty single tile is to be derived from some randomness. The point being that this index shouldn't be deterministic.
### Think about randomness. More importantly, think of a random number generator which doesn't bias itself towards a subset of the sample space.
Player 1 and Player 2 will both select a single tile from this grid.
Index of the faulty tile won't be computed in the initialization of the grid i.e level L.
Only after both the players have selected this tile will the index of this faulty tile be computed and revealed.






