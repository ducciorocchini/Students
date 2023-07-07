# From: Chiara Raineri - 2023

# Making sure that the packages are installed and recalling the libraries
# If the package is not installed, install it, if not, recall it
if (!require("ggplot2")) install.packages("ggplot2"); library("ggplot2")  # Package to make beautiful graphs
if (!require("viridis")) install.packages("viridis"); library("viridis")  # Package to use different palettes for ggplots
if (!require("raster")) install.packages("raster"); library("raster")  # Package to read, write, manipulate, analyze and model spatial data
if (!require("ncdf4")) install.packages("ncdf4"); library("ncdf4")  # Package to manage files with .nc extension (from Copernicus)
if (!require("RStoolbox")) install.packages("RStoolbox"); library("RStoolbox")  # Package for quantitative estimates
if (!require("gridExtra")) install.packages("gridExtra"); library("gridExtra")  # Package to build multiframes with different graphs from ggplot2
if (!require("colorspace")) install.packages("colorspace"); library("colorspace")  # Package to use colorspace palettes
# if (!require("patchwork")) install.packages("patchwork"); library("patchwork")  # Package to build multiframes

