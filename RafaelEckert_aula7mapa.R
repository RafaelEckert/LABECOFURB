# Instale se ainda não tiver:
# install.packages(c("WDI", "ggplot2", "dplyr", "sf", "rnaturalearth", "rnaturalearthdata"))

library(WDI)
library(ggplot2)
library(dplyr)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

# Dados WDI - Exportações de armas em 2023
dadosarmsEXP2023 <- WDI(country = 'all',
                        indicator = 'MS.MIL.XPRT.KD',
                        start = 2023, end = 2023)

grafcortearmsEXP2023 <- ggplot(dadosarmsEXP2023, 
                               aes(x = year, y = MS.MIL.XPRT.KD)) +
  geom_point(color = "gray70", alpha = 0.7, size = 2) +  # pontos gerais
  geom_point(data = filter(dadosarmsEXP2023, country == "Brazil"),
             aes(x = year, y = MS.MIL.XPRT.KD),
             color = "forestgreen", size = 3) +          # Brasil em destaque
  labs(
    title = "Exportações de Armas em 2023",
    x = "Ano",
    y = "ARMS"
  ) +
  theme_minimal(base_family = "Helvetica") +             # estilo limpo
  theme(
    plot.title = element_text(face = "bold", size = 16),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    legend.position = "none"  # remove legenda
  )

grafcortearmsEXP2023


# Mapa do mundo
world <- ne_countries(scale = "medium", returnclass = "sf")

# Juntar com dados do WDI usando código ISO3
mapa_dados <- left_join(world, dadosarmsEXP2023, by = c("iso_a3" = "iso3c"))

# Mapa com o Brasil em sua cor correspondente
mapa_arms <- ggplot(mapa_dados) +
  geom_sf(aes(fill = MS.MIL.XPRT.KD), color = "white", size = 0.1) +
  geom_sf(data = subset(mapa_dados, country == "Brazil"),
          aes(fill = MS.MIL.XPRT.KD), color = "black", size = 0.6) +  # cor conforme dado
  scale_fill_viridis_c(option = "plasma", na.value = "gray90", name = "ARMS") +
  labs(title = "Exportações de Armas por País (2023)") +
  theme_minimal(base_family = "Helvetica") +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10),
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank()
  )

mapa_arms

