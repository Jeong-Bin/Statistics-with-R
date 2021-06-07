mydata <- read.csv("https://www.theissaclee.com/ko/courses/rstat101/examscore.csv", header = TRUE)
head(mydata)

# <midterm과 final의 상관계수 구하기>
# (참고) https://www.theissaclee.com/ko/courses/rstat101/week5/
# x = mid, y = final

# 평균
x_bar <- mean(mydata$midterm)
y_bar <- mean(mydata$final)

# 표준편차
s_x <- sd(mydata$midterm)
s_y <- sd(mydata$final)

# 상관계수
z_x <- (mydata$midterm - x_bar) / s_x
z_y <- (mydata$final - y_bar) / s_y
sum(z_x * z_y) / (30-1)
# 상관계수는 0.677


# R에서는 상관계수 함수를 제공한다!
# cor(x, y)
cor(mydata$midterm, mydata$final)

#-----------------------------------------------------

# 1. 산점도로 시작화
my_corr <- cor(mydata$midterm, mydata$final)

plot(mydata$midterm, mydata$final, asp = 1,
     xlab = "중간고사", 
     ylab = "기말고사",
     main = "시험점수 산점도")

# 상관계수 값 표시
title(sub = paste("상관계수: ", round(my_corr, 4)), 
      adj = 1,  # 오른쪽 정렬
      col.sub = "red")

abline(v = x_bar) # 수직선
abline(h = y_bar) # 수평선

#-----------------------------------------------------

# 2. 기준점을 0으로 하기 위해
#    다음과 같이 - x_bar, - y_bar 를 추가한다.
plot(mydata$midterm- x_bar, mydata$final - y_bar,
     asp = 1,
     xlab = "중간고사", 
     ylab = "기말고사",
     main = "시험점수 산점도")

# 상관계수 값 표시
title(sub = paste("상관계수: ", round(my_corr, 4)), 
      adj = 1,  # 오른쪽 정렬
      col.sub = "red")

abline(v = 0) # 수직선
abline(h = 0) # 수평선

#-----------------------------------------------------

# 3. 상관계수
z_x <- (mydata$midterm - x_bar) / sd(mydata$midterm)
z_y <- (mydata$final - y_bar) / sd(mydata$final)

plot(z_x, z_y,
     asp = 1,
     xlab = "중간고사", 
     ylab = "기말고사",
     main = "시험점수 산점도")

# 상관계수 값 표시
title(sub = paste("상관계수: ", round(my_corr, 4)), 
      adj = 1,  # 오른쪽 정렬
      col.sub = "red")

abline(v = 0) # 수직선
abline(h = 0) # 수평선

#-----------------------------------------------------

# 4. 각 점이 상관계수에 미치는 영향만큼 점의 크기를 조절
#    원점에서 멀어질 수록 영향이 커짐
plot(z_x, z_y, asp = 1,
     xlab = "표준 중간고사 점수", 
     ylab = "표준 기말고사 점수",
     main = "중간, 기말고사 표준점수 분포",
     col = c("blue", "red")[as.factor(sign(z_x * z_y))],
      # z_x와 z_y를 곱한 값이 양수면 빨강, 음수면 파랑
     cex = abs(z_x * z_y))
      # cex = n으로 점의 크기를 조절할 수 있는데,
      # n에 z_x와 z_y를 곱한 값의 절대값을 부여한다.

title(sub = paste("상관계수: ", round(my_corr, 4)), adj = 1, col.sub = "red")

abline(v = 0)
abline(h = 0)