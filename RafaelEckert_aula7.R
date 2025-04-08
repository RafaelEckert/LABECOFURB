#   AULA 7

# A PARTIR DA VARIÁVEL ESCOLHIDA NAS OUTRAS AULAS:
# REFAÇA OS 3 GRÁFICOS:
# 1) DADOS EM PAINEL
# 2) CORTE TRANSVERSAL
# 3) SÉRIE TEMPORAL

# CÓDIGO ELABORADO PELO CHATGPT

library(ggplot2)
library(WDI)

# Dados do PIB
dadospib <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD')

# Adicionando dados do Brasil separadamente
dados_brasil <- dadospib[dadospib$iso2c == 'BR', ]

# Gráfico com as modificações
grafpainel <- ggplot(dadospib, aes(x = year, y = NY.GDP.MKTP.CD)) + 
  # Plotando os pontos para todos os países
  geom_point(aes(color = "Todos os países"), alpha = 0.7) +
  # Plotando os pontos para o Brasil em vermelho
  geom_point(data = dados_brasil, aes(x = year, y = NY.GDP.MKTP.CD), color = "red", size = 2) +
  # Adicionando título e modificando rótulos
  ggtitle("Produto Interno Bruto (PIB) por Ano") + 
  labs(x = "Ano", y = "PIB") + 
  theme_minimal() +  # Tema mais moderno
  # Mudando as cores e fontes
  scale_color_manual(values = c("Todos os países" = "blue")) +
  theme(
    plot.title = element_text(family = "Arial", face = "bold", size = 16, hjust = 0.5),
    axis.title.x = element_text(family = "Arial", size = 12),
    axis.title.y = element_text(family = "Arial", size = 12),
    axis.text = element_text(family = "Arial", size = 10),
    legend.position = "none"  # Remover a legenda dos países
  )

# Exibir o gráfico
print(grafpainel)


#################################################

# 1) DADOS EM PAINEL:

library(ggplot2)
library(WDI)

# Dados das exportações de armas
dadosarmsEXP <- WDI(country = 'all', indicator = 'MS.MIL.XPRT.KD')

# Adicionando dados do Brasil separadamente
dados_brasil <- dadosarmsEXP[dadosarmsEXP$iso2c == 'BR', ]

# Gráfico com as modificações
grafpainelarmsEXP <- ggplot(dadosarmsEXP, aes(x = year, y = MS.MIL.XPRT.KD)) + 
  # Plotando os pontos para todos os países
  geom_point(aes(color = "Todos os países"), alpha = 0.7) +
  # Plotando os pontos para o Brasil em vermelho
  geom_point(data = dados_brasil, aes(x = year, y = MS.MIL.XPRT.KD), color = "red", size = 2) +
  # Adicionando título e modificando rótulos
  ggtitle("Exportações de Armas por Ano") + 
  labs(x = "Ano", y = "ARMS") + 
  theme_minimal() +  # Tema mais moderno
  # Mudando as cores e fontes
  scale_color_manual(values = c("Todos os países" = "blue")) +
  theme(
    plot.title = element_text(family = "Arial", face = "bold", size = 16, hjust = 0.5),
    axis.title.x = element_text(family = "Arial", size = 12),
    axis.title.y = element_text(family = "Arial", size = 12),
    axis.text = element_text(family = "Arial", size = 10),
    legend.position = "none"  # Remover a legenda dos países
  )

# Exibir o gráfico
print(grafpainelarmsEXP)


#################################################

# 2) CORTE TRANSVERSAL

library(ggplot2)
library(WDI)
library(dplyr)

# Carregando os dados
dadosarmsEXP2023 <- WDI(country = 'all',
                        indicator = 'MS.MIL.XPRT.KD',
                        start = 2023, end = 2023)

# Construindo o gráfico com as modificações
grafcortearmsEXP2023 <- ggplot(dadosarmsEXP2023, 
                               aes(x = year, y = MS.MIL.XPRT.KD)) +
  geom_point(color = "gray60", alpha = 0.6, size = 2) +  # pontos dos países em cinza moderno
  geom_point(data = filter(dadosarmsEXP2023, country == "Brazil"),
             aes(x = year, y = MS.MIL.XPRT.KD),
             color = "forestgreen", size = 3) +           # destaque para o Brasil em verde
  labs(
    title = "Exportações de Armas em 2023",
    x = "Ano",
    y = "ARMS"
  ) +
  theme_minimal(base_family = "Helvetica") +              # fonte moderna
  theme(
    plot.title = element_text(face = "bold", size = 16, color = "#333333"),
    axis.title = element_text(size = 12, color = "#333333"),
    axis.text = element_text(size = 10, color = "#555555"),
    legend.position = "none"                              # remove legenda
  )

# Exibindo o gráfico
grafcortearmsEXP2023


#################################################

# 3) SÉRIE TEMPORAL

library(ggplot2)
library(WDI)

# Coleta dos dados
dadosarmsEXPBR <- WDI(country = 'BR',
                      indicator = 'MS.MIL.XPRT.KD')

# Criação do gráfico com melhorias visuais
grafseriearmsEXPBR <- ggplot(dadosarmsEXPBR,
                             aes(x = year, y = MS.MIL.XPRT.KD)) +
  geom_line(color = "forestgreen", size = 1.2) +   # linha em verde e mais espessa
  geom_point(color = "forestgreen", size = 2) +    # pontos verdes para destacar os anos
  labs(
    title = "Exportações de Armas do Brasil ao Longo do Tempo",
    x = "Ano",
    y = "ARMS"
  ) +
  theme_minimal(base_family = "Helvetica") +
  theme(
    plot.title = element_text(face = "bold", size = 16, color = "#333333"),
    axis.title = element_text(size = 12, color = "#333333"),
    axis.text = element_text(size = 10, color = "#555555"),
    legend.position = "none"  # Remove legenda (mesmo que não exista, por segurança)
  )

# Exibindo o gráfico
grafseriearmsEXPBR
