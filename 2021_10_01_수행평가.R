install.packages('dplyr')
library(dplyr)
df_exam = read.csv('../file/exam.csv')
df_exam

  # math / english / science 변수만 갖는 DataFrame 출력 

# 방법 1 
df_rs1 <- df_exam %>% select(math, english, science)
df_rs1
# 방법 2
df_rs2 <- df_exam[,3:5]
df_rs

# class 가 1인 모든 변수를 갖는 DataFrame 출력 

df_class1 <- df_exam %>% select(everything()) %>% filter( class == 1)
df_class1

# english가 60점이상이고 80점 미만 DataFrame 출력 

df_english <- df_exam %>%  select(everything()) %>%  filter( english >= 60 & english < 80)
df_english

# science가 60점이상이고 80점 미만 DataFrame 출력 

df_science <-  df_exam %>% select(everything()) %>% filter( science >= 60 & science < 80)
df_science

# math가 60점 이상이고 점수가 높은 순서를 갖는 class,id,math 변수를 갖는 DataFrame출력 

df_result1 <- df_exam %>%  filter(math >= 60) %>% select(class, id , math) %>% arrange(desc(math))
df_result1

# class로 그룹화 되고 수학점수 평균, 영어점수 평균, 과학점수 평균 변수를 갖는 DataFrame 출력 

df_result2 <- df_exam %>%  group_by(class) %>% summarise(mean_math = mean(df_exam$math),
                                                         mean_english = mean(df_exam$english),
                                                         mean_science =mean(df_exam$science)) 

df_result2

# total(math, english, science의 합) 파생 변수를 갖는 DataFrame 출력 

df_result3 <- df_exam %>% mutate(total = math + english + science)
df_result3

# mean(math, english, science의 합의 평균) 파생변수를 갖는 DataFrame

df_result4 <- df_result3 %>% mutate(mean = (math + english + science) / 3)
df_result4

# grade(평균의 등급 A,B,C,D,F) 파생변수를 갖는 DataFrame 출력 

df_result5 <- df_result4 %>% mutate(grade = ifelse(mean >= 90,"A",
                                    ifelse(mean >= 80,"B",
                                    ifelse(mean >= 70,"C",
                                    ifelse(mean >= 60,"D","F")))))
df_result5
