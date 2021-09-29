# 날짜 : 2021/09/28
# 이름 : 강병화
# 내용 : 제어문과 함수 - 조건문 교재 p110
# if  함수 사용하기 

x <- 50; y <- 4; z <- x*y
if(x*y >= 40){
  cat("x*y의 결과는 40이상입니다.\n")
  cat("x*y=",z)
}

# if()함수 사용으로 입력된 점수의 학점 구하기 
score <- scan()
score
result <- "노력"
if(score >= 80){
  result <- "우수"
}
cat("당신의 학점은", result, score)

# if-else if 형식으로 학점 구하기 
score <- scan()
score
if(score >=90){
  result = "A학점"
}else if(score >= 80){
  result = "B학점"
}else if(score >= 70){
  result = "C학점"
}else if(score >=60){
  result = "D학점"
  
}else{
  result = "F학점"
}

cat("당신의 학점은",result)

print(result)

# ifelse() 함수 사용하기 
score <- scan()

score
ifelse(score >= 80,"우수","노력")
ifelse(score <= 80,"우수","노력")

# ifelse() 함수 응용하기 
excel <- read.csv('../file/student1.txt')
excel
q1 <- excel$번호
q1


# ifelse()함수에서 논리 연산자 사용하기 
ifelse(q1 >= 2 & q1 <= 4, q1 ^ 2, q1)

# switch() 함수를 사용하여 사원명으로 급여정보보기
empname <- scan(what="")
empname
switch(empname,
       hong=250,
       lee=350,
       kim=200,
       kang=400
)
# 벡터에서 which() 함수 사용 -> index값을 반환
name <- c("kim","lee","choi","park")
which(name == "choi")
# 데이터프레임에서 which() 함수사용 
no <- c(1:5)
name <- c("홍길동","이순신","강감찬","유관순","김유신")
score <- c(85,78,89,90,74)
exam <- data.frame(학번=no,이름=name,성적=score)
exam
class(exam)
# 단계 2: 일치하는 이름의 위치 반환 
which(exam$이름 == '유관순')
exam[4,]





