# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Gist.create(snippet:'#include <stdio.h>
int main() 
{ 
  int a = 3;
  int b = 5;

  printf("%i",a+b);

  return 0;
}', lang:'c',description:'Program w C')

Gist.create(snippet:'int funkcja(int a, int b, int c)
{  
  for(int i=0; i<b; i++)
  {
    c += b;
    c -= i;
  }
 
  return c;
}',lang:'c++',description:'Funkcja w C++')

Gist.create(snippet:'public class Hello {
  public static void main(String[] args) {
    System.out.print("Hello World");
  }
}',lang:'java',description:'Hello world w Javie')

Gist.create(snippet:'body { 
  background-color: #fff; 
  color: #333; 
  margin:0;
}

.action {
  border:solid 1px #000000;
  text-align: center;
  width:90px;
  background-color:#99CCFF;
  padding:1px; 
  margin-left: 10px;
  margin-right: 10px;
  margin-bottom: 10px;
  margin-top: 10px;
}',lang:'css',description:'CSS')

Gist.create(snippet:'<!DOCTYPE html>
<html>
  <head>
    <meta charset=UTF-8"/>
    <title>Home Page</title>
  </head>
  <body>
    <h1>Naglowek 1</h1>
  </body>
</html>',lang:'html',description:'HTML')

Gist.create(snippet:'def b.dec
  @val -= 1
end

begin
  b.dec
  a.dec
rescue StandardError => msg
  print "Error: ", msg, "\n"
end

print "D: ", a.get, " ", b.get,"\n";',lang:'ruby',description:'RUBY')