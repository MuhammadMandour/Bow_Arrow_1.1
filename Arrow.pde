class Arrow 
{
  PImage arrow; // define arrow's photo
  float x, y; // Cordinates of arrow 
  float width, height; // size of arrow --->7gm el-sora y3ni
  float speed = 2; // speed of arrow
    int range; //max(X) of program (Width) , it is used to know what is maximum range of arrow can go  

  boolean clean; // it is used to know if arrow  exceed range of program
  float left, right, top, bottom;  // Coordinates for bounding box , it is used in killing enemy 
  Arrow(String filename, float x, float y, int width, int height, int sizeX) 
{ // Constractor
    // all of this just I take all of things passed by constactor to class 
    this.arrow = loadImage(filename); // load photo
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.arrow.resize(width, height); // Resize the image
    this.clean = false;
    this.range = sizeX;
}

  void displayArrow() 
{ 
    image(arrow, this.x + ArcherX/2, this.y + ArcherY/2);// display enemy photo , this ArcherX and ArcherX see main
}
  
  void moveArrow() 
{
    x += speed; //update coordinates of arrow , that make arrow move
    // Update bounding arrow coordinates
    left = x + 38;
    right = x + 42;
    top = y - 10;
    bottom = y + 5;
}
  
  void isClean() 
{ // this method tell us if arrow went to end of program or not
    if (x > range) 
{ //if it exceed the end of program it will return true that will  make us clean arrow
      clean = true; 
}
}
  
  void shootEnemy(Enemy anEnemy) 
{ // this method make us know if arrow is touched the enemy or not
    if (top >= anEnemy.bottom && 
        bottom <= anEnemy.top && 
        right > anEnemy.left && 
        left <= anEnemy.right) {
      anEnemy.removeEnemy = true; // if they touched it will return us this value to remove enemy ---> go to enemy class
}
}
}
