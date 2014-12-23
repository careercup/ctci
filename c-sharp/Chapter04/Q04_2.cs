
using System;
using ctci.Contracts;
using System.Collections.Generic;

namespace Chapter04
{
    public class Q04_2 : IQuestion
    {
	    enum State
        {
		    Unvisited, Visited, Visiting
	    }

        class Node
        {
            public Node[] Adjacent { get; set; }
            public int AdjacentCount { get; set; }
            public String Vertex { get; set; }
            public State State { get; set; }

            public Node(String vertex, int adjacentLength)
            {
                Vertex = vertex;                
                AdjacentCount = 0;
                Adjacent = new Node[adjacentLength];
            }
    
            public void AddAdjacent(Node x)
            {
                if (AdjacentCount < 30) {
                    Adjacent[AdjacentCount] = x;
                    AdjacentCount++;
                } else {
                    Console.Write("No more adjacent can be added");
                }
            }
        }

        class Graph 
        {
            public Node[] Nodes { get; set; }
            public int Count { get; set; }

	        public Graph()
            {
		        Nodes = new Node[6];
		        Count = 0;
            }
	
            public void AddNode(Node x)
            {
		        if (Count < 30) {
			        Nodes[Count] = x;
			        Count++;
		        } else {
			        Console.Write("Graph full");
		        }
            }
        }

	    Graph CreateNewGraph()
	    {
		    Graph g = new Graph();        
		    Node[] temp = new Node[6];

		    temp[0] = new Node("a", 3);
		    temp[1] = new Node("b", 0);
		    temp[2] = new Node("c", 0);
		    temp[3] = new Node("d", 1);
		    temp[4] = new Node("e", 1);
		    temp[5] = new Node("f", 0);

		    temp[0].AddAdjacent(temp[1]);
		    temp[0].AddAdjacent(temp[2]);
		    temp[0].AddAdjacent(temp[3]);
		    temp[3].AddAdjacent(temp[4]);
		    temp[4].AddAdjacent(temp[5]);
		    for (int i = 0; i < 6; i++) {
			    g.AddNode(temp[i]);
		    }
		    return g;
	    }

        bool Search(Graph g,Node start,Node end)
        {  
            LinkedList<Node> q = new LinkedList<Node>();
            foreach (Node n in g.Nodes)
            {
                n.State = State.Unvisited;
            }
            start.State = State.Visiting;
            q.AddLast(start);
            while(q.Count!=0)
            {
                Node u = q.First.Value;
                q.RemoveFirst();
                if (u != null)
                {
	                foreach (Node v in u.Adjacent)
                    {
	                    if (v.State == State.Unvisited)
                        {
	                        if (v == end)
                            {
	                            return true;
	                        }
                            else
                            {
	                            v.State = State.Visiting;
	                            q.AddLast(v);
	                        }
	                    }
	                }
	                u.State = State.Visited;
                }
            }
            return false;
        }

        public void Run()
        {
		    Graph g = CreateNewGraph();
            Node[] n = g.Nodes;
		    Node start = n[3];
		    Node end = n[5];
		    Console.WriteLine(Search(g, start, end));
        }
    }
}
