# 날짜 : 2021/09/29
# 이름 : 강병화
# 내용 : EDA와 Data정제 - 결측치 실습하기 교재 p200

df_exam <- read.csv('../file/exam_na.csv')
View(df_exam)

# NA값은 보통 평균으로 대체한다 
# 결측치 존재 여부 

is.na(df_exam) # TRUE가 결측치라는 표현이다 FLASE는 결측치가 아닌 정상 데이터이다 

# 결측치를 갖는 행 제거 => 빅데이터라는 특징을 감안하면 티끌이므로 하나의 데이터는 제거할 수도 있다 

df_exam_new <- df_exam %>% filter(!is.na(math) & !is.na(english) & !is.na(science))
View(df_exam_new)

# 기초 통계분석 
df_exam_new %>% mutate(total=math+english+science,mean=total/3) %>% 
            arrange(desc(total))
# 교제 p201 실습- summary() 함수를 이용해서 결측치 확인하기
dataset <- read.csv('../file/exam_na.csv')
View(dataset)
summary(dataset$math) # 통계를 냇을 경우 NA'S가 1개임을 확인할 수 있음 
sum(dataset$math) # 결측치가 있는 경우 NA로 출력되는것을 확인 할 수 있음 
# 교재 p201 실습 - sum()함수의 속성을 이용하여 결측치 제거하기 

sum(dataset$math,na.rm=T) # na.rm = T속성을 적용하여 결측치 제거 

# 교재 p201 실습 - 결측치 제거 함수를 이용하여 결측치 제거 
math2 <- na.omit(dataset$math)  #math열에 있는 모든 NA제거 
math2
sum(math2) # 결측치를 제거하고 합계를 구한다 

# 교재 p202 실습 - 결측치를 0으로 대체하기 

X <- dataset$math # math열을 대상으로 벡터 생성

x[1:20] # math 열의 벡터 확인
dataset$math2 <- ifelse(!is.na(x),x,0)
dataset

# 교재 p202 실습 - 결측치를 평균값으로 대체 

dataset$math3 <- ifelse(!is.na(x), X, round(mean(x,na.rm=TRUE),2)) 
dataset$math3[1:20]
dataset

# 결측치 결측치를 0으로 대체 결측치를 평균값으로 대체한 3개 칼럼 확인 
dataset[c('math','math2','math3')]


# 교재 p203 실습 - 범주형 변수의 극단치 처리하기 
View(dataset)
table(dataset$english) # 범주형 변수 english대상으로 극단치를 확인하는 방법 
pie(table(dataset$english)) # 원형 차트로 표현현

# 교재 p203 실습 - subset() 함수를 사용하여 데이터 정제하기 
dataset <- subset(dataset,gender == 1 | gender == 2) # 다른 데이터셋으로 하므로 알고만 넘어간다 
length(dataset$math)
pie(table(dataset$english))

# 교재 p204 실습 - 연속형 변수의 극단치 보기 

dataset <- read.csv('../file/exam_outlier.csv')
View(dataset)
dataset$english
length(datset$english)
plot(dataset$english)
summary(dataset$english)

# 교재 p205 실습 - english 변수의 데이터 정제와 시각화 

dataset2 <-subset(dataset, english <= 100 & english >=0)
dataset2
length(dataset2$english)
stem(dataset2$english) # 줄기와 잎 도표 보기 

# 여기서 줄기는 점수 앞자리 잎은 점수 뒷자리들이 줄을 서있다 

# 교재 p205 실습 - science 변수의 데이터 정제와 시각화 

# 단계 1: science변수에서 NA발견 
summary(dataset2$science)
length(dataset2$science)
# 단계 2: science 변수 정제 
dataset2 <- subset(dataset2,science >= 0 & science <= 100)
length(dataset2)
boxplot(dataset2$science)


# p206 실습 - boxzplot와 통계를 이용한 극단치 처리하기 

# 단계 1 : boxplot로 science 극단치 시각화 
boxplot(dataset$science)

# 단계 2: 극단치 통계 확인 

boxplot(dataset$science)$stats

# 단계 3: 극단치 제거한 서브 셋 만들기 

dataset_sub <- subset(dataset, science <= 100 & science >=0)
summary(dataset_sub$science)

