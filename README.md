# gin_mall

gin_mall is a sample e-commerce application built with the Gin web framework for Go. This project provides a basic structure for a scalable and maintainable Go web application.

**[中文版本](README_zh.md)**

## Project Structure

```
gin_mall/
|-- cmd/                 # 主应用入口
|   |-- gin_mall/
|       |-- main.go
|-- config/              # 应用配置
|   |-- config.go
|-- internal/            # 内部应用代码
|   |-- app/             # 应用核心逻辑
|       |-- app.go
|       |-- handlers/    # HTTP 请求处理
|           |-- product_handler.go
|       |-- repositories/  # 数据库访问层
|           |-- product_repository.go
|       |-- services/     # 业务逻辑层
|           |-- product_service.go
|-- migrations/          # 数据库迁移脚本
|   |-- 001_init_schema.up.sql
|   |-- 001_init_schema.down.sql
|-- models/               # 数据模型
|   |-- product.go
|-- pkg/                  # 通用包和库
|   |-- utils/            # 通用工具函数
|       |-- response.go
|-- scripts/              # 脚本文件
|   |-- deploy.sh
|-- web/                  # 与 web 相关的资源
|   |-- static/           # 静态文件
|   |-- templates/        # HTML 模板文件
|-- .gitignore            # Git 忽略文件列表
|-- go.mod                # Go 模块文件
|-- go.sum                # Go 模块依赖文件
|-- README.md             # 项目文档

```

## Getting Started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/LuStormstout/gin_mall.git
   ```

2. **Change into the project directory:**

   ```bash
   cd gin_mall
   ```

3. **Run the application:**

   ```bash
   go run cmd/gin_mall/main.go
   ```

   The application will be accessible at [http://localhost:8080](http://localhost:8080).

## Configuration

The configuration settings for the application can be found in the `config/config.go` file. Update this file to match your database and other environment configurations.

## Database Migrations

To apply database migrations, use the following commands:

```bash
go run cmd/gin_mall/main.go migrate up
```

To rollback migrations:

```bash
go run cmd/gin_mall/main.go migrate down
```

## Contributing

Feel free to contribute to the project by opening issues or submitting pull requests.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
