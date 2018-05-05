library(readtext)
library(dplyr)
library(tidytext)
library(ggplot2)
library(tidyr)
library(wordcloud)
library(reshape2)

##date: 4/28
browns <- readtext("browns drafts picks.txt")
browns.1 <- as.data.frame(browns) %>% unnest_tokens(word, text)
data(stop_words)
browns.2 <- browns.1 %>% anti_join(stop_words)
browns.3 <- browns.2 %>% count(word, sort = TRUE)
browns.4 <- as_tibble(browns.3)

browns.4 %>%
  filter(n>=3) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

browns.sentiment <- browns.4 %>%
  inner_join(get_sentiments("bing")) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)
ggplot(browns.sentiment, aes(word, sentiment, fill = word)) +
  geom_col(show.legend = FALSE)+
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

browns.sentiment2 <- browns.4 %>%
  inner_join(get_sentiments("nrc")) %>%
  spread(sentiment, n, fill = 0)
ggplot(browns.sentiment2, aes(word, positive, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
ggplot(browns.sentiment2, aes(word, anticipation, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
ggplot(browns.sentiment2, aes(word, trust, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

browns.sentiment3 <- browns.4 %>%
  inner_join(get_sentiments("afinn"))
ggplot(browns.sentiment3, aes(word, score, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
