mydata <- read.csv("https://www.theissaclee.com/ko/courses/rstat101/examscore.csv", header = TRUE)
head(mydata)

# 줄기잎 그래프(기본 10단위)
stem(mydata$midterm)

# 그래프 크기를 2배로 = 단위를 2로 나눔 = 5단위
stem(mydata$midterm, scale = 2)

# 그래프 크기를 0.2배로 = 단위를 0.5로 나눔 = 20단위
stem(mydata$midterm, scale = 0.5)
