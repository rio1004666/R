# 날짜 : 2021/09/28
# 이름 : 강병화
# 내용 : 데이터 시각화  - 막대차트 교재 p139

# 기본 막대차트

count <- c(1,2,3,4,5)
barplot(count)

score <- c(80,72,60,78,82)
names(score) <- c('김유신','김춘추','장보고','강감찬','이순신')
barplot(score)

# 범주형 막대차트 
season <- c('winter','summer','spring','summer','summer',
            'autumn','autumn','summer','spring','spring')
season
# 빈도수 카운팅을 할 때 사용하는 내장메서드 table
result <- table(season)
result


# 단순 색상을 파레트함수로 스타일링해준다 
barplot(result,main="season", col= c('blue','red','green','yellow'))
barplot(result,main="season", col=rainbow(4))
barplot(result,main="season", col=heat.colors(4))
barplot(result,main="season", col=terrain.colors(4))

# x축  y축 라벨 달기 

barplot(result,
        main="season",
        col= rainbow(4), # 파레트 함수 
        xlab='계절', # x 축
        ylab='빈도수', # y축
        horiz= T) #수평으로 함

# 누적 그래프 

df_sample = read.csv('../file/sample_population.csv')
df_sample
matrix_sample <- as.matrix(df_sample)
matrix_sample
barplot(matrix_sample)
barplot(matrix_sample,col = rainbow(3), beside=T,
        legend.text=T)


# 세로 막대 차트 그리기 

# 단계 1 :  차트 작성을 위한 자료 만들기 

chart_data <- c(305,450,320,460,330,480,380,520)



names(chart_data) <- c("2018 1분기","2019 1분기",
                       "2018 2분기","2019 2분기",
                       "2018 3분기","2019 3분기",
                       "2018 4분기","2019 4분기"
                       ) # 8개의 벡터에 칼럼명 지정 
str(chart_data) # 자료구조 보기
chart_data

# 단계 2: 세로 막대 차트 그리기

barplot(chart_data,ylim=c(0,600), # 차원의 높이에 해당하는 데이터 셋 지정 
        col=rainbow(8), # 8가지 다른 색 
        main="2021년도 vs 2019년도 매출현황 비교") # 제목 지정 
help("barplot") # barplot() 함수 도움말 보기


# 막대 차트의 가로축과 세로축에 레이블 추가하기 

barplot(chart_data,ylim=c(0,600),
        ylab="매출액(단위:만원)",
        xlab="년도별 분기현황",
        col= rainbow(8),
        main = "2018년도 vs 2019년도 매출현황 비교")


# 가로 막대 차트 그리기

barplot(chart_data,xlim=c(0,600),horiz = T,
        ylab="년도별 분기현황",
        xlab="매출액(단위:만원)",
        col= rainbow(8),
        main = "2018년도 vs 2019년도 매출현황 비교")


# 막대 차트에서 막대 사이의 간격 조정하기 

barplot(chart_data, xlim=c(0,600), horiz=T,
        ylab="년도별 분기현황",
        xlab="매출액(단위:만원)",
        col=rainbow(8),space=1,cex.names=0.8, # space속성으로 간격 커지고 두께 얇아진다 
        # cex.names 속성으로 축이름의 크기 조정할 수 잇따 
        main="2018년도 vs 2019년도 매출현황 비교")

# 막대 차트에서 막대의 색상 지정하기 

barplot(chart_data,xlim=c(0,600),horiz=T,
        ylab="년도별 분기현황",
        xlab="매출액(단위:만원)",
        space = 1, cex.names = 0.8,
        main="2018년도 vs 2019년도 매출현황 비교",
        col= rep(c(2,4),4)) 
        # c()함수에서 사용되는 색상관련 인수 값은 1~7까지로 지정된 색은 검은색 1
        # 빨간색 2 초록색 3 파란색 4 하늘색 5 자주색 6 노란색 7 이다. 
        # 2,4는 빨간색 파란색 선택되고 4는 4번 반복된다는 의미이다 

