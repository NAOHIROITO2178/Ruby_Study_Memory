print "Hello world"
puts "Hello world" #「puts」の場合は改行が付く
p "Hello world"  #デバッグ用

変数
-英小文字（変数名のルール）
msg = "Hello World again"
puts msg

定数
-英大文字（定数名のルール）
VERSION=1.1
puts VERSION

VERSION=1.2
puts VERSION

p 4.8.class
p 4.8.methods

p 10 + 3
p 10 * 3
p 2.4 * 2
p 10 / 3
p 10 % 3
p 10.0 / 3
p Rational(2, 5) + Rational(3, 4)
p 2/5r + 3/4r


p 52.6.round
p 52.6.floor
p 52.6.ceil

文字列
"" 特殊文字 式展開
''
puts"Hell\no Worl\td"
puts'Hell\no Worl\td'

puts"price#{3000 * 4}"
puts'price#{3000 * 4}'

name = "naohiro"
puts"Hello#{name}"

puts"Hello World"
puts"Hello\n"*10

!
-upcase
-upcase!破壊的なメソッド
-downcase reverse

name = "naohiro"
puts name.upcase
puts name
puts name.upcase!
puts name

? 真偽値 true false
p name.empty?
p name.include?("g")

配列
colors = ["red", "blue", "yellow"]

p colors[0]
p colors[-1]
p colors[0..2]
p colors[0...2]
p colors[5]

colors[0] = "pink"
colors[1..2] = ["white", "black"]
colors.push("gold")
colors << "silver"
p colors

p color.size
p color.sort

ハッシュ
- key / value

naohiro 200
yuichiro 400

scores = {"naohiro" => 200, "yuichiro" => 400}
scores = {:naohiro => 200, :yuichiro => 400}
scores = {naohiro: 200, yuichiro: 400}

p scores[:naohiro]
scores[:yuichiro] = 600
p scores

p scores.size
p scores.keys
p scores.values
p scores.has_key?(:naohiro)

変換

x = 50
y = "3"

p x + y.to_i
p x + y.to_f
p x.to_s + y

scores = {naohiro: 200, hiyoku: 400}
p scores.to_a.to_h

puts "he\"llo"
puts 'he\'llo'

puts %Q(hello)
puts %(hello)
puts %q(hello)

p["red", "blue"]
p['red', 'blue']

p %W(red blue)
p %w(red blue)

%s 文字
%d 整数
%f 浮動小数点数

p "name: $s" % "naohiro"
p "name: $10s" % "naohiro"
p "name: $-10s" % "naohiro"

p "id: %d, rate: %10.2f" % [355, 3.284]

printf
sprintf

p sprintf("name: %10s\n", "naohiro")
p sprintf("id: %d, rate: %10.2f\n", 355, 3.284)

score = gets.to_i

if score > 80
  puts "great!"
elsif score > 60
  puts "good!"
else
  puts "so so ..."
end 

puts "great!" if score > 80

signal = gets.chomp

case signal
when "red" 
  puts "stop!"
when "blue", "green"
  puts "go!"
when "yellow" 
  puts "caution!"
else
  puts "wrong signal!"
end

while

i = 0
while i < 10 do
  puts "#{i}: hello"
  i += 1
end

times

10.times do |i|
  puts "#{i}:hello"
end

10.times { |i| puts "#{i}:hello"}

for
for i in 15..20 do
  p i
end

for color in ["red", "blue"]  do
  p color
end

for name, score in {naohiro:200, yuichiro:400} do
  p "#{name}:#{score}"
end

#each
(15..20).each do |i|
  p i
end

["red", "blue"].each do |color|
  p color
end

{naohiro:200, yuichiro:400}.each do |name, score|
  p "#{name}:#{score}"
end

i = 0
loop do 
  p i
  i += 1
end

break
next

10.times do |i|
  if i == 7 then
    #break  #ifのiの値で止まる
    next #ifのiの値をスキップする
  end
  p i
end

def sayHi(name="yoshiaki") #引数
  return "hi! 単位が20足りてない#{name}!"
end

sayHi("naohiro")
sayHi

p sayHi

アクセス権
-public 
-protected
-private:レシーバーを指定できない

クラス
class User
  @@count = 0
  VERSION = 1.1
  attr_accessor :name
  attr_reader :name
  setter: name=(value)
  getter: name

  def initialize(name)
    @@count += 1
    @name = name
  end
  
  オーバーライド
  def sayHi
    puts "hi! from admin!"
    self
    self.name -> @name
    puts "hi! I'm #{@name}"
    puts "hi! I'm #{self.name}"
    sayPrivate
  end

  def self.info
    puts "#{VERSION}: User Class, #{@@count} instances."
  end

  private

   def sayPrivate
     puts "private"
   end

end

User.new.sayHi

tom = User.new("tom")

tom.name = "tom Jr."
p tom.name

tom.sayHi

tim = User.new("tim")
tim.sayHi

sam = User.new("sam")
bob = User.new("bob")
mike = User.new("mike")
User.info

p User::VERSION

User:親クラス、 SuperClass
AdminUser:子クラス、SubClass

class AdminUser < User

  def sayHello
    puts "Hello from #{@name}"
    sayPrivate
  end
  def sayPrivate
    puts "private from Admin"
  end

end

AdminUser.new.sayHello
AdminUser.new.sayPrivate

tom = AdminUser.new("tom")
tom.sayHi
tom.sayHello

module(クラスのようにメソッドや定数をまとめられるもの)
-名前空間

def movie_encode
end

def movie_export
end

module Movie

   VERSION = 1.1

   def self.encode
     puts "encoding..."
   end

   def self.export
     puts "exporting..."
   end

end

Movie.encode
Movie.export

p Movie::VERSION

module Debug

  def info
    puts "#{self.class} debug info..."
  end

end

class Player
  include Debug
end

class Monster
  include Debug
end

Player.new.info
Monster.new.info

例外
class MyError < StandardError; end

x = gets.to_i

begin
  if x == 3
    raise MyError
  end
  p 100 / x
rescue => MyError
  puts "not 3!"
rescue => ex
  p.ex.message
  p.ex.class
  puts "stopped!"
ensure 
  puts "--END!--"
end