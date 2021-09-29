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
