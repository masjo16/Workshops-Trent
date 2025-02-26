# Install required packages if not already installed
install.packages("ggplot2")
library(ggplot2)

# Basic scatter plot
ggplot(data = OrchardSprays,                  # 1: The data
       aes(x = treatment, y = decrease)) +    # 2: Aesthetics
  geom_point()                                # 3: Geometry

#Adding a colour of our choice to the points
ggplot(data = OrchardSprays,                  # 1: Data
       aes(x = treatment, y = decrease)) +    # 2: Aesthetics
  geom_point(color = 'forestgreen')           # 3: Geometry (Changing the color)

#Changing colour based on another variable in the dataset
ggplot(data = OrchardSprays,                                          # 1: Data
       aes(x = treatment, y = decrease, color = factor(rowpos))) +    # 2: Aesthetics
  geom_point()                                                        # 3: Geometry

#Instead of colour, we can change size too
ggplot(data = OrchardSprays,                                                        # 1: Data
       aes(x = treatment, y = decrease, color = factor(rowpos), size= colpos)) +    # 2: Aesthetics
  geom_point()                                                                      # 3: Geomtry


#We can change the shape, size, and transparency of the points 
ggplot(data = OrchardSprays,
       aes(x = treatment, y = decrease)) +
  geom_point(                              #Note we are changing geom_point, not aes!
    color = "grey",                        # Point color
    size = 3,                              # Point size
    alpha = 0.6,                           # Transparency
    shape = 'triangle'                     # Point shape (triangle)
  )

#If your points are too close together, you can use jitter to space them apart
ggplot(data = OrchardSprays,
       aes(x = treatment, y = decrease)) +
  geom_point(                  # Note we are changing geom_point, not aes!
    color = "grey",            # Point color
    size = 3,                  # Point size
    alpha = 0.6,               # Transparency
    shape = 'triangle',        # Point shape (triangle)
    position = 'jitter'        # Spread the points out over x
  )

#best to label your axes with 'real' terms
ggplot(OrchardSprays, aes(x = treatment, y = decrease)) +
  geom_point(position = 'jitter') +     # The jitter term
  labs(title = "Orchard Spraying",
       x = "Treatment Group",
       y = "Decrease in Pest Number")


#####################################################################
#Modify the code below to make the points larger blue squares
#See `?geom_point` for more information on the point layer.
#####################################################################
ggplot(data = PlantGrowth,
       aes(x = group, y = weight)) +
  geom_point()
#####################################################################
#
#
#####################################################################

#utilizing facets for multiple plots:
ggplot(data = airquality,            # 1: Data
       aes(x = Day, y = Ozone)) +    # 2: Aesthetics
  geom_point() +                     # 3: Geometry
  facet_wrap(~Month)                 # 4: Facets (Plot by month)

#and using themes to make a blank background
ggplot(data = airquality,              # 1: Data
       aes(x = Day, y = Ozone)) +      # 2: Aesthetics
  geom_point() +                       # 3: Geometry
  facet_wrap(~Month) +                 # 4: Facets
  theme_minimal()                      # 5: Theme


#Boxplots are often used in research to show population effects
ggplot(data = PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot()            #The boxplot geometry

#Many research figures will combine boxplots with scatter plots
ggplot(data = PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot() +          #The boxplot geometry
  geom_point()              #The point geometry

#Similarly, you can make violin plots
ggplot(data = PlantGrowth, aes(x = group, y = weight)) +
  geom_violin() +                  #The violin plot geometry
  geom_point(position = 'jitter')  #The jitter term

#Less common are bar charts, but they can still be useful with categorical data
ggplot(data = BOD, aes(x= Time, y=demand)) + 
  geom_col()         #The bar chart geometry

#Dnd you can flip any chart with coord_flip
ggplot(data = BOD, aes(x = Time, y = demand)) + 
  geom_col() +       #The bar chart geometry
  coord_flip()       #Flipping the chart (x & y)

##############################################################################
# 'fitting' the data #
##############################################################################
#just to see what it looks like, we can fit a linear relationship
#please determine if this is appropriate for your data first
ggplot(data = faithful,                                 #Data
       aes(x = waiting, y = eruptions)) +               #Aesthetics
  geom_point(shape = 15, size = 5, alpha = 0.6) +       #Point geometry
  geom_smooth(method = "lm")                            #Linear model line

#You can graph multiple geometries at once:
ggplot(data = faithful,                                 #Data
       aes(x = waiting, y = eruptions)) +               #Aesthetics
  geom_point() +                                        #Point geometry
  geom_smooth()                                         #Default smooth line
#note that the default is automatically determined;
#you should probably run a particular function instead


##############################################################################
# maps! #
#############################################################################
#and yes, we can make maps in ggplot2!
#but most would use the sf package instead.

#we need some spatial data
install.packages('maps')
library(maps)

#and we have to format these data for our use
world_map <- map_data("world")

ggplot(world_map, aes(x = long, y = lat, group = group)) + geom_polygon(fill = 'lightgray', colour = 'white')
