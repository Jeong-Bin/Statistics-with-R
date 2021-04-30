mydata <- read.csv("https://www.theissaclee.com/ko/courses/rstat101/examscore.csv", header = TRUE)
head(mydata)

mydata$gender

# gender만 가져와서 table을 만들고 변수에 저장
mytable <- table(mydata$gender)
mytable

# 열 이름을 한글로 바꾸기
names(mytable) <- c("여자", "남자")
mytable

# 파이차트
pie(mytable,
    main = "학생 성별 분포")

# 차트 위에 비율 표기(좌표값 이용)
text(0.3, 0.3, "33.3%")
text(-0.3, -0.3, "66.6%")
