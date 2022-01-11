class Queen extends Piece{
  
  
  
  Queen(int x, int y, boolean white){
    super(x,y);
    this.white = white;
    empty = false;
    if(white){
       image = white_queen; 
    }
    else{
       image = black_queen; 
    }
  }
  
  
  double getScore(){
    
    if(x >= 3 && x<=4 && y>=3 && y <=4){
     return 10;
   }
   else{
     return 9;
   }
  }
  
  
    void findMoves(Piece[][] pieces,  boolean isWhite) {
    moves.clear();
    int i;
    int j;

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
  
