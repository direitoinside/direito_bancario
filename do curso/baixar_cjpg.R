library(tjsp)
library(writexl)
library(readxl)
library(tidyverse)
library(genderBR)


?tjsp_baixar_cjpg
tjsp_baixar_cjpg(
  livre = "santander",
  aspas = FALSE,
  processo = "",
  foro = "",
  vara = "",
  classe = "",
  assunto = "",
  magistrado = "",
  inicio = "01/01/2022",
  fim = "31/12/2022",
  diretorio = "data-raw/cjpg",
  paginas = 1:10
)
?tjsp_ler_cjpg
cjpg <- tjsp_ler_cjpg(diretorio = "data-raw/cjpg")
write_xlsx(cjpg, "data/cjpg.xlsx") # erro devido a limitação de tamanho do excel
write.csv2(cjpg, "data/cjpg.csv")

cjpg <- cjpg |> 
  mutate(sexo = get_gender(magistrado), .after = magistrado)

cjpg <- cjpg |> 
  mutate(sexo = ifelse(magistrado == "Sizara Corral de Arêa Leão Muniz Andrade", "female", sexo))

?tjsp_autenticar

?tjsp_baixar_cpopg
tjsp_autenticar()
tjsp_baixar_cpopg(processos = cjpg$processo, sono = 1, diretorio = "data-raw/cpopg")

## Exemplo: meus_processos <- c("10044934620218260655", "00013705720218260655")

## Exemplo: tjsp_baixar_cpopg(processos = meus_processos, sono = 1, diretorio = "data-raw/meus_processos_folder")

arquivos_de_trabalho <- list.files("data-raw/cpopg", full.names = TRUE)

## Imprimir os nomes dos arquivos
arquivos_de_trabalho

## Leitura dos dados, depois que baixar os processos
cpopg_dados <- tjsp_ler_dados_cpopg(arquivos = arquivos)

cpopg_partes <- tjsp_ler_partes(arquivos = arquivos)

cpopg_movimentacao <- tjsp_ler_movimentacao(arquivos = arquivos)

