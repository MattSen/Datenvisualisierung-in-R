##### RDA Deutschland Tagung 2020 - Advanced Track - Workshop ##### 

#################### Datenvisualisierung mit R ####################

require(ggplot2)
require(viridis)

ggplot(iris, aes(Sepal.Length, Sepal.Width))+
  geom_point(aes(color = Species)) +
  geom_smooth(aes(color = Species, fill = Species), method = "lm") + 
  scale_color_viridis(discrete = TRUE)+
  scale_fill_viridis(discrete = TRUE) +
  theme_minimal() +
  theme(legend.position = "bottom")


require(plotly)

# Plot funktioniert nur in R

p <- plot_ly(
  type = "scatter",
  x = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), 
  y = c(68000, 52000, 60000, 20000, 95000, 40000, 60000, 79000, 74000, 42000, 20000, 90000),
  mode = "markers+lines") %>%
  layout(
    yaxis = list(
      showexponent = "all",
      exponentformat = "e"
    )
  )

p
