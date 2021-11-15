
install.packages('Sejong')
install.packages('wordcloud')
install.packages('tm')
install.packages('hash')
install.packages('rJava')
install.packages('tau')
install.packages('RSQLite')
install.packages('cli')
install.packages('rcmdcheck')
install.packages('devtools')


library('KoNLP')
library('tm')
library('wordcloud')

word_cloud <- file('C:\\Users\\강병화\\Desktop\\WorkSpace\\R\\file\\wordcloud_data.txt', encoding = 'UTF-8')
word_data <- readLines(word_cloud)
word_data
head(word_data)

# term = '추가단어', tag = ncn(명사지시코드)
user_dic <- data.frame(term = c("R 프로그래밍","페이스북","김진성","소셜네트워크"),tag = 'ncn')
buildDictionary(ext_dic = 'sejong', user_dic = user_dic)

paste(extractNoun('김진성은 많은 사람과 소통을 위해서 소셜네트워크에 가입하였습니다.'),
      collapse=" ") # 신규단어가 추출되고 extractNoun함수로, collapse속성으로 명사들을 공백으로 연결한다 
# 실습 306p - 단어 추출을 위한 사용자 함수 정의하기 

# 단계 1: 사용자 정의 함수 작성 
exNouns <- function(x) { paste(extractNoun(as.character(x)), collapse = " ")}
# 단계 2: exNouns()함수를 이용하여 단어 추출 
wordcloud_nouns <- sapply(word_data, exNouns) # 단어 추출 
wordcloud_nouns[1]  # 단어가 추출된 첫 줄 보기 
################################################################

# 실습 307p - 추출된 단어를 대상으로 전처리하기 
# 추출된 단어를 대상으로 전처리하기 
myCorpus <- Corpus(VectorSource(wordcloud_nouns))
myCorpus
# 추출된 단어를 대상으로 처리할 수 있도록 변경하거나 불필요한 단어를 제거하는 
# 전처리 과정에서 tm패키지에서 제공되는 tm_map()함수를 이용한다. 

# 단계 2: 데이터 전처리 
# 단계 2-1: 문장부호 
myCorpusPrepro <- tm_map(myCorpus,removePunctuation)
# 단계 2-2:  수치 제거 
myCorpusPrepro <- tm_map(myCorpusPrepro,removeNumbers)
# 단계 2-3: 소문자 변경 
myCorpusPrepro <- tm_map(myCorpusPrepro,tolower)
# 단계 2-4:  불용어 제거 
myCorpusPrepro <- tm_map(myCorpusPrepro,removeWords, stopwords('english'))
# 단계 2-5: 전처리 결과 확인 
inspect(myCorpusPrepro[1:5])
###################################################################
# 실습 308p - 단어 선별(2~8 음절 사이 단어 선택) 하기 
# 한글 1음절은 2byte에 저장(2음절 = 4byte)
myCorpusPrepro_term <-
    TermDocumentMatrix(myCorpusPrepro,
                       control = list(wordLength = c(4,16))) # 2~8음절 # Corpus 객체 정보 
myCorpusPrepro_term
# 단계 2: matrix 자료구조를 data.frame 자료구조로 변경 
myTerm_df <- as.data.frame(as.matrix(myCorpusPrepro_term))
dim(myTerm_df)
###################################################################
# 단어 출현 빈도수 구하기 
# 실습 309p - 단어 출현 빈도수 구하기 
wordResult <- sort(rowSums(myTerm_df),decreasing = TRUE)
wordResult[1:10]
# 불용어 제거 
# 단계 1: 데이터 전처리 
# 단계 1-1: 문장부호 제거 
myCorpusPrepro <- tm_map(myCorpus,removePunctuation)
# 단계 1-2: 수치 제거
myCorpusPrepro <- tm_map(myCorpusPrepro,removeNumbers)
# 단계 1-3: 소문자 변경 
myCorpusPrepro <- tm_map(myCorpusPrepro,tolower)
myStopwords = c(stopwords('english'),"사용","하기")
myCorpusPrepro <- tm_map(myCorpusPrepro,removeWords,myStopwords)

# 단계2: 단어 선별과 평서문 변환 
myCorpusPrepro_term <- TermDocumentMatrix(myCorpusPrepro,
                                          control = list(wordLengths = c(4,16))) # 2~8음절 
# 말뭉치 객체를 평서문으로 변환 
myTerm_df <- as.data.frame(as.matrix(myCorpusPrepro_term))

# 단계 3: 단어 출현 빈도수 구하기 

wordResult <- sort(rowSums(myTerm_df),decreasing = TRUE)
wordResult[1:10]
# 단계1: 단어 이름과 빈도수로 data.frame 생성 
myName <- names(wordResult)
word_df <- data.frame(word = myName, freq = wordResult)
str(word_df)
# 단계2: 단어 색상과 글꼴 지정 
pal <- brewer.pal(12,"Paired") # 12가지 색상 적용 
# 단어 구름으로 시각화하기 위해서는 wordcloud() 함수를 사용한다.

# 단계3: 단어 구름 시각화 
wordcloud(word_df$word,word_df$freq, scale = c(5,1),
          min.freq = 3, random.order = F,
          rot.per = .1, colors = pal, family = "malgun")
