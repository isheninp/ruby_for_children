# LIFE GAME simple edition

@age=0
@x_max, @y_max = 78, 50
@entities=[]
@max_ent=444
@mutation_children=0.001
@mutation_dead=0.0
@mutation_children_count=0
@mutation_dead_count=0
# @entities+=[[40,9], [40,10], [40,11], [40,12], [40,13], [40,14], [40,15]]
@entities+=[[40,19],[40,20],[40,21],[40,22],[40,23],[40,24],[40,25],[40,26],[40,27], [40,28]]

def move
  children=[]
  dead=[]
  (1..@y_max).each do |y|
    (1..@x_max).each do |x|
      c = touch_count(x,y)
      if place_empty?(x,y)
        if c == 3 && x>1 && y>1 && x<@x_max and y<@y_max
          children << [x,y]
          point(x,y,42)
        end
        if c > 0 && rand < @mutation_children && x>1 && y>1 && x<@x_max and y<@y_max
          children << [x,y]
          point(x,y,44)
          @mutation_children_count+=1
        end
      else
        if c<3 || c>4
          dead << [x,y]
          point(x,y,47)
        end
        if rand < @mutation_dead
          dead << [x,y]
          point(x,y,47)
          @mutation_dead_count+=1
        end
      end
    end
  end
  @entities = @entities - dead + children
end

def place_empty?(x,y)
  [[x,y]]-@entities != []
end

def touch_count(x,y)
  count = 0
  (-1..1).each do |dx|
    (-1..1).each do |dy|
      count=count+1 unless place_empty?(x+dx,y+dy)
    end
  end
  return count
end

#\033[<L>;<C>H # Move the cursor to line L, column C
#\033[<N>A     # Move the cursor up N lines
#\033[<N>B     # Move the cursor down N lines
#\033[<N>C     # Move the cursor forward N columns
#\033[<N>D     # Move the cursor backward N columns
#\033[2J       # Clear the screen, move to (0,0)
#\033[K        # Erase to end of line

def cursor(x,y)
  print "\033[#{y};#{x+x}H"
  # print "\033[#{y}B"
  # print "\033[#{x}C"
end

def cls
  puts "\033[2J"
end

def point(x,y,color)
  cursor(x,y)
  printf "\033[#{color}m  \033[0m\n"
end

def show_board
  (0..@x_max).each do |x|
    point(x,0,41)
    point(x,@y_max,41)
  end
  (0..@y_max).each do |y|
    point(0,y,41)
    point(@x_max,y,41)
  end
  (2..@y_max-1).each do |y|
    (1..@x_max-1).each do |x|
      point(x,y,47)
    end
  end
end

def earth
  @entities.each do |entity|
    point(entity[0],entity[1],42)
  end
end

def rnd_entities
  (1..@max_ent).each do
   @entities << [2+rand(@x_max-3), 3+rand(@y_max-4)]
  end
end

#rnd_entities
cls
show_board

earth

t1=Time.now
loop do 
# (1..50).each do
  cursor(2,@y_max+2)
  print("Age: #{@age}, count:#{@entities.count}, mutation_children:#{@mutation_children_count}, mutation_dead:#{@mutation_dead_count}                                     ")
  move
  # earth
  @age+=1
  exit if @entities.count==0
end
t2=Time.now
p t2-t1

# printf "\033[0mAll attributes off\033[0m\n"
# printf "\033[1mBold\033[0m\n"
# printf "\033[4mUnderline\033[0m\n"
# printf "\033[5mBlink\033[0m\n"
# printf "\033[8mHide\033[0m\n"
# printf "\033[30mBlack\033[0m\n"
# printf "\033[31mRed\033[0m\n"
# printf "\033[32mGreen\033[0m\n"
# printf "\033[33mYellow\033[0m\n"
# printf "\033[34mBlue\033[0m\n"
# printf "\033[35mMagenta\033[0m\n"
# printf "\033[36mCyan\033[0m\n"
# printf "\033[37mWhite\033[0m\n"
# printf "\033[40m\033[37mBlack Background\033[0m\n"
# printf "\033[41mRead Background\033[0m\n"
# printf "\033[42mGreen Background\033[0m\n"
# printf "\033[43mYellow Background\033[0m\n"
# printf "\033[44mBlue Background\033[0m\n"
# printf "\033[45mMagenta Background\033[0m\n"
# printf "\033[46mCyan Background\033[0m\n"
# printf "\033[47mWhite Background\033[0m\n"

# cursor(10,10)
# print "O"
# sleep 2
