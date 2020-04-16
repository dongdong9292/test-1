url = "https://media.daum.net/ranking/popular/"
text = read_html(url)


newstitle_imsi = html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 div.cont_thumb > strong > a")
newstitle = html_text(newstitle_imsi, trim = T)


newspapername_imsi = html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 div.cont_thumb > strong > span")
newspapername = html_text(newspapername_imsi, trim = T)

news = data.frame(뉴스제목=newstitle,신문사=newspapername)

write.csv(news, "daumnews.csv")