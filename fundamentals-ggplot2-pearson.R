################################################################################
#                                                                              #
#             "Hands-On Dat Visualization with ggplot2: Concepts"              #
#          Pearson Live Training Session for O'Reilly, June 13 2023            #
#                                                                              #
#                             Dr Cédric Scherer                                #
#                             cedricscherer.com                                #
#                                                                              #
################################################################################


##------------------------------------------------------------------------------
## PREPARATION
##------------------------------------------------------------------------------

## This session makes use of the following packages:
##  - ggplot2 
##  - dplyr 
##  - readr
##  - forcats 
##  - stringr 
##  - scales 
##  - ragg
##  - gapminder

## Please install the missing packages by running the following:
pkgs <- c("ggplot2",  "dplyr", "readr","forcats", "stringr", "scales", "ragg", "gapminder")
unavailable <- setdiff(pkgs, rownames(installed.packages()))
install.packages(unavailable)

## We are using a non-default font in this session. If you want to run all code
## "as it is", please install the "Asap Condensed" typeface which is available 
## for free via Google Fonts: fonts.google.com/specimen/Asap+Condensed.
## You find the files in the ./fonts folder. Install them by double-clicking.
##
## If you don't want to or can't install the fonts, it is still possible to run
## the code. Just make sure to replace the font families in the code with one 
## that is installed on your system--or remove the respective rows (more later).

## For Mac Users: If you want to save your visualization to PDF, Please make 
## sure that XQuartz is installed which is needed to use the cairo pdf device:
## https://www.xquartz.org/


## That's it---let's start!


##------------------------------------------------------------------------------
## DATA SETS
##------------------------------------------------------------------------------

library(gapminder)

gapminder

# gapminder <- readr::read_csv("./data/gapminder.csv")
# gapminder

library(dplyr)

gm2007 <- filter(gapminder, year == 2007)
gm2007

gm_g7 <- filter(gapminder, country %in% c(
  "United States", "Canada", "France", "Germany", "Italy", "Japan", "United Kingdom")
)
gm_g7


##------------------------------------------------------------------------------
## GGPLOT COMPONENTS: DATA
##------------------------------------------------------------------------------

?ggplot

ggplot(data = gm2007)


##------------------------------------------------------------------------------
## GGPLOT COMPONENTS: AESTHETICS
##------------------------------------------------------------------------------

ggplot(data = gm2007) +
  aes(x = gdpPercap, y = lifeExp)

ggplot(data = gm2007) + aes(x = gdpPercap, y = lifeExp)

ggplot(data = gm2007, mapping = aes(x = gdpPercap, y = lifeExp))

ggplot(gm2007, aes(gdpPercap, lifeExp))

ggplot(data = gm2007, aes(x = gdpPercap, y = lifeExp))

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  )


##------------------------------------------------------------------------------
## GGPLOT COMPONENTS: GEOMETRICAL LAYERS
##------------------------------------------------------------------------------

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point()

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  layer(
    geom = "point", 
    stat = "identity", ## do nothing
    position = "identity" ## do nothing
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  layer(
    geom = "line", 
    stat = "identity", ## do nothing
    position = "identity" ## do nothing
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  layer(
    geom = "smooth", 
    stat = "smooth", 
    position = "identity" ## do nothing
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_smooth()

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point() +
  geom_smooth()

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_smooth() +
  geom_point()

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point(
    color = "#28a87d",
    alpha = .5,
    shape = 8,
    stroke = 1.2,
    size = 2
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point(
    color = "#28a87d"
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point(
    aes(color = continent)
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point(
    color = "#28a87d",
    size = 3
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point(
    aes(color = continent,
        size = pop)
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point(
    aes(color = lifeExp >= 75),
    alpha = .5
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point(
    aes(color = continent != "Europe"),
    alpha = .5
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point(
    aes(color = pop < 10^9),
    alpha = .5
  )

ggplot(
    data = gm_g7,
    aes(x = year, y = lifeExp)
  ) +
  geom_line(
    aes(color = country),
    alpha = .5
  )

ggplot(
    data = gm_g7,
    aes(x = year, y = lifeExp,
        color = country)
  ) +
  geom_line(
    alpha = .5
  )

ggplot(
    data = gm_g7,
    aes(x = year, y = lifeExp)
  ) +
  geom_line(
    aes(color = country),
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )

ggplot(
    data = gm_g7,
    aes(x = year, y = lifeExp,
        color = country)
  ) +
  geom_line(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )

ggplot(
    data = gm_g7,
    aes(x = year, y = lifeExp,
        color = country)
  ) +
  geom_line(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm",
    color = "black"
  )

ggplot(
    data = gm_g7,
    aes(x = year, y = lifeExp)
  ) +
  geom_line(
    alpha = .5
  )

ggplot(
    data = gm_g7,
    aes(x = year, y = lifeExp,
        group = country)
  ) +
  geom_line(
    alpha = .5
  )

ggplot(
    data = gm_g7,
    aes(x = year, y = lifeExp,
        group = country)
  ) +
  geom_line(
    alpha = .5
  ) +
  geom_line(
    data = filter(gm_g7, country == "Japan"),
    color = "red",
    size = 1
  )

ggplot(
    data = gm2007,
    aes(x = continent, y = gdpPercap)
  ) +
  geom_point(
    alpha = .3
  )

ggplot(
    data = gm2007,
    aes(x = continent, y = gdpPercap)
  ) +
  geom_point(
    position = "identity",
    alpha = .3
  )

ggplot(
    data = gm2007,
    aes(x = continent, y = gdpPercap)
  ) +
  geom_point(
    position = "jitter",
    alpha = .3
  )

ggplot(
    data = gm2007,
    aes(x = continent, y = gdpPercap)
  ) +
  geom_point(
    position = position_jitter(),
    alpha = .3
  )

ggplot(
    data = gm2007,
    aes(x = continent, y = gdpPercap)
  ) +
  geom_point(
    position = position_jitter(
      width = .2
    ),
    alpha = .3
  )

ggplot(
    data = gm2007,
    aes(x = continent, y = gdpPercap)
  ) +
  geom_jitter(
    width = .2,
    alpha = .3
  )

ggplot(
    data = gm2007,
    aes(x = continent, y = gdpPercap)
  ) +
  geom_boxplot() +
  geom_jitter(
    width = .2,
    alpha = .3
  )

ggplot(
    data = gm2007,
    aes(x = continent, y = gdpPercap)
  ) +
  geom_boxplot(
    outlier.shape = NA
  ) +
  geom_jitter(
    width = .2,
    alpha = .3
  )

gm_bars <- filter(
  gapminder, 
  country %in% c("United States", "Canada"), 
  year > 1999
)

gm_bars

ggplot(
    data = gm_bars,
    aes(x = year, y = gdpPercap)
  ) +
  geom_col(
    aes(fill = country)
  )

ggplot(
    data = gm_bars,
    aes(x = factor(year), y = gdpPercap)
  ) +
  geom_col(
    aes(fill = country)
  )

ggplot(
    data = gm_bars,
    aes(x = factor(year), y = gdpPercap)
  ) +
  geom_col(
    aes(fill = country),
    position = "stack"
  )

ggplot(
    data = gm_bars,
    aes(x = factor(year), y = gdpPercap)
  ) +
  geom_col(
    aes(fill = country),
    position = "dodge"
  )

ggplot(
    data = gm_bars,
    aes(x = factor(year), y = gdpPercap)
  ) +
  geom_col(
    aes(fill = country),
    position = "dodge",
    width = .6
  )

ggplot(
    data = gm_bars,
    aes(x = factor(year), y = gdpPercap)
  ) +
  geom_col(
    aes(fill = country),
    position = position_dodge(
      width = .7
    ),
    width = .6
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp,
        color = continent,
        size = pop)
  ) +
  geom_point(
    alpha = .5
  ) 

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp,
        color = continent,
        size = pop)
  ) +
  geom_point(
    alpha = .5
  ) +
  labs(
    x = "GDP per capita (US$, inflation-adjusted)",
    y = "Life expectancy at birth (years)"
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp,
        color = continent,
        size = pop)
  ) +
  geom_point(
    alpha = .5
  ) +
  labs(
    x = "GDP per capita (US$, inflation-adjusted)",
    y = "Life expectancy at birth (years)",
    color = "Continent:",
    size = "Population:"
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp,
        color = continent,
        size = pop)
  ) +
  geom_point(
    alpha = .5
  ) +
  labs(
    x = "GDP per capita (US$, inflation-adjusted)",
    y = NULL,
    color = NULL,
    size = "Population:"
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp,
        color = continent,
        size = pop)
  ) +
  geom_point(
    alpha = .5
  ) +
  labs(
    x = "GDP per capita (US$, inflation-adjusted)",
    y = "",
    color = NULL,
    size = "Population:"
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp,
        color = continent,
        size = pop)
  ) +
  geom_point(
    alpha = .5
  ) +
  labs(
    x = "GDP per capita (US$, inflation-adjusted)",
    y = "Life expectancy at birth (years)",
    color = "Continent:",
    size = "Population:",
    title = "Health & Income of Nations in 2007",
    caption = "Source: Gapminder project"
  )


##------------------------------------------------------------------------------
## EXPORT YOUR GGPLOT
##------------------------------------------------------------------------------

# ggsave(g, filename = "my_plot.png")

# ggsave("my_plot.png")

# ggsave("my_plot.png", width = 8, height = 5, dpi = 600)

# ggsave("my_plot.pdf", width = 20, height = 12, unit = "cm", device = cairo_pdf)


##------------------------------------------------------------------------------
## STORE YOUR GGPLOT
##------------------------------------------------------------------------------

g <-
  ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp,
        color = continent, 
        size = pop)
  ) +
  geom_point(
    alpha = .5
  ) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    color = NULL,
    size = "Population:",
    title = "Health & Income of Nations in 2007"
  )

class(g)

g


##------------------------------------------------------------------------------
## GGPLOT COMPONENTS: THEMES
##------------------------------------------------------------------------------

g + theme_light()

g + theme_minimal()

g + theme_classic()

g + theme_void()

g + theme_light(
  base_size = 13,
  base_family = "Asap Condensed"
)

theme_set(theme_light())

g

theme_set(theme_light(
  base_size = 13,
  base_family = "Asap Condensed"
))

g

library(ragg)

systemfonts::system_fonts() %>%
  filter(stringr::str_detect(family, "Asap")) %>%
  pull(family) %>%
  unique() %>% 
  sort()

g +
  theme()

g +
  theme(
    panel.grid.minor = element_blank()
  )

g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold")
  )

g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    plot.title.position = "plot"
  )

g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    plot.title.position = "plot",
    panel.background = element_rect(
      fill = "#f8f8f8", color = NA
    )
  )

theme_update(
  panel.grid.minor = element_blank(),
  plot.title = element_text(face = "bold"),
  plot.title.position = "plot",
  panel.background = element_rect(
    fill = "#f8f8f8", color = NA
  )
)

theme_update(
  panel.grid.minor = element_blank(),
  plot.title = element_text(face = "bold"),
  plot.title.position = "plot",
  panel.background = element_rect(
    fill = "#f8f8f8", color = NA
  )
)

g


##------------------------------------------------------------------------------
## GGPLOT COMPONENTS: FACETS
##------------------------------------------------------------------------------

g +
  facet_wrap(
    vars(continent)
  )

g +
  facet_wrap(
    ~ continent
  )

g +
  facet_wrap(
    ~ continent,
    ncol = 1
  )

g +
  facet_wrap(
    ~ continent,
    ncol = 2
  )

g +
  facet_wrap(
    ~ continent,
    ncol = 2,
    scales = "free"
  )

g +
  facet_wrap(
    ~ continent,
    ncol = 2,
    scales = "free_y"
  )


##------------------------------------------------------------------------------
## GGPLOT COMPONENTS: SCALES
##------------------------------------------------------------------------------

ggplot(
    data = gm2007,
    aes(x = gdpPercap, 
        y = lifeExp,
        color = continent,
        size = pop)
  ) +
  geom_point() +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_discrete() +
  scale_size()

ggplot(
    data = gm2007,
    aes(x = continent, 
        y = lifeExp,
        color = gdpPercap)
  ) +
  geom_jitter(width = .2) +
  scale_x_discrete() +
  scale_y_continuous() +
  scale_color_continuous()

g +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_discrete() +
  scale_size()

g +
  scale_x_log10() +
  scale_y_binned() +
  scale_color_viridis_d() +
  scale_size_area()

g +
  scale_x_log10( 
    labels = scales::label_comma()
  ) +
  scale_y_continuous() +
  scale_color_discrete() +
  scale_size()

g +
  scale_x_log10(
    labels = scales::label_comma(),
    name = "GDP per capita (log scale)"
  ) +
  scale_y_continuous() +
  scale_color_discrete() +
  scale_size()

g +
  scale_x_log10(
    labels = scales::label_comma(),
    name = "GDP per capita (log scale)"
  ) +
  scale_y_continuous(
    limits = c(35, NA),
  ) +
  scale_color_discrete() +
  scale_size()

g +
  scale_x_log10(
    labels = scales::label_comma(),
    name = "GDP per capita (log scale)"
  ) +
  scale_y_continuous(
    limits = c(60, 75)
  ) +
  scale_color_discrete() +
  scale_size()

g +
  scale_x_log10(
    labels = scales::label_comma(),
    name = "GDP per capita (log scale)"
  ) +
  scale_y_continuous(
    limits = c(35, NA),
    breaks = seq(30, 85, by = 5)
  ) +
  scale_color_discrete() +
  scale_size()

g +
  scale_x_log10(
    labels = scales::label_comma(),
    name = "GDP per capita (log scale)"
  ) +
  scale_y_continuous(
    limits = c(35, NA),
    breaks = seq(30, 85, by = 5)
  ) +
  scale_color_discrete(
    type = continent_colors
  ) +
  scale_size()

gapminder::continent_colors

g +
  scale_x_log10(
    labels = scales::label_comma(),
    name = "GDP per capita (log scale)"
  ) +
  scale_y_continuous(
    limits = c(35, NA), 
    breaks = seq(30, 85, by = 5)
  ) +
  scale_color_manual(
    values = continent_colors
  ) +
  scale_size()

g +
  scale_x_log10(
    labels = scales::label_comma(),
    name = "GDP per capita (log scale)"
  ) +
  scale_y_continuous(
    limits = c(35, NA),
    breaks = seq(30, 85, by = 5)
  ) +
  scale_color_brewer(
    palette = "Dark2"
  ) +
  scale_size()

g +
  scale_x_log10(
    labels = scales::label_comma(),
    name = "GDP per capita (log scale)"
  ) +
  scale_y_continuous(
    limits = c(35, NA), 
    breaks = seq(30, 85, by = 5)
  ) +
  scale_color_brewer(
    palette = "Dark2"
  ) +
  scale_size(
    range = c(1, 9)
  )

g +
  scale_x_log10(
    labels = scales::label_comma(),
    name = "GDP per capita (log scale)"
  ) +
  scale_y_continuous(
    limits = c(35, NA), 
    breaks = seq(30, 85, by = 5)
  ) +
  scale_color_brewer(
    palette = "Dark2"
  ) +
  scale_size(
    range = c(1, 9),
    breaks = 1:4*250000000
  )

g +
  scale_x_log10(
    labels = scales::label_comma(),
    name = "GDP per capita (log scale)"
  ) +
  scale_y_continuous(
    limits = c(35, NA), 
    breaks = seq(30, 85, by = 5)
  ) +
  scale_color_brewer(
    palette = "Dark2"
  ) +
  scale_size(
    range = c(1, 9),
    breaks = 1:4*250000000, 
    labels = scales::label_comma(
      scale = 1 / 10^6,
      suffix = "M"
    )
  )


##------------------------------------------------------------------------------
## GGPLOT COMPONENTS: COORDINATE SYSTEMS
##------------------------------------------------------------------------------

ggplot(
    data = gm2007,
    aes(x = continent, y = lifeExp)
  ) +
  geom_boxplot() +
  coord_cartesian()

ggplot(
    data = gm2007,
    aes(x = continent, y = lifeExp)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(60, NA)
  )

ggplot(
    data = gm2007,
    aes(x = continent, y = lifeExp)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(60, NA)
  )

ggplot(
    data = gm2007,
    aes(x = continent, y = lifeExp)
  ) +
  geom_boxplot() +
  scale_y_continuous(
    limits = c(60, NA)
  )

ggplot(
    data = gm2007,
    aes(x = continent, y = lifeExp)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(60, NA),
    clip = "off"
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point() +
  coord_cartesian(
    expand = FALSE,
    clip = "off"
  )

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point() +
  coord_fixed()

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point() +
  coord_fixed(ratio = 2000)

ggplot(
    data = gm2007,
    aes(x = continent)
  ) +
  geom_bar() +
  coord_cartesian()

ggplot(
    data = gm2007,
    aes(x = continent)
  ) +
  geom_bar() +
  coord_flip()

ggplot(
    data = gm2007,
    aes(y = continent)
  ) +
  geom_bar() +
  coord_cartesian()

ggplot(
    data = gm2007,
    aes(x = continent)
  ) +
  geom_bar() +
  coord_flip()

library(forcats)

ggplot(
    data = gm2007,
    aes(y = fct_infreq(continent))
  ) +
  geom_bar()

ggplot(
    data = gm2007,
    aes(y = fct_rev(
      fct_infreq(continent)
    ))
  ) +
  geom_bar()

ggplot(
    data = gm2007,
    aes(y = continent)
  ) +
  geom_bar() +
  coord_polar()

ggplot(
    data = gm2007,
    aes(y = continent)
  ) +
  geom_bar() +
  coord_polar(theta = "y")

ggplot(
    data = gm2007,
    aes(y = 1,
        fill = fct_infreq(continent))
  ) +
  geom_bar(position = "stack") +
  coord_polar(direction = -1)

ggplot(
    data = gm2007,
    aes(y = 1,
        fill = fct_infreq(continent))
  ) +
  geom_bar(position = "stack") +
  coord_cartesian()

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point() +
  coord_trans(x = "log10")

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point() +
  geom_smooth() +
  coord_trans(x = "log10")

ggplot(
    data = gm2007,
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point() +
  geom_smooth() +
  scale_x_log10()

##------------------------------------------------------------------------------
## THAT'S IT FOLKS...
##------------------------------------------------------------------------------

## You want more? Join the follow-up course! 
## "Advanced Data Visualization with {ggplot2}"
## oreilly.com/live-events/hands-on-guide-to-advanced-data-visualization-with-ggplot2-custom-design/0636920092434
