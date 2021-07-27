class TabBar{
  private ArrayList<TabItem> tabs;
  
  private int globalTabWidth, globalTabHeight;
  private int globalMaxWidth, globalMaxTabWidth;
  
  private int currentSelected;
  
  public TabBar(int defaultWidth, int defaultHeight, int maxWidth){
    tabs = new ArrayList();
    currentSelected = -1;
    
    globalTabWidth = defaultWidth;
    globalTabHeight = defaultHeight;
    globalMaxWidth = maxWidth;
    globalMaxTabWidth = defaultWidth;
  }
  
  public int count(){
    return tabs.size();
  }
  
  public int getGlobalTabWidth(){
    return globalTabWidth;
  }
  
  public int getGlobalTabHeight(){
    return globalTabHeight;
  }
  
  public int getSelectedIndex(){
    return currentSelected;
  }
  
  public TabItem get(int index){
    return tabs.get(index);
  }
  
  public void removeTab(int index){
    if(index == 0 && tabs.size() > 1){
      select(0);
    }else{
      select(index-1);
    }
    
    for(int i=index;i<tabs.size();i++){
      tabs.get(i).setIndex(tabs.get(i).getIndex() - 1);
    }
    tabs.remove(index);
    recalculateTabWidth();
  }
  
  public void addTab(TabItem item){
    item.setIndex(tabs.size());
    tabs.add(item);
    
    select(tabs.size() - 1);
    recalculateTabWidth();
  }
  
  public void display(int x, int y){
    for(int i=0;i<tabs.size();i++){
      if(i == currentSelected){
        tabs.get(i).display(true, x, y);
      }else{
        tabs.get(i).display(false, x, y);
      }
    }
    image(tab_add, x + tabs.size() + (tabs.size() * globalTabWidth), y);
  }
  
  public void select(int index){
    currentSelected = index;
  }
  
  public void recalculateTabWidth(){
    // Update tab width
    if(tabs.size() > 0){
      int goalWidth = globalMaxWidth / tabs.size();
      if(goalWidth < globalMaxTabWidth){
        globalTabWidth = goalWidth;
      }else{
        globalTabWidth = globalMaxTabWidth;
      }
      tab_unselected.resize(globalTabWidth, globalTabHeight);
      tab_selected.resize(globalTabWidth, globalTabHeight);
    }else{
      globalTabWidth = globalMaxTabWidth;
      tab_unselected.resize(globalTabWidth, globalTabHeight);
      tab_selected.resize(globalTabWidth, globalTabHeight);
    }
    
    // Update max text length of each tab
    for(int i=0;i<tabs.size();i++){
      tabs.get(i).recalculateTitleWidth();
    }
  }
  
  public boolean MouseIsOverAdd(){
    int i = tabs.size()-1;
    int x = browser.getX();
    int y = browser.getY();
    int leftBound = (i * globalTabWidth) + globalTabWidth + i;
    return ((mouseX > x + leftBound) && mouseX < x + leftBound + tab_add.width && mouseY >= y && mouseY < y + globalTabHeight);
  }
}
