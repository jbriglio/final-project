library(readtext)
library(dplyr)
library(tidytext)
library(ggplot2)
library(tidyr)
library(wordcloud)
library(reshape2)

##date: 4/27
patriots <- readtext("patriots drafts picks.txt")
patriots.1 <- as.data.frame(patriots) %>% unnest_tokens(word, text)
data(stop_words)
patriots.2 <- patriots.1 %>% anti_join(stop_words)
patriots.3 <- patriots.2 %>% count(word, sort = TRUE)
patriots.4 <- as_tibble(patriots.3)

patriots.4 %>%
  filter(n>=3, n<=5) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

patriots.sentiment <- patriots.4 %>%
  inner_join(get_sentiments("bing")) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)
ggplot(patriots.sentiment, aes(word, sentiment, fill = word)) +
  geom_col(show.legend = FALSE)+
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

patriots.sentiment2 <- patriots.4 %>%
  inner_join(get_sentiments("nrc")) %>%
  spread(sentiment, n, fill = 0)
ggplot(patriots.sentiment2, aes(word, positive, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
ggplot(patriots.sentiment2, aes(word, anticipation, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
ggplot(patriots.sentiment2, aes(word, trust, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

patriots.sentiment3 <- patriots.4 %>%
  inner_join(get_sentiments("afinn"))
ggplot(patriots.sentiment3, aes(word, score, fill = word)) +
  geom_col(show.legend = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
