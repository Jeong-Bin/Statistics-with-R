mydata <- read.csv("https://www.theissaclee.com/ko/courses/rstat101/examscore.csv", header = TRUE)
head(mydata)

# 박스 플랏, 가로
boxplot(mydata$midterm, 
        main = "시험 점수 분포",
        xlab = "점수",
        horizontal = T)

# 첫 번째 값을 임의로 바꿔서 이상치로 만들어본다
mydata$midterm[1] <- 100

boxplot(mydata$midterm, 
        main = "시험 점수 분포",
        xlab = "점수",
        horizontal = T)

# 네이밍
boxplot(mydata$midterm,
        mydata$final,
        main = "시험 점수 분포",
        xlab = "점수",
        ylab = "시험 종류",
        names = c("중간고사", "기말고사"),
        horizontal = T)
