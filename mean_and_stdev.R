# Original code: AlbertoTarroni

library(terra)
library(imageRy)
library(viridis)

#### INVERNO ####

wd_ndsi <- setwd("C:/Users/alber/Documents/Uni/Da fare/Tele_Windows/Progetto/NDSI_DICEMBRE")           #Imposto la mia working directory per richiamare agilmente i diversi file in seguito senza dover scrivere il percorso completo

### ANALISI INVERNALE ANNO 2017 - 2019(20) - 2021 - 2023 ###

wd_ndsi                                                                                                #Richiamo la working directory

## Carico le diverse bande per l'anno 2017, 2020, 2021, 2023 ##

### 24_12_2017 ###

b2_17 <- rast("NDSI_24_12_2017/2017-12-24-00_00_2017-12-24-23_59_Sentinel-2_L2A_B02_(Raw).tiff")       #banda per il blu (2)
b3_17 <- rast("NDSI_24_12_2017/2017-12-24-00_00_2017-12-24-23_59_Sentinel-2_L2A_B03_(Raw).tiff")       #banda per il verde (3)
b4_17 <- rast("NDSI_24_12_2017/2017-12-24-00_00_2017-12-24-23_59_Sentinel-2_L2A_B04_(Raw).tiff")       #banda per il rosso (4)
b11_17 <- rast("NDSI_24_12_2017/2017-12-24-00_00_2017-12-24-23_59_Sentinel-2_L2A_B11_(Raw).tiff")      #banda 11 ovvero SWIR (Short-Waved Infrared Light),ottima per distinguere neve da altre superfici, acqua e neve bagnata alta riflettanza nelle lunghezze d'onda SWIR mentre neve secca bassa riflettanza 

### 08_01_2020 ###

b2_20 <- rast("NDSI_8_1_2020/2020-01-08-00_00_2020-01-08-23_59_Sentinel-2_L2A_B02_(Raw).tiff")
b3_20 <- rast("NDSI_8_1_2020/2020-01-08-00_00_2020-01-08-23_59_Sentinel-2_L2A_B03_(Raw).tiff")
b4_20 <- rast("NDSI_8_1_2020/2020-01-08-00_00_2020-01-08-23_59_Sentinel-2_L2A_B04_(Raw).tiff")
b11_20 <- rast("NDSI_8_1_2020/2020-01-08-00_00_2020-01-08-23_59_Sentinel-2_L2A_B11_(Raw).tiff")

### 13_12_2021 ###

b2_21 <- rast("NDSI_13_12_2021/2021-12-13-00_00_2021-12-13-23_59_Sentinel-2_L2A_B02_(Raw).tiff")
b3_21 <- rast("NDSI_13_12_2021/2021-12-13-00_00_2021-12-13-23_59_Sentinel-2_L2A_B03_(Raw).tiff")
b4_21 <- rast("NDSI_13_12_2021/2021-12-13-00_00_2021-12-13-23_59_Sentinel-2_L2A_B04_(Raw).tiff")
b11_21 <- rast("NDSI_13_12_2021/2021-12-13-00_00_2021-12-13-23_59_Sentinel-2_L2A_B11_(Raw).tiff")

### 23_12_2023 ###

b2_23 <- rast("NDSI_23_12_2023/2023-12-23-00_00_2023-12-23-23_59_Sentinel-2_L2A_B02_(Raw).tiff")
b3_23 <- rast("NDSI_23_12_2023/2023-12-23-00_00_2023-12-23-23_59_Sentinel-2_L2A_B03_(Raw).tiff")
b4_23 <- rast("NDSI_23_12_2023/2023-12-23-00_00_2023-12-23-23_59_Sentinel-2_L2A_B04_(Raw).tiff")
b11_23 <- rast("NDSI_23_12_2023/2023-12-23-00_00_2023-12-23-23_59_Sentinel-2_L2A_B11_(Raw).tiff")

### TRUE COLOR DA ASSOCIAZIONE DI BANDE rosso = b4, verde = b3, blu = b2 ###

#2017#

true_color_2017 <- c(b4_17,b3_17,b2_17)                                                                  #unisco in vettore lineare le bande rossa (4), verde (3), blu (2) disposte già in quest'ordine per facilitarmi l'associazione nel plotRGB
tc_17 <- plotRGB(true_color_2017, 1, 2, 3, main = "True Color 24/12/17 Bayan-Unjuul")                    #plotRGB per unire le 3 diverse bande del rosso,verde,blu per visualizzare l'immagine satellitare True Color ovvero colori reali da satellite

#2020#

true_color_2020 <- c(b4_20,b3_20,b2_20)
tc_20 <- plotRGB(true_color_2020, 1, 2, 3, main = "True Color 08/01/20 Bayan-Unjuul")

#2021#

true_color_2021 <- c(b4_21,b3_21,b2_21)
tc_21 <- plotRGB(true_color_2021, 1, 2, 3, main = "True Color 13/12/21 Bayan-Unjuul")

#2023#
true_color_2023 <- c(b4_23,b3_23,b2_23)
tc_23 <- plotRGB(true_color_2023, 1, 2, 3, main = "True Color 23/12/23 Bayan-Unjuul")


par(mfrow=c(2,2), oma=c(3,3,3,3))                                                                         #dispongo le successive immagini in 2x2 per potere visualizzarle insieme e confrontarle, uso la funzione par() e l'argomento mforw=c(2,2) che dispone 2x2, il secondo argomento oma=c(3,3,3,3) mi permette di creare margini dai quattro punti cardinali (bottom,left,right,top)
tc_17 <- plotRGB(true_color_2017, 1, 2, 3, main = "True_Color_24_12_17_BU")
tc_20 <- plotRGB(true_color_2020, 1, 2, 3, main = "True_Color_08_01_20_BU")
tc_21 <- plotRGB(true_color_2021, 1, 2, 3, main = "True_Color_13_12_21_BU")
tc_23 <- plotRGB(true_color_2023, 1, 2, 3, main = "True_Color_23_12_23_BU")

dev.off()                                                                                                 #uso dev.off() per ripristinare una visualizzazione normale e pulire la sezione plot, serve per annullare comandi come par()


### NDSI 1 = NEVE/GHIACCIO , 0 = SUOLO  VEG, -1 = ACQUA O SIMILI ###                                      #Indice di copertura nevosa che utilizza le bande verde (3 in Sentinel-2) e SWIR (11 in Sentinel-2)

## Palette colori ##

col_ndsi <- colorRampPalette(c("black", "brown", "white", "darkblue")) (100)                              #con comando colorRampPalette creo una scala di colori rispetto a valori del mio futuro indice, valori più bassi dal nero al darkblue passando per il marrone e bianco. Sfumatura tra i colori 100. Meno è quel valore e meno verranno rappresentati i valori più dettagliati

### 2017 ###
ndsi_2017 <- (b3_17 - b11_17) / (b3_17 + b11_17)                                                          #per calcolare l'indice NDSI si usa questa formula: (b3_17 - b11_17) / (b3_17 + b11_17). Assegno il risultante all'oggetto ndsi_2017
plot(ndsi_2017, col = col_ndsi, main = "NDSI 2017 Inverno")                                               #creo plot dell'indice ndsi_2017 con scala di colori col_ndsi che ho precedentemente costruito

### 2020 ###
ndsi_2020 <- (b3_20 - b11_20) / (b3_20 + b11_20)
plot(ndsi_2020, col = col_ndsi, main = "NDSI 2020 Inverno")

### 2021 ###
ndsi_2021 <- (b3_21 - b11_21) / (b3_21 + b11_21)
plot(ndsi_2021, col = col_ndsi, main = "NDSI 2021 Inverno")

### 2023 ###

ndsi_2023 <- (b3_23 - b11_23) / (b3_23 + b11_23)
plot(ndsi_2023, col = col_ndsi, main = "NDSI 2023 Inverno")

par(mfrow=c(2,2), oma=c(3,3,3,3))                                                                          #confronto i vari plot
plot(ndsi_2017, col = col_ndsi, main = "NDSI 2017 Inverno")
plot(ndsi_2020, col = col_ndsi, main = "NDSI 2020 Inverno")
plot(ndsi_2021, col = col_ndsi, main = "NDSI 2021 Inverno")
plot(ndsi_2023, col = col_ndsi, main = "NDSI 2023 Inverno")

dev.off()

## Calcolo la deviazione standard di ogni indice ##

ndsi_sd_17 <- focal(ndsi_2017, w = matrix(1/169,13,13), fun = sd)                                           #uso la funzione focal per svolgere la funzione sd(deviazione standard) su una finestra mobile w = matrix(1/169,13,13) ovvero matrice 13x13 dove ogni elemento è 1/169 di valore. Questo significa che ogni pixel ha lo stesso peso
plot(ndsi_sd_17, col = col_ndsi, main = "Dev Stand 17")

ndsi_sd_20 <- focal(ndsi_2020, w = matrix(1/169,13,13), fun = sd)
plot(ndsi_sd_20, col = col_ndsi, main = "Dev Stand 20")

ndsi_sd_21 <- focal(ndsi_2021, w = matrix(1/169,13,13), fun = sd)
plot(ndsi_sd_21, col = col_ndsi, main = "Dev Stand 21")

ndsi_sd_23 <- focal(ndsi_2023, w = matrix(1/169,13,13), fun = sd)
plot(ndsi_sd_23, col = col_ndsi, main = "Dev Stand 23")

## Analisi con grafico a barre basato sulle medie dei valori di NDSI con l'aggiunta della deviazione standard ##

years <- c(2017, 2020, 2021, 2023)                                                                           #vettore years che sarà la mia asse delle x dove ogni barra sarà l'anno di rappresentanza
means <- c(mean(ndsi_sd_17[], na.rm = TRUE), mean(ndsi_sd_20[], na.rm = TRUE),                               #calcolo delle medie per i singoli indici per i singoli anni, uso na.rm = true per far si che non tenga conto dei valori nulli
           mean(ndsi_sd_21[], na.rm = TRUE), mean(ndsi_sd_23[], na.rm = TRUE))
sds <- c(sd(ndsi_sd_17[], na.rm = TRUE), sd(ndsi_sd_20[], na.rm = TRUE),                                     #unifico le deviazioni standard calcolate in valori univoci
         sd(ndsi_sd_21[], na.rm = TRUE), sd(ndsi_sd_23[], na.rm = TRUE))

barplot(means, names.arg = years, ylim = c(0, max(means + sds)),                                             #rappresento i valori medi di NDSI nei differenti anni tenendo conto delle sue deviazioni standard, i valori presi da means, names.arg = years serve a impostare sull'asse delle x gli anni, ylim = limiti dei valori assey da 0 a media + deviazione standard
        main = "Media NDSI con Deviazione Standard", ylab = "Valori NDSI", col = "lightblue")

barplot(means, names.arg = years, ylim = c(0, max(means + sds)), 
        main = "Media NDSI con Deviazione Standard", ylab = "Valori NDSI", col = c("lightblue","lightblue","lightblue","red")) #solo per identificare la barra con più differenza rispetto le altre le ho associato un altro colore

#### NDSI ANALISI PERIODO INVERNALE DA 2017 - 2019 - 2021 - 2023 ####


snow <- c(ndsi_2017,ndsi_2020,ndsi_2021,ndsi_2023)                                                            #assegno all'oggetto snow un vettore con tutti gli indici dei differenti anni
plot(snow, col = col_ndsi)

#### ANALISI PCA NDSI ####
ndsi_pca <- im.pca(snow)                                                                                      #analisi PCA (Principal Component Analysis) faccio un'analisi tra i differenti anni andando a evidenziare le componenti principali per osservare dove sono le più grandi differenze

plot(ndsi_pca, col = viridis(100))

## Differenza tra i diversi ndsi dei diversi anni ponendo come componente da cui sottrarre il 2017 ##

dif_snow_1 <- snow[[1]]-snow[[2]] # 2017 - 2019
dif_snow_2 <- snow[[1]]-snow[[3]] # 2017 - 2021
dif_snow_3 <- snow[[1]]-snow[[4]] # 2017 - 2023

dif_col = colorRampPalette(c("black","grey","white"))(6)
par(mfrow=c(1,3))

## Plotto le varie differenze ##

plot(dif_snow_1, col= dif_col, main = " Dif 2017 - 2019")
plot(dif_snow_2, col= dif_col, main = " Dif 2017 - 2021")
plot(dif_snow_3, col= dif_col, main = " Dif 2017 - 2023")

dev.off()


#### FINE NDSI (Indice copertura nevosa) ####



#### ESTATE ####

wd_ndvi_g <- setwd("C:/Users/alber/Documents/Uni/Da fare/Tele_Windows/Progetto/NDVI_GIUGNO")

### ANALISI GIUGNO (estivo) ANNI 2017 - 2019 - 2021 - 2023 ###

wd_ndvi_g

### 02_06_2017 ###

b2_17_ndvi <- rast("NDVI_2_6_2017/2017-06-02-00_00_2017-06-02-23_59_Sentinel-2_L2A_B02_(Raw).tiff")
b3_17_ndvi <- rast("NDVI_2_6_2017/2017-06-02-00_00_2017-06-02-23_59_Sentinel-2_L2A_B03_(Raw).tiff")
b4_17_ndvi <- rast("NDVI_2_6_2017/2017-06-02-00_00_2017-06-02-23_59_Sentinel-2_L2A_B04_(Raw).tiff")
b8_17_ndvi <- rast("NDVI_2_6_2017/2017-06-02-00_00_2017-06-02-23_59_Sentinel-2_L2A_B08_(Raw).tiff")           #carico la banda 8 del Sentinel-2 che si riferisce all'infrarosso NIR fondamentale per vedere la vegetazione, riflette molto nella banda a infrarosso

### 07_06_2019 ###

b2_19_ndvi <- rast("NDVI_7_6_2019/2019-06-07-00_00_2019-06-07-23_59_Sentinel-2_L2A_B02_(Raw).tiff")
b3_19_ndvi <- rast("NDVI_7_6_2019/2019-06-07-00_00_2019-06-07-23_59_Sentinel-2_L2A_B03_(Raw).tiff")
b4_19_ndvi <- rast("NDVI_7_6_2019/2019-06-07-00_00_2019-06-07-23_59_Sentinel-2_L2A_B04_(Raw).tiff")
b8_19_ndvi <- rast("NDVI_7_6_2019/2019-06-07-00_00_2019-06-07-23_59_Sentinel-2_L2A_B08_(Raw).tiff")


### 21_06_2021 ###

b2_21_ndvi <- rast("NDVI_26_6_2021/2021-06-26-00_00_2021-06-26-23_59_Sentinel-2_L2A_B02_(Raw).tiff")
b3_21_ndvi <- rast("NDVI_26_6_2021/2021-06-26-00_00_2021-06-26-23_59_Sentinel-2_L2A_B03_(Raw).tiff")
b4_21_ndvi <- rast("NDVI_26_6_2021/2021-06-26-00_00_2021-06-26-23_59_Sentinel-2_L2A_B04_(Raw).tiff")
b8_21_ndvi <- rast("NDVI_26_6_2021/2021-06-26-00_00_2021-06-26-23_59_Sentinel-2_L2A_B08_(Raw).tiff")

### 21_06_2023 ###

b2_23_ndvi <- rast("NDVI_21_6_2023/2023-06-21-00_00_2023-06-21-23_59_Sentinel-2_L2A_B02_(Raw).tiff")
b3_23_ndvi <- rast("NDVI_21_6_2023/2023-06-21-00_00_2023-06-21-23_59_Sentinel-2_L2A_B03_(Raw).tiff")
b4_23_ndvi <- rast("NDVI_21_6_2023/2023-06-21-00_00_2023-06-21-23_59_Sentinel-2_L2A_B04_(Raw).tiff")
b8_23_ndvi <- rast("NDVI_21_6_2023/2023-06-21-00_00_2023-06-21-23_59_Sentinel-2_L2A_B08_(Raw).tiff")

### TRUE COLOR DA ASSOCIAZIONE DI BANDE rosso = b4, verde = b3, blu = b2 ###

#2017#

tc_17_ndvi_g <- c(b4_17_ndvi,b3_17_ndvi,b2_17_ndvi)
plot_tc_17_g <- plotRGB(tc_17_ndvi_g, 1, 2, 3, main = "True Color 02/06/17 Bayan-Unjuul")

#2019#

tc_19_ndvi_g <- c(b4_19_ndvi,b3_19_ndvi,b2_19_ndvi)
plot_tc_19_g <- plotRGB(tc_19_ndvi_g, 1, 2, 3, main = "True Color 07/06/19 Bayan-Unjuul")

#2021#

tc_21_ndvi_g <- c(b4_21_ndvi,b3_21_ndvi,b2_21_ndvi)
plot_tc_21_g <- plotRGB(tc_21_ndvi_g, 1, 2, 3, main = "True Color 21/06/21 Bayan-Unjuul")

#2023#

tc_23_ndvi_g <- c(b4_23_ndvi,b3_23_ndvi,b2_23_ndvi)
plot_tc_23_g <- plotRGB(tc_23_ndvi_g, 1, 2, 3, main = "True Color 26/06/23 Bayan-Unjuul")


### CONFRONTO TRUE COLOR ###
par(mfrow=c(2,2), oma=c(3,3,3,3))
plot_tc_17_g <- plotRGB(tc_17_ndvi_g, 1, 2, 3, main = "True_Color_02_06_17_BU")
plot_tc_19_g <- plotRGB(tc_19_ndvi_g, 1, 2, 3, main = "True_Color_07_06_19_BU")
plot_tc_21_g <- plotRGB(tc_21_ndvi_g, 1, 2, 3, main = "True_Color_21_06_21_BU")
plot_tc_23_g <- plotRGB(tc_23_ndvi_g, 1, 2, 3, main = "True_Color_26_06_23_BU")



dev.off()



### NDVI 1 = temperate/tropicali ; 0.2 - 0.4 = shrub/grassland ; -0.1 - 0.1 = roccia, sabbia, neve ; -1 = acqua ###

## Palette colori ##

col_ndvi <- colorRampPalette(c("black", "grey", "green", "darkgreen")) (100)                                          #creo palette di colori dal nere per valori minimi di ndvi a verdescuro per valori più alti passando per grigio e verde

### 2017 ###
ndvi_2017_g <- (b8_17_ndvi - b4_17_ndvi) / (b8_17_ndvi + b4_17_ndvi)                                                  #calcolo indice NDVI per l'anno 2017 attraverso = (b8_17_ndvi - b4_17_ndvi) / (b8_17_ndvi + b4_17_ndvi) 
plot(ndvi_2017_g, col = col_ndvi, main = "NDVI 2017 Giugno")                                                          #plotto NDVI con colore col_ndvi che è la mia palette precedentemente preparata

### 2019 ###

ndvi_2019_g <- (b8_19_ndvi - b4_19_ndvi) / (b8_19_ndvi + b4_19_ndvi)
plot(ndvi_2019_g, col = col_ndvi, main = "NDVI 2019 Giugno")

### 2021 ###

ndvi_2021_g <- (b8_21_ndvi - b4_21_ndvi) / (b8_21_ndvi + b4_21_ndvi)
plot(ndvi_2021_g, col = col_ndvi, main = "NDVI 2021 Giugno")

### 2023 ###

ndvi_2023_g <- (b8_23_ndvi - b4_23_ndvi) / (b8_23_ndvi + b4_23_ndvi)
plot(ndvi_2023_g, col = col_ndvi, main = "NDVI 2023 Giugno")


### CONFRONTO NDVI ESTATE ###
par(mfrow=c(2,2), oma=c(3,3,3,3))
plot(ndvi_2017_g, col = col_ndvi, main = "NDVI 2017 Giugno")
plot(ndvi_2019_g, col = col_ndvi, main = "NDVI 2019 Giugno")
plot(ndvi_2021_g, col = col_ndvi, main = "NDVI 2021 Giugno")
plot(ndvi_2023_g, col = col_ndvi, main = "NDVI 2023 Giugno")

dev.off()

## NDVI DEVIAZIONE STANDARD ESTIVO ##

par(mfrow=c(2,2))
ndvi_sd_17_g <- focal(ndvi_2017_g, w = matrix(1/169,13,13), fun = sd)
plot(ndvi_sd_17_g, col = col_ndvi, main = "Dev Stand 17")

ndvi_sd_19_g <- focal(ndvi_2019_g, w = matrix(1/169,13,13), fun = sd)
plot(ndvi_sd_19_g, col = col_ndvi, main = "Dev Stand 19")

ndvi_sd_21_g <- focal(ndvi_2021_g, w = matrix(1/169,13,13), fun = sd)
plot(ndvi_sd_21_g, col = col_ndvi, main = "Dev Stand 21")

ndvi_sd_23_g <- focal(ndvi_2023_g, w = matrix(1/169,13,13), fun = sd)
plot(ndvi_sd_23_g, col = col_ndvi, main = "Dev Stand 23")

dev.off()
years <- c(2017, 2019, 2021, 2023)
means_ndvi_g <- c(mean(ndvi_sd_17_g[], na.rm = TRUE), mean(ndvi_sd_19_g[], na.rm = TRUE),
           mean(ndvi_sd_21_g[], na.rm = TRUE), mean(ndvi_sd_23_g[], na.rm = TRUE))
sds_ndvi <- c(sd(ndvi_sd_17_g[], na.rm = TRUE), sd(ndvi_sd_19_g[], na.rm = TRUE),
         sd(ndvi_sd_21_g[], na.rm = TRUE), sd(ndvi_sd_23_g[], na.rm = TRUE))

barplot(means_ndvi_g, names.arg = years, ylim = c(0, max(means_ndvi_g + sds_ndvi)), 
        main = "Media NDVI con Deviazione Standard Giugno", ylab = "Valori NDVI", col = "lightblue")

barplot(means_ndvi_g, names.arg = years, ylim = c(0, max(means_ndvi_g + sds_ndvi)), 
        main = "Media NDVI con Deviazione Standard Giugno", ylab = "Valori NDVI", col = c("lightblue","lightblue","red","red"))

#### FINE NDVI ESTIVO ####



#### NDMI ESTIVO ####                                                                                                          #Calcolo Indice NDMI (Normalize Difference Moisture Index) per monitorare il contentuto di umidità nella vegetazione e nel suolo, per verificare se la presenza di vegetazione è sostenuta da una stabilità idrica

wd_ndmi_g <- setwd("C:/Users/alber/Documents/Uni/Da fare/Tele_Windows/Progetto/NDMI_GIUGNO")

### GIUGNO ###

wd_ndmi_g

#2017#
b8a_17_g <- rast("NDMI_2_6_17/2017-06-02-00_00_2017-06-02-23_59_Sentinel-2_L2A_B8A_(Raw).tiff")                                 #carico banda 8A del Sentinel-2 che è un'altra versione della banda 8 ovvero NIR (vicino infrarosso) ma più stretta e specifica che mi servirà per il calcolo NDMI
b11_17_g <- rast("NDMI_2_6_17/2017-06-02-00_00_2017-06-02-23_59_Sentinel-2_L2A_B11_(Raw).tiff")                                 #banda SWIR sensibile all'umidità nel suolo e vegetazione

#2019#
b8a_19_g <- rast("NDMI_7_6_19/2019-06-07-00_00_2019-06-07-23_59_Sentinel-2_L2A_B8A_(Raw).tiff")
b11_19_g <- rast("NDMI_7_6_19/2019-06-07-00_00_2019-06-07-23_59_Sentinel-2_L2A_B11_(Raw).tiff")

#2021#
b8a_21_g <- rast("NDMI_26_6_21/2021-06-26-00_00_2021-06-26-23_59_Sentinel-2_L2A_B8A_(Raw).tiff")
b11_21_g <- rast("NDMI_26_6_21/2021-06-26-00_00_2021-06-26-23_59_Sentinel-2_L2A_B11_(Raw).tiff")

#2023#
b8a_23_g <- rast("NDMI_21_6_23/2023-06-21-00_00_2023-06-21-23_59_Sentinel-2_L2A_B8A_(Raw).tiff")
b11_23_g <- rast("NDMI_21_6_23/2023-06-21-00_00_2023-06-21-23_59_Sentinel-2_L2A_B11_(Raw).tiff")

#NDMI#
ndmi_2017_g <- (b8a_17_g - b11_17_g) / (b8a_17_g + b11_17_g)                                                                       #Calcolo NDMI attraverso = (b8a_17_g - b11_17_g) / (b8a_17_g + b11_17_g) tra bande 8a e 11
ndmi_2019_g <- (b8a_19_g - b11_19_g) / (b8a_19_g + b11_19_g)
ndmi_2021_g <- (b8a_21_g - b11_21_g) / (b8a_21_g + b11_21_g)
ndmi_2023_g <- (b8a_23_g - b11_23_g) / (b8a_23_g + b11_23_g)

col_ndmi <- colorRampPalette(c("black", "white", "red", "darkred")) (100)                                                          #Costruisco la mia palette di colori da nero (valori min di NDMI) a rosso scuro (valori max di NDMI) passando per bianco e rosso

#CONFRONTO#
par(mfrow= c(2,2))
plot(ndmi_2017_g, col = col_ndmi, main = " NDMI 2017 GIUGNO")
plot(ndmi_2019_g, col = col_ndmi, main = " NDMI 2019 GIUGNO")
plot(ndmi_2021_g, col = col_ndmi, main = " NDMI 2021 GIUGNO")
plot(ndmi_2023_g, col = col_ndmi, main = " NDMI 2023 GIUGNO")

dev.off()
# confrontando ad occhio pare che lo stress negli anni diminuisca ma il dato da tener conto è che si parla di valori max a 0.4 ovvero in pieno stress
# o tendente allo stress idrico, non mi figuro una stabilità idrica nel suolo, mi pare sempre un sistema tendente all'instabilità
# potrebbe darsi che nel 2023 a giugno sia piovuto particolarmente o proprio in quella occasione
# DA APPROFONDIRE

## DEVIAZIONE STANDARD NDMI ESTIVO ##
par(mfrow=c(2,2))                                                                                                                    #Calcolo la deviazione standard dell'indice NDMI dell'anno 2017
ndmi_sd_17_g <- focal(ndmi_2017_g, w = matrix(1/169,13,13), fun = sd)
plot(ndmi_sd_17_g, col = col_ndmi, main = "Dev Stand 17")

ndmi_sd_19_g <- focal(ndmi_2019_g, w = matrix(1/169,13,13), fun = sd)
plot(ndmi_sd_19_g, col = col_ndmi, main = "Dev Stand 19")

ndmi_sd_21_g <- focal(ndmi_2021_g, w = matrix(1/169,13,13), fun = sd)
plot(ndmi_sd_21_g, col = col_ndmi, main = "Dev Stand 21")

ndmi_sd_23_g <- focal(ndmi_2023_g, w = matrix(1/169,13,13), fun = sd)
plot(ndmi_sd_23_g, col = col_ndmi, main = "Dev Stand 23")

years_ndmi <- c(2017, 2019, 2021, 2023)
means_ndmi_g <- c(mean(ndmi_sd_17_g[], na.rm = TRUE), mean(ndmi_sd_19_g[], na.rm = TRUE),
                  mean(ndmi_sd_21_g[], na.rm = TRUE), mean(ndmi_sd_23_g[], na.rm = TRUE))
sds_ndmi <- c(sd(ndmi_sd_17_g[], na.rm = TRUE), sd(ndmi_sd_19_g[], na.rm = TRUE),
              sd(ndmi_sd_21_g[], na.rm = TRUE), sd(ndmi_sd_23_g[], na.rm = TRUE))

barplot(means_ndmi_g, names.arg = years, ylim = c(0, max(means_ndmi_g + sds_ndmi)), 
        main = "Media NDMI con Deviazione Standard Giugno", ylab = "Valori NDMI", col = "lightblue")
barplot(means_ndmi_g, names.arg = years, ylim = c(0, max(means_ndmi_g + sds_ndmi)), 
        main = "Media NDMI con Deviazione Standard Giugno", ylab = "Valori NDMI", col = c("lightblue","lightblue","red","red"))



#### ANALISI PERIODO ESTIVO ####

#### NDVI ANALISI PERIODO ESTIVO DA 2017 - 2019 - 2021 -2023 ####

# Ho preso immagini leggermente diverse in risoluzione, quindi faccio resample e crop per avere immagini uguali per fare vettore #
# verifico l'estensione delle diverse immagini per vedere quanto sono diverse #
ext(ndvi_2017_g)
ext(ndvi_2019_g)
ext(ndvi_2021_g)
ext(ndvi_2023_g)

#Pongo come estensione base da cui fare i crop l'immagine del 2017
ext_common <- ext(ndvi_2017_g)
ndvi_2019_g <- crop(ndvi_2019_g, ext_common)
ndvi_2021_g <- crop(ndvi_2021_g, ext_common)
ndvi_2023_g <- crop(ndvi_2023_g, ext_common)

#Faccio resample sull'immagine del 2017 per omogeneità tra le immagini

ndvi_2019_g <- resample(ndvi_2019_g, ndvi_2017_g)
ndvi_2021_g <- resample(ndvi_2021_g, ndvi_2017_g)
ndvi_2023_g <- resample(ndvi_2023_g, ndvi_2017_g)

# analisi #

ndvi_estivo <- c(ndvi_2017_g,ndvi_2019_g,ndvi_2021_g,ndvi_2023_g)
plot(ndvi_estivo, col = col_ndvi)

####  PCA ANALISI NDVI ESTIVO ####

ndvi_g_pca <- im.pca(ndvi_estivo)                                                                             #Faccio PCA del NDVI
plot(ndvi_g_pca, col = viridis(100))

#Calcolo delle differenze tra i vari NDVI con base 2023 da cui sottrarre i vari anni

dif_ndvi_estivo_1 <- ndvi_estivo[[4]] - ndvi_estivo[[1]]  # 2023 - 2017
dif_ndvi_estivo_2 <- ndvi_estivo[[4]] - ndvi_estivo[[2]]  # 2023 - 2019
dif_ndvi_estivo_3 <- ndvi_estivo[[4]] - ndvi_estivo[[3]]  # 2023 - 2021

dif_col_ndvi = colorRampPalette(c("black","white","darkgreen"))(6)

par(mfrow=c(1,3))

plot(dif_ndvi_estivo_1, col= dif_col_ndvi, main = "Dif 2023 - 2017")
plot(dif_ndvi_estivo_2, col= dif_col_ndvi, main = "Dif 2023 - 2019")
plot(dif_ndvi_estivo_3, col= dif_col_ndvi, main = "Dif 2023 - 2021")

dev.off()

#### NDMI ANALISI PERIODO ESTIVO DA 2017 - 2019 - 2021 -2023 ####

ndmi_estivo_g <- c(ndmi_2017_g,ndmi_2019_g,ndmi_2021_g,ndmi_2023_g)
plot(ndmi_estivo_g, col = col_ndmi)

#### ANALISI PCA NDMI ESTIVO ####
ndmi_g_pca <- im.pca(ndmi_estivo_g)
plot(ndmi_g_pca, col = viridis(100))

#Calcolo delle differenze tra i vari NDMI con base 2017 da cui sottrarre i vari anni

dif_ndmi_giugno_1 <- ndmi_estivo_g[[1]] - ndmi_estivo_g[[2]] # 2017 - 2019
dif_ndmi_giugno_2 <- ndmi_estivo_g[[1]] - ndmi_estivo_g[[3]] # 2017 - 2021
dif_ndmi_giugno_3 <- ndmi_estivo_g[[1]] - ndmi_estivo_g[[4]] # 2017 - 2023

par(mfrow=c(1,3))
plot(dif_ndmi_giugno_1, col = dif_col_ndmi, main = "NDMI 2017 - 2019 GIUGNO")
plot(dif_ndmi_giugno_2, col = dif_col_ndmi, main = "NDMI 2017 - 2021 GIUGNO")
plot(dif_ndmi_giugno_3, col = dif_col_ndmi, main = "NDMI 2017 - 2023 GIUGNO")

dev.off()

#### FINE ANALISI PERIODO ESTIVO ####






#### PRIMAVERA ####

wd_ndvi_a <- setwd("C:/Users/alber/Documents/Uni/Da fare/Tele_Windows/Progetto/NDVI_APRILE")

### APRILE (primaverile) ###

wd_ndvi_a

### 03_04_2017 ###

b2_17_ndvi_a <- rast("NDVI_3_4_2017/2017-04-03-00_00_2017-04-03-23_59_Sentinel-2_L2A_B02_(Raw).tiff")
b3_17_ndvi_a <- rast("NDVI_3_4_2017/2017-04-03-00_00_2017-04-03-23_59_Sentinel-2_L2A_B03_(Raw).tiff")
b4_17_ndvi_a <- rast("NDVI_3_4_2017/2017-04-03-00_00_2017-04-03-23_59_Sentinel-2_L2A_B04_(Raw).tiff")
b8_17_ndvi_a <- rast("NDVI_3_4_2017/2017-04-03-00_00_2017-04-03-23_59_Sentinel-2_L2A_B08_(Raw).tiff")

### 03_04_2019 ###

b2_19_ndvi_a <- rast("NDVI_3_4_2019/2019-04-03-00_00_2019-04-03-23_59_Sentinel-2_L2A_B02_(Raw).tiff")
b3_19_ndvi_a <- rast("NDVI_3_4_2019/2019-04-03-00_00_2019-04-03-23_59_Sentinel-2_L2A_B03_(Raw).tiff")
b4_19_ndvi_a <- rast("NDVI_3_4_2019/2019-04-03-00_00_2019-04-03-23_59_Sentinel-2_L2A_B04_(Raw).tiff")
b8_19_ndvi_a <- rast("NDVI_3_4_2019/2019-04-03-00_00_2019-04-03-23_59_Sentinel-2_L2A_B08_(Raw).tiff")


### 07_04_2021 ###

b2_21_ndvi_a <- rast("NDVI_7_4_2021/2021-04-07-00_00_2021-04-07-23_59_Sentinel-2_L2A_B02_(Raw).tiff")
b3_21_ndvi_a <- rast("NDVI_7_4_2021/2021-04-07-00_00_2021-04-07-23_59_Sentinel-2_L2A_B03_(Raw).tiff")
b4_21_ndvi_a <- rast("NDVI_7_4_2021/2021-04-07-00_00_2021-04-07-23_59_Sentinel-2_L2A_B04_(Raw).tiff")
b8_21_ndvi_a <- rast("NDVI_7_4_2021/2021-04-07-00_00_2021-04-07-23_59_Sentinel-2_L2A_B08_(Raw).tiff")

### 12_04_2023 ###

b2_23_ndvi_a <- rast("NDVI_12_4_2023/2023-04-12-00_00_2023-04-12-23_59_Sentinel-2_L2A_B02_(Raw).tiff")
b3_23_ndvi_a <- rast("NDVI_12_4_2023/2023-04-12-00_00_2023-04-12-23_59_Sentinel-2_L2A_B03_(Raw).tiff")
b4_23_ndvi_a <- rast("NDVI_12_4_2023/2023-04-12-00_00_2023-04-12-23_59_Sentinel-2_L2A_B04_(Raw).tiff")
b8_23_ndvi_a <- rast("NDVI_12_4_2023/2023-04-12-00_00_2023-04-12-23_59_Sentinel-2_L2A_B08_(Raw).tiff")

### TRUE COLOR DA ASSOCIAZIONE DI BANDE rosso = b4, verde = b3, blu = b2 ###

# Funzione per stretchare i valori tra 1 e 255 siccome i valori grezzi delle bande scaricate eccedevano dal valore gamma standard dell'RGB che va da 0-255. Ho quindi normalizzato i valori delle singole bande rispetto a quel range
stretch <- function(raster_band) {
  min_val <- min(raster_band[], na.rm = TRUE)
  max_val <- max(raster_band[], na.rm = TRUE)
  stretched_band <- (raster_band - min_val) / (max_val - min_val) * 255
  return(stretched_band)
}


#2017#

# Stretching delle bande per il 2017
b4_17_ndvi_a_stretch <- stretch(b4_17_ndvi_a)                                                       #Applico la funzione stretch sulle bande interessate per farle rientrare nel range idoneo per la visualizzazione RGB standard
b3_17_ndvi_a_stretch <- stretch(b3_17_ndvi_a)
b2_17_ndvi_a_stretch <- stretch(b2_17_ndvi_a)

# Creare un oggetto SpatRasterStack con le bande stretchate
tc_17_ndvi_a_stretch <- c(b4_17_ndvi_a_stretch, b3_17_ndvi_a_stretch, b2_17_ndvi_a_stretch)

# Plot RGB con le bande stretchate
plot_tc_17_a <- plotRGB(tc_17_ndvi_a_stretch, r = 1, g = 2, b = 3, scale = 255, main = "True Color 03/04/17 Bayan-Unjuul")

#2019#

# Stretching delle bande per il 2019
b4_19_ndvi_a_stretch <- stretch(b4_19_ndvi_a)
b3_19_ndvi_a_stretch <- stretch(b3_19_ndvi_a)
b2_19_ndvi_a_stretch <- stretch(b2_19_ndvi_a)

# Creare un oggetto SpatRasterStack con le bande stretchate
tc_19_ndvi_a_stretch <- c(b4_19_ndvi_a_stretch, b3_19_ndvi_a_stretch, b2_19_ndvi_a_stretch)

# Plot RGB con le bande stretchate
plot_tc_19_a <- plotRGB(tc_19_ndvi_a_stretch, r = 1, g = 2, b = 3, scale = 255, main = "True Color 03/04/19 Bayan-Unjuul")


#2021#

# Stretching delle bande per il 2021
b4_21_ndvi_a_stretch <- stretch(b4_21_ndvi_a)
b3_21_ndvi_a_stretch <- stretch(b3_21_ndvi_a)
b2_21_ndvi_a_stretch <- stretch(b2_21_ndvi_a)

# Creare un oggetto SpatRasterStack con le bande stretchate
tc_21_ndvi_a_stretch <- c(b4_21_ndvi_a_stretch, b3_21_ndvi_a_stretch, b2_21_ndvi_a_stretch)

# Plot RGB con le bande stretchate
plot_tc_21_a <- plotRGB(tc_21_ndvi_a_stretch, r = 1, g = 2, b = 3, scale = 255, main = "True Color 07/04/21 Bayan-Unjuul")


#2023#

# Stretching delle bande per il 2023
b4_23_ndvi_a_stretch <- stretch(b4_23_ndvi_a)
b3_23_ndvi_a_stretch <- stretch(b3_23_ndvi_a)
b2_23_ndvi_a_stretch <- stretch(b2_23_ndvi_a)

# Creare un oggetto SpatRasterStack con le bande stretchate
tc_23_ndvi_a_stretch <- c(b4_23_ndvi_a_stretch, b3_23_ndvi_a_stretch, b2_23_ndvi_a_stretch)

# Plot RGB con le bande stretchate
plot_tc_23_a <- plotRGB(tc_23_ndvi_a_stretch, r = 1, g = 2, b = 3, scale = 255, main = "True Color 12/04/23 Bayan-Unjuul")

### CONFRONTO TRUE COLOR APRILE

par(mfrow=c(2,2), oma=c(3,3,3,3))

plot_tc_17_a <- plotRGB(tc_17_ndvi_a_stretch, r = 1, g = 2, b = 3, scale = 255, main = "True_Color_03_04_17_BU")
plot_tc_19_a <- plotRGB(tc_19_ndvi_a_stretch, r = 1, g = 2, b = 3, scale = 255, main = "True_Color_03_04_19_BU")
plot_tc_21_a <- plotRGB(tc_21_ndvi_a_stretch, r = 1, g = 2, b = 3, scale = 255, main = "True_Color_07_04_21_BU")
plot_tc_23_a <- plotRGB(tc_23_ndvi_a_stretch, r = 1, g = 2, b = 3, scale = 255, main = "True_Color_12_04_23_BU")



dev.off()


#### NDVI PERIODO PRIMAVERILE #### 

### NDVI 1 = temperate/tropicali ; 0.2 - 0.4 = shrub/grassland ; -0.1 - 0.1 = roccia, sabbia, neve ; -1 = acqua ###

### 2017 ###
ndvi_2017_a <- (b8_17_ndvi_a - b4_17_ndvi_a) / (b8_17_ndvi_a + b4_17_ndvi_a)
plot(ndvi_2017_a, col = col_ndvi, main = "NDVI 2017 Aprile")

### 2019 ###

ndvi_2019_a <- (b8_19_ndvi_a - b4_19_ndvi_a) / (b8_19_ndvi_a + b4_19_ndvi_a)
plot(ndvi_2019_a, col = col_ndvi, main = "NDVI 2019 Aprile")

### 2021 ###

ndvi_2021_a <- (b8_21_ndvi_a - b4_21_ndvi_a) / (b8_21_ndvi_a + b4_21_ndvi_a)
plot(ndvi_2021_a, col = col_ndvi, main = "NDVI 2021 Aprile")

### 2023 ###

ndvi_2023_a <- (b8_23_ndvi_a - b4_23_ndvi_a) / (b8_23_ndvi_a + b4_23_ndvi_a)
plot(ndvi_2023_a, col = col_ndvi, main = "NDVI 2023 Aprile")

par(mfrow=c(2,2), oma=c(3,3,3,3))

plot(ndvi_2017_a, col = col_ndvi, main = "NDVI 2017")
plot(ndvi_2019_a, col = col_ndvi, main = "NDVI 2019")
plot(ndvi_2021_a, col = col_ndvi, main = "NDVI 2021")
plot(ndvi_2023_a, col = col_ndvi, main = "NDVI 2023")

dev.off()

## DEVIAZIONE STANDARD NDVI PRIMAVERA ##
par(mfrow=c(2,2))
ndvi_sd_17_a <- focal(ndvi_2017_a, w = matrix(1/169,13,13), fun = sd)
plot(ndvi_sd_17_a, col = col_ndvi, main = "Dev Stand 17")

ndvi_sd_19_a <- focal(ndvi_2019_a, w = matrix(1/169,13,13), fun = sd)
plot(ndvi_sd_19_a, col = col_ndvi, main = "Dev Stand 19")

ndvi_sd_21_a <- focal(ndvi_2021_a, w = matrix(1/169,13,13), fun = sd)
plot(ndvi_sd_21_a, col = col_ndvi, main = "Dev Stand 21")

ndvi_sd_23_a <- focal(ndvi_2023_a, w = matrix(1/169,13,13), fun = sd)
plot(ndvi_sd_23_a, col = col_ndvi, main = "Dev Stand 23")

dev.off()

years_ndvi_a <- c(2017, 2019, 2021, 2023)
means_ndvi_a <- c(mean(ndvi_sd_17_a[], na.rm = TRUE), mean(ndvi_sd_19_a[], na.rm = TRUE),
                  mean(ndvi_sd_21_a[], na.rm = TRUE), mean(ndvi_sd_23_a[], na.rm = TRUE))
sds_ndvi_a <- c(sd(ndvi_sd_17_a[], na.rm = TRUE), sd(ndvi_sd_19_a[], na.rm = TRUE),
              sd(ndvi_sd_21_a[], na.rm = TRUE), sd(ndvi_sd_23_a[], na.rm = TRUE))

barplot(means_ndvi_a, names.arg = years, ylim = c(0, max(means_ndvi_a + sds_ndvi_a)), 
        main = "Media NDVI con Deviazione Standard Aprile", ylab = "Valori NDVI", col = "lightblue")



#### FINE NDVI PERIODO PRIMAVERILE ####

#### NDMI PERIODO PRIMAVERILE ####
wd_ndmi_a = setwd("C:/Users/alber/Documents/Uni/Da fare/Tele_Windows/Progetto/NDMI_APRILE")

### CARICO BANDE per NDMI (8A - 811)/(8A+811) ###

wd_ndmi_a

#2017#

b8a_17_a <- rast("NDMI_3_4_2017/2017-04-03-00_00_2017-04-03-23_59_Sentinel-2_L2A_B8A_(Raw).tiff")
b11_17_a <- rast("NDMI_3_4_2017/2017-04-03-00_00_2017-04-03-23_59_Sentinel-2_L2A_B11_(Raw).tiff")

#2019#

b8a_19_a <- rast("NDMI_3_4_2019/2019-04-03-00_00_2019-04-03-23_59_Sentinel-2_L2A_B8A_(Raw).tiff")
b11_19_a <- rast("NDMI_3_4_2019/2019-04-03-00_00_2019-04-03-23_59_Sentinel-2_L2A_B11_(Raw).tiff")

#2021#

b8a_21_a <- rast("NDMI_7_4_2021/2021-04-07-00_00_2021-04-07-23_59_Sentinel-2_L2A_B8A_(Raw).tiff")
b11_21_a <- rast("NDMI_7_4_2021/2021-04-07-00_00_2021-04-07-23_59_Sentinel-2_L2A_B11_(Raw).tiff")

#2023#

b8a_23_a <- rast("NDMI_12_4_2023/2023-04-12-00_00_2023-04-12-23_59_Sentinel-2_L2A_B8A_(Raw).tiff")
b11_23_a <- rast("NDMI_12_4_2023/2023-04-12-00_00_2023-04-12-23_59_Sentinel-2_L2A_B11_(Raw).tiff")

### NDMI ###

## Palette colori ##

### 2017 ###
ndmi_2017_a <- (b8a_17_a - b11_17_a) / (b8a_17_a + b11_17_a)
plot(ndmi_2017_a, col = col_ndmi, main = "NDMI 2017 Aprile")

### 2019 ###

ndmi_2019_a <- (b8a_19_a - b11_19_a) / (b8a_19_a + b11_19_a)
plot(ndmi_2019_a, col = col_ndmi, main = "NDMI 2019 Aprile")

### 2021 ###

ndmi_2021_a <- (b8a_21_a - b11_21_a) / (b8a_21_a + b11_21_a)
plot(ndmi_2021_a, col = col_ndmi, main = "NDMI 2021 Aprile")

### 2023 ###

ndmi_2023_a <- (b8a_23_a - b11_23_a) / (b8a_23_a + b11_23_a)
plot(ndmi_2023_a, col = col_ndmi, main = "NDMI 2023 Aprile")


### confronto ndmi ###

par(mfrow=c(2,2), oma=c(3,3,3,3))
plot(ndmi_2017_a, col = col_ndmi, main = "NDMI 2017 Aprile")
plot(ndmi_2019_a, col = col_ndmi, main = "NDMI 2019 Aprile")
plot(ndmi_2021_a, col = col_ndmi, main = "NDMI 2021 Aprile")
plot(ndmi_2023_a, col = col_ndmi, main = "NDMI 2023 Aprile")

dev.off()

## DEVIAZIONE STANDARD NDMI PRIMAVERA ##
par(mfrow=c(2,2))
ndmi_sd_17_a <- focal(ndmi_2017_a, w = matrix(1/169,13,13), fun = sd)
plot(ndmi_sd_17_a, col = col_ndmi, main = "Dev Stand 17")

ndmi_sd_19_a <- focal(ndmi_2019_a, w = matrix(1/169,13,13), fun = sd)
plot(ndmi_sd_19_a, col = col_ndmi, main = "Dev Stand 19")

ndmi_sd_21_a <- focal(ndmi_2021_a, w = matrix(1/169,13,13), fun = sd)
plot(ndmi_sd_21_a, col = col_ndmi, main = "Dev Stand 21")

ndmi_sd_23_a <- focal(ndmi_2023_a, w = matrix(1/169,13,13), fun = sd)
plot(ndmi_sd_23_a, col = col_ndmi, main = "Dev Stand 23")


years_ndmi_a <- c(2017, 2019, 2021, 2023)
means_ndmi_a <- c(mean(ndmi_sd_17_a[], na.rm = TRUE), mean(ndmi_sd_19_a[], na.rm = TRUE),
                  mean(ndvi_sd_21_a[], na.rm = TRUE), mean(ndmi_sd_23_a[], na.rm = TRUE))
sds_ndmi_a <- c(sd(ndmi_sd_17_a[], na.rm = TRUE), sd(ndmi_sd_19_a[], na.rm = TRUE),
                sd(ndmi_sd_21_a[], na.rm = TRUE), sd(ndmi_sd_23_a[], na.rm = TRUE))

barplot(means_ndmi_a, names.arg = years, ylim = c(0, max(means_ndmi_a + sds_ndmi_a)), 
        main = "Media NDMI con Deviazione Standard Aprile", ylab = "Valori NDMI", col = "lightblue")
barplot(means_ndmi_a, names.arg = years, ylim = c(0, max(means_ndmi_a + sds_ndmi_a)), 
        main = "Media NDMI con Deviazione Standard Aprile", ylab = "Valori NDMI", col = c("lightblue","lightblue","lightblue","red"))


#### ANALISI PERIODO PRIMAVERILE ####

#### NDVI ANALISI PERIODO PRIMAVERILE DA 2017 - 2019 - 2021 -2023 ####

# analisi #

ndvi_aprile <- c(ndvi_2017_a,ndvi_2019_a,ndvi_2021_a,ndvi_2023_a)
plot(ndvi_aprile, col = col_ndvi)

## PCA NDVI PRIMAVERA ##

ndvi_a_pca <- im.pca(ndvi_aprile)
plot(ndvi_a_pca, col = viridis(100))

#pare che negli anni dal 2017 al 2023 nel periodo primaverile ci sia un aumento di copertura vegetazionale, esclusivamente erbacea

dif_ndvi_aprile_1 <- ndvi_aprile[[4]] - ndvi_aprile[[1]]  # 2023 - 2017
dif_ndvi_aprile_2 <- ndvi_aprile[[4]] - ndvi_aprile[[2]]  # 2023 - 2019
dif_ndvi_aprile_3 <- ndvi_aprile[[4]] - ndvi_aprile[[3]]  # 2023 - 2021

dif_col_ndvi = colorRampPalette(c("black","white","darkgreen"))(6)

par(mfrow=c(1,3))

plot(dif_ndvi_aprile_1, col= dif_col_ndvi, main = "Dif 2023 - 2017")
plot(dif_ndvi_aprile_2, col= dif_col_ndvi, main = "Dif 2023 - 2019")
plot(dif_ndvi_aprile_3, col= dif_col_ndvi, main = "Dif 2023 - 2021")
# sottraendo dal 2023 gli anni precedenti si vede un aumento di copertura vegetazionale

dev.off()

#### NDMI ANALISI PERIODO PRIMAVERILE DA 2017 - 2019 - 2021 -2023 ####

# analisi #

ndmi_aprile <- c(ndmi_2017_a,ndmi_2019_a,ndmi_2021_a,ndmi_2023_a)
plot(ndmi_aprile, col = col_ndmi)

#### ANALISI PCA NDMI PRIMAVERA ####

ndmi_a_pca <- im.pca(ndmi_aprile)
plot(ndmi_a_pca, col = viridis(100))

# si nota come dal 2017 al 2023 ci siano molte più zone stressate, si notano meno zone rosse ovvero zone in cui non c'è water stress

dif_ndmi_aprile_1 <- ndmi_aprile[[1]] - ndmi_aprile[[2]]  # 2017 - 2019
dif_ndmi_aprile_2 <- ndmi_aprile[[1]] - ndmi_aprile[[3]]  # 2017 - 2021
dif_ndmi_aprile_3 <- ndmi_aprile[[1]] - ndmi_aprile[[4]]  # 2017 - 2023

dif_col_ndmi = colorRampPalette(c("black","white","red"))(6)

par(mfrow=c(1,3))

plot(dif_ndmi_aprile_1, col= dif_col_ndmi, main = "Dif 2017 - 2019")
plot(dif_ndmi_aprile_2, col= dif_col_ndmi, main = "Dif 2017 - 2021")
plot(dif_ndmi_aprile_3, col= dif_col_ndmi, main = "Dif 2017 - 2023")

# qui si nota un aumento del terreno sterile o che ha un certo valore di water stress dal 2017 fino al 2023 ( la zona rossa indica quello)

dev.off()

#### CONCLUSIONI PERIODO PRIMAVERILE ####
# Si nota come è presente dal NDVI un aumento della copertura vegetazionale negli anni, principalmente erbacea MA
# dall'analisi NDMI sullo stress per quanto concerne la presenza d'acqua nello stesso periodo si è visto un processo contrario
# + copertura vegetazionale ma + water stress. Ipotesi: potrebbe essere che un aumento delle temperature incentivi specie erbacee occasionali
# ma che aumenta lo stress idrico del terreno, probabilmente effetto degli ultimi decenni. Ipotizzo un drop nei prossimi anni per quanto riguarda
# copertura vegetazionale andando ad aumentare il processo di desertificazione che stiamo vedendo negli ultimi anni in Mongolia siccome il suolo non è più
# "idricamente robusto" tendente al secco e a non mantenere acqua nel tempo tra un periodo invernale nevoso e uno estivo. Soprattutto dato dall'analisi di una riduzione copertura nevosa negli anni

# si parla di esclusivamente piante erbacee che non indicano una stabilità vegetazionale, potrebbe quindi NDVI non essere un indice ottimale per il problema
# PER QUESTO SI PROVANO VARI INDICI

#### FINE NDMI PERIODO PRIMAVERILE ####

#### FINE ANALISI PERIODO PRIMAVERILE

####FINE PROGETTO####
