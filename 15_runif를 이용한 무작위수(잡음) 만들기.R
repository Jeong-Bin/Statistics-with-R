# runif(random unif) : 0~1 사이의 무작위 수 n개 추출
runif(10) # : 0~1 사이의 무작위 수 10개 추출

# 만약 5~10 사이의 수 10개을 뽑고싶다면
runif(10) * 5 + 5

# 만약 15~19 사이의 수 10개을 뽑고싶다면
runif(10) * 4 + 15

#------------------------------------------------------

# 그래프 그리기
range_vec <- 1:20

true_fuc <- function(x){
  result <- 20 + 3*x
  return(result)
}

plot(range_vec, true_fuc(range_vec),
     type = "l", lty = 2)


# runif를 이용한 잡음
noise_fuc3 <- function(x){
  true_vec <- 20 + 3*x  # y절편20, 기울기3인 직선
  noise_vec <- runif(length(x)) * 10 - 5 # -5~5사이의 값을 x의 길이만큼 잡음 생성
  
  result <- true_vec + noise_vec
  return((result))
}

# 점을 찍어보면 매번 y값이 다르게 나온다.
points(4, noise_fuc3(4), pch = 19) # pch는 점의 모양

# 여러개의 x값
x <- 5:15
points(x, noise_fuc3(x), pch = 19)


# runif의 한계
# 설정한 범위 밖의 값은 나오지 않는다.  -> 완전한 잡음이 아님
