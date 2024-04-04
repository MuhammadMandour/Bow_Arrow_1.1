class Button
{
  PVector Pos =new PVector(0,0);
  float Width=0;
  float Height =0;
  color Colour;
  String Text;
  Boolean Pressed =false;
  Boolean Clicked =false;
  Button(int x,int y,int w,int h,String t,int r ,int g, int b) 
{   // Constractor
    // all of this just I take all of things passed by constactor to class 
  Pos.x=x;
  Pos.y=y;
  Width=w;
  Height=h;
  Colour =color(r,g,b);
  Text=t;
}
  void update()
{
  /*this method depend on id mouse pressed or not  if  left button is pressed it will check if it pressed in button coordinates or not 
  if it pressed in area of button it will make clicked true ,I use cliced in isClicked method
  if not pressed in area of button will make cliked= false*/
  if(mousePressed ==true&&mouseButton==LEFT&&Pressed==false)
{
  Pressed =true;
  if (mouseX>=Pos.x&&mouseX<=Pos.x+Width&&mouseY>=Pos.y&&mouseY<=Pos.y+Height)
{
  Clicked=true;
}
}   else 
{
  Clicked=false;
  //Pressed=false;
}
if (mousePressed !=true)
{
Pressed=false; // it make 
}
}
  void display () 
{ // I used it to make us see where the button is when 
  fill(Colour);
  rect(Pos.x,Pos.y,Width,Height); // i used rectangle to let me know where is this box that i can click on it
  fill(0);
  textAlign(CENTER,CENTER); // make text in center , we dont need it
  text(Text,Pos.x+(Width/2),Pos.y+(Height/2)); // we dont need it too
}
boolean isClicked() 
{ //to know if button has been clicked or not
return Clicked;
}
}
