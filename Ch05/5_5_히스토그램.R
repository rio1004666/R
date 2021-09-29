# 날짜 : 2021/09/28
# 이름 : 강병화
# 내용 : 데이터 시각화  - 히스토그램 p150
# 연속형 데이터이므로

cars
dist <- cars[,2]
dist

barplot(dist)
hist(dist)


#iris 히스토그램
iris
hist(iris$Sepal.Width,
     xlim=c(2.0,4.5),
     xlab='꽃받침 너비',
     main='꽃받침 너비 분포도')
