package main

import (
	"gin-mall/config"

	"github.com/gin-gonic/gin"
)

func main() {
	// 初始化配置
	config, err := config.NewConfig()
	if err != nil {
		panic(err)
	}

	// 初始化数据库连接
	db := config.DB
	defer db.Close()

	// 初始化路由
	router := gin.Default()

	// 启动服务
	router.Run(":8080")
}
