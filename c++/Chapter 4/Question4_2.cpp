#include<iostream>
#include<cstdio>
#include<queue>
#include<cstring>
using namespace std;
const int MAX = 100;

bool isRoute(int a, int b, bool graph[][MAX]){
    queue<int> Que;
    bool visited[MAX];
    memset(visited, false, sizeof(visited));
    Que.push(a);
    visited[a] = true;
    int tmp;
    while(!Que.empty()){
        tmp = Que.front();
        Que.pop();
        for(int i=0; i<MAX; i++){
            if(graph[tmp][i] && !visited[i]){
                if(b==i)
                    return true;
                Que.push(i);
                visited[i]=true;
            }
        }
    }
    return false;
}

int main(){
    freopen("4.2.in", "r", stdin);
    int n, m, u, v;
    bool dgraph[MAX][MAX];
    cin>>n>>m;
    for(int i=0; i<m; i++){
        cin>>u>>v;
        dgraph[u][v] = true;
    }
    cout<<isRoute(0, 3, dgraph);
}
