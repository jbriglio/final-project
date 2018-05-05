library(ggmap)
library(tidyverse)
library(maps)
library(mapproj)

map.1 <- get_map(location = c(-95.7129, 37.0902), zoom = 4, maptype = "roadmap")
ggmap(map.1)

map.2 <- ggmap(map.1) +
  geom_point(
    aes(x = -94.5786 , y = 39.0997),
    color = "red", size = 2) +
  geom_point(
    aes(x = -90.0715 , y = 29.9511),
    color = "gold", size = 2) +
  geom_point(
    aes(x = -71.0589 , y = 42.3601),
    color = "blue", size = 2) +
  geom_point(
    aes(x = -75.1652, y = 39.9526),
    color = "green", size = 2) +
  geom_point(
    aes(x = -118.2437, y = 34.0522),
    color = "black", size = 2) +
  geom_point(
    aes(x = -94.6859, y = 46.7296),
    color = "purple", size = 2) +
  geom_point(
    aes(x = -79.9959, y = 40.4406),
    color = "yellow", size = 2) +
  geom_point(
    aes(x = -81.6557, y = 30.3322),
    color = "cyan", size = 2) +
  geom_point(
    aes(x = -74.0060, y = 40.7128),
    color = "darkgreen", size = 2) +
  geom_point(
    aes(x = -74.0060, y = 40.7128),
    color = "dodgerblue", size = 1) +
  geom_point(
    aes(x = -122.4194, y = 37.7749),
    color = "darkred", size = 2) +
  geom_point(
    aes(x = -81.6944, y = 41.4993),
    color = "brown", size = 2) +
  geom_point(
    aes(x = -104.9903, y = 39.7392),
    color = "orange", size = 2) +
  geom_point(
    aes(x = -87.6298, y = 41.8781),
    color = "darkorange", size = 2) +
  geom_point(
    aes(x = -82.4572, y = 27.9506),
    color = "firebrick", size = 2) +
  geom_point(
    aes(x = -95.3698, y = 29.7604),
    color = "white", size = 2)
map.2
