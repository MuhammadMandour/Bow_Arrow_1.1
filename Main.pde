  import ddf.minim.*; // Library for playing song
  AudioPlayer music; //defination of music
  AudioPlayer song;//defination of song
  AudioPlayer boomsound;
  AudioPlayer arrowsound;
  //Movie video;
  float speed=1;
  Minim minim;
  Character Archer;//defination of Character Object
  Button button;//defination of Button Object
  Button Continue;
  Button Back;
  Button lvl1;
  Button lvl2;
  Boom reaction;//defination of Boom Object
  boolean state;
  boolean play;
  boolean gameEnded = false; // Flag to track whether the game has ended
  boolean gamestate;// lose or win  ,used in end of level
  PImage gif; // Declare a variable to hold the sky image
  PImage lvl1_start;
  PImage lvl2_start;
  PImage lvl3_start;
  PImage goodguy;
  PImage startbg;// Declare a variable to hold the Start image
  PImage win;// Declare a variable to hold the winner image
  PImage lose;// Declare a variable to hold the Gameover image
  boolean Enter_1;// it will be true in lvl 1 to make archer can through arrows ,if i dont use it i will make archer through arrows in start menu
  boolean Reload = true;// i make it in reloading arrows
  ArrayList<Arrow> arrowList;//defination of ArrayList of arrows
  ArrayList<Enemy> enemyList;//defination of ArrayList of Enemy
  ArrayList<Boom> boomList;//defination of ArrayList of Boom
  int arrowsNumber; //number of arrows i use
  int menu =0;// make us switch between levels 
  final int sizeX = 1000;// Width of game
  final int sizeY = 700;//Height of game
  int ArcherX=80;
  int ArcherY=100;
  int lvl=0;
  Enemy[] monsters = new Enemy[15]; // Array to hold the monsters
  void setup() 
{
 size(1000, 700);
 frameRate(100);
    //music.loop();
    //song.loop();

  button =new Button (385,80,250,80,"Play",0,111,154);
  Continue =new Button (0,540,290,80,"CONTINUE",0,111,154);
  lvl1 =new Button (380,245,200,80,"Play",0,111,154);
  lvl2 =new Button (380,540,220,70,"Play",0,111,154);
  Back =new Button (365,540,300,70,"BACK",0,111,154);
  minim =new Minim(this);
  music =minim.loadFile("Om_Kalsoum.wav");  
  arrowsound =minim.loadFile("arrowsound.wav");
  boomsound =minim.loadFile("boomsound.wav");
  song =minim.loadFile("melody.wav");
  win=loadImage("winner.jpg");
  lose=loadImage("Gameover.jpg");
  startbg =loadImage("startbg.jpg");
    goodguy =loadImage("goodguy.png");
  gif = loadImage("bg2.jpg"); // Load your GIF file
  lvl1_start = loadImage("lvl0.jpg"); 
  lvl2_start = loadImage("lvl1.jpg"); 
  lvl3_start = loadImage("lvl2.jpg"); 
  gif.resize(width, height); // Resize the GIF to fit the canvas
  win.resize(width, height); 
  lvl1_start.resize(width,height);
  lvl2_start.resize(width,height);
  lvl3_start.resize(width,height);
  lose.resize(width, height); 
  startbg.resize(width,height);
  Archer = new Character("shooterr.png", 0, mouseY,ArcherX, ArcherY);
  arrowList = new ArrayList<Arrow>();
  enemyList = new ArrayList<Enemy>();
  boomList=new ArrayList<Boom>();
  state = false;
  //video.loop();
  // Create monsters and position them next to each other

}
  void draw() 
{
  switch (menu) 
{
  case 0: 
{
  song.play();
  image(startbg,0,0);
  button.update();
  //button.display();
  if(button.isClicked())
{
  menu=1;
  //println("Arrows Number = 20");
}
}

break;
//  case 1: 
//{  
//    //song.loop();
//    //song.play();
  

////  for (int i = 0; i < monsters.length; i++) 
////{ // making array of monsters that have deffernce x coorrdinates ,dont ask me ho can i get this equation
////    monsters[i] = new Enemy("monsterr.png", startX - i * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY);
////    enemyList.add(monsters[i]);
////}
//  menu++;
//}
  //break;
  case 1: 
{
  arrowsNumber = 20;
  Reload=true;
  float startX = sizeX - 45; // Adjust the starting x-coordinate
  float startY = sizeY; // Adjust the y-coordinate if needed
  int monsterWidth = 35; // Adjust the width of each monster
  float spacing = 5;
  int monsterHeight = 60; // Adjust the spacing between monsters
  gameEnded = false;
 
  if(lvl==0)
{
  image(lvl1_start,0,0);
  lvl1.update();
   //lvl1.display();
  if(lvl1.isClicked())
{
    for (int i = 0; i < monsters.length; i++) 
{ // making array of monsters that have deffernce x coorrdinates ,dont ask me ho can i get this equation
    monsters[i] = new Enemy("monsterr.png", startX - i * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY,speed);
    enemyList.add(monsters[i]);
}
  menu=2;
  music.loop();

}
}
if (lvl==1) 
{
    music.loop();
   image(lvl2_start,0,0);
   //lvl1.display();
   //lvl2.display();
   lvl1.update();
   lvl2.update();

  if(lvl1.isClicked())
{
    for (int i = 0; i < monsters.length; i++) 
{ // making array of monsters that have deffernce x coorrdinates ,dont ask me ho can i get this equation
    monsters[i] = new Enemy("monsterr.png", startX - i * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY,speed);
    enemyList.add(monsters[i]);
}
  menu=2;
  arrowList.clear();
}
else if(lvl2.isClicked())
{
  int x =(int)random (0,5);
  int y =(int)random (5,10);
  int z =(int)random (10,15);

    for (int i = 0; i < monsters.length; i++) 
{ // making array of monsters that have deffernce x coorrdinates ,dont ask me ho can i get this equation
    monsters[i] = new Enemy("monsterr.png", startX - i * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY,speed);
    enemyList.add(monsters[i]);
}
    monsters[x] = new Enemy("goodguy.png", startX - x * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY,random(0.8,1.5));
    monsters[y] = new Enemy("goodguy.png", startX - y * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY,random(0.8,1.5));
    monsters[z] = new Enemy("goodguy.png", startX - z * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY,random(0.8,1.5));
    enemyList.set(x, monsters[x]);
    enemyList.set(y, monsters[y]);
    enemyList.set(z, monsters[z]);
  menu=4;
  arrowList.clear();

}
}
else if(lvl==2)
{
    music.loop();
   lvl1.display();
   lvl2.display();

   image(lvl3_start,0,0);
   lvl1.update();
   lvl2.update();
if(lvl1.isClicked())
{
    for (int i = 0; i < monsters.length; i++) 
{ // making array of monsters that have deffernce x coorrdinates ,dont ask me ho can i get this equation
    monsters[i] = new Enemy("monsterr.png", startX - i * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY,speed);
    enemyList.add(monsters[i]);
}
  menu=2;
   arrowList.clear();
}if(lvl2.isClicked())
{
  int x =(int)random (0,5);
  int y =(int)random (5,10);
  int z =(int)random (10,15);
    for (int i = 0; i < monsters.length; i++) 
{ // making array of monsters that have deffernce x coorrdinates ,dont ask me ho can i get this equation
    monsters[i] = new Enemy("monsterr.png", startX - i * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY,speed);
    enemyList.add(monsters[i]);
}
    monsters[x] = new Enemy("goodguy.png", startX - x * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY,random(0.8,1.5));
    monsters[y] = new Enemy("goodguy.png", startX - y * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY,random(0.8,1.5));
    monsters[z] = new Enemy("goodguy.png", startX - z * (monsterWidth + spacing), startY, monsterWidth, monsterHeight, sizeY,random(0.8,1.5));
    enemyList.set(x, monsters[x]);
    enemyList.set(y, monsters[y]);
    enemyList.set(z, monsters[z]);
  arrowList.clear();
  menu=4;
}
}
}

break;
    case 2: 
{
  song.pause();
  music.play();
  Lvl_1 lvl1 = new Lvl_1();
  lvl1.displayLevel(Archer, arrowList, enemyList, boomList, arrowsNumber, state);//, gameEnded
}
  break;
  case 3: 
{

  if (gamestate==true)
{
    music.pause();
     song.play();
  image(win, 0, 0);
  //Continue.display();
  Continue.update();
  if(Continue.isClicked())
{
  play=Continue.isClicked();
  arrowsNumber = 20;
  menu=1;
  song.loop();
}
}
  else 
{  
      music.pause();
  enemyList.clear();
 song.play();
  image(lose, 0, 0);
  //Back.display();
  Back.update();
  if(Back.isClicked())
{
   //song.loop();
menu=1;
arrowsNumber = 20;
 //music.close();
}
}
}
  break;
case 4: 
{
    Archer.setImage("shooterr.png");
    song.pause();
    int n = 0;
    Enter_1 = true;
    image(gif, 0, 0);
    Archer.update(mouseY);
    Archer.displayArcher();

    for (Enemy anEnemy : enemyList) 
{
      anEnemy.displayEnemy();
}

    for (Arrow anArrow : arrowList) 
{
      anArrow.displayArrow();
      anArrow.moveArrow();
      anArrow.isClean();
      for (Enemy anEnemy : enemyList)
{
        anArrow.shootEnemy(anEnemy);
}
}

    // Remove arrows and enemies that need to be cleaned
    for (int i = arrowList.size() - 1; i >= 0; i--) 
{
      Arrow anArrow = arrowList.get(i);
      if (anArrow.clean) 
{
        arrowList.remove(anArrow);
}
}

        for (int i = enemyList.size() - 1; i >= 0; i--) 
{
        Enemy anEnemy = enemyList.get(i);
        if (anEnemy.removeEnemy) 
{
        float x = anEnemy.x;
        float y = anEnemy.y;
        boomList.add(new Boom("boom.png","boomsound.wav", x, y, 90, 40));
        enemyList.remove(anEnemy);
        Boom aBoom = boomList.get(n);
        ++n;
        aBoom.displayReaction();
        aBoom.playsong();
}
}

    for (Boom aBoom : boomList) 
{
      aBoom.displayReaction();
}

        if (state && !gameEnded) 
{
        if (arrowsNumber >= 0 && enemyList.size() == 0) 
{
        println("WINNER");
        gameEnded = true;
        boomList.clear();
        gamestate = true;
        enemyList.clear();
        arrowList.clear();
        menu=5;
        Enter_1 = false;
        lvl=2;
}       else if (arrowList.size() == 0 && enemyList.size() > 0 && arrowsNumber == 0) 
{
        println("GAME OVER");
        gameEnded = true;
        boomList.clear();
        gamestate = false;
        enemyList.clear();
        arrowList.clear();
        menu=5;
        Enter_1 = false;

}
}
}
break;
case 5:
{
    if (gamestate==true)
{
    music.pause();
     song.play();
  image(win, 0, 0);
  //Continue.display();
  Continue.update();
  if(Continue.isClicked())
{
  arrowsNumber = 20;
  menu=1;
  song.loop();
}
}
  else 
{  
      music.pause();
  enemyList.clear();
 song.play();
  image(lose, 0, 0);
  //Back.display();
  Back.update();
  if(Back.isClicked())
{
   //song.loop();
menu=1;
arrowsNumber = 20;
 //music.close();   
}
}
}
}
}
