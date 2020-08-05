# SESION 1, POSTWORK

library(dplyr)

# SELECT
two.columns <- iris %>%
  select(Sepal.Length,Sepal.Width)

columns = c('Sepal.Length','Sepal.Width')
two.columns <- iris %>%
  select(columns)

# FILTER
setosa <- iris %>%
  filter(Species=='setosa')

setosa
species_to_select = c('setosa','virginica')
species <- iris %>%
  filter(Species %in% species_to_select)
table(species$Species) # sí aparece la especie 'versicolor' porque el df 'species' es un filtrado de 'iris'

# MUTATE
iris2 <- iris %>%
  mutate(Sepal.Length.6 = ifelse(Sepal.Length >=6, 'GE 6', 'LT 6')) %>%
  mutate(Sepal.Length.rela = Sepal.Length/mean(Sepal.Length))
head(iris2)

# Sumarizar group_by() summarize():
iris %>% 
  group_by(Species) %>%
  summarize(mean.Sepal.Length = mean(Sepal.Length),
            sd.Sepal.Length = sd(Sepal.Length),
            rows = n())
# ARRANGE
order1 <- iris %>%
  arrange(Sepal.Length)
head(order1)

order2 <- iris %>%
  arrange(desc(Sepal.Length))
head(order2)

iris2 %>%
  arrange(desc(Sepal.Length.rela)) %>%
  select(Species, Sepal.Length.rela) %>%
  filter(Species== 'virginica')

iris %>% group_by(Species) %>%
  summarize(mean.Sepal.Length = mean(Sepal.Length),
            sd.Sepal.Length = sd(Sepal.Length),
            rows = n()) %>%
  arrange(mean.Sepal.Length)

# INNER JOIN ()
iris2 <- iris %>%
  mutate(id = row_number())
iris2

iris3 <- iris2 %>%
  filter(Species=='setosa') %>%
    mutate(Sepal.Length.6 = ifelse(Sepal.Length >=6, 'GE 6', 'LT 6')) %>%
    mutate(Sepal.Length.rela = Sepal.Length/mean(Sepal.Length)) %>%
  select(id,Sepal.Length.6,Sepal.Length.rela)
iris3

iris4 <- iris2 %>% inner_join(iris3, by=c('id'))

iris2
iris3
head(iris4)

# LEFT JOIN
iris5 <- iris2 %>% left_join(iris3, by=c('id'))
iris5

# ANTI JOIN
iris6 <- iris2 %>% anti_join(iris3)
iris6
