# 날짜 : 2021/09/27
# 이름 : 강병화
# 내용 : 데이터유형과 구조 - DataFrame 실습하기 교재 p71
# DataFrame은 행과 열로 이루어진 테이블 

# DataFrame 생성

a <- c(1,2)
b <- c(3,4)
c <- c(T,F)
df1 <- data.frame(a,b,c)
df1

df2 <- data.frame(num = c(1,2,3),
                  name = c('김유신','김춘추','장보고'),
                  age = c(21,21,32))

df2
uid <- c('a101','a102','a103', 'a104', 'a105')
name <- c('김유신','김춘추','장보고','강감찬','이순신')
pos <- c('대리','과장','사원','부장','과장')
dep <- c(101,102,103,104,105)
member_df <- data.frame(uid,name,pos,dep)
member_df

# DataFrame 데이터 출력
df2$name[1]
df2$name[3]
df2$name[4]
df2$age[3]
member_df$uid[1]
member_df$name[3]
member_df$pos[5]

# DataFrame 필수 내장함수

iris # 꽃잎 꽃받침 => 품종을 구분 
class(iris) # 데이터 구조 유형확인 (다른언어의 클래스와는 다르다)
View(iris) # 데이터프레임 표 형태로 출력
head(iris) # 데이터프레임 상위 6개 출력
tail(iris) # 데이터 프레임 하위 6개 출력 
str(iris) # 데이터 프레임 컬럼의 자료유형을 확인
dim(iris) # 데이터 프레임 행열 크기확인
names(iris) # 데이터 프레임 속성(컬럼) 확인 
summary(iris) # 데이터프레임 요약 통계 확인


# CSV 파일을 이용한 데이터프레임 생성
iris_df <- read.csv('../file/iris.csv')
View(iris_df)

exam_df <- read.csv('../file/exam.csv')
View(exam_df)





# DataFrame 집계 실습 





