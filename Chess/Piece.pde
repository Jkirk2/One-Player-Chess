
//Parent class for Piece, placeholder for a space with no piece in it
class Piece{
  PImage image;
  int x;
  int y;
  int displayX;
  int displayY;
  boolean moved;
  boolean white;
  boolean empty;
  boolean selected;
  ArrayList<Move> moves;
  Piece(int x, int y){
    this.x=x;
    this.y=y;
    displayX = x;
    displayY = y;
    moves = new ArrayList<Move>();
    empty = true;
  }
  
  void draw(){
    
    if(image != null){
      image(image, displayX*size, displayY*size);
    }
     
  }
  
  void resetPos(){
    displayX = x;
    displayY = y;
    
  }
  double getScore(){
   return 0; 
    
  }
  

  
  
  void findMoves(Piece[][] pieces, boolean isWhite){
    moves.clear();
  }
  
}
