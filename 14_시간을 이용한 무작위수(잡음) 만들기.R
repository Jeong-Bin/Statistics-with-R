# 소수 6자리까지 현재 시간 출력
options(digits.secs = 6)
Sys.time()

# 뒤에서 4자리를 선택해 잡음으로 설정하기
random_0to1 <- function(){
  options(digits.secs = 6)
  current_time <- as.character(Sys.time())  # Sys.time()은 숫자형이라서 문자형으로 변환
  n <- nchar(current_time)  # 몇 개의 문자가 있는지 셈
  time_decimal <- substr(current_time, n-3, n)  # 뒤에서 4번째 자리까지 선택
  return(as.integer(time_decimal)/ 10000)  # 다시 숫자로 변환 후 1만으로 나누기 
}

random_0to1()


# 근데 R에서는 아래 함수를 이용해 간단하게 무작위수를 구할 수 있다.
runif(1)
