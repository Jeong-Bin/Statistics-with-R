# 함수를 사용해서 최빈값 구하기

x <- c(1, 3, 9, 7, 1, 2, 2, 5, 3, 3, 3)
table(x) # 일단 3이 4번 나오며 최빈값이다.


# 내 방법(가독성이 안 좋을 수 있음)
mytable0 <- table(x)

statMode0 <- function(data_vac){
  result <- (sort(data_vac, decreasing = TRUE))
  return(result)
}

names(statMode0(mytable0))[1]

#------------------------------------------------

# 방법1 : sort의 제일 마지막 값으로
statMode1 <- function(data_vac){
  mytable1 <- table(data_vac)
  n <- length(mytable1)
  result <- names(sort(mytable1))[n]
  return(result)
}

statMode1(x)

#------------------------------------------------

# 방법 2 : sort의 제일 첫 번째 값으로
statMode2 <- function(data_vac){
  mytable2 <- table(data_vac)
  result <- names(sort(mytable2, decreasing = TRUE))[1]
  return(result)
}

statMode2(x)

#------------------------------------------------

# 방법 3 : 음수 사용해서 첫 번째 값으로
statMode3 <- function(data_vac){
  mytable3 <- table(data_vac)
  n <- length(mytable3)
  result <- names(sort(-mytable3))[1]
  return(result)
}

statMode3(x)

