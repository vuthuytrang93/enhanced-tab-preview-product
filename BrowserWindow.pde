class BrowserWindow{
  private TabBar tabBar;
  
  private PImage window_top_bar, window_url_bar, window_default_webpage;
  private int posX, posY;
  private int bWidth, bHeight;
  private boolean isEnhanced;
  
  public BrowserWindow(boolean isEnhanced, int xIn, int yIn, int widthIn, int heightIn){
    posX = xIn;
    posY = yIn;
    
    bWidth = widthIn;
    bHeight = heightIn;
    
    tabBar = new TabBar(tab_selected.width, tab_selected.height, bWidth - tab_selected.width);
    
    window_top_bar = loadImage("browser/window_top_bar.png");
    window_url_bar = loadImage("browser/url_bar.png");
    window_default_webpage = loadImage("browser/webpage_background.png");
  }
  
  public TabBar getTabBar(){
    return tabBar;
  }
  
  public int getX(){
    return posX;
  }
  
  public int getY(){
    return posY;
  }
  
  public void display(){
    // Static content
    image(window_top_bar, posX, posY);
    image(window_url_bar, posX, posY + window_top_bar.height);
    textAlign(LEFT, CENTER);
    
    
    // Dynamic tabs
    tabBar.display(posX, posY);
  
    // Dynamic webpage
    if(tabBar.getSelectedIndex() >= 0){
      image(tabBar.get(tabBar.getSelectedIndex()).getWebpage(), posX, posY + window_top_bar.height + window_url_bar.height);
      text(tabBar.get(tabBar.getSelectedIndex()).getURL(), posX + 120, posY + window_top_bar.height + 16);
    }else{
      image(window_default_webpage, posX, posY + window_top_bar.height + window_url_bar.height);
      text("", posX + 120, posY + window_top_bar.height + 16);
    }
  }
  
  public void checkForTabClick(){
    for(int i=0;i<tabBar.count();i++){
      if(tabBar.get(i).MouseIsOverTab()){
        tabBar.select(i);
      }
      if(tabBar.get(i).MouseIsOverX()){
        tabBar.removeTab(i);
      }
    }
  }; 
  public void checkForNewTabClick(){
    if(tabBar.MouseIsOverAdd()){
      
      tabBar.addTab(new TabItem("New tab", "", webpage_default));
    }  
  }
}
