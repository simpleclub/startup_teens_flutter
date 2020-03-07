void main() {

//Deklaration + Initialisierung
  int x = 10;
  int y = 2;

//Deklaration z
  int z;
  
//Arithmetische Operationen
  z = x + y;
  z = x - y;
  z = x * y;
  z = x / y as int;
  z = x % y;

//Deklaration v
  bool v;
  
//Vergleichs Operationen
  v = x < y;
  v = x > y;
  v = x <= y;
  v = x >= y;
  v = x == y;
  v = x != y;

//Logische Operationen
  v = x > 20 && x != y;
  v = x > 20 || x != y;
  v = !(x <= y && x != y);

//If else
  if (x < 10) {
    print('X ist kleiner als 10');
  } else if (x == 10) {
    print('X ist gleich 10');
  } else {
    print('X ist größer als 10');
  }

//Nested ff statement
  if (x >= 1) {
    if (x <= 10) {
      print('X ist eine Zahl zwischen 1 und 10');
    }
  }

//Ternary Operator
int num = 5;
String oddEven = (num % 2 == 0) ? 'gerade' : 'ungerade';

//while loop
  int i = 0;

  while (i < 10) {
    print(i.toString());
    i = i + 1;
  }

//List Deklaration
  List<int> numbers1 = [1,2,3,4,5,6,7,8,9]; //mit Initialisierung
  List<int> numbers2 = new List();
  List<int> numbers3 = new List(5);

  numbers1.add(10);
  numbers2.add(1);
  numbers3[0] = 1;

  int firstElem = numbers1.first;
  int lastElem = numbers1.last;
  int listLength = numbers1.length;
  bool listIsEmpty = numbers1.isEmpty;

  for (int num in numbers1) {
    print(num.toString());
  }

//Map
  Map<String, String> prefix = new Map();
  prefix['DE'] = '0049';
  prefix['AT'] = '0043';
  prefix['DK'] = '0045';
  prefix['PL'] = '0048';

  print(prefix['AT']);

}