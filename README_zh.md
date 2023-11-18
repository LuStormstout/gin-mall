# gin-mall

Gin-Mall 是一个使用 Gin Web 框架构建的电商示例应用，用于 Go 语言。该项目提供了一个可扩展且易于维护的 Go Web 应用程序的基本结构。

## 项目结构

```
gin-mall/
|-- cmd/                 # 主要应用程序入口
|   |-- gin-mall/
|       |-- main.go
|-- config/              # 应用程序配置
|   |-- config.go
|-- internal/            # 内部应用程序代码
|   |-- app/             # 应用程序主体逻辑
|       |-- app.go
|       |-- handler/     # HTTP请求处理
|           |-- product_handler.go
|       |-- repository/  # 数据库访问层
|           |-- product_repository.go
|       |-- service/     # 业务逻辑层
|           |-- product_service.go
|-- migrations/          # 数据库迁移脚本
|   |-- 001_init_schema.up.sql
|   |-- 001_init_schema.down.sql
|-- model/               # 数据模型
|   |-- product.go
|-- pkg/                 # 通用的包和库
|   |-- utils/           # 通用工具函数
|       |-- response.go
|-- scripts/             # 脚本文件
|   |-- deploy.sh
|-- web/                 # Web相关资源
|   |-- static/          # 静态文件
|   |-- templates/       # HTML模板文件
|-- .gitignore           # Git忽略文件列表
|-- go.mod               # Go模块文件
|-- go.sum               # Go模块依赖文件
|-- README.md            # 项目说明文档
```

## 入门指南

1. **克隆仓库:**

   ```bash
   git clone https://github.com/LuStormstout/gin-mall.git
   ```

2. **切换到项目目录:**

   ```bash
   cd gin-mall
   ```

3. **运行应用程序:**

   ```bash
   go run cmd/gin-mall/main.go
   ```

   应用程序将在 [http://localhost:8080](http://localhost:8080) 处可访问。

## 配置

应用程序的配置设置可以在 `config/config.go` 文件中找到。请更新此文件以匹配您的数据库和其他环境配置。

## 数据库迁移

要应用数据库迁移，请使用以下命令:

```bash
go run cmd/gin-mall/main.go migrate up
```

要回滚迁移，请运行:

```bash
go run cmd/gin-mall/main.go migrate down
```

## 贡献

欢迎通过开启问题或提交拉取请求来贡献项目。

## 许可证

该项目根据 [MIT License](https://opensource.org/licenses/MIT) 许可证许可。
