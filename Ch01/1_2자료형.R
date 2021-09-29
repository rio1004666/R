# 날짜 : 2021/09/27
# 이름 : 강병화
# 내용 : R설치와 개요 - 자료형 실습하기 교재 p41

#숫자형
num1 <- 1
num2 <- 2
num3 <- 3.14
num1
num2;num3

#논리형
bool1 <- TRUE
bool2 <- FALSE
bool1
bool2

#문자형
str1 <- "Hello!"
str2 <- '안녕'
str1
str2
#특수형
var1 <- NULL  # 초기값을 의미
var2 <- NA    # 결측값, Not Available
var3 <- NaN   # 수학적으로 정의가 불가능한 값, Not a Number
var1
var2
var3



####################################################

#교재 p42 실습 - 스칼라 변수 사용 예

int <- 20 # 숫자값 초기화
int
string <- "홍길동"
string
boolean <- TRUE
boolean
sum(10,20,20)
sum(10,20,20,NA) # NA 결측치 자료형 
sum(10,20,20,NA,na.rm=TRUE) # 결측치 제거 후 합계 여산 
ls() # 현재 사용중인 변수 보기 

#교재 p43 실습 - 자료형 확인
is.character(string) # string 변수의 문자형 여부 확인 
x <- is.numeric(int)
x
is.logical(boolean) # boolean 변수의; 논리형 여부 확인 

is.logical(x) # x 변수의 논리형 여부 확인인

is.na(x) # x 변수의 NA여부 확인 

#교재 p43 실습 - 문자 원소를 숫자 원소로 형 변환하기기

x <- c(1,2,"3") # 3개의 원소를 갖는 벡터 생성 
# c() 함수를 이용하여 벡터를 생성할 경우 원소 중 한 개라도 문자이면 모든 문자로 하여 객체가 형성된다. 
x
result <- x * 3
result <- as.numeric(x) * 3 # 벡터 x 를 숫자형으로 변환 
# result2 <- as.integer(x) * 3
result
#교재 p44 실습 - 복소수 자료 생성과 형 변환 
z <- 5.3 - 3i
Re(z) # 실수: 현실의 수 
Im(z) # 허수 : 상상의 수 
is.complex(x) # 복소수 여부 확인인
as.complex(5.3)

#교재 p44 실습 - 스칼라 변수의 자료형과 자료구조 확인
# mode(변수) : 자료의 성격을 알려준다.
mode(int)
mode(string)
mode(boolean)

# class(변수) : 자료구조의 성격을 알려준다.
class(string)
class(int)
class(boolean)
# 스칼라 변수일 때 mode()와 class() 는 같은 결과값으로 나타난다 
# 배열 리스트 테이블인 경우 class를 사용 


#교재 p45 실습 - 문자벡터와 그래프 생성
gender <- c("man","woman","woman","man","man")
plot(gender) # 차트는 수치 데이터만 가능 


#교재 p45 실습 - as.factor() 함수를 이용하여 요인형 변환

Ngender <- as.factor(gender) # Factor형 변환 
table(Ngender) # 빈도수 구하기 


#교재 p46 실습 - Factor형 변수로 차트 그리기
# 벡터 원소를 요인형으로 변환한 경우 순서가 알파벳 순서로 정렬되는 요인형의 기본 유형이다.
plot(Ngender)
mode(Ngender)
class(Ngender)
is.factor(Ngender)
Ngender # Factor Norminal 변수 내용보기
#################################################
#교재 p47 실습 - factor() 함수를 이용하여 Factor형 변환

# 범주의 순서를 사용자가 지정한 순서대로 정렬하는 기능 
args(factor) # factor() 함수의 매개변수 보기 
Ogender <- factor(gender,levels=c("woman","man"), ordered = T)
Ogender

#교재 p47 실습 - 순서가 없는 요인과 순서가 있는 요인형 변수로 차트 그리기 
par(mfrow = c(1,3)) # par() 함수를 이용하여 두 개의 그래프를 Plots 영역에 나타 낼 수 있다 
# 1행 3열  3개의 차트를 뽑을 수 있다. 
plot(Ngender)
plot(Ngender)
plot(Ogender)

#교재 p47 실습 - as.Date() 함수를 이용한 날짜형 변환 
as.Date("20/02/28","%y/%m/%d")
class(as.Date("20/02/08","%y/%m/%d"))
dates = c("02/28/20","02/30/20","03/01/20")
as.Date(dates,"%m/%d/%y")
# 날짜형 변환 함수 as.Date() 함수를 이용하여 문자열 상수를 날짜형으로 변환할 수 있다. 
# 첫번재 인수는 문자열 상수 , 두번째 인수는 날짜형으로 변환하는 양식을 지정

#교재 52p 함수 파라미터 확인하기
args(max) # max()함수의 파라미터 확인 
max(10,20,NA,30) # NA 출력 
max(10,20,30,NA,na.rm = T) # 결측치 제거 후 최댓값 구하기 

#교재 52P 함수 사용 예제 보기 
example(seq) #seq 함수 사용 예제 보기 
nums <- seq(29)
nums
#교재 53p 평균을 구해주는 mean() 함수 사용예
example(mean)
mean(10:20)
x <- c(0:10,50)
x
mean(x)
