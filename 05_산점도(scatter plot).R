mydata <- read.csv("https://www.theissaclee.com/ko/courses/rstat101/examscore.csv", header = TRUE)
head(mydata)

# 산점도, asp로 가로세로 비율 똑같이 맞춤
plot(mydata$midterm, mydata$final,
     xlab = "중간고사",
     ylab = "기말고사",
     main = "시험점수 산점도",
     asp = 1)
