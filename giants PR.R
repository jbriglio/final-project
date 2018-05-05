library(readtext)
library(dplyr)
library(tidytext)
library(ggplot2)
library(tidyr)
library(wordcloud)
library(reshape2)

##date: 4/28
giants <- readtext("giants drafts picks.txt")
giants.1 <- as.data.frame(giants) %>% unnest_tokens(word, text)
data(stop_words)
giants.2 <- giants.1 %>% anti_join(stop_words)
giants.3 <- giants.2 %>% count(word, sort = TRUE)
giants.4 <- as_tibble(giants.3)

giants.4 %>%
  filter(n>=3) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

giants.sentiment <- giants.4 %>%
  inner_join(get_sentiments("bing")) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)
ggplot(giants.sentiment, aes(word, sentiment, fill = word)) +
  geom_col(show.legend = FALSE)+
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

giants.sentiment2 <- giants.4 %>%
  inner_join(get_sentiments("nrc")) %>%
  spread(sentiment, n, fill = 0)
ggplot(giants.sentiment2, aes(word, positive, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
ggplot(giants.sentiment2, aes(word, anticipation, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
ggplot(giants.sentiment2, aes(word, trust, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

giants.sentiment3 <- giants.4 %>%
  inner_join(get_sentiments("afinn"))
ggplot(giants.sentiment3, aes(word, score, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())