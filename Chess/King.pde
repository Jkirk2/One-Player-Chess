class King extends Piece {



  King(int x, int y, boolean white) {
    super(x, y);
    this.white = white;
    empty = false;
    if (white) {
      image = white_king;
    } else {
      image = black_king;
    }
  }



  double getScore(){
    if(!moved){
     return 901; 
    }
   return 900; 
   
  }

  void findMoves(Piece[][] pieces,  boolean isWhite) {
    moves.clear();
    if (isWhite) {

      //left and right
      if (x-1 >=0) {
        if (pieces[x-1][y].empty || !pieces[x-1][y].white) {

          moves.add(new Move(x-1, y));
        }
      }
      if (x+1 < 8) { 
        if (pieces[x+1][y].empty || !pieces[x+1][y].white) {

          moves.add(new Move(x+1, y));
        }
      }
      //top three
      if (y + 1 < 8) {
        if (x-1 >=0) {
          if ( pieces[x-1][y+1].empty || !pieces[x-1][y+1].white) {

            moves.add(new Move(x-1, y+1));
          }
        }
        if (x+1 < 8 ) {
          if ( pieces[x+1][y+1].empty || !pieces[x+1][y+1].white) {

            moves.add(new Move(x+1, y+1));
          }
        }
        if (pieces[x][y+1].empty || !pieces[x][y+1].white) {
          moves.add(new Move(x, y+1));
        }
      }
      //bottom three
      if (y -1 >= 0) {
        if (x-1 >=0) {
          if ( pieces[x-1][y-1].empty || !pieces[x-1][y-1].white) {

            moves.add(new Move(x-1, y-1));
          }
        }
        if (x+1 < 8 ) {
          if ( pieces[x+1][y-1].empty || !pieces[x+1][y-1].white) {

            moves.add(new Move(x+1, y-1));
          }
        }
        if (pieces[x][y-1].empty || !pieces[x][y-1].white) {
          moves.add(new Move(x, y-1));
        }
      }
    } else {
      //black peices
            //left and right
      if (x-1 >=0) {
        if (pieces[x-1][y].empty || pieces[x-1][y].white) {

          moves.add(new Move(x-1, y));
        }
      }
      if (x+1 < 8) { 
        if (pieces[x+1][y].empty || pieces[x+1][y].white) {

          moves.add(new Move(x+1, y));
        }
      }
      //top three
      if (y + 1 < 8) {
        if (x-1 >=0) {
          if ( pieces[x-1][y+1].empty || pieces[x-1][y+1].white) {

            moves.add(new Move(x-1, y+1));
          }
        }
        if (x+1 < 8 ) {
          if ( pieces[x+1][y+1].empty || pieces[x+1][y+1].white) {

            moves.add(new Move(x+1, y+1));
          }
        }
        if (pieces[x][y+1].empty || pieces[x][y+1].white) {
          moves.add(new Move(x, y+1));
        }
      }
      //bottom three
      if (y -1 >= 0) {
        if (x-1 >=0) {
          if ( pieces[x-1][y-1].empty || pieces[x-1][y-1].white) {

            moves.add(new Move(x-1, y-1));
          }
        }
        if (x+1 < 8 ) {
          if ( pieces[x+1][y-1].empty || pieces[x+1][y-1].white) {

            moves.add(new Move(x+1, y-1));
          }
        }
        if (pieces[x][y-1].empty || pieces[x][y-1].white) {
          moves.add(new Move(x, y-1));
        }
      }
      
    }
  }
}
