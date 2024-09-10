# original code:
Stefano Samorè 

library(sf)

# Importiamo lo shapefile con l'area contenente i ghiacciai prodotto in QGIS
areaghiacc <- st_read("ghiacciaio.shp")
areaghiacc

# Ritagliamo il raster usando l'area del ghiacciaio (shapefile) sull'immagine scaricata da Landsat
fornicut0323 <- crop(forni0323, areaghiacc)
fornicut0323

# Con la funzione mask abbiamo ritagliato il raster secondo la forma precisa dello shapefile
forni0323d <- mask(fornicut0323, areaghiacc)
plot(forni0323d)

