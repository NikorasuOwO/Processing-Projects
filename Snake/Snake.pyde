class Snake:
    
    posX = [800/2]
    posY = [800/2]
    direction = 0
    
    def __init__(self, a, b):
        self.posX = [a]
        self.posY = [b]
    
    def eats(self,Ax,Ay): # we are passing the coordinates of the apple
        
        if(Ax == self.posX[0] and Ay == self.posY[0]): # if Apple is eaten
            return True # The Snake did eat
        else:
            return False
    
    def should_die(self, x, y): # We are passing the next position
        
        if(x > 800-40 or y > 800-40 or x < 0 or y < 0):
            #println("EDGE DEATH")
            return True
        
        for i in range(len(self.posX)):
            if x==self.posX[i] and y==self.posY[i] and (self.direction!=0):
                return True
        return False
        
    def updater(self, direction, Ax, Ay):
        newX = self.posX[0]
        newY = self.posY[0]
        if direction == 1 or direction == -1:
            newY = self.posY[0] + direction*40
        else:
            newX = self.posX[0] + (direction/2)*40
        
        if(self.should_die(newX, newY)):
            println("IM DED")
            setup()
            
        elif not self.eats(Ax, Ay):
           ##print("NO COME" + str(self.posX)+" | "+str(self.posY))
           self.posX.insert(0,newX)
           self.posX.pop(len(self.posX)-1)
           self.posY.insert(0,newY)
           self.posY.pop(len(self.posY)-1)
        else:
            #print("COME"+str(self.posX)+" | "+str(self.posY))
            self.posX.insert(0,newX)
            self.posY.insert(0,newY)
            #println(str(self.posX)+" | "+str(self.posY))
    
class Apple:
    
    x = 0
    y = 0
    

    def random_spot(self):
        self.prev_x = self.x
        self.prev_y= self.y
        
        self.x = random(40,800)
        self.y = random(40, 800)
        self.x = self.x - self.x%40
        self.y = self.y - self.y%40
    
    
def setup():
    size(800,800)
    background(200,255,200)
    global Snk
    Snk = Snake(width/2, height/2)
    global App
    App = Apple()
    App.random_spot()
    
    frameRate(15)
    
    
def draw_edges(n):
    stroke(0)
    strokeWeight(5)
    fill(40,255,40)
    line(0,0,width,0)
    line(width,0,width, height)
    line(width, height, 0,height)
    line(0,height, 0,0)
    
    textSize(5*n + 30)
    text(str(n),width/2,height/2)


def draw():
    background(200,255,200)
    draw_edges(len(Snk.posX))
    
    if keyPressed:
        if (key == 'w') or keyCode==UP:
            Snk.direction = -1
            Snk.updater(-1, App.prev_x, App.prev_y)
        if key == 's' or keyCode==DOWN:
            Snk.direction = 1
            Snk.updater(1, App.prev_x, App.prev_y)
        if key == 'a' or keyCode==LEFT:
            Snk.updater(-2, App.prev_x, App.prev_y)
            Snk.direction = -2
        if key == 'd' or keyCode==RIGHT:
            Snk.updater(2, App.x, App.y)
            Snk.direction = 2    
    else:
        Snk.updater(Snk.direction, App.prev_x, App.prev_y)
    rectMode(CORNER)
    
    fill(255,100,100)
    rect(App.x, App.y, 40, 40)
    
    if(Snk.direction != 0):
        fill(random(0,255),random(0,255),random(0,255))
        for i in range (len(Snk.posX)):
            rect(Snk.posX[i],Snk.posY[i],40,40)
    else:
        fill(20,255,20)
        rect(Snk.posX[0], Snk.posY[0], 40, 40)


    if(Snk.eats(App.x, App.y)):
        ##print("COMIDA, x= " + str(App.x), "y= " + str(App.x))
        App.random_spot()
