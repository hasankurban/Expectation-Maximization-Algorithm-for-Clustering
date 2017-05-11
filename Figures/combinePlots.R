require(grid)
require(gridExtra)
#grid.arrange(n1,k1,d1,n3,k3,d3,ncol = 3,top=textGrob("Experimental Results for Multivarite Synthetic Data Sets", gp=gpar(fontsize=15,font=8)))

grid.arrange(cancer3,cancer1,cancer2,census3,census1,census2,census103,census101,census102,ncol = 3)

grid.arrange(n3,k3,d3,n1,k1,d1,ncol = 3)

grid.arrange(ast3,ast1,ncol = 2) # galaxy data



