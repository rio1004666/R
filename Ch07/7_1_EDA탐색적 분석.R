# 날짜 : 2021/09/29
# 이름 : 강병화
# 내용 : EDA탐색적 분석

df_exam <- read.csv('../file/exam.csv')

View(df_exam)

#head(),tail()
head(df_exam)
tail(df_exam)

#dim()
dim(df_exam)
#str() # 문자열이아닌 속성을 알아내는 내장메서드 
str(df_exam)
#summary()
summary(df_exam)
#sum()
sum(df_exam$math)
mean(df_exam$math)


# 데이터 셋 보기  

dataset <-  read.csv('../file/exam_na.csv')
View(dataset)
dataset
print(dataset) # 콘솔창으로 전체 데이터 출력 

# 데이터 셋 구조 보기 

names(dataset)
attributes(dataset)
str(dataset)

# 데이터 셋 조회 

# 단계 1: 데이터 셋에서 특정 변수 조회하기 

dataset$math
dataset$english
dataset$science

# 단계 2: 특정변수의 조회 결과를 변수에 저장하기 

x <- dataset$math
y <- dataset$english
z <- dataset$science
x
y
z

# 단계 3: 산점도 그래프로 변수 조회 
View(dataset)
plot(dataset$math)

# 단계 4: 칼럼명을 사용하여 특정 변수 조회 

dataset['math']
dataset['english']
dataset['science']

# 단계 5: 색인을 사용하여 특정변수 조회 
dataset[2] # class필드명의 레코드값들이 출력 
dataset[3] # math필드명의 레코드값들이 출력
dataset[4] # english필드명의 레코드값들이 출력 
dataset[3,] # 3행(index=3) 1개의 전체 열들의 레코드값들이 출력 
dataset[,3] # 3열(math) 1개의 전체 행들의 레코드값들이 출력 

# 단계 6: 2개 이상의 칼럼 조회 
dataset[c('math','english')] # 2개 이상인 경우 벡터사용 
dataset[c(1,2)] # 2개의 인덱스로 컬럼을 접근해서 사용 
dataset[c(1,2,3)] # 3개의 인덱스로 컴럼을 접근해서 사용 
dataset[c(1,2:3,4:5)] 

# 단계 7: 특정 행/열을 조회 
dataset[,c(2:4)]
dataset[c(2:4),]
dataset[-c(1:10),] # 1~10 행을 제외한 나머지 행의 모든 열 조회 





