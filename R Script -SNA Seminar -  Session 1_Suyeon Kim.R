#Activating the igraph package tells R that your code uses language and functions associated with that package
install.packages("igraph")
library(igraph)
install.packages("tidyverse")
library(tidyverse)
# Bringing in an Edgelist from a .csv
hog_crush <- read.csv(file.choose(),header=TRUE)  #select crush data

#Convert the .csv into a graph object so R knows what to do with it
crush_edge <- graph_from_data_frame(d = hog_crush, directed = TRUE)

#View the graph object - it looks like the edge list you begin with! 
crush_edge

#Visualise and inspect your network! 
plot(crush_edge)


# Bring it into R
hog_data  <- read.csv(file.choose(),header=TRUE, row.names=1) #select hogwarts houses one mode
# Note the rownames option is used on matrices, not edgelists. 
view(hog_data)
#Tell R it is a matrix
hog_matrix <- as.matrix(hog_data)

# Make it a network object
hog_network <- graph.adjacency(hog_matrix, mode = "undirected", diag = FALSE)

# Examine object
hog_network

# Plot Object
plot(hog_network)


### TWO MODE NETWORK 
# bring it in as a matrix
hog_two_data <- read.csv(file.choose(),header=TRUE,row.names=1) # select hogwarts houses - two mode
hog_two_matrix <- as.matrix(hog_two_data)

hog_two_matrix

# Now use 'graph.incidence() to tell R it is a two mode network
hog_two_network <- graph.incidence(hog_two_matrix)

#Inspect it
hog_two_network

# Plot it - Can't really tell the houses from the students
plot(hog_two_network)

# Change the colours to represent different node types
plot(hog_two_network, vertex.color = V(hog_two_network)$type)

# OR the standard way to do it is different node shapes for one and the other type

#So we create the "rules" that we want to use for our network

#what shapes we want them to be
shapes <- c("circle", "square")
# What colours they should be
colors <-c("yellow", "orange")

# Then we can plot them based on your design parameters
plot(hog_two_network, vertex.color=colors[V(hog_two_network)$type+1],
     vertex.shape=shapes[V(hog_two_network)$type+1])
