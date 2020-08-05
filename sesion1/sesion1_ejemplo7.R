# SESIÓN 1, EJEMPLO 7

## Instalación desde CRAN
install.packages("dplyr")

library(dplyr)
?select
?filter
?arrange
?mutate
?summarise
?group_by

# PARTE 1. FILTER
iris %>% filter(Sepal.Length >= 6)
iris %>% filter((Sepal.Length >= 6) & (Petal.Length > 4.5))

# PARTE 2. SELECT
iris %>% 
  select(Sepal.Length,Petal.Length) %>%
  filter((Sepal.Length >= 6) & (Petal.Length > 4.5)) %>%
  head(5)

iris %>%
  select(-Species) %>%
  head(5)

iris %>% 
  select(starts_with('S')) %>% 
  head(5)

# PARTE 3: ARRANGE
iris %>% 
  arrange(Sepal.Length) %>% 
  head(5)

# Ordenamos descendentemente por la columna Sepal.Length y seleccionamos primeros 5 renglones
iris %>% 
  arrange(desc(Sepal.Length)) %>%
  head(5)

# PARTE 4: RENAME
iris %>%
  rename(Especies = Species) %>%
  head(5)

# PARTE 5: MUTATE
iris %>% 
  mutate(Mult.Width = Sepal.Width*Petal.Width) %>%
  head(5)

# PARTE 6: GROUP BY
iris %>%
  group_by(Species) %>%
  count()

iris

iris %>% 
  group_by(Species) %>%
  summarise(Mean.Sepal.Length = mean(Sepal.Length),
            Median.Petal.Length = median(Sepal.Length),
            Max.Petal.Width = max(Petal.Width),
            Min.Petal.Length = min(Petal.Length))
