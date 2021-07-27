class TabItem{
  private String title, displayTitle, url;
  private int index;
  
  private PImage webpage;
  
  public TabItem(String titleIn, String urlIn, PImage webpageIn){
    title = titleIn;
    displayTitle = title;
    url = urlIn;
    index = -1;
    webpage = webpageIn;
  }
  
  public String getTitle(){
    return title;
  }
  
  public void setTitle(String newTitle){
    title = newTitle;
    displayTitle = title;
  }
  
  public String getURL(){
    return url;
  }
  
  public void setURL(String urlIn){
    url = urlIn;
  }
  
  public int getIndex(){
    return index;
  }
  
  public void setIndex(int newIndex){
    index = newIndex;
  }
  
  public PImage getWebpage(){
    return webpage;
  }
  
  public void setWebpage(PImage webpageIn){
    webpage = webpageIn;
  }
  
  public void display(boolean isSelected, int x, int y){
    // Draw tab and contents
    int tabWidth = browser.getTabBar().getGlobalTabWidth();
    
    if(isSelected){
      image(tab_selected, x + index + (index * tabWidth), y);
      text(displayTitle, x + (index * tabWidth) + 10 + index, y + 17);
      image(tab_close, x + ((index * tabWidth) + (tabWidth - tab_close.width - 10)) + index, y + 8);
    }else{
      image(tab_unselected, x + index + (index * tabWidth), y);
      text(displayTitle, x + (index * tabWidth) + 10 + index, y + 17);
      image(tab_close, x + ((index * tabWidth) + (tabWidth - tab_close.width - 10)) + index, y + 8);
    }
    
  }
  
  public boolean MouseIsOverTab(){
    int x = browser.getX();
    int y = browser.getY();
    int tabWidth = browser.getTabBar().getGlobalTabWidth();
    return (mouseX > x + (index * tabWidth) && mouseX < x + (index * tabWidth) + tabWidth && mouseY >= y && mouseY < y + browser.getTabBar().getGlobalTabHeight());
  }
  
  public boolean MouseIsOverX(){
    int x = browser.getX();
    int y = browser.getY();
    int tabWidth = browser.getTabBar().getGlobalTabWidth();
    int leftBound = ((index * tabWidth) + (int)(tabWidth - tab_close.width - 10)) + index;
    return (mouseX > x + leftBound && mouseX < x + leftBound + tab_close.width && mouseY >= y + 8 && mouseY < y + 28);
  }
  
  public void recalculateTitleWidth(){
    int tabWidth = browser.getTabBar().getGlobalTabWidth();
    
    // Shorten title if necessary
    String formattedTitle = title;
    int overflowLimit = (int)((tabWidth - tab_close.width - 10) * 0.85);
    while(textWidth(formattedTitle) > overflowLimit){
      formattedTitle = formattedTitle.substring(0,formattedTitle.length()-1);
    }
    if(!formattedTitle.equals(title)){
      formattedTitle = formattedTitle.substring(0,formattedTitle.length()-2) + "..";
    }
    displayTitle = formattedTitle;
  }
}
