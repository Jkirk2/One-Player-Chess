class Knight extends Piece {



  Knight(int x, int y, boolean white) {
    super(x, y);
    this.white = white;
    empty = false;
    if (white) {
      image = white_knight;
    } else {
      image = black_knight;
    }
  }
  
  double getScore(){
    if(x >= 3 && x<=4 && y>=3 && y <=4){
     return 3.5;
   }
   else{
     return 3;
   }
    
  }

  void findMoves(Piece[][] pieces,  boolean isWhite) {
    moves.clear();

    if (isWhite) {
      //left
      if (x-2 >= 0) {
        if (y-1 >= 0) {
          if (pieces[x-2][y-1].empty ||  !pieces[x-2][y-1].white) {
            moves.add(new Move(x-2, y-1));
          }
        }

        if (y+1 < 8) {
          if (pieces[x-2][y+1].empty ||  !pieces[x-2][y+1].white) {
            moves.add(new Move(x-2, y+1));
          }
        }
      }
      //right
      if (x+2 < 8) {
        if (y-1 >= 0) {
          if (pieces[x+2][y-1].empty ||  !pieces[x+2][y-1].white) {
            moves.add(new Move(x+2, y-1));
          }
        }

        if (y+1 < 8) {
          if (pieces[x+2][y+1].empty ||  !pieces[x+2][y+1].white) {
            moves.add(new Move(x+2, y+1));
          }
        }
      }

      //down
      if (y+2 < 8) {
        if (x - 1 >= 0) {
          if (pieces[x-1][y+2].empty || !pieces[x-1][y+2].white) {
            moves.add(new Move(x-1, y+2));
          }
        }

        if (x + 1  < 8) {
          if (pieces[x+1][y+2].empty || !pieces[x+1][y+2].white) {
            moves.add(new Move(x+1, y+2));
          }
        }

      }
      //up
       if (y-2 >= 0) {
        if (x - 1 >= 0) {
          if (pieces[x-1][y-2].empty || !pieces[x-1][y-2].white) {
            moves.add(new Move(x-1, y-2));
          }
        }

        if (x + 1  < 8) {
          if (pieces[x+1][y-2].empty || !pieces[x+1][y-2].white) {
            moves.add(new Move(x+1, y-2));
          }
        }

      }




        //black

      }
      else{
        
              //left
      if (x-2 >= 0) {
        if (y-1 >= 0) {
          if (pieces[x-2][y-1].empty ||  pieces[x-2][y-1].white) {
            moves.add(new Move(x-2, y-1));
          }
        }

        if (y+1 < 8) {
          if (pieces[x-2][y+1].empty ||  pieces[x-2][y+1].white) {
            moves.add(new Move(x-2, y+1));
          }
        }
      }
      //right
      if (x+2 < 8) {
        if (y-1 >= 0) {
          if (pieces[x+2][y-1].empty ||  pieces[x+2][y-1].white) {
            moves.add(new Move(x+2, y-1));
          }
        }

        if (y+1 < 8) {
          if (pieces[x+2][y+1].empty ||  pieces[x+2][y+1].white) {
            moves.add(new Move(x+2, y+1));
          }
        }
      }

      //down
      if (y+2 < 8) {
        if (x - 1 >= 0) {
          if (pieces[x-1][y+2].empty || pieces[x-1][y+2].white) {
            moves.add(new Move(x-1, y+2));
          }
        }

        if (x + 1  < 8) {
          if (pieces[x+1][y+2].empty || pieces[x+1][y+2].white) {
            moves.add(new Move(x+1, y+2));
          }
        }

      }
      //up
       if (y-2 >= 0) {
        if (x - 1 >= 0) {
          if (pieces[x-1][y-2].empty || pieces[x-1][y-2].white) {
            moves.add(new Move(x-1, y-2));
          }
        }

        if (x + 1  < 8) {
          if (pieces[x+1][y-2].empty || pieces[x+1][y-2].white) {
            moves.add(new Move(x+1, y-2));
          }
        }

      }
        
        
        
      }
  }
    
}
