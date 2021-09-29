# 날짜 : 2021/09/29
# 이름 : 강병화
# 내용 : dplyr 패키지 실습하기 교재 - p169
install.packages('dplyr')
library(dplyr)
df_exam = read.csv('../file/exam.csv')
df_exam
# 데이터 프레임을 가공처리하는 함수들 

#select - DataFrame에서 특정컬럼을 선택해서 새로운 DF생성 

df_rs <- df_exam[,4]
df_rs

df_math <- df_exam %>% select(math)
df_english <- df_exam %>% select(english) # 단축키 ctrl + shift + m
df_result1 <- df_exam %>% select(science,math) 
df_result2 <- df_exam %>% select(everything())

df_math
df_english
df_result1
df_result2

#filter

df_class1 <- df_exam %>% select(everything()) %>% filter(class == 1)

df_class1

# - 영어점수 60점 이상 그리고 80점 미만
df_rs1 <- df_exam %>% select(everything()) %>% filter(english >= 60 & english < 80)
df_rs1
View(df_rs1)
# - 과학점수 60점 이상 또는 80점 이하
df_rs2 <- df_exam %>% filter(science >= 60 | science <= 80)
df_rs2


# - class가 1인 반에 수학점수만 출력
df_rs3 <- df_exam %>%  filter(class == 1) %>% select(math)
df_rs3
#arrange

df_math_asc <- df_exam %>% arrange(math) # 수학점수를 기준으로 오름차순 정렬 
df_math_desc <- df_exam  %>%  arrange(desc(math)) # 수학점수를 기준으로 내림차순 정렬 
View(df_math_asc)
View(df_math_desc)


#mutate - DataFrame에 파생 변수(새로운 컬럼)를 생성

View(df_exam)
df_total <- df_exam %>% mutate(total = math+english+science)
df_mean <- df_total%>% mutate(mean = total/3)
df_mean %>% mutate(grade = ifelse(mean >= 90, 'A',
                           ifelse(mean >= 80,'B',
                           ifelse(mean >= 70, 'C',
                           ifelse(mean >= 60, 'D','F')))))
View(df_mean)

#summarise - DataFrame의 요약통계 확인 

df_exam %>% summarise(mean_math = mean(math)) 
df_exam %>% summarise(sum_math = sum(math)) 


#group_by

#inner_join


# 데이터프레임 처리     R 언어 -> dplyr     파이썬 ->  pandas
# 시각화                R 언어 -> hhplot2   파이썬 -> matplotlib











