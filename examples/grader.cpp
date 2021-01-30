#include <bits/stdc++.h>
using namespace std;

int main(int argc, char *argv[]){
	long long a, b;
	assert(argc>=3);
	freopen(argv[1], "r", stdin);
	cin >> a;
	freopen(argv[2], "r", stdin);
	cin >> b;
	return a>b? 1:0;
}
