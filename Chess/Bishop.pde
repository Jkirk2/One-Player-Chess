class Bishop extends Piece {



  Bishop(int x, int y, boolean white) {
    super(x, y);
    this.white = white;
    empty = false;
    if (white) {
      image = white_bishop;
    } else {
      image = black_bishop;
    }
  }

  double getScore() {
     if(x >= 3 && x<=4 && y>=3 && y <=4){
     return 3.5;
   }
   else{
    return 3; 
   }
  }


  void findMoves(Piece[][] pieces,  boolean isWhite) {
    moves.clear();
    int i;
    int j;
    if (isWhite) {


      //right down
      i = x+1;
      j = y+1;
      while (i < 8 && j < 8) {
        if (pieces[i][j].empty) {
          moves.add(new  Move(i, j));
          i++;
          j++;
        } else if (!pieces[i][j].white) {
          moves.add(new  Move(i, j));
          i += 20;
        } else {
          i += 20;
        }
      }

      //left down
      i = x-1;
      j = y+1;
      while (i >= 0 && j < 8) {
        if (pieces[i][j].empty) {
          moves.add(new  Move(i, j));
          i--;
          j++;
        } else if (!pieces[i][j].white) {
          moves.add(new  Move(i, j));
          i -=20;
        } else {
          i -= 20;
        }
      }


      //right up
      i = x+1;
      j = y-1;
      while (i < 8 && j >= 0) {
        if (pieces[i][j].empty) {
          moves.add(new  Move(i, j));
          i++;
          j--;
        } else if (!pieces[i][j].white) {
          moves.add(new  Move(i, j));
          i += 20;
        } else {
          i += 20;
        }
      }

      //left up
      i = x-1;
      j = y-1;
      while (i >= 0 && j >= 0) {
        if (pieces[i][j].empty) {
          moves.add(new  Move(i, j));
          i--;
          j--;
        } else if (!pieces[i][j].white) {
          moves.add(new  Move(i, j));
          i -=20;
        } else {
          i -= 20;
        }
      }
    } else {


      //right down
      i = x+1;
      j = y+1;
      while (i < 8 && j < 8) {
        if (pieces[i][j].empty) {
          moves.add(new  Move(i, j));
          i++;
          j++;
        } else if (pieces[i][j].white) {
          moves.add(new  Move(i, j));
          i += 20;
        } else {
          i += 20;
        }
      }

      //left down
      i = x-1;
      j = y+1;
      while (i >= 0 && j < 8) {
        if (pieces[i][j].empty) {
          moves.add(new  Move(i, j));
          i--;
          j++;
        } else if (pieces[i][j].white) {
          moves.add(new  Move(i, j));
          i -=20;
        } else {
          i -= 20;
        }
      }


      //right up
      i = x+1;
      j = y-1;
      while (i < 8 && j >= 0) {
        if (pieces[i][j].empty) {
          moves.add(new  Move(i, j));
          i++;
          j--;
        } else if (pieces[i][j].white) {
          moves.add(new  Move(i, j));
          i += 20;
        } else {
          i += 20;
        }
      }

      //left up
      i = x-1;
      j = y-1;
      while (i >= 0 && j >= 0) {
        if (pieces[i][j].empty) {
          moves.add(new  Move(i, j));
          i--;
          j--;
        } else if (pieces[i][j].white) {
          moves.add(new  Move(i, j));
          i -=20;
        } else {
          i -= 20;
        }
      }
    }
  }
}
