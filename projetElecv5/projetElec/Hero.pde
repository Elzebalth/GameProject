class Hero {
  protected int heroPos1, heroPos2, heroPos3, heroPos4, heroPos5, heroPos6, heroPos7, heroPos8, heroPos9, heroPos10, heroPos11, heroPos12, heroPos13, heroPos14, heroPos15, heroPos16, heroPos17, heroPos18;
  protected float x, y, previousX, previousY;
  public float vitX=8, vitY=2, mvt=0;
  public int nbWaitMvt=25, currentFrame=0;
  private int heroAnimCount=0, i=0, j=0, nbMontee=0, nbDescente=0, compteur=0;
  public boolean saut=false, jumping=false, droite=false, gauche=false, reset=true, firstChute=true;
  public char lastMove='A';

  public void resetDessin() {
    for (int i=0; i<128*38; i++) {
      if (hitboxLvl[levelNumber][i].endsWith("hero")) { 
        heroPos1=i;//en bas à droite
        heroPos2=i-1;
        heroPos3=i-2;
        heroPos4=i-3;
        heroPos5=i-4;
        heroPos6=i-5;
        heroPos7=i-128;
        heroPos8=i-129;
        heroPos9=i-130;
        heroPos10=i-131;
        heroPos11=i-132;
        heroPos12=i-133;
        heroPos13=i-256;
        heroPos14=i-257;
        heroPos15=i-258;
        heroPos16=i-259;
        heroPos17=i-260;
        heroPos18=i-261;//en haut à gauche
        x=(heroPos18%128)*8;
        y=(heroPos18/128)*16;
      }
    }
  }

  public void dessin() {
    if (reset==true) {
      resetDessin();
      reset=false;
    }
    rect(x, y, 8, 16);
    rect((heroPos1%128)*8, (heroPos1/128)*16, 8, 16);
    animation();
    //if (heroAnimCount<20) {
    //  image(heroRight1, x, y);
    //  heroAnimCount+=1;
    //} else if (heroAnimCount<40 && heroAnimCount>=20) {
    //  image(heroRight2, x, y);im
    //  heroAnimCount+=1;
    //} else if (heroAnimCount>=40 && heroAnimCount<60) {
    //  image(heroRight3, x, y);
    //  heroAnimCount+=1;
    //} else if (heroAnimCount>=60) {
    //  heroAnimCount=0;
    //  image(heroRight1, x, y);
    //}
  }

  public void animation() {
    int offset=0;
    println(jumping);
    if (keyPressed==true && (key==DROITE ||lastMove==DROITE) && jumping==false) {
      if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {
        currentFrame=(currentFrame+1) % 12;
        image(heroGreenR[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroGreenR[(currentFrame+offset)%12], x, y);
        offset+=1;
      } else if (bonusNoClip.noClip==true) {
        currentFrame=(currentFrame+1) % 12;
        image(heroBlackR[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroBlackR[(currentFrame+offset)%12], x, y);
        offset+=1;
      } else if (bonusTP.bonusTP==true && bonusTP.trigTP==false) {
        currentFrame=(currentFrame+1) % 12;
        image(heroPurpleR[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroPurpleR[(currentFrame+offset)%12], x, y);
        offset+=1;
      } else if (bonusTP.trigTP==true) {
        currentFrame=(currentFrame+1) % 20;
        image(heroTPR[(currentFrame+offset)%20], x, y);
        offset+=1;
        image(heroTPR[(currentFrame+offset)%20], x, y);
        offset+=1;
      } else if (bonusDash.dash==true && bonusDash.trigDash==false) {
        currentFrame=(currentFrame+1)%12;
        image(heroRedR[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroRedR[(currentFrame+offset)%12], x, y);
        offset+=1;
      } else if (bonusDash.trigDash==true) {
        currentFrame=(currentFrame+1)%7;
        image(heroRedR[(currentFrame+offset)%7], x, y);
        offset+=1;
        image(heroRedR[(currentFrame+offset)%7], x, y);
        offset+=1;
      } else if (bonusGravitySwap.gravitySwap==true) {
        currentFrame=(currentFrame+1)%12;
        image(heroVeridianR[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroVeridianR[(currentFrame+offset)%12], x, y);
        offset+=1;
      } else {
        currentFrame=(currentFrame+1) % 12; 
        image(heroBlueR[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroBlueR[(currentFrame+offset)%12], x, y);
        offset+=1;
      }
    } else if (keyPressed==true && (key==GAUCHE || lastMove==GAUCHE) && jumping==false) {
      if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {
        currentFrame=(currentFrame+1) % 12;
        image(heroGreenL[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroGreenL[(currentFrame+offset)%12], x, y);
        offset+=1;
      } else if (bonusNoClip.noClip==true) {
        currentFrame=(currentFrame+1) % 12;
        image(heroBlackL[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroBlackL[(currentFrame+offset)%12], x, y);
        offset+=1;
      } else if (bonusTP.bonusTP==true) {
        currentFrame=(currentFrame+1) % 12;
        image(heroPurpleL[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroPurpleL[(currentFrame+offset)%12], x, y);
        offset+=1;
      } else if (bonusDash.dash==true && bonusDash.trigDash==false) {
        currentFrame=(currentFrame+1) % 12;
        image(heroRedL[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroRedL[(currentFrame+offset)%12], x, y);
        offset+=1;
      } else if (bonusDash.trigDash==true) {
        currentFrame=(currentFrame+1) % 29;
        image(heroDashL[(currentFrame+offset)%29], x, y);
        offset+=1;
        image(heroDashL[(currentFrame+offset)%29], x, y);
        offset+=1;
      } else if (bonusGravitySwap.gravitySwap==true) {
        currentFrame=(currentFrame+1) % 12;
        image(heroVeridianL[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroVeridianL[(currentFrame+offset)%12], x, y);
        offset+=1;
      } else {
        currentFrame=(currentFrame+1) % 12;
        image(heroBlueL[(currentFrame+offset)%12], x, y);
        offset+=1;
        image(heroBlueL[(currentFrame+offset)%12], x, y);
        offset+=1;
      }
    } else if (lastMove==GAUCHE && jumping==false) {
      if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {
        image(heroIdleGreenL, x, y);
      } else if (bonusNoClip.noClip==true) {
        image(heroIdleBlackL, x, y);
      } else if (bonusTP.bonusTP==true) {
        image(heroIdlePurpleL, x, y);
      } else if (bonusDash.dash==true) {
        image(heroIdleRedL, x, y);
      } else if (bonusGravitySwap.gravitySwap==true) {
        image(heroIdleVeridianL, x, y);
      } else {
        image(heroIdleBlueL, x, y);
      }
    } else if ( jumping==false || (jumping==false && lastMove=='A')) {
      if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {
        image(heroIdleGreenR, x, y);
      } else if (bonusNoClip.noClip==true) {
        image(heroIdleBlackR, x, y);
      } else if (bonusTP.bonusTP==true) {
        image(heroIdlePurpleR, x, y);
      } else if (bonusDash.dash==true) {
        image(heroIdleRedR, x, y);
      } else if (bonusGravitySwap.gravitySwap==true) {
        image(heroIdleVeridianR, x, y);
      } else {
        image(heroIdleBlueR, x, y);
      }
    }
    if ((jumping==true && lastMove==DROITE)||( lastMove=='A' && jumping==true)) {
      if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {
        image(heroJumpGreenR, x, y);
      } else if (bonusNoClip.noClip==true) {
        image(heroJumpBlackR, x, y);
      } else if (bonusTP.bonusTP==true) {
        image(heroJumpPurpleR, x, y);
      } else if (bonusDash.dash==true) {
        image(heroJumpRedR, x, y);
      } else if (bonusGravitySwap.gravitySwap==true) {
        image(heroJumpVeridianR, x, y);
      } else {
        image(heroJumpBlueR, x, y);
      }
    }
    if (jumping==true && lastMove==GAUCHE) {
      if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {
        image(heroJumpGreenL, x, y);
      } else if (bonusNoClip.noClip==true) {
        image(heroJumpBlackL, x, y);
      } else if (bonusTP.bonusTP==true) {
        image(heroJumpPurpleL, x, y);
      } else if (bonusDash.dash==true) {
        image(heroJumpRedL, x, y);
      } else if (bonusGravitySwap.gravitySwap==true) {
        image(heroJumpVeridianL, x, y);
      } else {
        image(heroJumpBlueL, x, y);
      }
    }
  }

  public void mvtGauche() {//42 >10
    if (((!hitboxLvl[levelNumber][hero.heroPos6-1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos12-1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos18-1].startsWith("wall"))||(bonusNoClip.trigNoClip==true &&(hitboxLvl[levelNumber][hero.heroPos18-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos17-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos16-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos15-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos14-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos13-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos12-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos11-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos10-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos9-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos8-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos6-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos5-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos4-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos3-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos2-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos1-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7-1].startsWith("wallNoClip"))))) {
      if (hero.gauche==true && x>previousX-8) {//mvt d'une case
        x-=vitX;
        hero.heroHitboxGauche(1);
        hero.lastMove=GAUCHE;
        hero.previousX=hero.x;
      }
    }
  }

  public void mvtDroite() {
    if ( ((!hitboxLvl[levelNumber][hero.heroPos1+1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos7+1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos13+1].startsWith("wall"))||(bonusNoClip.trigNoClip==true &&(hitboxLvl[levelNumber][hero.heroPos18+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos17+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos16+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos15+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos14+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos13+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos12+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos11+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos10+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos9+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos8+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos6+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos5+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos4+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos3+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos2+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos1+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7+1].startsWith("wallNoClip"))))) {
      if (hero.droite==true && x<previousX+8) {//mvt d'une case
        x+=vitX;
        hero.heroHitboxDroite(1);
        hero.lastMove=DROITE;
        hero.previousX=hero.x;
      }
    }
  }

  public void heroHitbox() {
    if (hitboxLvl[levelNumber][heroPos1]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos1]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos1].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos1]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos1]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos2]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos2]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos2].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos5]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos2]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos3]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos3]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos3].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos5]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos3]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos4]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos4]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos4].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos5]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos4]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos5]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos5]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos5].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos5]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos5]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos6]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos6]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos6].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos5]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos6]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos7]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos7]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos7].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos7]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos7]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos8]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos8]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos8].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos8]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos8]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos9]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos9]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos9].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos9]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos9]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos10]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos10]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos10].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos10]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos10]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos11]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos11]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos11].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos11]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos11]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos12]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos12]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos12].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos12]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos12]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos13]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos13]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos13].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos13]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos13]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos14]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos14]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos14].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos14]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos14]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos15]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos15]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos15].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos15]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos15]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos16]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos16]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos16].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos16]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos16]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos17]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos17]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos17].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos17]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos17]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos18]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos18]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos18].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos18]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos18]="hero";
    }
  }

  public void wallNoClipheroDelete() {
    for (int i=1; i<128*38-1; i++) {
      if (hitboxLvl[levelNumber][i].equals("wallNoCliphero") && (!hitboxLvl[levelNumber][i+1].equals("wallNoCliphero") || !hitboxLvl[levelNumber][i+1].equals("hero") || !hitboxLvl[levelNumber][i-1].equals("wallNoCliphero") || !hitboxLvl[levelNumber][i-1].equals("hero"))) {
        hitboxLvl[levelNumber][i]="wallNoClip";
      }
    }
  }
  public void heroHitboxGauche(int nbDeplacement) {
    while ((bonusNoClip.trigNoClip==false &&(hitboxLvl[levelNumber][hero.heroPos18-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos17-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos16-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos15-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos14-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos13-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos12-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos11-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos10-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos9-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos8-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos7-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos6-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos5-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos4-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos3-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos2-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos1-nbDeplacement].startsWith("wall")))||(bonusNoClip.trigNoClip==true && ((!hitboxLvl[levelNumber][heroPos18-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos18-nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos17-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos17-nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos16-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos16-nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos15-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos15-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos14-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos14-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos13-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos13-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos12-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos12-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos11-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos11-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos10-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos10-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos9-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos9-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos8-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos8-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos7-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos7-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos6-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos6-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos5-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos5-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos4-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos4-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos3-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos3-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos2-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos2-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos1-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos1-nbDeplacement].startsWith("wall") )))) {

      nbDeplacement--;
    }
    hero.heroPos1-=nbDeplacement;
    hero.heroPos2-=nbDeplacement;
    hero.heroPos3-=nbDeplacement;
    hero.heroPos4-=nbDeplacement;
    hero.heroPos5-=nbDeplacement;
    hero.heroPos6-=nbDeplacement;
    hero.heroPos7-=nbDeplacement;
    hero.heroPos8-=nbDeplacement;
    hero.heroPos9-=nbDeplacement;
    hero.heroPos10-=nbDeplacement;
    hero.heroPos11-=nbDeplacement;
    hero.heroPos12-=nbDeplacement;
    hero.heroPos13-=nbDeplacement;
    hero.heroPos14-=nbDeplacement;
    hero.heroPos15-=nbDeplacement;
    hero.heroPos16-=nbDeplacement;
    hero.heroPos17-=nbDeplacement;
    hero.heroPos18-=nbDeplacement;
    contactSpike();
    contactBonusDoubleJump();
    contactBonusDash();
    contactBonusTP();
    contactBonusNoClip();

    if (!hitboxLvl[levelNumber][heroPos1+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos1+nbDeplacement]="empty";
    }
    if (!hitboxLvl[levelNumber][heroPos2+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos2+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos3+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos3+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos4+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos4+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos5+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos5+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos6+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos6+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos7+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos7+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos8+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos8+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos9+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos9+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos10+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos10+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos11+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos11+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos12+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos12+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos13+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos13+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos14+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos14+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos15+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos15+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos16+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos16+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos17+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos17+nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos18+nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos18+nbDeplacement]="empty";
    }
    heroHitbox();
  }
  public void heroHitboxDroite(int nbDeplacement) {
    while ((bonusNoClip.trigNoClip==false &&(hitboxLvl[levelNumber][hero.heroPos18+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos17+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos16+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos15+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos14+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos13+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos12+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos11+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos10+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos9+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos8+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos7+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos6+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos5+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos4+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos3+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos2+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos1+nbDeplacement].startsWith("wall")))||(bonusNoClip.trigNoClip==true && ((!hitboxLvl[levelNumber][heroPos18+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos18+nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos17+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos17+nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos16+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos16+nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos15+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos15+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos14+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos14+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos13+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos13+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos12+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos12+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos11+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos11+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos10+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos10+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos9+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos9+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos8+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos8+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos7+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos7+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos6+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos6+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos5+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos5+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos4+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos4+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos3+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos3+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos2+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos2+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos1+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos1+nbDeplacement].startsWith("wall") )))) {
      nbDeplacement--;
    }
    hero.heroPos1+=nbDeplacement;
    hero.heroPos2+=nbDeplacement;
    hero.heroPos3+=nbDeplacement;
    hero.heroPos4+=nbDeplacement;
    hero.heroPos5+=nbDeplacement;
    hero.heroPos6+=nbDeplacement;
    hero.heroPos7+=nbDeplacement;
    hero.heroPos8+=nbDeplacement;
    hero.heroPos9+=nbDeplacement;
    hero.heroPos10+=nbDeplacement;
    hero.heroPos11+=nbDeplacement;
    hero.heroPos12+=nbDeplacement;
    hero.heroPos13+=nbDeplacement;
    hero.heroPos14+=nbDeplacement;
    hero.heroPos15+=nbDeplacement;
    hero.heroPos16+=nbDeplacement;
    hero.heroPos17+=nbDeplacement;
    hero.heroPos18+=nbDeplacement;
    contactSpike();
    contactBonusDoubleJump();
    contactBonusDash();
    contactBonusTP();
    contactBonusNoClip();

    if (!hitboxLvl[levelNumber][heroPos1-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos1-nbDeplacement]="empty";
    }
    if (!hitboxLvl[levelNumber][heroPos2-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos2-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos3-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos3-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos4-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos4-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos5-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos5-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos6-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos6-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos7-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos7-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos8-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos8-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos9-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos9-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos10-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos10-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos11-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos11-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos12-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos12-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos13-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos13-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos14-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos14-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos15-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos15-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos16-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos16-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos17-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos17-nbDeplacement]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos18-nbDeplacement].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos18-nbDeplacement]="empty";
    }
    heroHitbox();
  }
  public void heroHitboxHaut() {
    hero.heroPos1-=128;
    hero.heroPos2-=128;
    hero.heroPos3-=128;
    hero.heroPos4-=128;
    hero.heroPos5-=128;
    hero.heroPos6-=128;
    hero.heroPos7-=128;
    hero.heroPos8-=128;
    hero.heroPos9-=128;
    hero.heroPos10-=128;
    hero.heroPos11-=128;
    hero.heroPos12-=128;
    hero.heroPos13-=128;
    hero.heroPos14-=128;
    hero.heroPos15-=128;
    hero.heroPos16-=128;
    hero.heroPos17-=128;
    hero.heroPos18-=128;
    contactSpike();
    contactBonusDoubleJump();
    contactBonusTP();
    contactBonusDash();
    contactBonusNoClip();
    if (!hitboxLvl[levelNumber][heroPos1+128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos1+128]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos2+128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos2+128]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos3+128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos3+128]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos4+128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos4+128]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos5+128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos5+128]="empty";
    }    
    if (!hitboxLvl[levelNumber][heroPos6+128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos6+128]="empty";
    }
    heroHitbox();
  }
  public void heroHitboxChute() {
    hero.heroPos1+=128;
    hero.heroPos2+=128;
    hero.heroPos3+=128;
    hero.heroPos4+=128;
    hero.heroPos5+=128;
    hero.heroPos6+=128;
    hero.heroPos7+=128;
    hero.heroPos8+=128;
    hero.heroPos9+=128;
    hero.heroPos10+=128;
    hero.heroPos11+=128;
    hero.heroPos12+=128;
    hero.heroPos13+=128;
    hero.heroPos14+=128;
    hero.heroPos15+=128;
    hero.heroPos16+=128;
    hero.heroPos17+=128;
    hero.heroPos18+=128;
    contactSpike();
    contactBonusDoubleJump();
    contactBonusTP();
    contactBonusDash();    
    contactBonusNoClip();
    if (!hitboxLvl[levelNumber][hero.heroPos18-128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos18-128]="empty";
    }    
    if (!hitboxLvl[levelNumber][hero.heroPos17-128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos17-128]="empty";
    }    
    if (!hitboxLvl[levelNumber][hero.heroPos16-128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos16-128]="empty";
    }    
    if (!hitboxLvl[levelNumber][hero.heroPos15-128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos15-128]="empty";
    }    
    if (!hitboxLvl[levelNumber][hero.heroPos14-128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos14-128]="empty";
    }    
    if (!hitboxLvl[levelNumber][hero.heroPos13-128].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos13-128]="empty";
    }
    heroHitbox();
  }


  public void contactSol() {
    if (nbMontee==0 && nbDescente==0 && !hitboxLvl[levelNumber][hero.heroPos1+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos2+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos3+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos4+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos5+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos6+128].startsWith("wall") && saut==false && bonusDoubleJump.trigDoubleJump==false) {
      nbDescente=6;
    }
  }

  public void distanceSol() {
    while (nbMontee==0 && !hitboxLvl[levelNumber][hero.heroPos1+(nbDescente*128)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos2+(nbDescente*128)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos3+(nbDescente*128)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos4+(nbDescente*128)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos5+(nbDescente*128)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos6+(nbDescente*128)].startsWith("wall")) {
      nbDescente++;
    }
    if (nbDescente==0) {
      jumping=false;
    }
    jumping=true;
  }
  public void mvtHaut() {
    if (hero.saut==true && nbMontee==0 && nbDescente==0) {
      nbMontee=6;
    }
    if (bonusDoubleJump.trigDoubleJump==true) {
      nbMontee=6;
      //mvt=nbDescente;
      nbDescente=0;
    }
  }

  public void descente() {

    if (mvt<6 && i<6 && !hitboxLvl[levelNumber][hero.heroPos1+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos2+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos3+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos4+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos5+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos6+128].startsWith("wall")) {
      if (firstChute==true) {
        vitY=0;
        firstChute=false;
        mvt=nbDescente;
      }
      y+=vitY;
      vitY+=0.31;        
      i++;
    } else if (mvt>=6 && i<6 && !hitboxLvl[levelNumber][hero.heroPos1+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos2+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos3+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos4+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos5+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos6+128].startsWith("wall")) {
      y+=8;
      i+=3;
      firstChute=false;
    } else if (i>=6 && nbMontee==0 && nbDescente>0) {
      nbDescente--;
      i=0;
      heroHitboxChute();
    }
    if ( hitboxLvl[levelNumber][hero.heroPos1+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos2+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos3+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos4+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos5+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos6+128].startsWith("wall")) {
      jumping=false;
      resetDessin();
      nbDescente=0;
      firstChute=true;
      if (bonusDoubleJump.doubleJumpOn==true) {
        bonusDoubleJump.doubleJump=true;
      }
    } else {
      jumping=true;
    }
  }
  public void montee() {
    if (nbMontee>0 && j<6  && !hitboxLvl[levelNumber][hero.heroPos18-128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos17-128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos16-128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos15-128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos14-128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos13-128].startsWith("wall")) {
      if (nbMontee==6) {
        if (j==0) {
          vitY=7;
        }
        y-=vitY;
        vitY-=0.5;
      } else if (nbMontee>1 && nbMontee<6) {
        if (j==0 && nbMontee==5) {
          vitY=3.1;
        }
        y-=vitY;
        vitY-=0.1;
      }
      j++;
    } else if (j==6 && nbDescente==0) {
      hero.saut=false;
      if (bonusDoubleJump.trigDoubleJump==true) {
        bonusDoubleJump.trigDoubleJump=false;
        bonusDoubleJump.doubleJump=false;
      }
      j=0;
      if (nbMontee>1) {
        hero.heroHitboxHaut();
      }
      nbMontee--;
    } else {
      nbMontee=0;
    }
  }

  public void dash() {
    if (bonusDash.trigDash==true) {
      int offset=0;
      for (int i=0; i<24; i++) {
        hero.dessin();
        if (lastMove==GAUCHE) {
          heroHitboxGauche(1);
        }
        if (lastMove==DROITE) {
          heroHitboxDroite(1);
        }
        hero.mvtDroite();
        hero.mvtGauche();
        hero.contactEnd();
        currentFrame=(currentFrame+1) % 29;
        image(heroDashL[(currentFrame+offset)%29], x, y);
        offset+=1;
        image(heroDashL[(currentFrame+offset)%29], x, y);
        offset+=1;
      }
    }
    bonusDash.trigDash=false;
  }

  public void TP() {
    if (bonusTP.trigTP==true) {
      int offset=0;
      if (lastMove==GAUCHE) {
        heroHitboxGauche(16);
      }
      if (lastMove==DROITE) {
        heroHitboxDroite(16);
      }
      bonusTP.trigTP=false;
      currentFrame=(currentFrame+1) % 15;
      image(heroTPR[((currentFrame+offset)%20)+19], x, y);
      offset+=1;
      image(heroTPR[((currentFrame+offset)%20)+19], x, y);
      offset+=1;
    }
  }
  public void NoClip() {
    if (bonusNoClip.trigNoClip==true) {
    }
  }

  public void contactSpike() {
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("spike") || hitboxLvl[levelNumber][heroPos17].startsWith("spike") || hitboxLvl[levelNumber][heroPos16].startsWith("spike") || hitboxLvl[levelNumber][heroPos15].startsWith("spike") || hitboxLvl[levelNumber][heroPos14].startsWith("spike") || hitboxLvl[levelNumber][heroPos13].startsWith("spike") || hitboxLvl[levelNumber][heroPos12].startsWith("spike") || hitboxLvl[levelNumber][heroPos11].startsWith("spike") || hitboxLvl[levelNumber][heroPos10].startsWith("spike") || hitboxLvl[levelNumber][heroPos9].startsWith("spike") || hitboxLvl[levelNumber][heroPos8].startsWith("spike") || hitboxLvl[levelNumber][heroPos7].startsWith("spike") || hitboxLvl[levelNumber][heroPos6].startsWith("spike") || hitboxLvl[levelNumber][heroPos5].startsWith("spike") || hitboxLvl[levelNumber][heroPos4].startsWith("spike") || hitboxLvl[levelNumber][heroPos3].startsWith("spike") || hitboxLvl[levelNumber][heroPos2].startsWith("spike") || hitboxLvl[levelNumber][heroPos1].startsWith("spike")) {
      String actualLevel="lvl"+str(i+1);
      hitboxLvl[levelNumber]=loadStrings("data/levels/lvlsHitbox/"+actualLevel+".txt");
    }
  }
  public void contactBonusDoubleJump() {
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("BJump") || hitboxLvl[levelNumber][heroPos17].startsWith("BJump") || hitboxLvl[levelNumber][heroPos16].startsWith("BJump") || hitboxLvl[levelNumber][heroPos15].startsWith("BJump") || hitboxLvl[levelNumber][heroPos14].startsWith("BJump") || hitboxLvl[levelNumber][heroPos13].startsWith("BJump") || hitboxLvl[levelNumber][heroPos12].startsWith("BJump") || hitboxLvl[levelNumber][heroPos11].startsWith("BJump") || hitboxLvl[levelNumber][heroPos10].startsWith("BJump") || hitboxLvl[levelNumber][heroPos9].startsWith("BJump") || hitboxLvl[levelNumber][heroPos8].startsWith("BJump") || hitboxLvl[levelNumber][heroPos7].startsWith("BJump") || hitboxLvl[levelNumber][heroPos6].startsWith("BJump") || hitboxLvl[levelNumber][heroPos5].startsWith("BJump") || hitboxLvl[levelNumber][heroPos4].startsWith("BJump") ||  hitboxLvl[levelNumber][heroPos3].startsWith("BJump") || hitboxLvl[levelNumber][heroPos2].startsWith("BJump") || hitboxLvl[levelNumber][heroPos1].startsWith("BJump")) {
      bonusDoubleJump.doubleJump=true;
      bonusDoubleJump.doubleJumpOn=true;
      bonusDash.dash=false;
      bonusTP.bonusTP=false;
      bonusNoClip.noClip=false;
      bonusDoubleJump.x=2000;
      bonusDoubleJump.y=2000;
    }
  }
  public void contactBonusDash() {
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("BDash") || hitboxLvl[levelNumber][heroPos17].startsWith("BDash") || hitboxLvl[levelNumber][heroPos16].startsWith("BDash") || hitboxLvl[levelNumber][heroPos15].startsWith("BDash") || hitboxLvl[levelNumber][heroPos14].startsWith("BDash") || hitboxLvl[levelNumber][heroPos13].startsWith("BDash") || hitboxLvl[levelNumber][heroPos12].startsWith("BDash") || hitboxLvl[levelNumber][heroPos11].startsWith("BDash") || hitboxLvl[levelNumber][heroPos10].startsWith("BDash") || hitboxLvl[levelNumber][heroPos9].startsWith("BDash") || hitboxLvl[levelNumber][heroPos8].startsWith("BDash") || hitboxLvl[levelNumber][heroPos7].startsWith("BDash") || hitboxLvl[levelNumber][heroPos6].startsWith("BDash") || hitboxLvl[levelNumber][heroPos5].startsWith("BDash") || hitboxLvl[levelNumber][heroPos4].startsWith("BDash") || hitboxLvl[levelNumber][heroPos3].startsWith("BDash") || hitboxLvl[levelNumber][heroPos2].startsWith("BDash") || hitboxLvl[levelNumber][heroPos1].startsWith("BDash")) {
      bonusDash.x=2000;
      bonusDash.y=2000;
      bonusDash.dash=true;
      bonusTP.bonusTP=false;
      bonusDoubleJump.doubleJump=false;
      bonusDoubleJump.doubleJumpOn=false;
      bonusNoClip.noClip=false;
    }
  }
  public void contactBonusTP() {
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("BTP") || hitboxLvl[levelNumber][heroPos17].startsWith("BTP") || hitboxLvl[levelNumber][heroPos16].startsWith("BTP") || hitboxLvl[levelNumber][heroPos15].startsWith("BTP") || hitboxLvl[levelNumber][heroPos14].startsWith("BTP") || hitboxLvl[levelNumber][heroPos13].startsWith("BTP") || hitboxLvl[levelNumber][heroPos12].startsWith("BTP") || hitboxLvl[levelNumber][heroPos11].startsWith("BTP") || hitboxLvl[levelNumber][heroPos10].startsWith("BTP") || hitboxLvl[levelNumber][heroPos9].startsWith("BTP") || hitboxLvl[levelNumber][heroPos8].startsWith("BTP") || hitboxLvl[levelNumber][heroPos7].startsWith("BTP") || hitboxLvl[levelNumber][heroPos6].startsWith("BTP") || hitboxLvl[levelNumber][heroPos5].startsWith("BTP") || hitboxLvl[levelNumber][heroPos4].startsWith("BTP") || hitboxLvl[levelNumber][heroPos3].startsWith("BTP") || hitboxLvl[levelNumber][heroPos2].startsWith("BTP") || hitboxLvl[levelNumber][heroPos1].startsWith("BTP")) {
      bonusTP.x=2000;
      bonusTP.y=2000;
      bonusTP.bonusTP=true;
      bonusDash.dash=false;
      bonusDoubleJump.doubleJump=false;
      bonusDoubleJump.doubleJumpOn=false;
      bonusNoClip.noClip=false;
    }
  }

  public void contactBonusNoClip() {
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos17].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos16].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos15].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos14].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos13].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos12].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos11].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos10].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos9].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos8].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos7].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos6].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos5].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos4].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos3].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos2].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos1].startsWith("BnoClip")) {
      bonusNoClip.x=2000;
      bonusNoClip.y=2000;
      bonusNoClip.noClip=true;
      bonusTP.bonusTP=false;
      bonusDash.dash=false;
      bonusDoubleJump.doubleJump=false;
      bonusDoubleJump.doubleJumpOn=false;
    }
  }
  public void contactEnd() {
    // println(hitboxLvl[levelNumber][hero.heroPos18]);
    //println(lastMove);
    // println(lastMove==DROITE);
    if (lastMove==GAUCHE && (hitboxLvl[levelNumber][hero.heroPos18-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos17-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos16-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos15-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos14-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos13-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos12-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos11-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos10-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos9-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos8-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos7-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos6-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos5-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos4-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos4-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos3-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos2-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos1-1].equals("end"+levelNumber))) {
      heroHitboxDroite(120);
    }
    if (lastMove==DROITE && (hitboxLvl[levelNumber][hero.heroPos18+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos17+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos16+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos15+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos14+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos13+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos12+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos11+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos10+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos9+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos8+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos7+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos6+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos5+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos4+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos4+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos3+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos2+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos1+1].equals("end"+levelNumber))) {
      heroHitboxGauche(120);
    }
    if (lastMove==GAUCHE) {
      if (hitboxLvl[levelNumber][hero.heroPos18-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos18-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos17-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos17-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos16-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos16-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos15-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos15-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos14-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos14-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos13-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos13-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos12-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos12-1].substring(3));

        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos11-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos10-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos10-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos9-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos9-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos8-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos8-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos7-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos7-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos6-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos6-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos5-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos5-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos4-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos4-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos3-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos3-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos2-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos2-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos1-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos1-1].substring(3));
      }
    } else  if (lastMove==DROITE) {
      if (hitboxLvl[levelNumber][hero.heroPos18+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos18+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos17+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos17+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos16+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos16+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos15+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos15+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos14+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos14+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos13+1].startsWith("end")) {      
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos13+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos12+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos12+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos11+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos11+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos10+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos10+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos9+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos9+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos8+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos8+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos7+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos7+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos6+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos6+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos5+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos5+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos4+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos4+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos3+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos3+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos2+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos2+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos1+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos1+1].substring(3));
      }
    }
  }
}