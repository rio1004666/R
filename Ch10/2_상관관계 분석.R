# 날짜: 2021/11/16
# 이름: 강병화
# 내용: # 상관관계 분석 실습

install.packages('corrplot')
library(corrplot)
data(iris)
df_iris <- iris
View(df_iris)

# 상광계수 확인

cor(df_iris$Sepal.Length, df_iris$Sepal.Width)
cor(df_iris$Sepal.Length, df_iris$Petal.Length)
cor(df_iris$Petal.Length, df_iris$Petal.Width)


corr_iris <- cor(df_iris[,1:4], method = 'pearson')
corr_iris


corrplot(corr_iris)
corrplot(corr_iris, type="lower")
corrplot(corr_iris, method="number")

#############################################

# product 상관분석

df_product <- read.csv('../file/product.csv')
df_product

# 상관계수 확인
cor(dfproduct$제품친밀도, dfproduct$제품적절성)
cor(dfproduct$제품친밀도, dfproduct$제품만족도)
cor(dfproduct$제품친밀도, dfproduct$제품적절성)

#상관행렬 확인
cor(df_product, method = 'pearson')

#시각화
corrplot(corr_product)
 






