# numero inteiro
x <- 2L
typeof(x)

# numeros decimais (doubles)
y <- 2.5
typeof(y)

# realizando operações usando nome dos objetos
z <- x + y
typeof(z)

## Objeto texto (aspas simples ou duplas)

w <- "jurimetria"
typeof(w)

#

u <- '2'
v <- "2.5"

u + v

## objeto da classe data, classe é comportamento objeto

data <- as.Date("2023-02-25")
typeof(data)

data2 <- as.Date("2023-03-01")

as.numeric(data2)
as.numeric(data)

# operações com data
data2-data

class(data)

data3 <- as.Date("1969-12-30")
as.numeric(data3)

## Vetor objeto co um ou mais elementos

nome <- c("luis", "ana", "joão")

numeros  <- 1:10

numeros

#subconjunto
numeros[10]

numeros[2:5]

numeros[-1]

# tipo fator

nomes <- c("luis", "ana", "joão", "ana", "flávia", "luis", "ana")

nomes_como_fator <- as.factor(nomes) # snakecase preferivel a lowercamelcase nomescomofator

nomes_como_fator

as.numeric(nomes_como_fator)

# Matrizes

m <- matrix(1:15)
m

#Usando vetor

n*2

n <- matrix(1:15,ncol = 3)
n

#dataframe Emparelhamento de Vetores

df <- data.frame(nome = c("fabiana","juvenal","lucas","pedro","beatriz","bruno"),
                idade = c(55, 18, 35, 34, 30, 40))
df

class(df)

#lista

l <- list(m,data, df)
l

