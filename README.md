# gin-mall

Gin-Mall is a sample e-commerce application built with the Gin web framework for Go. This project provides a basic structure for a scalable and maintainable Go web application.

**[中文版本](README_zh.md)**

## Project Structure

```
gin-mall/
|-- cmd/                 # Main application entry point
|   |-- gin-mall/
|       |-- main.go
|-- config/              # Application configuration
|   |-- config.go
|-- internal/            # Internal application code
|   |-- app/             # Application core logic
|       |-- app.go
|       |-- handler/     # HTTP request handling
|           |-- product_handler.go
|       |-- repository/  # Database access layer
|           |-- product_repository.go
|       |-- service/     # Business logic layer
|           |-- product_service.go
|-- migrations/          # Database migration scripts
|   |-- 001_init_schema.up.sql
|   |-- 001_init_schema.down.sql
|-- model/               # Data models
|   |-- product.go
|-- pkg/                 # Common packages and libraries
|   |-- utils/           # General utility functions
|       |-- response.go
|-- scripts/             # Script files
|   |-- deploy.sh
|-- web/                 # Web-related resources
|   |-- static/          # Static files
|   |-- templates/       # HTML template files
|-- .gitignore           # Git ignore file list
|-- go.mod               # Go module file
|-- go.sum               # Go module dependency file
|-- README.md            # Project documentation
```

## Getting Started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/gin-mall.git
   ```

2. **Change into the project directory:**

   ```bash
   cd gin-mall
   ```

3. **Run the application:**

   ```bash
   go run cmd/gin-mall/main.go
   ```

   The application will be accessible at [http://localhost:8080](http://localhost:8080).

## Configuration

The configuration settings for the application can be found in the `config/config.go` file. Update this file to match your database and other environment configurations.

## Database Migrations

To apply database migrations, use the following commands:

```bash
go run cmd/gin-mall/main.go migrate up
```

To rollback migrations:

```bash
go run cmd/gin-mall/main.go migrate down
```

## Contributing

Feel free to contribute to the project by opening issues or submitting pull requests.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
