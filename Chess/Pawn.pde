class Pawn extends Piece {


  Pawn(int x, int y, boolean white) {
    super(x, y);
    this.white = white;
    empty = false;
    if (white) {
      image = white_pawn;
    } else {
      image = black_pawn;
    }

    moved = false;
  }

  double getScore(){
   
    
   if(x >= 3 && x<=4 && y>=3 && y <=4){
     return 1.1;
   }
   else{
    return 1; 
   }

  }

  void findMoves(Piece[][] pieces, boolean isWhite) {

    moves.clear();
    //black moves
    if (!isWhite) {
      if (!moved) {
        if (pieces[x][y+2].empty && pieces[x][y+1].empty) {
          moves.add(new Move(x, y+2));
        }
      }
      if (pieces[x][y+1].empty) {
        moves.add(new Move(x, y+1));
      }
      if (x < 7 && pieces[x+1][y+1].white && !pieces[x+1][y+1].empty) {
        moves.add(new Move(x+1, y+1));
      }
      if (x > 0 && pieces[x-1][y+1].white && !pieces[x-1][y+1].empty) {
        moves.add(new Move(x-1, y+1));
      }
    }

    //white moves
    else {
      if (!moved) {
        if (pieces[x][y-2].empty && pieces[x][y-1].empty) {
          moves.add(new Move(x, y-2));
        }
      }
      if (pieces[x][y-1].empty) {
        moves.add(new Move(x, y-1));
      }
      if (x < 7 && !pieces[x+1][y-1].white && !pieces[x+1][y-1].empty) {
        moves.add(new Move(x+1, y-1));
      }
      if (x > 0 && !pieces[x-1][y-1].white && !pieces[x-1][y-1].empty) {
        moves.add(new Move(x-1, y-1));
      }
    }
  }
}
