# 날짜 : 2021/09/28
# 이름 : 강병화
# 내용 : 데이터 입출력 - 데이터 저장하기 교재 p101




iris
write.csv(iris, '../file/iris_dataset.csv',quote=F)
iris_dataset <- read.csv('../file/iris_dataset.csv')
iris_dataset



Titanic
write.csv(Titanic, '../file/titanic_dataset.csv')
