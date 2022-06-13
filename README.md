# APCS_Final_Chess
### Cd Projekt Chess: Brian Yang and Anson Wong
### Brief Description:
Our plan is to create a chess game that follows most of the standard rules of the game in Processing. All of the gameplay such as the movement of chess pieces and forfeiting will be done using the keyboard inputs. Complicated game outcomes like stalemate with many pieces remaining and moves like en passant and castling will be nice to have features but will not be a priority. What will be a priority is by making a playable game of chess that closely resembles actual chess.<br>
### [Prototype Here](https://docs.google.com/document/d/1grKeZeHldpE-cCBicYMR9spisFDGOOUnQsajPrm6ZLQ/edit)
### Compile/Run Instructions:
To be run in processing. To start the game, enter in the name of the first and second player. To play, follow standard rules of chess and type in the location of the piece you want to move and then where you want to move it to. Pressing f during your turn will allow you to forfeit the match, pressing r resets the board, pressing c will allow the player to change the color of the board, pressing n will allow the player to display the name of the chess piece.
### Development Log
##### 5/23/2022
Anson: Worked on readme and added basic information like names, link, basic instructions
##### 5/24/2022
Brian: Created the base files for all the classes.
##### 5/25/2022
Brian: Created Square class and then the Board class. Also added the locational indicators for the chessboard.
##### 5/26/2022
Brian: Added reset method to game board and a title screen
Anson: Added the chess pieces
##### 5/27/2022
Anson: Started pieces class and made child classes
##### 5/29/2022
Anson: Resolved merge conflict
##### 5/30/2022
Brian: Added pieces to the game board and created movement of the pieces using strings
Anson: Started movement and created method to know what piece was being moved
##### 5/31/2022
Brian: Added a reset board method and a prompt for the players names
Anson: Restricted movement according to game rules for pawns, rooks, and knights
##### 6/1/2022
Brian: Added a way so that you cannot try to move pieces into invalid locations (off the game board)
Anson: Fixed knight movement
##### 6/2/2022
Anson: Changed method of moving pieces
##### 6/3/2022
Anson: Changed UML diagram
##### 6/7/2022
Brian: Implemented movement for knight that works
##### 6/8/2022
Brian: Added free movement of Bishop that doesn't check collisions (Will check in future)
##### 6/11/2022
Brian: Finished movement on all the pieces and added QoL features such as being able to see what piece you've selected and a graveyard of all the captured pieces. Fixed pieces being able to move to its on square and that counting as a move.
##### 6/12/2022
Brian: Added win screen and timer. Win screen is displayed when timer runs out or king is capture (Will be changed into king is checkmated). Amount of timer is also able to be created by taking user input.
Anson: Started checks
##### 6/13/2022
Anson: Added checkmating
