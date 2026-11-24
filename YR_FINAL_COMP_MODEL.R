# Load library items
library(ggplot2)
library(gganimate)

# 1. Create the data table 
my_data <- data.frame(
  trial = c(1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6),
  reaction_time = c(500, 480, 475, 490, 480, 470, 500, 600, 680, 720, 810, 890),
  group = c("Healthy", "Healthy", "Healthy", "Healthy", "Healthy", "Healthy",
            "Depressed", "Depressed", "Depressed", "Depressed", "Depressed", "Depressed")
)

# 2. Make the actual plot (Dark Green for Healthy, Dark Blue for Depressed)
p <- ggplot(my_data, aes(x = trial, y = reaction_time, color = group)) +
  geom_line() +
  geom_point() +
  scale_color_manual(values = c("Healthy" = "darkgreen", "Depressed" = "darkblue")) +
  labs(
    title = "Trial {as.integer(frame_along)}: Reaction Time (ms)", # Shows whole numbers (1, 2, 3...)
    x = "Trial Number",
    y = "Reaction Time (ms)"
  )

# 3. Display animation 
anim <- p + transition_reveal(trial)
anim