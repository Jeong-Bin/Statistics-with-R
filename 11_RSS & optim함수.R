# 임의 산점도(부동산 예시)
plot(0, 0, type = 'n',
     xlim = c(0, 10),
     ylim = c(0, 10))
abline(h = 0)
abline(v = 0)

points(x = c(2, 4, 6, 8),  # x_i : 방의 크기
       y = c(1, 6, 4, 8))  # y_i : 집의 가격


# 직선 공식 : y = a+bx (a=y절편, b=기울기)
# 직선 A
abline(a =2, b = 0.5)
# 직선 B
abline(a =1, b = 0.8, col = "red")

#-----------------------------------------------

# RSS = sum((y_i - y_i_hat)^2)
# RSS가 작을 수록 잘 예측한 것
y_i = c(1, 6, 4, 8)

#-----------------------------------------------

# 직선 A (y = a+bx)
y_i_hat_A <- 2 + 0.5 * c(2, 4, 6, 8)
y_i_hat_A # 3, 4, 5, 6

# 직선 A의 RSS
sum((y_i - y_i_hat_A)^2) # = 13

#-----------------------------------------------

# 직선 B (y = a+bx)
y_i_hat_B <- 1 + 0.8 * c(2, 4, 6, 8)
y_i_hat_B # 2.6, 4.2, 5.8, 7.4

# 직선 B의 RSS
sum((y_i - y_i_hat_B)^2) # = 9.4

#-----------------------------------------------

# 근데 일일이 하기 귀찮으므로 함수를 만들자

RSS <- function(intersect, slope){
  y_i_hat <- intersect + slope * c(2, 4, 6, 8)
  y_i <- c(1, 6, 4, 8)
  RSS <- sum((y_i - y_i_hat)^2)
  return(RSS)
}

# 직선 A의 RSS
RSS(2, 0.5) # = 13
# 직선 B의 RSS
RSS(1, 0.8) # = 9.4

#-----------------------------------------------

# 그럼 RSS를 최소로 하는 최적의 a, b는?
# optim(optimization) 함수를 사용!

# optim(par = c(1, 1), fn = rss)
# par = 파라미터 백터값(여기서는 intersect, slope)
# fn = 이용할 함수
# data = 이용할 데이터(여기서는 사용 안 함)

# optim의 파라미터 백터값을 사용하기 위해
# RSS 함수를 조금 바꿔준다.
RSS <- function(par){
  intersect <- par[1]
  slope <- par[2]
  y_i_hat <- intersect + slope * c(2, 4, 6, 8)
  y_i <- c(1, 6, 4, 8)
  RSS <- sum((y_i - y_i_hat)^2)
  return(RSS)
}

RSS(c(2, 0.5)) # 이제 이렇게 백터 형식으로 입력해야 함

# par는 아무거나 초기값 하나만 설정해주면 됨
result <- optim(par = c(2, 0.5), fn = RSS)
result

" 결과
$par
[1] 0.0005164763 0.9499521173
=> 최적의 a, b값

$value
[1] 8.7
=> 최소 RSS값

$counts
function gradient 
83       NA 
=> 반복횟수
"

# 최적의 회귀직선
abline(a =0.0005164763, b = 0.9499521173, col = "blue")

# 내 집의 크기가 5일때 가격을 예측해보자
# y = a+bx
0.0005164763 + 0.9499521173 * 5 # 4.750277