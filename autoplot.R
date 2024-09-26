# Civenti Mattia 30
# github: MattiaCiventi

# Crea un biplot per visualizzare la PCA
autoplot(pca_result, data = data, colour = 'Anno', loadings = TRUE, loadings.label = TRUE) +
  labs(title = "Biplot dell'Analisi delle Componenti Principali (PCA)",
       x = "PC1",
       y = "PC2") +
  theme_minimal()

