
##loading library
library(tidyverse)
##testing proportions
age_response <- c("18 to 24 years", "25 to 34 years", "35 to 44 years", "45 to 54 years", "55 to 64 years", "65 to 74 years", "75 years and older")
sample(x = age_response, size= 1000, replace = TRUE, prob = c(0.14,0.15,0.16,0.16,0.17,0.13,0.09))

gender_response <- c("Male", "Female","Other")
sample(x = gender_response, size= 1000, replace = TRUE, prob = c(0.45,0.54,0.01))

satisfy_response <- c("Strongly Approve", "Somewhat Approve","Neutral","Somewhat Disapprove", "Strongly Disapprove")
sample(x = satisfy_response, size= 1000, replace = TRUE, prob = c(0.36,0.2,0.1,0.24,0.1))

election_response <- c("The Liberal Party", "The Conservative Party", "The New Democratic Party", "The Bloc Québécois", "The Green Party", "Other")
sample(x = election_response, size= 1000, replace = TRUE, prob = c(0.41,0.317,0.195,0.058,0.0,0.02))

##full dataframe
set.seed(852)
stimed_data<-
  tibble(ages =sample(x = age_response, size= 1000, replace = TRUE, 
      prob = c(0.14,0.15,0.16,0.16,0.17,0.13,0.09)), genders = sample(x = gender_response,
      size= 1000, replace = TRUE, prob = c(0.45,0.54,0.01)), satisfys = sample(x = satisfy_response,
      size= 1000, replace = TRUE, prob = c(0.36,0.2,0.1,0.24,0.1)),elections = 
      sample(x = election_response, size= 1000, replace = TRUE, 
      prob = c(0.41,0.317,0.195,0.058,0.0,0.02)))

##age plot
stimed_data %>%
  ggplot(aes(x = ages))+
  geom_bar(fill = "blue")+
  ggtitle("Figure 1")+
  coord_flip()


##gender plot
stimed_data %>%
  ggplot(aes(x = genders))+
  geom_bar(fill = "orange")+
  ggtitle("Figure 2")+
  geom_text(aes(label=stat(prop)*100,group=1),stat='count',nudge_y=0.15)+
  coord_flip()

##piechart
pie(table(stimed_data$satisfys),main= "Figure 3")


##elections question graph
stimed_data %>%
  ggplot(aes(x = elections))+
  geom_bar(fill = "green")+
  ggtitle("Figure 4")+
  geom_text(aes(label=stat(prop)*100,group=1),stat='count',nudge_y=0.15)+
  coord_flip()