# 날짜 : 2021/09/28
# 이름 : 강병화
# 내용 : 데이터 시각화  - 박스상자(박스플롯)교재 p148

# 연속된 데이터 파악 
# 이상치 최대 3분위 중위수 1분위 최소 파악 

cars
View(cars)

dist <- cars[,2] # 행과 열 모든 행에 대해서 2번째 컬럼들만 추출한다 
dist
class(dist)
boxplot(dist,main="자동차 제동 거리")
boxplot.stats(dist)

iris # 벛꽃 데이터 셋 
View(iris)
boxplot(data=iris,
      Sepal.Length ~ Species)
