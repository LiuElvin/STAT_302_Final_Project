library(collections)

# Modified Dijkstra to find the minimal edge weight needed to create a spanning tree
findRcWithDijkstra = function(nodes) {
  adjm = as.matrix(dist(nodes))
  
  n = nrow(nodes)
  visited = logical(n)
  
  q = PriorityQueue()
  q$push(c(1, 0), priority = 0)
  
  min_rc = 0
  
  while (q$size() > 0 || !all(visited)) {
    temp = q$pop()
    node = temp[1]
    w = temp[2]
    if (visited[node]) {
      next
    }
    visited[node] = T
    min_rc = max(min_rc, w)
    
    for (i in which(!visited)) {
      p = adjm[node, i]
      q$push(c(i, p), priority = -p)
    }
  }
  
  return(min_rc)
}

testFindRcNTimes = function(B = 10, n = 50, seed = 123) {
  set.seed(seed)
  for (i in 1:B) {
    nodes = genNodes(n)
    actual = findRc(nodes)
    expected = findRcWithDijkstra(nodes)
    err_flag = 0
    if (abs(actual - expected) > 0.05) {
      cat(paste("Test failed in iteration", i, "\n"))
      cat(paste("> Actual:", round(actual, 6)), "\n")
      cat(paste("> Expected:", round(expected, 6)), "\n")
      err_flag = 1
      break
    }
  }
  cat(paste("All tests pass!!\n"))
}

# Run the test n times with given seed
testFindRcNTimes(B = 20, n = 100, seed = 123)
