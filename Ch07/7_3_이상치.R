# 날짜 : 2021/09/29
# 이름 : 강병화
# 내용 : EDA와 Data정제 - 이상치 실습하기 교재 p202

df_exam <- read.csv('../file/exam_outlier.csv')
View(df_exam)

# 이상치를 결측치로 변환 

df_exam$math <- ifelse(df_exam$math > 100 | df_exam$math < 0, NA,df_exam$math)
df_exam$english <- ifelse(df_exam$english > 100 | df_exam$english < 0, NA,df_exam$english)
df_exam$science <- ifelse(df_exam$science > 100 | df_exam$science < 0, NA,df_exam$science)
View(df_exam)

# 결측치를 0으로 수정 
df_exam[is.na(df_exam)] <- 0 # 결측치가 True인것을 모두 0으로 셋팅팅
View(df_exam)

# 기초 통계분석 
df_result <- df_exam %>% mutate(total=math+english+science,mean = total/ 3) %>%  arrange(desc(total))
View(df_result)
