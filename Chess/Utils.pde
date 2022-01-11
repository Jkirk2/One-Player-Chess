PImage black_pawn;
PImage white_pawn;
PImage black_rook;
PImage white_rook;
PImage black_bishop;
PImage white_bishop;
PImage black_knight;
PImage white_knight;
PImage black_queen;
PImage white_queen;
PImage black_king;
PImage white_king;



void loadImages(){
  
  black_pawn = loadImage("data/pawn_black.png");
  black_rook = loadImage("data/rook_black.png");
  black_knight = loadImage("data/knight_black.png");
  black_king = loadImage("data/king_black.png");
  black_queen = loadImage("data/queen_black.png");
  black_bishop = loadImage("data/bishop_black.png");
  
  white_pawn= loadImage("data/pawn_white.png");
  white_rook= loadImage("data/rook_white.png");
  white_knight= loadImage("data/knight_white.png");
  white_king= loadImage("data/king_white.png");
  white_queen= loadImage("data/queen_white.png");
  white_bishop= loadImage("data/bishop_white.png");
  
}
