# 날짜 : 2021/09/28
# 이름 : 강병화
# 내용 : 제어문과 함수 - 반복문 교재 p115

# for (변수 in 변수){실행문}
i <- c(1:10)
i
for(n in i){
  print(n*10)
  print(n)
}
# 짝수 값만 출력하기 
i <- c(1:10)
for(n in i){
  if(n%%2 == 0) print(n)
}

# 짝수이면 넘기고, 홀수 값만 출력하기
i <- c(1:10)
for(n in i){
  if(n%%2 == 0){
    next
  }else{
    print(n)
  }
}
# 변수의 칼럼명 출력하기
name <- c(names(exam))
for(n in name){
  print(n)
}
# 벡터 데이터 사용하기
score <- c(85,95,98)
name <- c("홍길동","이순신","강감찬")
i <- 1
for(s in score){
  cat(name[i],"->",s,"\n")
  i < i + 1
}
# while(조건){실행문}
i = 0
while(i<10){
  i <- i + 1
  
  print(i)
}



