
library(igraph)

# Bringing in the data and converting into a network object
edge_list <- read.csv(file.choose(), header = TRUE) ## Select "GRIME_EDGE_LIST_2008 _GRIME ONLY.csv"
my_graph <- graph_from_data_frame(d=edge_list, directed = TRUE)

#It needs a quick cleanup!
plot(my_graph, vertex.size = 8) 

##Removing Loops
my_graph <- delete.edges(my_graph, E(my_graph)[is.loop(my_graph)])
plot(my_graph, vertex.size = 8) 

################################################################################

# PART 1: PEOPLE IN NETWORKS: Node-level Data

## 1) Degree centrality -The command for degree centrality from your network object
degree(my_graph)

#Store it as an object - this will come in handy later! 
degree <- degree(my_graph)
#View it to make sure
degree


## 2) Constrain - #The command to get the constraint from your network object
constraint <- constraint(my_graph)
# View it
constraint


## 3) Betweenness
betweenness <- betweenness(my_graph)
#View it
betweenness

################################################################################

# PART 2: NETWORKS OF PEOPLE: Network-level Data

## 1) Transitivity
transitivity <- transitivity(my_graph)
#View it
transitivity


## 2) Reciprocity 
recip <- reciprocity(my_graph, ignore.loops = TRUE, mode = c("ratio"))
#View it
recip

## 3) Density
dense <- edge_density(my_graph, loops = FALSE)
#View it
dense

################################################################################

# PART 3: Create a table with your new data

## Node Data

node_data <- data.frame(
  degree = degree,
  constraint = constraint,
  betweenness = betweenness
  
)

## Network Data

network_data <- data.frame (
  transitivity = transitivity,
  reciprocity = recip,
  density = dense
)


# Inspect the datasets
print(node_data)
print(network_data)


### Code to export
write.csv(node_data, "file_path/file_name.csv")
write.csv(network_data, "file_path/file_name.csv")


