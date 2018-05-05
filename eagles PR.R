library(readtext)
library(dplyr)
library(tidytext)
library(ggplot2)
library(tidyr)
library(wordcloud)
library(reshape2)

##date: 4/30
eagles <- readtext("eagles draft picks.txt")
eagles.1 <- as.data.frame(eagles) %>% unnest_tokens(word, text)
data(stop_words)
eagles.2 <- eagles.1 %>% anti_join(stop_words)
eagles.3 <- eagles.2 %>% count(word, sort = TRUE)
eagles.4 <- as_tibble(eagles.3)

eagles.4 %>%
  filter(n>=3) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

eagles.sentiment <- eagles.4 %>%
  inner_join(get_sentiments("bing")) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)
ggplot(eagles.sentiment, aes(word, sentiment, fill = word)) +
  geom_col(show.legend = FALSE)+
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

eagles.sentiment2 <- eagles.4 %>%
  inner_join(get_sentiments("nrc")) %>%
  spread(sentiment, n, fill = 0)
ggplot(eagles.sentiment2, aes(word, positive, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
ggplot(eagles.sentiment2, aes(word, anticipation, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
ggplot(eagles.sentiment2, aes(word, trust, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

eagles.sentiment3 <- eagles.4 %>%
  inner_join(get_sentiments("afinn"))
ggplot(eagles.sentiment3, aes(word, score, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
