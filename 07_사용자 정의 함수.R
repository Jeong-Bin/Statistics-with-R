# 화씨를 섭씨로 바꾸기
# 공식 : (화씨 - 32) * 5/9 = 섭씨

# 화씨 : 67, 45, 92, 83, 70

# 방법 1
(67 - 32) * 5/9
(45 - 32) * 5/9
(92 - 32) * 5/9
(83 - 32) * 5/9
(70 - 32) * 5/9


# 방법 2
tempF <- c(67, 45, 92, 83, 70)
(tempF - 32) * 5/9


# 방법 3 : 함수 사용
convFtoC <- function(tempF){
  result <- (tempF - 32) * 5/9
  return(result)
}

convFtoC(67)
convFtoC(tempF)
