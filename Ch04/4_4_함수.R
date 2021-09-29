# 날짜 : 2021/09/28
# 이름 : 강병화
# 내용 : 제어문과 함수 - 함수 교재 p118

f1 <- function(){
  cat("매개변수가 없는 함수")
}
f1()
f3 <- function(x,y){
  add <- x + y
  return(add)
}
add <- f3(10,20)
add
# 기본함수를 사용하여 요약통계량과 빈도수 구하기 
# 단계 1: 파일 불러오기 
test <- read.csv("../file/exam.csv")
head(test)
# 단계 2: 요약통계량 구하기
summary(test)
# 단계 3: 특정 변수의 빈도수 구하기

table(test$math)
table(test$english)
table(test$science)

# 단계 4: 각 칼럼 단위의 빈도수와 최댓값, 최솟값 계산을 위한 사용자 함수 정의 
data_pro <- function(x){
  for(idx in 3:length(x)){
    cat(idx, "번째 칼럼의 빈도 분석 결과 ")
    print(table(x[idx]))
    cat("\n")
  }
  for(idx in 3:length(x)){
    f <- x[idx] # 점수자체 최댓값 최솟값
    # f <- table(x[idx]) # 빈도수 최댓값 최솟값 구할때 
    cat(idx, "번째 칼럼의 최댓값/최솟값\n")
    cat("max=",max(f),"min=",min(f),"\n") 
  }
  
}
data_pro(test)

# 분산과 표준편차를 구하는 사용자 함수 정의 

x <- c(7,5,12,9,15,6)
var_sd <- function(x){
  var <- sum(x - mean(x)/ 2) / (length(x)-1)
  sd <- sqrt(var)
  cat("표본분산:",var,"\n")
  cat("표본표준편차:",sd)
}
var_sd(x)
# 피타고라스와 구구단 함수 저의 
pytha <- function(s,t){
  a <- s ^ 2 - t ^2
  b <- 2 * s * t
  c <- s ^ 2 + t ^ 2
  cat("피타고라스 정리: 3개의 변수 : ", a, b, c)
}

pytha(2,1)

# 구구단 출력 함수 만들기 
gugu <- function(i,j){
  for(x in i){
    cat("**",x,"단 **\n")
    for(y in j){
      cat(x,"*",y,"=",x*y,"\n")
    }
    cat("\n")
  }
 
}
i <- c(2:9)
j <- c(1:9)

gugu(i,j)

# 결측치 포함 자료의 평균 계산 함수 정의 

data <- c(10,20,5,4,40,7,NA,6,3,NA,2,NA)
na <- function(x){
  # 1차: NA제거 
  print(x)
  print(mean(x,na.rm = T))
  # 2차 : NA를 0으로 대체 
  data = ifelse(!is.na(x),x,0) # ifelse문 사용 
  print(data)
  print(mean(data))
  # 3차: NA를 평균으로 대체 
  data2 = ifelse(!is.na(x),x,round(mean(x,na.rm = TRUE),2))
  print(data2)
  print(mean(data2))
}
na(data)


# 몬테카를로 시뮬레이션 함수 정의 
# 단계 1 동전 앞면과 뒷면의 난수 확률분포 함수 정의
coin <- function(n){
  r <- runif(n,min=0,max=1)
  result <- numeric()
  for(i in 1:n){
    if(r[i] <= 0.5)
      result[i] <- 0
    else
      result[i] <- 1
  }
  return(result)
}
# 단계 2 동전 던지기 횟수가 10회인 경우 앞면과 뒷면 나오는 vector값
coin(10)
# 단계 3: 몬테카를로 시뮬레이션 함수 정의 
 montaCoin <-function(n){
   cnt <- 0
   for(i in 1:n){
     cnt <- cnt + coin(1)
   }
   result <- cnt / n
   return(result)
}
# 단계 4: 몬테카를로 시뮬레이션 함수 호출 
 
montaCoin(10)
montaCoin(30)
montaCoin(100)
montaCoin(1000)
montaCoin(10000)


# 행 / 컬럼 단위의 합계와 평균 구하기 

# 1단계 : 데이터 셋 불러오기 

install.packages("RSADBE")
library(RSADBE)
data("Bug_Metrics_Software")
Bug_Metrics_Software[,,1]

# 2단계 : 행 단위 합계와 평균구하기
rowSums(Bug_Metrics_Software[,,1]) # 소프트웨어 별 버그 수 합계
rowMeans(Bug_Metrics_Software[,,1])   # 소프트웨어 별 버스 수 평균 
colSums(Bug_Metrics_Software[,,1])  # 버그 종류별 버스 수 합계 
colMeans(Bug_Metrics_Software[,,1]) # 버그 종류별 버스 수 평균 
Bug_Metrics_Software


# 기술통계량 관련 내장함수 사용하기 
seq(-2,2,by=.2) #-2~2 범위에서 0.2씩 증가
vec <- 1:10
vec
min(vec)
max(vec)
range(vec)
mean(vec)
median(vec)
sum(vec)
rnorm(10) # 난수 생성 
sd(rnorm(10)) # 정규분포 자료 10개 무작위 추출 표준편차 구하기 
table(vec) #  벡터 자료 대상으로 빈도수 구하기 

# 난수 생성 
n <-50
rnorm(n,mean=0,sd=1) # 표준 정규분포를 갖는 난수 생성하기 
# 평균 0 표준편차 1로 고정한 표준정규분포 
result <- rnorm(n,mean=0,sd=1)
hist(result, main="Histogram of rnorm(n,mean=0,sd=1)")

# 균등분포(연속형)의 난수 생성은 runif()함수를 이용한다 
n <- 100
runif(n,min=0,max=10)
hist(runif(n,min=0,max=10))
# 이항분포(이산형) 난수 생성하기 
n <- 20 # 독립시행횟수 
        # 0또는 1의 이산변량 대상 0.5확률로 n개 선정 
rbinom(n,1,prob=1/2)
rbinom(n,2,0.5) # 0,1,2 의 이산변량 대상 0.5확률로 n개 선정 
n <- 100 # 독립시행 

rbinom(n,5,prob=1/6) # 0~5사이의 이산변량 대상 1/6 확률로 n개 선정 

# 종자값으로 난수 발생 
rnorm(5,mean=0,sd=1)  #매번 실행하는 경우 임의의 난수 생성 (종잣값 설정안하고 그냥 난수 생성)
set.seed(123) # 종자값을 123으로 설정
rnorm(5,mean=0,sd=1)
set.seed(123) # 위의 난수와 같은 값 나온다 
rnorm(5,mean=0,sd=1)
set.seed(345) # 위의 난수와 다른 종자값이므로 난수도 다르게 나옴 
rnorm(5,mean=0,sd=1)

# 수학 관련 내장함수 사용하기

vec <- 1:10
prod(vec) # 벡터의 곱(1*2*3*...*10)
factorial(5) # 계성 (1*2*3*4*5) = 120
abs(-4) # 절댓값(5)
sqrt(16) # 제곱근 
vec
cumsum(vec) # 벡터값에 대한 누적합
log(10)    # 10의 자연 로그 
log10(10)   # 10의 일반 로그 



# 행렬 연산 내장함수 사용 

# 행렬 연산을 위한 x,y 행렬 생성 
x <- matrix(1:9, nrow=3,ncol=3, byrow=T) # 3 x 3 정방행렬
y <- matrix(1:3,nrow=3) # 3 x 1 행렬 
ncol(x) # 열수 반환 
nrow(x) # 행수 반환 
t(x) # x의 전치 행렬 반환 
cbind(x, 1:3) # x에 열 추가 
rbind(x, 10:12) # x에 행 추가 
diag(x) # 정방행렬 x에서 대각선 값 반환 
det(x) 
apply(x,1,sum) # x의 행 단위 합계
apply(x,2,mean) # x의 열 단위 평균 
svd(x) # 정방행렬 x에서 d,u,v 행렬로 특이값 분해 
eigen(x) #정방행렬 x에서 고유값 분해 
x %*% y # x,y의 행과 열을 곱하고 더하는 행렬 곱 반환 

# 집합 연산 관련 내장함수 사용하기 
# 집합 연산을 위한 벡터 설정 
x <- c(1,3,5,7,9)
y <- c(3,7)
union(x,y) # x,y벡터에 관한 합집합
setequal(x,y) # 교집합합
interact(x,y)# x,y벡터에 관한 차집합 
setdiff(y,x) #y,x벡터에 관한 차집합
5%in%y #5가 y의 원소인지 검사
