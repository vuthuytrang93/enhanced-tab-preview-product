PImage windows_background, window_bar_bottom, webpage_default;
PImage tab_selected, tab_unselected, tab_add, tab_close;
PImage webpage_amazon_remote;

BrowserWindow browser;

void setup(){
  fullScreen();
  background(0,0,0);
  textSize(14);
  fill(0,0,0);
  textAlign(LEFT, CENTER);
  
  // Load static components
  windows_background = loadImage("windows/windows_background.png");
  window_bar_bottom = loadImage("windows/windows_bar.png");
  
  
  // Load dynamic content
  tab_selected = loadImage("browser/tab.png");
  tab_unselected = loadImage("browser/tab_unselected.png");
  tab_add = loadImage("browser/tab_add.png");
  tab_close = loadImage("browser/tab_close.png");
  
  // Load webpage content
  webpage_default = loadImage("webpages/google/homepage.png");
  webpage_amazon_remote = loadImage("webpages/amazon/remote.png");
  
  // Default browser window size: 1200x700, centered on screen
  browser = new BrowserWindow(false, (width/2) - 600,(height/2) - 350, 1200, 700);
  browser.getTabBar().addTab(new TabItem("Fire TV Stick 4K streaming device", "www.amazon.ca/Stick-All-New-Remote-streaming-player", webpage_amazon_remote));
}

void draw(){
  // Draw top window bar and url bar
  image(windows_background, 0,0);
  
  browser.display();
  
  //image(window_bar_bottom);
  image(window_bar_bottom, 0, height - window_bar_bottom.height);
}

void mousePressed(){
  browser.checkForTabClick();
  browser.checkForNewTabClick();
}
