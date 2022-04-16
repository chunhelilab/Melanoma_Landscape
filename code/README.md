This is a matlab implementation of Melanoma network. This network includes 226 parameters and 17 components.
Melanoma.m is the ODEs of Melanoma model;
multivariate_normal_distribution is the density function of the Gaussian distribution which is used to calculate the density function of Melanoma model;
Solver.m is used to solve the ODEs, calculate the mean value and the covariance of each stable state and calculate the transition paths and actions between the stable states.
plot_Landscape.m is the main function which is uesd to calculate the density function of expression level of the system and use the DRL method [1] to plot the landscape and transition paths of the system.
Please run plot_Landscape.m and the program runs about 50 minutes to get landscape, tranistion path and stationary distribution of stable states.
Please  run plot_Fig4.m to get the knocking down results of the landscape in Figure 4.
Please  run plot_Fig4E.m to get the transition action of Figure 4E.
Please  run plot_FigS3.m to get the transition paths in the of Figure S3.


[1] Kang, Xin, and Chunhe Li. "A Dimension Reduction Approach for Energy Landscape: Identifying Intermediate States in Metabolism‐EMT Network."  Advanced Science 8.10 (2021): 2003133.