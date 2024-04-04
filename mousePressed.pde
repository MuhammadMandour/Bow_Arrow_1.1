void mousePressed()
{
    if (mouseButton == LEFT && Reload && arrowsNumber >= 0&&Enter_1&&!gameEnded) 
{
    arrowList.add(new Arrow("arrowr.png", 0, mouseY, 45, 15, sizeX));
    --arrowsNumber;
    Archer.setImage("shooterra.png");
    Reload = false;
    println("Arrows Number = " + arrowsNumber);
    if(!gameEnded)
{
        arrowsound.loop();
    arrowsound.play();
}
    state = true;
}  
    if (mouseButton == RIGHT && arrowsNumber <= 20 && arrowsNumber > 0) {
    Reload = true;
    Archer.setImage("shooterr.png");
}
}
