mydata <- read.csv("https://www.theissaclee.com/ko/courses/rstat101/examscore.csv", header = TRUE)
head(mydata)

# 히스토그램
hist(mydata$midterm)

# 20단위로(방법1)
hist(mydata$midterm, breaks = c(0,20,40,60,80))

# 20단위로(방법2)
hist(mydata$midterm, breaks = c(0:4)*20)

# 5단위로(방법2)
hist(mydata$midterm, breaks = c(0:16)*5,
     main = "중간고사 분포",
     xlab = "중간고사 변수",
     ylab = "빈도수수")
