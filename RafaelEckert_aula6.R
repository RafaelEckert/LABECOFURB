# AULA 6

# API (PORTA/FORMA DE ACESSO REMOTO)
# ACESSAMOS OS DADOS DO BANCO MUNDIAL (WORLD BANK)
# WORLD DEVELOPMENT INDICATORS (WDI)
# INDICADORES DE DESENVOLVIMENTO MUNDIAL

# PIB (PRODUTO INTERNO BRUTO)

#install.packpages('WDI')
library(WDI) # CARREGAR BIBLIOTECA/PACOTE

options(scipen = 999) # REMOVER A NOT. CIENT.

# DADOS EM PAINEL
dadospib <- WDI(country = 'all',
                indicator = 'NY.GDP.MKTP.CD')

paises <- c('BR', 'US')

dadospibbrus <- WDI(country = paises,
                    indicator = 'NY.GDP.MKTP.CD')

# CORTE TRANSVERSAL
dadospib2023 <- WDI(country = 'all',
                    indicator = 'NY.GDP.MKTP.CD',
                    start = 2023, end = 2023)

# SÉRIE TEMPORAL
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NY.GDP.MKTP.CD')

# DADOS EM PAINEL TESTE
dadosarmsEXP <- WDI(country = 'all',
                    indicator = 'MS.MIL.XPRT.KD')

# CORTE TRANSVERSAL TESTE
dadosarmsEXP2023 <- WDI(country = 'all',
                        indicator = 'MS.MIL.XPRT.KD',
                        start = 2023, end = 2023)

# SÉRIE TEMPORAL TESTE
dadosarmsEXPBR <- WDI(country = 'BR',
                      indicator = 'MS.MIL.XPRT.KD')


# GRÁFICOS
# BIBLIOTECA ggplot2 (tidyverse)
#install.packpages("tidyverse")
library(tidyverse)

## DADOS EM PAINEL

grafpainel <- ggplot(dadospib,
                     mapping = aes(y = NY.GDP.MKTP.CD,
                                   x = year)) + 
  geom_point()

print(grafpainel)

# CORTE TRANVERSAL

grafcorte <- ggplot(dadospib2023,
                   mapping = aes(y = NY.GDP.MKTP.CD,
                                 x = year)) +
  geom_point()

print(grafcorte)

# SÉRIE TEMPORAL

grafserie <-  ggplot(dadospibbr,
                     mapping = aes(y = NY.GDP.MKTP.CD,
                                   x= year)) +
  geom_line()

print(grafserie)


## DADOS EM PAINEL TESTE

grafpainelarmsEXP<- ggplot(dadosarmsEXP,
                     mapping = aes(y = MS.MIL.XPRT.KD,
                                   x = year)) + 
  geom_point()

print(grafpainelarmsEXP)

# CORTE TRANVERSAL TESTE

grafcortearmsEXP2023 <- ggplot(dadosarmsEXP2023,
                    mapping = aes(y = MS.MIL.XPRT.KD,
                                  x = year)) +
  geom_point()

print(grafcortearmsEXP2023)

# SÉRIE TEMPORAL TESTE

grafseriearmsEXPBR <-  ggplot(dadosarmsEXPBR,
                     mapping = aes(y = MS.MIL.XPRT.KD,
                                   x= year)) +
  geom_line()

print(grafseriearmsEXPBR)
