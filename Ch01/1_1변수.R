# 날짜 : 2021/09/27
# 이름 : 강병화
# 내용 : R설치와 개요 - 변수 실습하기 교재 p39

# r 스튜디오 기본 설정 
# Tools -> Global options -> code -> saving -> default text encoding utf-8
# Tools -> Global options -> Spelling -> 'Use real time spelling checking 해제

# 명령문 실행은 ctrl + enter

#변수

num1 <- 1
num2 <- 2
print(num1)
print(num2)

str1 <- "Hello R!"
str2 <- '안녕 R!'
str1
str2

# 스칼라 변수(1개의 값을 갖는 변수, 일반적인 변수)
var1 <- 1
var2 <- 2
var3 <- var1 + var2
var3
# 벡터(Vector) 변수(하나 이상의 값을 갖는 변수, 배열) 
x <- c(1, 2, 3)
y <- c('서울','대전','부산','광주')
x
y
# 팩터(factor) 변수(문자열이 저장되는 벡터, 범주형 데이터)

value <- c('A','B','B','O','AB','A')
ftype <- factor(value)
ftype

####################################################
#교재 p40 실습 - 변수 사용 예
var1 <- 0
var1
var1 <- 1
var1
var2 <- 2
var2
var3 <- 3
var3

#교재 p40 실습 - 변수.멤버 형식의 변수 선언 예

# 변수.멤버 형태로 변수명을 지정하면 효과적으로 데이터를 관리할 수 있다.

goods.code <-'a001' # 상품코드
goods.name <- '냉장고' # 상품명
goods.price <- 850000 # 가격
goods.des <- '최고사양, 등급 최고 품질' #상품 설명명
goods.code
goods.name
#교재 p41 실습 - 스칼라 변수 사용 예
age <- 35
name <- "홍길동"
age # 정수 35를 갖는 스칼라 변수의 값 확인
name # 문자열 "홍길동"을 갖는 스칼라 변수의 값 확인

#교재 p41 실습 - 벡터 변수 사용 예
# 벡터 자료구조는 1차원의 선형 자료구조 
age <- 35
names <- c("홍길동","이순신","유관순")
age
names










