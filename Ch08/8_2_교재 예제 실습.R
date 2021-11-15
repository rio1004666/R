# 날짜 : 2021/09/30

# 이름 : 강병화

# 내용 : 고급 시각화 분석 - 교재 예제 실습

# 교재 p234 실습 - lattice 패키지 사용 준비하기 
# 단계 1 : lattice 패키지 설치하기 
install.packages('lattice') # lattice 패키지 설치 
library(lattice) # 메모리에 로드 
# 단계 2 : 실습용 데이터 가져오기 

install.packages("mlmRev")
library(mlmRev) # Chem97 데이터 셋을 제공하는 mlmRev패키지를 설치하고 메모리에 로드한다 
data(Chem97) # Chem97 데이터 셋은 학생들 대상으로 A레벨 화학 점수를 기록한 데이터 셋이다.
str(Chem97)  # age는 18.5세 기준 -6~ + 5 범위이다. 
View(Chem97)
head(Chem97,30) # 앞부분 30개 행 보기  

################################################################
# 교재 p236 실습 - histogram() 함수를 이용하여 데이터 시각화하기  
histogram(~gcsescore,data=Chem97)
##################################################################
# 교재 p236 실습 - score 변수를 조건변수로 지정하여 데이터 시각화하기  
histogram(~gcsescore | score, data = Chem97)
histogram(~gcsescore | factor(score), data = Chem97)
##################################################################
# 교재 p238 실습 - densityplot() 함수를 사용하여 밀도 그래프 그리기
densityplot(~gcsescore | factor(score), data=Chem97,
            group = gender,
            plot.points = T,auto.key = T)

# 교재 p239 실습 - barchart() 함수를 사용하여 막대 그래프 그리기
# 단계 1: 기본데이터 셋 가져오기 
data("VADeaths")
View(VADeaths)

# 단계 2: VADeath 데이터 셋 구조 보기 
str(VADeaths)

# 단계 3: 데이터 형식 변경 (matrix 형식을 table 형식을 변경)

dit <- as.data.frame.table(VADeaths)
str(dit)
dit 

# 단계 4: 막대그래프 그리기 
barchart(Var1 ~ Freq | Var2, data = dit, layout = c(4,1))
# 조건이 시골과 도시 출신 각각 남녀 => 4개의 패널이 생서 ㅇ
# 각 패널마다 x축은 사망 비율의 값에 100퍼센트에서 20 40 60 80 으로 나눠진다 
# y축은 연령대별로 분류하여 박대그래프로 그려준다 


# 교재 p241 실습 - dotplot() 함수를 사용하여 점 그래프 그리기

# 단계 1 : layout 속성이 없는 경우 

dotplot(Var1~Freq | Var2, data =dit) # 레이아웃 속성이 없는경우 2x2

# 단계 2 : layout 속성을 적용한 경우 

dotplot(Var1 ~ Freq | Var2, data= dit, layout = c(4,1))

# 교재 p242 실습 - 점을 선으로 연결하여 시각화하기  

dotplot(Var1 ~ Freq | Var2, data = dit, layout = c(4,1),
        group = Var2, type="o",
        auto.key = list(space ="right", points=T, lines=T)) # 범례 추가 
# 범례를 나타내는 속성으로 범례의 위치를 그래프의 오른쪽으로 지정하고 그래프에 사용된점과 선을 범례에 표시하도록 한다.
# type = "o" : 점 타입으로 원형에 실선이 통과하는 유형으로 그래프의 타입을 지정한다 

# 교재 p243 실습 - airquality 데이터셋으로 산점도 그래프 그리기

# 단계 1: airquality 데이터 셋 가져오기 
library(datasets)
str(airquality)

# 교재 p246 실습 - quakes 데이터 셋으로 산점도 그래프 그리기 
# 교재 p247 실습 - 이산형 변수를 조건으로 지정하여 산점도 그리기  
# 교재 p248 실습 - 동일한 패널에 두개의 변수값 표현하기 
# 교재 p249 실습 - eqaul.count() 함수를 사용하여 이산형 변수 범주화하기 
# 교재 p251 실습 - 수심과 리히터 규모 변수를 동시에 적용하여 산점도 그리기 
# 교재 p253 실습 - 이산형 변수를 리코딩한 뒤에 factor형으로 변환하여 산점도 그리기 
# 교재 p254 실습 - depth 조건에 의해서 위도와 경도의 조건 그래프 그리기 
# 교재 p255 실습 - 조건의 구간 크기와 겹침 간격 적용 후 조건 그래프 그리기 
# 교재 p256 실습 -  패널과 조건 막대에 색을 적용하여 조건 그래프 그리기 
# 교재 p257 실습 -  위도, 경도, 깊이를 이용하여 3차원 산점도 그리기 
# 교재 p258 실습 -  테두리와 회전 속성을 추가하여 3차원 산점도 그래프 그리기 
# 교재 p259 실습 -  ggplot2 패키지 설치와 실습 데이터 가져오기 
# 교재 p261 실습 -  qplot()함수의 fill과 binwidth속성 적용하기 
# 교재 p262 실습 -  facets 속성을 사용하여 drv 변수값으로 행/열 단위로 패널 생성하기 
# 교재 p263 실습 -  qplot()함수에서 color 속성을 사용하여 두 변수 구분하기 
# 교재 p264 실습 -  displ과 hwy변수의 관계를 drv변수로 구분하기  
# 교재 p264 실습 -  mtcars 데이터 셋에 색상, 크기, 모양, 적용하기 
# 교재 p266 실습 - diamonds 데이터 셋에 막대, 점, 선 레이아웃 적용하기








