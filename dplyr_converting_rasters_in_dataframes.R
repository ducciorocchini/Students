
# raster data making use of imageRy
im.list()   # listing data

# stack EN
EN_01 <- im.import("EN_01.png")
EN_05 <- im.import("EN_05.png")
EN_10 <- im.import("EN_10.png")
EN_13 <- im.import("EN_13.png")

EN <- c(EN_01[[1]], EN_05[[1]], EN_10[[1]], EN_13[[1]])

ENd <- as.data.frame(EN, xy=TRUE)

head(ENd)

ENds <- ENd %>%
  dplyr::select(EN_01_1, EN_05_1, EN_10_1, EN_13_1)

# or, without pipe %>%:
ENds <- dplyr::select(df1, A, B, E)

ggplot(ENds) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis_c(name = "NO2", option = "C") +
  labs(title = 'NO2 variation')


