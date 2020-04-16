url = "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text = read_html(url)

# <h1> 태그의 컨텐츠
nodes1 = html_nodes(text,"h1")
h1 = html_text(nodes1)
h1

# 텍스트 형식으로 내용을 가지고 있는 <a> 태그의 컨텐츠와 href 속성값
nodes2 = html_nodes(text, "a")
html_text(nodes2)
html_attr(nodes2, "href")

# <img> 태그의 src 속성값
node3 = html_nodes(text, "img")
html_attr(node3, "src")

# 첫 번째 <h2> 태그의 컨텐츠
node4 = html_nodes(text, "h2:nth-of-type(1)")
html_text(node4)

#<ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
node5 = html_nodes(text, "ul > *[style$=green]")
html_text(node5)

# 두 번째 <h2> 태그의 컨텐츠
node6 = html_nodes(text, "h2:nth-of-type(2)")
html_text(node6)

# <ul> 태그의 모든 자식 태그들의 컨텐츠 
node7 = html_nodes(text, "ol > *")
html_text(node7)

# <table> 태그의 모든 자손 태그들의 컨텐츠 
node8 = html_nodes(text, "table > *")
html_text(node8)

# name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
node9 = html_nodes(text, ".name")
html_text(node9)

# target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
node10 = html_nodes(text, "#target")
html_text(node10)
