mydata <- read.csv("https://www.theissaclee.com/ko/courses/rstat101/examscore.csv", header = TRUE)

plot(mydata$midterm, mydata$final, asp = 1,
     xlab = "중간고사",
     ylab = "기말고사",
     main = "시험점수 산점도")

# linear model(회귀분석도 linear model의 한 종류)
# lm(회귀식or모델식, 데이터)
# lm(기말고사 = y절편(intercept) + 기울기 * 중간고사 + noise, 데이터 = madata)
# 그런데 y절편, 기울기, nosie는 생략해서 아래와 같이 입력할 수 있다.
# lm(final ~ midterm, data = mydata)  => ~ : 중간고사로 기말고사를 예측하겠다.

result <- lm(final ~ midterm, data = mydata)
summary(result)
# y절편 : 13.8866, 기울기 : 0.8967


# 회귀직선 그리기. coefficients에 y절편과 기울기가 담겨있다.
abline(result$coefficients)

# 30명 학생들의 residual(점과 직선 사이의 거리)
result$residuals

# 1번 학생의 정보
mydata[1,]
# residual은 -1.96

# 히스토그램
hist(result$residuals)
summary(result$residuals)
# Mean이 Median보다 작으므로 왼쪽으로 치우친 그래프이다.


# 만약 나의 중간고사가 40점이라면 기말고사는 몇 점을 받을까?
# y절편 + 기울기 * 중간고사 = 기말고사
result$coefficients[1] + result$coefficients[2] * 40
# 49.75점



 
