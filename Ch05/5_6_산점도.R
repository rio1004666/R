# 날짜 : 2021/09/28
# 이름 : 강병화
# 내용 : 데이터 시각화  - 산점도 p154


mtcars
View(mtcars)

wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt,mpg)
plot(wt,mpg,col= 'red',pch = 5) # pch는 점의 모양 col 는 색상
iris

df_iris <- iris[,3:4]
df_iris
View(iris[,3:4])
group <- as.numeric(iris$Species) # 종(종류)를  숫자로 변환 
group
color <- c('red','green', 'blue') # 색상을 분류하기 위한 벡터 
plot(df_iris,pch=16,col=color[group]) # 숫자를 인덱스로 색상을 구해서 구분하는 산점도 




