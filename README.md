# Gin-Mall 电子商城项目

Gin-Mall 是一个基于 Go、Gin、Gorm、MySQL 和 Redis 的电子商城项目。

## 项目结构

```
gin-mall/
├── config/
│   └── config.go
├── controller/
│   └── product_controller.go
├── model/
│   └── product_model.go
├── repository/
│   └── product_repository.go
├── service/
│   └── product_service.go
└── main.go
```

## 快速开始

1. 克隆项目到本地：
   ```bash
   git clone https://github.com/your_username/gin-mall.git
   cd gin-mall
   ```

2. 安装依赖：
   ```bash
   go get -u github.com/gin-gonic/gin
   go get -u github.com/jinzhu/gorm
   go get -u github.com/go-sql-driver/mysql
   go get -u github.com/go-redis/redis/v8
   ```

3. 配置数据库连接：
   - 在 `config/config.go` 中设置数据库连接信息。

4. 运行项目：
   ```bash
   go run main.go
   ```

## 贡献

欢迎贡献代码！请提交 Pull Request。

## 许可证

MIT License