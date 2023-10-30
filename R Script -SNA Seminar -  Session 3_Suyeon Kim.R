# Install Igraph if you have not got it
install.packages("igraph")

# Tell R to use igraph package commands
library(igraph)

# Bring in your data
grime_edge_list <- read.csv(file.choose(), header = TRUE)  ## Select "GRIME_EDGE_LIST_2008 _GRIME ONLY.csv"

#Make it a Graph Object so R can read it as such.
grime_08 <- graph_from_data_frame(d= grime_edge_list, directed = TRUE)

# Plot your new graph object
plot(grime_08)

# Looks Great, but notice the loops back to self? We can fix those by removing the edges
grime_08_clean <- delete.edges(grime_08, E(grime_08)[is.loop(grime_08)])

#Much better - ready to go!  
plot(grime_08_clean)

################################################################################
############################  Step 1  ##########################################


## Now lets play with the structure with the "layout" argument
# Random
plot(grime_08_clean, layout = layout.random)
# Grid
plot(grime_08_clean, layout = layout.grid)
#Small world/Circle
plot(grime_08_clean, layout = layout.circle)
## Note this does not change the graph, only the way it is presented!

##Play with other graph characteristics
#Colour with , vertex.color = " " or edge.color = " "
plot(grime_08_clean, vertex.color = "pink")
plot(grime_08_clean, edge.color = "pink")

#Sizes
plot(grime_08_clean, vertex.size = 5, edge.arrow.size = 0.5)

#Labels/Titles
plot(grime_08_clean, vertex.label = NA)
plot(grime_08_clean, vertex.label.cex = 0.5)
plot(grime_08_clean, main = "Collaboration Network", sub = "GRIME, 2008")
plot(grime_08_clean, frame = TRUE)


## Final Plot
plot(grime_08_clean, vertex.color = "orange", vertex.size = 6, vertex.label.cex = 0.7, edge.color = "blue", edge.arrow.size = 0.4, main = "Collaboration Network", sub = "GRIME, 2008" )


################################################################################
############################  Step 2  ##########################################

#Visualising Centrality using vertex.size = 

# Degree Centrality
plot(grime_08_clean, vertex.size = degree(grime_08_clean)*2, edge.arrow.size = 0.5)

# Betweenness Centrality 
plot(grime_08_clean, vertex.size = betweenness(grime_08_clean)*2, edge.arrow.size = 0.5)


#Visualising the different Edge Characteristics

# Tell R where the weights are
E(grime_08_clean)$collab_weight

# Plot with weights attached
plot(grime_08_clean, edge.width = E(grime_08_clean)$collab_weight, vertex.size = 6, vertex.label = NA)


### Now let's add some node characteristics from data we have outside the network object
grime_nodes <- read.csv(file.choose(), header = TRUE)  ## Select "GRIME_2008_Nodes.csv"
g <- graph_from_data_frame(grime_edge_list, vertices = grime_nodes, directed = TRUE)

# Delete Loops 
g_clean <- delete.edges(g, E(g)[is.loop(g)])

# Attach and plot COlour to Sex Categories
sex <-ifelse(V(g_clean)$sex == "f", "red", "white")

plot(g_clean, vertex.color = sex)

# Size is sales
plot(g_clean, vertex.color = sex, vertex.size = V(g_clean)$fake_sales/100)


#==============================================================================#
#==============================================================================#
##################### Workshop a more complex network ##########################
#==============================================================================#
#==============================================================================#

fan_edge_list <- read.csv(file.choose(), header = FALSE)  ## Select "Fans also like csv"


## Make it a graph object
fans <- graph_from_data_frame(d= fan_edge_list, directed = TRUE)

# It is messy. What can you do to clean it up and make it ready for publication?
plot(fans)


# You also have info on these nodes if you wish. Select "FANS_NODES.csv"
fan_nodes <- read.csv(file.choose(), header = TRUE)

#Tip: When writing lengthy code for graphs, put like next to like. 
# In other words, put all vertex manipulations next to each other and edge with edge. This makes it easier to track and troubleshoot if needed. 
     
fan_clean <- delete.edges(fans, E(fans)[is.loop(fans)])
plot(fan_clean)

# Random
plot(fan_clean, layout = layout.random)
# Grid
plot(fan_clean, layout = layout.grid)
#Small world/Circle
plot(fan_clean, layout = layout.circle)

#Sizes
plot(fan_clean, vertex.size = 5, edge.arrow.size = 0.5)

#Labels/Titles
plot(fan_clean, vertex.label = NA, vertex.size=10, main = "Fan also likes", frame = TRUE)
plot(fan_clean, vertex.label.cex = 0.5)
plot(fan_clean, main = "Fan also likes", sub = "fan, network")
plot(fan_clean, frame = TRUE)


## Final Plot

plot(fan_clean, vertex.label = NA, vertex.size=3,edge.arrow.size=0.2, main = "Fan also likes", frame = TRUE)
                                                          
     