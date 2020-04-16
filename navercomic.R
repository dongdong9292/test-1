url = "https://comic.naver.com/genre/bestChallenge.nhn"
text = read_html(url)

comicName = html_nodes(text,".challengeTitle")
comicName = html_text(comicName, trim = T)
comicSummary = html_nodes(text,".summary")
comicSummary = html_text(comicSummary, trim = T)
comicGrade = html_nodes(text,".rating_type>strong")
comicGrade = html_text(comicGrade, trim = T)
news = data.frame(comicName=comicName,comicSummary=comicSummary,comicGrade=comicGrade)
write.csv(news, "navercomic.csv")