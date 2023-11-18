package config

import (
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

// Config 包含数据库连接信息
type Config struct {
	DB *gorm.DB
}

// NewConfig 创建一个新的配置
func NewConfig() (*Config, error) {
	db, err := gorm.Open("mysql", "test:123456@/gin-mall?charset=utf8&parseTime=True&loc=Local")
	if err != nil {
		return nil, err
	}

	// 设置数据库连接池信息
	db.DB().SetMaxIdleConns(10)
	db.DB().SetMaxOpenConns(100)

	return &Config{DB: db}, nil
}
