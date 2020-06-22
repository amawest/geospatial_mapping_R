# Geospatial Visualization in R
# PART 1
install.packages(c("acs", 
                   "choroplethr", 
                   "choroplethrMaps",
                   "RColorBrewer",
                   "ggplot2"))

library(acs)
library(choroplethr)
library(choroplethrMaps)
library(RColorBrewer)
library(ggplot2)

api.key.install("4f73d031e662702b51198fc221189a80ca22d7ec")

# -------------------------------------------
# PART 2
# per capita income by county, default everything
county_choropleth_acs(tableId = "B19301")

# per capita income by county, change title + subtitle
county_choropleth_acs(tableId = "B19301") +
  labs(title="Custom Title", 
       subtitle = "Snazzy Custom Subtitle") +
  theme(
       plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
       plot.subtitle = element_text(size = 8, color = "cornflowerblue", hjust = 0.5))

# per capita income by county, continuous colors
county_choropleth_acs(tableId = "B19301", num_colors = 1) +
  labs(title="Custom Title", 
       subtitle = "Snazzy Custom Subtitle") +
  theme(
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 8, color = "cornflowerblue", hjust = 0.5))

col.pal<-brewer.pal(7,"Greens")
df_2015<-get_acs_data(tableId="B19301",map="county",endyear=2015)
choro1<-CountyChoropleth$new(df_2015$df)
choro1$ggplot_scale <- scale_fill_manual(name="Per Capita Income",values=col.pal, drop=FALSE)
choro1$render() +
  labs(title="Custom Title", 
       subtitle = "Snazzy Custom Subtitle") +
  theme(
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 8, color = "darkseagreen", hjust = 0.5))


# ----------------------------------------
# PART 3: By States & Regions

# 1 || Specify Michigan
county_choropleth_acs(tableId = "B19301", state_zoom="michigan") +
  labs(title="Custom Title", 
       subtitle = "Snazzy Custom Subtitle") +
  theme(
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 8, color = "cornflowerblue", hjust = 0.5))

# 2 || Specify a Mix of States
county_choropleth_acs(tableId = "B19301", state_zoom=c("michigan", "ohio", "wisconsin")) +
  labs(title="Custom Title", 
       subtitle = "Snazzy Custom Subtitle") +
  theme(
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 8, color = "cornflowerblue", hjust = 0.5))

# 3 || Change Michigan Colors with scale_fill_brewer() 
county_choropleth_acs(tableId = "B19301", state_zoom=c("michigan")) + 
  scale_fill_brewer(palette="Spectral") + 
  labs(title="Custom Title", 
       subtitle = "Snazzy Custom Subtitle") +
  theme(
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 8, color = "goldenrod", hjust = 0.5))

# 4 || Change State Group Colors with scale_fill_brewer() 
county_choropleth_acs(tableId = "B19301", state_zoom=c("michigan", "ohio", "wisconsin")) + 
  scale_fill_brewer(palette="YlGnBu") + 
  labs(title="Custom Title", 
       subtitle = "Snazzy Custom Subtitle") +
  theme(
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 8, color = "darkseagreen", hjust = 0.5))

# -------------------------------------------
