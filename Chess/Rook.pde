class Rook extends Piece {



  Rook(int x, int y, boolean white) {
    super(x, y);
    this.white = white;
    empty = false;
    if (white) {
      image = white_rook;
    } else {
      image = black_rook;
    }
  }


  double getScore() {

    if(x >= 3 && x<=4 && y>=3 && y <=4){
     return 5.5;
   }
   else if(!moved){
    return 6; 
   }
   else{
     return 5;
   }
  }



  void findMoves(Piece[][] pieces, boolean isWhite) {
    moves.clear();
    int i;

    if (isWhite) {
      //checking up
      i = y -1;
      while (i >= 0) {
        if (pieces[x][i].empty) {
          moves.add(new Move(x, i));
        } else {
          if (!pieces[x][i].white) {
            moves.add(new Move(x, i));
          }
          //automatically stops the loop
          i -= 12;
        }
        i --;
      }

      //checking down
      i = y +1;
      while (i < 8) {
        if (pieces[x][i].empty) {
          moves.add(new Move(x, i));
        } else {
          if (!pieces[x][i].white) {
            moves.add(new Move(x, i));
          }
          //automatically stops the loop
          i += 12;
        }
        i ++;
      }

      i = x -1;
      while (i >= 0) {
        if (pieces[i][y].empty) {
          moves.add(new Move(i, y));
        } else {
          if (!pieces[i][y].white) {
            moves.add(new Move(i, y));
          }
          //automatically stops the loop
          i -= 12;
        }
        i --;
      }

      //checking down
      i = x +1;
      while (i < 8) {
        if (pieces[i][y].empty) {
          moves.add(new Move(i, y));
        } else {
          if (!pieces[i][y].white) {
            moves.add(new Move(i, y));
          }
          //automatically stops the loop
          i += 12;
        }
        i ++;
      }
    }
    //Black pieces
    else {
      //checking up
      i = y -1;
      while (i >= 0) {
        if (pieces[x][i].empty) {
          moves.add(new Move(x, i));
        } else {
          if (pieces[x][i].white) {
            moves.add(new Move(x, i));
          }
          //automatically stops the loop
          i -= 12;
        }
        i --;
      }

      //checking down
      i = y +1;
      while (i < 8) {
        if (pieces[x][i].empty) {
          moves.add(new Move(x, i));
        } else {
          if (pieces[x][i].white) {
            moves.add(new Move(x, i));
          }
          //automatically stops the loop
          i += 12;
        }
        i ++;
      }

      i = x -1;
      while (i >= 0) {
        if (pieces[i][y].empty) {
          moves.add(new Move(i, y));
        } else {
          if (pieces[i][y].white) {
            moves.add(new Move(i, y));
          }
          //automatically stops the loop
          i -= 12;
        }
        i --;
      }

      //checking down
      i = x +1;
      while (i < 8) {
        if (pieces[i][y].empty) {
          moves.add(new Move(i, y));
        } else {
          if (pieces[i][y].white) {
            moves.add(new Move(i, y));
          }
          //automatically stops the loop
          i += 12;
        }
        i ++;
      }
    }
  }
}
