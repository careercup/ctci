
using ctci.Contracts;
using System;
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
    
            public void AddAdjacent(Node node)
            {
                if (AdjacentCount < 30) 
                {
                    Adjacent[AdjacentCount] = node;
                    AdjacentCount++;
                } 
                else 
                {
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
	
            public void AddNode(Node node)
            {
		        if (Count < 30) 
                {
                    Nodes[Count] = node;
			        Count++;
		        } 
                else 
                {
			        Console.Write("Graph full");
		        }
            }
        }

	    Graph CreateNewGraph()
	    {
		    var graph = new Graph();        
		    var nodes = new Node[6];

		    nodes[0] = new Node("a", 3);
		    nodes[1] = new Node("b", 0);
		    nodes[2] = new Node("c", 0);
		    nodes[3] = new Node("d", 1);
		    nodes[4] = new Node("e", 1);
		    nodes[5] = new Node("f", 0);

		    nodes[0].AddAdjacent(nodes[1]);
		    nodes[0].AddAdjacent(nodes[2]);
		    nodes[0].AddAdjacent(nodes[3]);
		    nodes[3].AddAdjacent(nodes[4]);
		    nodes[4].AddAdjacent(nodes[5]);
		    for (var i = 0; i < 6; i++) 
            {
			    graph.AddNode(nodes[i]);
		    }

		    return graph;
	    }

        bool Search(Graph graph, Node start, Node end)
        {  
            var nodeList = new LinkedList<Node>();

            foreach (var node in graph.Nodes)
            {
                node.State = State.Unvisited;
            }

            start.State = State.Visiting;
            nodeList.AddLast(start);

            while(nodeList.Count != 0)
            {
                var unvisited = nodeList.First.Value;
                nodeList.RemoveFirst();

                if (unvisited != null)
                {
	                foreach (var adjacentNode in unvisited.Adjacent)
                    {
	                    if (adjacentNode.State == State.Unvisited)
                        {
	                        if (adjacentNode == end)
                            {
	                            return true;
	                        }
                            else
                            {
	                            adjacentNode.State = State.Visiting;
	                            nodeList.AddLast(adjacentNode);
	                        }
	                    }
	                }
	                unvisited.State = State.Visited;
                }
            }

            return false;
        }

        public void Run()
        {
		    var graph = CreateNewGraph();
            var nodes = graph.Nodes;
            var start = nodes[3];
            var end = nodes[5];

		    Console.WriteLine(Search(graph, start, end));
        }
    }
}