# AULA 5

# API (PORTA/FORMA DE ACESSO REMOTO)
# ACESSAMOS OS DADOS DO BANCO MUNDIAL (WORLD BANK)
# WORLD DEVELOPMENT INDICATORS (WDI)
# INDICADORES DE DESENVOLVIMENTO MUNDIAL

# PIB (PRODUTO INTERNO BRUTO)

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
dadospibBR <- WDI(country = 'BR',
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