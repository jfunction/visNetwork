#' Function to completely replace the nodes and edges, with shiny only.
#'
#' Function to completely replace the nodes and edges, with shiny only. The nodes and edges passed in will completely replace the existing ones.
#' The link is based on id.
#' Note: This is not an officially supported function and does not appear in the official documentation.
#' 
#'@param graph : a \code{\link{visNetworkProxy}}  object
#'@param nodes : data.frame with the information of nodes. Needed at least column "id". See \link{visNodes} 
#' \itemize{
#'  \item{"id"}{ : id of the node, needed in the definition of edges and for update nodes}
#'  \item{"label"}{ : label of the node}
#'  \item{"group"}{ : group of the node. Groups can be configure with \link{visGroups}}
#'  \item{"value"}{ : size of the node}
#'  \item{"title"}{ : tooltip of the node}
#'  \item{"x"}{ : x location of the node}
#'  \item{"y"}{ : y location of the node}
#'  \item{...}{}
#'}
#'@param updateOptions : Boolean. Update options (nodesIdSelection & selectedBy) if needed ? Default to TRUE.
#'
#'@seealso \link{visNodes} for nodes options, \link{visEdges} for edges options, \link{visGroups} for groups options, 
#'\link{visLegend} for adding legend, \link{visOptions} for custom option, \link{visLayout} & \link{visHierarchicalLayout} for layout, 
#'\link{visPhysics} for control physics, \link{visInteraction} for interaction, \link{visNetworkProxy} & \link{visFocus} & \link{visFit} for animation within shiny,
#'\link{visDocumentation}, \link{visEvents}, \link{visConfigure} ...
#' 
#'@export
#'@references See online documentation \url{https://datastorm-open.github.io/visNetwork/}
visReplaceGraph <- function(graph, nodes, edges, updateOptions = TRUE){

  if(!any(class(graph) %in% "visNetwork_Proxy")){
    stop("Can't use visReplaceGraph with visNetwork object. Only within shiny & using visNetworkProxy")
  }

  data <- list(id = graph$id, nodes = nodes, edges = edges, updateOptions = updateOptions)

  graph$session$sendCustomMessage("visShinyReplaceGraph", data)

  graph
}
