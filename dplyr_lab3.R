mpg <- as.data.frame(ggplot2::mpg)
mpg2 = mpg

# 문제 7-1
mpg2 %>% mutate(합산연비 = cty+hwy) -> mpg2
# 문제 7-2
mpg2 %>% mutate(평균연비= 합산연비/2) ->mpg2
# 문제 7-3
mpg2 %>% arrange(desc(평균연비)) %>% head(3)
# 문제 7-4
mpg %>% mutate(합산연비 = cty+hwy) %>% mutate(평균연비 = 합산연비/2) %>% arrange(desc(평균연비)) %>% head(3)

# 문제 8-1
mpg %>% group_by(class) %>% summarise(mean(cty))
# 문제 8-2
mpg %>% group_by(class) %>% summarise(평균연비 = mean(cty)) %>% arrange(desc(평균연비))
# 문제 8-3
mpg %>% group_by(manufacturer) %>% summarise(고속도로평균 = mean(hwy)) %>% arrange(desc(고속도로평균)) %>% head(3)
# 문제 8-4
mpg %>% group_by(manufacturer) %>% filter(class=="compact") %>% summarise(개수=n()) %>% arrange(desc(개수))

# 문제 9-1
mpg = as.data.frame(ggplot2::mpg)
fuel = data.frame(fl = c("c", "d", "e", "p", "r"), price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22), stringsAsFactors = F)
mpg = left_join(mpg,fuel, by="fl")
# 문제 9-2
mpg %>% select(model,fl,price_fl) %>% head(5)


# 문제 10-1
midwest = as.data.frame(ggplot2::midwest)
midwest %>% mutate(미성년인구백분율 = popadults/poptotal*100) -> midwest
# 문제 10-2
midwest %>% arrange(desc(미성년인구백분율)) %>% head(5)
# 문제 10-3
분류 = data.frame(미성년비율등급 = ifelse(midwest$미성년인구백분율>=40,"large",
                                 ifelse(midwest$미성년인구백분율>=30,"middle","small")))
midwest = left_join(midwest,분류, by="미성년인구백분율")
# 문제 10-4
