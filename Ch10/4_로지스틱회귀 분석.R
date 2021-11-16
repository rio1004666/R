# 날짜: 2021/11/16
# 이름: 강병화
# 내용: # 로지스틱회귀 분석 실습

# 데이터 준비하기

View(iris)

df_iris <- iris
df_iris$Species <- as.integer(df_iris$Species)
View(df_iris)

# 학습,테스트 데이터 
idx <- sample(1:nrow(df_iris), nrow(df_iris) * 0.8) # 80퍼센트의 갯수 
idx

train_iris <- df_iris[idx,]
test_iris <- df_iris[-idx,]

View(train_iris)
View(test_iris)

# 모델생성 & 학습하기

model <- glm(Species ~ ., data = train_iris) # 모델생성하기
fitted(model) # 학습하기

# 테스트하기 

result <- predict(model, test_iris)
result

result <- round(result,0)
result

# 성능평가
acc <- mean(result == test_iris$Species)
acc
