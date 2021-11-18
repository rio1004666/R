# 패키지설치
install.packages('party')
library(party)
# 데이터 준비하기
df_iris <- iris
View(df_iris)

# 학습, 테스트 데이터
idx <- sample(1:nrow(iris),nrow(iris)*0.8)
idx 

train_iris <- df_iris[idx,]
test_iris <- df_iris[-idx,]

View(train_iris)
View(test_iris)

# 결정트리 모델 생성 
model <- ctree(formula = Species ~ ., data = train_iris)

# 시각화

plot(model)

# 테스트
result <- predict(model, test_iris)
result

# 성능평가 
acc <- mean(result == test_iris$Species)
acc
