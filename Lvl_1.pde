class Lvl_1 
{
// Constractor
  void displayLevel(Character archer, ArrayList<Arrow> arrowList, ArrayList<Enemy> enemyList, ArrayList<Boom> boomList, int arrowsNumber, boolean state) //, boolean gameEnded
{
      // all of this just I take all of things passed by constactor to class 
    int n = 0;
    Enter_1 = true;
    image(gif, 0, 0);
    archer.update(mouseY);
    archer.displayArcher();

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
        menu=3;
        Enter_1 = false;
        if (lvl==0)
{
        lvl=1;
}
        else if(lvl==1)
{
          lvl=2;
}
else 
{
lvl =2;
}
}       else if (arrowList.size() == 0 && enemyList.size() > 0 && arrowsNumber == 0) 
{
        println("GAME OVER");
        gameEnded = true;
        boomList.clear();
        gamestate = false;
        enemyList.clear();
        menu=3;
        Enter_1 = false;
                if (lvl==0)
{
        lvl=0;
}
        else if(lvl==1)
{
          lvl=1;
}
else {
lvl =2;
}
}
}
}
}
