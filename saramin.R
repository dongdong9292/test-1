url="http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=Java"
text = read_html(url)

text_value = html_nodes(text,xpath="//*[@id='async_sfilter']/div/div[2]/div[2]/ul/li")
text_value = html_text(text_value, trim=T)
text_value = gsub("[[:space:][:punct:]]","",text_value)
text_value = gsub("삭제", "", text_value)
text_value = text_value[-31]
text_name = gsub("[0-9]", "", text_value)
text_num = gsub("\\D","", text_value)

info = data.frame(tech_name=text_name,info_count=text_num)

write.csv(info, "sramin.csv")