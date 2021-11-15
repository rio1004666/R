# 날짜 : 2021/09/30

# 이름 : 강병화

# 내용 : 정형과 비정형 데이터 처리 - MySQL 데이터 처리 교재 P292


# 자바는 DB에 접근해서 클라이언트에게 서비스하기 위해서 사용하는 프로그래밍언어

# R은 DB에 접근해서 데이터를 분석하기 위해서 사용하는 프로그래밍 언어 

install.packages('RMySQL')
library(RMySQL)
library(dplyr)
library(ggplot2)


# 데이터베이스 접속

conn <- dbConnect(MySQL(), 
                  host='13.124.81.181',
                  user='rio100466',
                  password='1234',
                  dbname='rio100466')
# R에서 형성하는 데이터 구조는 DATA FRAME
df_user <- dbGetQuery(conn,statement = 'SELECT * FROM `USER1`')
Encoding(df_user$name) <- 'UTF-8' # 인코딩해주어야한다
df_user
# 매출 데이터 불러오기 
df_sale <- dbGetQuery(conn, statement = 'SELECT * FROM `SALE`')
df_sale

df_result <- df_sale %>%  group_by(uid) %>% summarise(total = sum(sales)) %>% arrange(desc(total))

# group_by앞에는 select가 생략되어 잇다 

View(df_sale)

# 시각화 

ggplot(data = df_result, aes(x = uid, y = total)) + geom_col()

# 데이터베이스 종료 

dbDisconnect(conn)
