
class Board {

  //scores of both sides
  double whiteScore;
  double blackScore;

  //selected square
  int xSelected;
  int ySelected;

  aiMove minimaxMove;

  //boolean for players
  boolean blackPlayer;
  boolean whitePlayer;

  boolean blackQcas;
  boolean blackKcas;
  boolean whiteQcas;
  boolean whiteKcas;

  //checks to see if player is still selecting move
  boolean blackMoving = false;
  boolean whiteMoving = false;

  boolean blackWin = false;
  boolean whiteWin = false;

  //2d array of Piece objects
  Piece[][] pieces;
  int size; // size of square
  boolean selectedPiece = false; // check if player is moving piece
  int clickTimer;
  Board(int size, boolean whitePlayer, boolean blackPlayer) {
    whiteScore = 0;
    blackScore = 0;
    pieces = new Piece[8][8];
    this.size =  size;
    this.whitePlayer = whitePlayer;
    this.blackPlayer = blackPlayer;
    minimaxMove = new aiMove(0, 0, 0, 0);
  }


  void checkCastle() {
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if ( pieces[i][j] instanceof King && !pieces[i][j].moved) {

          if ( pieces[i][j].white && pieces[i+3][j].white && !pieces[i+3][j].moved && pieces[i+3][j] instanceof Rook && pieces[i+1][j].empty && pieces[i+2][j].empty) {

            whiteKcas = true;
            
            for (int k = 0; k < 8; k++) {
              for (int l = 0; l < 8; l++) {
                if (pieces[k][l].white == false && pieces[k][l].moves.size() > 0)
                {
                  for (int m = 0; m < pieces[k][l].moves.size(); m++) {
                    if (pieces[k][l].moves.get(m).y == 7 && (pieces[k][l].moves.get(m).x == i || pieces[k][l].moves.get(m).x == i+1 || pieces[k][l].moves.get(m).x == i+2)) {
                      whiteKcas = false;
                     
                    }
                  }
                }
              }
            }
          } else if ( pieces[i][j].white && pieces[i-4][j].white && !pieces[i-4][j].moved && pieces[i-4][j] instanceof Rook && pieces[i-1][j].empty && pieces[i-2][j].empty && pieces[i-3][j].empty) {

            whiteQcas = true;
            for (int k = 0; k < 8; k++) {
              for (int l = 0; l < 8; l++) {
                if (!pieces[k][l].white && pieces[k][l].moves.size() > 0)
                {
                  for (int m = 0; m < pieces[k][l].moves.size(); m++) {
                    if (pieces[k][l].moves.get(m).y == 7 &&( pieces[k][l].moves.get(m).x == i || pieces[k][l].moves.get(m).x == i-1 || pieces[k][l].moves.get(m).x == i-2)) {
                      whiteQcas = false;
                    }
                  }
                }
              }
            }
          } else if ( !pieces[i][j].white && !pieces[i+3][j].white && !pieces[i+3][j].moved && pieces[i+3][j] instanceof Rook && pieces[i+1][j].empty && pieces[i+2][j].empty) {

            blackKcas = true;
            for (int k = 0; k < 8; k++) {
              for (int l = 0; l < 8; l++) {
                if (pieces[k][l].white && pieces[k][l].moves.size() > 0)
                {
                  for (int m = 0; m < pieces[k][l].moves.size(); m++) {
                    if (pieces[k][l].moves.get(m).y == 0 && (pieces[k][l].moves.get(m).x == i || pieces[k][l].moves.get(m).x == i+1 || pieces[k][l].moves.get(m).x == i+2)) {
                      blackKcas = false;
                    }
                  }
                }
              }
            }
          } else if ( !pieces[i][j].white && !pieces[i-4][j].white && !pieces[i-4][j].moved && pieces[i-4][j] instanceof Rook && pieces[i-1][j].empty && pieces[i-2][j].empty && pieces[i-3][j].empty) {

            blackQcas = true;
            for (int k = 0; k < 8; k++) {
              for (int l = 0; l < 8; l++) {
                if (pieces[k][l].white && pieces[k][l].moves.size() > 0)
                {
                  for (int m = 0; m < pieces[k][l].moves.size(); m++) {
                    if (pieces[k][l].moves.get(m).y == 0 &&( pieces[k][l].moves.get(m).x == i || pieces[k][l].moves.get(m).x == i-1 || pieces[k][l].moves.get(m).x == i-2 )) {
                      blackQcas = false;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    
  }

  void queenSideCastle(boolean white) {
    int yPos = 0;
    if (white) {
      yPos = 7;
      whiteQcas = false;
      whiteKcas = false;
      
    }
    else{
     blackQcas = false; 
     blackKcas = false;
    }

    move(4, yPos, 2, yPos);
    move(0, yPos, 3, yPos);
    
    
  }

  void kingSideCastle(boolean white) {
    int yPos = 0;
    if (white) {
      yPos = 7;
      whiteKcas = false;
      whiteKcas = false;
    }
    else{
     blackKcas = false; 
     blackQcas = false;
    }

    move(4, yPos, 6, yPos);
    move(7, yPos, 5, yPos);
  }






  void createBoard() {
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        pieces[i][j] = new Piece(i, j);
      }
    }
    //black pieces
    pieces[0][0] = new Rook(0, 0, false);
    pieces[1][0] = new Knight(1, 0, false);
    pieces[2][0] = new Bishop(2, 0, false);
    pieces[3][0] = new Queen(3, 0, false);
    pieces[4][0] = new King(4, 0, false);
    pieces[5][0] = new Bishop(5, 0, false);
    pieces[6][0] = new Knight(6, 0, false);
    pieces[7][0] = new Rook(7, 0, false);
    //black pawns
    for (int i = 0; i < 8; i++) {
      pieces[i][1] = new Pawn(i, 1, false);
    }

    //black pieces
    pieces[0][7] = new Rook(0, 7, true);
    pieces[1][7] = new Knight(1, 7, true);
    pieces[2][7] = new Bishop(2, 7, true);
    pieces[3][7] = new Queen(3, 7, true);
    pieces[4][7] = new King(4, 7, true);
    pieces[5][7] = new Bishop(5, 7, true);
    pieces[6][7] = new Knight(6, 7, true);
    pieces[7][7] = new Rook(7, 7, true);
    //black pawns
    for (int i = 0; i < 8; i++) {
      pieces[i][6] = new Pawn(i, 6, true);
    }
    blackWin = false;
    whiteWin = false;
    if (whitePlayer) {
      findAllMoves(true);
      whiteMoving = true;
    }
  }


  void drawPieces() {
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {

        pieces[i][j].draw();
      }
    }
  }

  void findAllMoves(boolean isWhite) {
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (isWhite) {
          if (pieces[i][j].white) {
            pieces[i][j].findMoves(pieces, isWhite);
          }
        } else {
          if (!pieces[i][j].white) {
            pieces[i][j].findMoves(pieces, isWhite);
          }
        }
      }
    }
  }



  //checks for mouseover of piece, clicking of piece, and shows selected piece and legal moves
  boolean checkSelected(boolean whiteTurn) {


    if (selectedPiece == false) {
      xSelected = mouseX/size;
      ySelected = mouseY/size;

      clickTimer --;
      fill(0, 100, 0);

      if (mousePressed && clickTimer < 0) {
        if (whiteTurn) {
          if (!pieces[xSelected][ySelected].empty && pieces[xSelected][ySelected].white) {
            pieces[xSelected][ySelected].selected = true;
            selectedPiece = true;
          }
        } else {
          if (!pieces[xSelected][ySelected].empty && !pieces[xSelected][ySelected].white) {
            pieces[xSelected][ySelected].selected = true;
            selectedPiece = true;
          }
        }
        clickTimer = 10;
      }
      rect(xSelected *size, ySelected*size, size, size);
    } else {
      clickTimer --;
      int moveChoiceX = mouseX/size;
      int moveChoiceY = mouseY/size;
      fill(100, 0, 0);

      pieces[xSelected][ySelected].displayX = moveChoiceX;
      pieces[xSelected][ySelected].displayY = moveChoiceY;
      rect(xSelected * size, ySelected * size, size, size);
      fill(0, 100, 0); 
      for (int i = 0; i < pieces[xSelected][ySelected].moves.size(); i++ ) {

        rect(pieces[xSelected][ySelected].moves.get(i).x * size, pieces[xSelected][ySelected].moves.get(i).y * size, size, size);
      }
      if (pieces[xSelected][ySelected] instanceof King ) {
        if (whiteTurn) {
          if (whiteKcas) {
            rect((xSelected+2) * size, ySelected*size, size, size);
            
          }
          if (whiteQcas) {
            rect((xSelected-2) * size, ySelected*size, size, size);
             
          }
        }
      }


      if (mousePressed && clickTimer < 0) {

        if (moveChoiceX == xSelected && moveChoiceY == ySelected) {

          selectedPiece = false;
          clickTimer = 10;
        } else {

          for (int i = 0; i < pieces[xSelected][ySelected].moves.size(); i++ ) {
            if (pieces[xSelected][ySelected].moves.get(i).y == moveChoiceY && pieces[xSelected][ySelected].moves.get(i).x == moveChoiceX) {
              move(xSelected, ySelected, moveChoiceX, moveChoiceY);
              clickTimer = 10;
              selectedPiece = false;
              if (whiteTurn) {
                findAllMoves(false);
              } else {
                findAllMoves(true);
              }
              return true;
            } else if (pieces[xSelected][ySelected] instanceof King && whiteKcas && moveChoiceX == xSelected+2 && moveChoiceY == ySelected) {
              kingSideCastle(true);
              selectedPiece = false;
              if (whiteTurn) {
                findAllMoves(false);
              } else {
                findAllMoves(true);
              }
              return true;
            } else if (pieces[xSelected][ySelected] instanceof King && whiteQcas && moveChoiceX == xSelected-2 && moveChoiceY == ySelected) {
              queenSideCastle(true);
              selectedPiece = false;
              if (whiteTurn) {
                findAllMoves(false);
              } else {
                findAllMoves(true);
              }
              return true;
            }
          }
        }
      }
    }
    return false;
  }


  void move(int x1, int y1, int x2, int y2) {
    if (pieces[x1][y1] instanceof  Pawn && pieces[x1][y1].white && y1 == 1 && y2 == 0) {
      pieces[x2][y2] = new Queen(x2, y2, true);
      pieces[x1][y1] = new Piece(x1, y1);
    } else if (pieces[x1][y1] instanceof  Pawn && !pieces[x1][y1].white && y1 == 6 && y2 == 7) {
      pieces[x2][y2] = new Queen(x2, y2, false);
      pieces[x1][y1] = new Piece(x1, y1);
    } else {
      pieces[x1][y1].x = x2;
      pieces[x1][y1].y = y2;
      pieces[x2][y2] = pieces[x1][y1];
      pieces[x2][y2].moved = true;
      pieces[x2][y2].resetPos();
      pieces[x1][y1] = new Piece(x1, y1);
    }
    findAllMoves(true);
    findAllMoves(false);
  }
  void whiteMove() {
    if (checkSelected(true)) {
      if (blackPlayer) {
        blackMoving = true;
      }
      findAllMoves(false);
      findAllMoves(true);
      whiteMoving = false;
      checkCastle();
    }
  }
  void blackMove() {

    if (checkSelected(false)) {
      if (whitePlayer) {
        whiteMoving = true;
      }
      findAllMoves(true);
      findAllMoves(false);
      checkCastle();
      blackMoving = false;
    }
  }





  void drawGrid() {

    int fill = 0;
    for (int i = 0; i < 8; i++) {

      if (fill == 255) {
        fill = 200;
      } else {
        fill = 255;
      }

      for (int j = 0; j < 8; j++) {
        fill(fill);
        rect(j*size, i*size, size, size);
        if (fill == 255) {
          fill = 200;
        } else {
          fill = 255;
        }
      }
    }
  }

  //black is negative, white is positive
  double getScore() {
    double total = 0;
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (!pieces[i][j].empty) {
          if (pieces[i][j].white) {
            total = total += pieces[i][j].getScore();
          } else {
            total = total-= pieces[i][j].getScore();
          }
        }
      }
    }
    return total;
  }

  void checkWin() {
    whiteWin = true;
    blackWin = true;
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {

        if (pieces[i][j] instanceof King) {
          if (pieces[i][j].white) {
            blackWin = false;
          } else {
            whiteWin = false;
          }
        }
      }
    }
  }
}
