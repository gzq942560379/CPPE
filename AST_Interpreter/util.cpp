
#include "util.h"
#include <fstream>
#include <sstream>

using namespace std;

string ReadFileIntoString(char *filename)
{
   ifstream file(filename);
   ostringstream buf;
   char ch;
   while (buf && file.get(ch))
      buf.put(ch);
   return buf.str();
}
