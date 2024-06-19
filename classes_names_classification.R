# Filippo  Paganelli 

# class 1 = vegetazione
# class 2 = suolo nudo
nomi_classi <- c("Vegetazione", "Suolo nudo") # uguali per entrambi in questo caso

# Le osservo una sopra all'altra
# Le plotto dando anche un nome alle classi in maniera da essere più chiaro
VB <- colorRampPalette(c("forestgreen", "floralwhite"))(2) # creo la mia scala di colori con solo 2 sfumature
par(mfrow=c(2,1)) # 2 righe e 1 colonna
plot(m23c, main = "Classificazione marzo 23", type = "classes", levels = nomi_classi, col = VB)
plot(s23c, main = "Classificazione settembre 23", type = "classes", levels = nomi_classi, col = VB)
