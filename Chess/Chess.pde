
int size= 60;
Board board;
Board boardCpy;
int aiX1, aiX2, aiY1, aiY2;
boolean moved = false;

void setup() {


  loadImages();
  size(480, 480);
  board = new Board(size, true, true); 
  board.createBoard();
}


void draw() {

  board.drawGrid();
  if (board.whiteMoving) {
    fill(100, 100, 0);
    if (moved) {
      rect(aiX1*size, aiY1*size, size, size);
      rect(aiX2*size, aiY2*size, size, size);
    }
    board.whiteMove();
  } else if (board.blackMoving) {


    if (!moved) {
      moved = true;
    }
    boardCpy = new Board(60, false, false);
    boardCpy = copyBoard( board);
    miniMax(boardCpy, 5, -9999, 9999, false);
    aiX1 = boardCpy.minimaxMove.x1;
    aiX2 = boardCpy.minimaxMove.x2;
    aiY1 = boardCpy.minimaxMove.y1;
    aiY2 = boardCpy.minimaxMove.y2;
    board.move(boardCpy.minimaxMove.x1, boardCpy.minimaxMove.y1, boardCpy.minimaxMove.x2, boardCpy.minimaxMove.y2);
    board.findAllMoves(true);

    board.whiteMoving = true;
    board.blackMoving = false;
  }
  board.checkWin();
  board.drawPieces();
  if (board.blackWin ) {
    textAlign(CENTER, CENTER);
    textSize(15);
    fill(0);
    text("Black Wins! press any key to play again", width/2, height/2); 
    if (keyPressed) {
      board.createBoard();
    }
  } else if (board.whiteWin) {
    textAlign(CENTER, CENTER);
    textSize(15);
    fill(0);
    text("White Wins! press any key to play again", width/2, height/2); 
    if (keyPressed) {
      board.createBoard();
    }
  } else  if (board.blackMoving) {
    textAlign(CENTER, CENTER);
    textSize(60);
    fill(0);
    text("Thinking.....", width/2, height/2);
  }
}


double miniMax(Board b, int depth, double alpha, double beta, boolean white) {
  b.checkWin();

  if (depth == 0 || b.blackWin || b.whiteWin) {

    return b.getScore();
  }

  if (white) {
    double bestVal = -999999;
    b.findAllMoves(true);
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (b.pieces[i][j].white && !b.pieces[i][j].empty) {
          for (int k = 0; k < b.pieces[i][j].moves.size(); k ++) {
            Board c = new Board(60, false, false);
            c = copyBoard( b);

            c.move(b.pieces[i][j].x, b.pieces[i][j].y, b.pieces[i][j].moves.get(k).x, b.pieces[i][j].moves.get(k).y);

            double value = miniMax(c, depth-1, alpha, beta, false);
            if (value > bestVal) {
              bestVal = value;
              b.minimaxMove.x1 = b.pieces[i][j].x;
              b.minimaxMove.y1 = b.pieces[i][j].y;
              b.minimaxMove.x2 = b.pieces[i][j].moves.get(k).x;
              b.minimaxMove.y2 = b.pieces[i][j].moves.get(k).y;
            }

            if (value >= beta) {
              return value;
            }
            if (value > alpha) {
              alpha = value;
            }
          }
        }
      }
    }
    return bestVal;
  } else {

    double bestVal = 99999999;

    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (!b.pieces[i][j].white && !b.pieces[i][j].empty) {
          for (int k = 0; k < b.pieces[i][j].moves.size(); k ++) {
            Board c = new Board(60, false, false);

            c = copyBoard(b);
            c.move(b.pieces[i][j].x, b.pieces[i][j].y, b.pieces[i][j].moves.get(k).x, b.pieces[i][j].moves.get(k).y);

            double value = miniMax(c, depth-1, alpha, beta, true);
            if (value < bestVal) {
              bestVal = value;

              b.minimaxMove.x1 = b.pieces[i][j].x;
              b.minimaxMove.y1 = b.pieces[i][j].y;
              b.minimaxMove.x2 = b.pieces[i][j].moves.get(k).x;
              b.minimaxMove.y2 = b.pieces[i][j].moves.get(k).y;
            }

            if (value <= alpha) {
              return value;
            }
            if (value < beta) {
              beta = value;
            }
          }
        }
      }
    }
    return bestVal;
  }
}



Board copyBoard( Board b) {
  Board a = new Board(60, false, false);
  for (int i =0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {

      if (b.pieces[i][j].empty) {
        a.pieces[i][j] = new Piece(b.pieces[i][j].x, b.pieces[i][j].y);
      } else {

        if (b.pieces[i][j] instanceof Pawn) {
          a.pieces[i][j] = new Pawn(b.pieces[i][j].x, b.pieces[i][j].y, b.pieces[i][j].white);
        } else if (b.pieces[i][j] instanceof Bishop) {
          a.pieces[i][j] = new Bishop(b.pieces[i][j].x, b.pieces[i][j].y, b.pieces[i][j].white);
        } else if (b.pieces[i][j] instanceof Knight) {
          a.pieces[i][j] = new Knight(b.pieces[i][j].x, b.pieces[i][j].y, b.pieces[i][j].white);
        } else if (b.pieces[i][j] instanceof Rook) {
          a.pieces[i][j] = new Rook(b.pieces[i][j].x, b.pieces[i][j].y, b.pieces[i][j].white);
        } else if (b.pieces[i][j] instanceof King) {

          a.pieces[i][j] = new King(b.pieces[i][j].x, b.pieces[i][j].y, b.pieces[i][j].white);
        } else if (b.pieces[i][j] instanceof Queen) {
          a.pieces[i][j] = new Queen(b.pieces[i][j].x, b.pieces[i][j].y, b.pieces[i][j].white);
        }
      }
      a.pieces[i][j].image = b.pieces[i][j].image;

      a.pieces[i][j].moved = b.pieces[i][j].moved;
      a.pieces[i][j].white = b.pieces[i][j].white;
      a.pieces[i][j].empty = b.pieces[i][j].empty;
      a.pieces[i][j].selected = b.pieces[i][j].selected;
    }
  }
  a.findAllMoves(true);
  a.findAllMoves(false);
  return a;
}



//stores the move for minimax
class aiMove {

  int x1, y1, x2, y2, score;

  aiMove(int x1, int y1, int x2, int y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }
}
