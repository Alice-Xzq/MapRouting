# MapRouting

The graph produced by the data sets provided when visualized look like the image below.  You are to search for the shortest path using Dijkstra's Algorithm from any one point to any other point in the graph network described in the file usa.txt (provided on Canvas).



"For this assignment we will be working with maps, or graphs whose vertices are points in the plane and are connected by edges whose weights are Euclidean distances. Think of the vertices as cities and the edges as roads connected to them. To represent a map in a file, we list the number of vertices and edges, then list the vertices (index followed by its x and y coordinates), then list the edges (pairs of vertices), and finally the source and sink vertices. For example, input6.txt represents the map below:

six vertex map

Dijkstra’s algorithm. Dijkstra’s algorithm is a classic solution to the shortest path problem on a weighted graph. The basic idea is not difficult to understand. We maintain, for every vertex in the graph, the length of the shortest known path from the source to that vertex, and we maintain these lengths in a priority queue. Initially, we put all the vertices on the queue with an artificially high priority and then assign priority 0.0 to the source. The algorithm proceeds by taking the lowest-priority vertex off the PQ, then checking all the vertices that can be reached from that vertex by one edge to see whether that edge gives a shorter path to the vertex from the source than the shortest previously-known path. If so, it lowers the priority to reflect this new information.

Here is a step-by-step description that shows how Dijkstra’s algorithm finds the shortest path 0-1-2-5 from 0 to 5 in the example above:

process 0 (0.0)
lower 3 to 3841.9
lower 1 to 1897.4
process 1 (1897.4)
lower 4 to 3776.2
lower 2 to 2537.7
process 2 (2537.7)
lower 5 to 6274.0
process 4 (3776.2)
process 3 (3841.9)
process 5 (6274.0)"*

 

For this project you will need to

1 - Before you start coding

Determine what the contents of the usa.txt file mean and how you will turn that into a graph.
Learn Dijkstra's Algorithm
Create and submit a video of explaining with visuals:
what is in usa.txt file
how you will create a priority queue implemented with a array-based heap.
Your plan explaining how Dijkstra's Algorithm works and how you will use it.
2 - Then you code in the data structures and algorithms and create

A console test client
A game app that finds the shortest path between two points in the US.
Extra - 

If time allows, or if you are ambitious, there is a related problem that is also important in computer science and real-world problem solving.  Kruskal's Minimum Spanning Algorithm finds the  set of connections that are the shortest possible total that connect all the nodes in a graph.  Why is this useful?  If you wanted to, for example, connect all the towns in the United States with fiber optic cable but you want to minimize the cost, you would want to connect the towns up to each other in such a way that the sum of all the connection distances was the least.   For example the below image shows a solution to connecting a set of cities with the least total path.  For this project you should use the smaller sets of data for either USA or MiddleEarth, also on Canvas.

exaple Kruskal

 

*Parts of this assignment have been taken from - http://josephpcohen.com/teaching/cs210/project-2-2/ (Links to an external site.)

