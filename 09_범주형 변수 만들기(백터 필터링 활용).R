mydata <- read.csv("https://www.theissaclee.com/ko/courses/rstat101/examscore.csv", header = TRUE)
head(mydata)

mydata$midterm  # 총 30개의 데이터
summary(mydata$midterm) # 중간고사 평균은 43.23

# 1. y에 비어있는 문자 "" 30개를 넣는다.
y <- character(length = 30)

# 2. 평균 미만인 데이터를 "low" 값으로 변환
#    평균 이상인 데이터는 "high"로 변환
y[mydata$midterm < 43.23] <- "low"
y[mydata$midterm >= 43.23] <- "high"
y

# 3. 가상의 컬럼 highlow를 만들고 y데이터를 넣는다.
mydata$highlow <- y
head(mydata)


# 4. 파이차트로 시각화
mytable <- table(mydata$highlow)
pie(mytable,
    labels = names(mytable),
    main = "중간고사 성적 high & low")
