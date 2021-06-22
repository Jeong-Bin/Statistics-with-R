# 3차원 그래프로 나타내기 위한 rql 패키지 다운받기
# Tools - Install Packages - rql 입력


library(rgl)

RSS <- function(intersect, slope){
  y_i_hat <- intersect + slope * c(2, 4, 6, 8)
  y_i <- c(1, 6, 4, 8)
  RSS <- sum((y_i - y_i_hat)^2)
  return(RSS)
}

# vectorize. 3차원 그래프를 그릴 때 필요한 과정
rss <- Vectorize(RSS)

open3d() # 3d용 창을 엶
persp3d(rss,
        xlim = c(-5, 5),
        ylim = c(-2, 2),
        zlim = c(6, 15),
        n = 100)

# 최소값(꼭지점)에 점 찍기
rgl.spheres(x = 0.0005164763,
            y = 0.9499521173,
            z = RSS(0.0005164763, 0.9499521173),
            r = 0.05, color = 'red')
