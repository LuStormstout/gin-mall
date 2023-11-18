-- 001_init_schema.up.sql

-- 用户表
CREATE TABLE user (
    user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    username VARCHAR(50) NOT NULL COMMENT '用户名',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT '电子邮箱',
    password_hash VARCHAR(255) NOT NULL COMMENT '密码哈希',
    phone_number VARCHAR(20) COMMENT '手机号码',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
);

CREATE INDEX idx_user_username ON user(username);
CREATE INDEX idx_user_email ON user(email);


-- 管理员表
CREATE TABLE admin (
    admin_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '管理员ID',
    username VARCHAR(50) NOT NULL COMMENT '用户名',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT '电子邮箱',
    password_hash VARCHAR(255) NOT NULL COMMENT '密码哈希',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
);

CREATE INDEX idx_admin_username ON admin(username);
CREATE INDEX idx_admin_email ON admin(email);


-- 分类表
CREATE TABLE category (
    category_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '分类ID',
    name VARCHAR(50) NOT NULL COMMENT '分类名称',
    description TEXT COMMENT '分类描述',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
);

CREATE INDEX idx_category_name ON category(name);


-- 商品表
CREATE TABLE product (
    product_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '商品ID',
    name VARCHAR(100) NOT NULL UNIQUE COMMENT '商品名称',
    description TEXT COMMENT '商品描述',
    price DECIMAL(10, 2) NOT NULL COMMENT '商品价格',
    stock_quantity INT UNSIGNED NOT NULL COMMENT '库存数量',
    category_id INT UNSIGNED COMMENT '分类ID',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE INDEX idx_product_name ON product(name);


-- 商品缩略图表
CREATE TABLE product_thumbnail (
    thumbnail_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '缩略图ID',
    product_id INT UNSIGNED NOT NULL COMMENT '商品ID',
    thumbnail_url VARCHAR(255) NOT NULL COMMENT '缩略图URL',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE INDEX idx_thumbnail_product_id ON product_thumbnail(product_id);


-- 订单表
CREATE TABLE order (
    order_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '订单ID',
    user_id INT UNSIGNED NOT NULL COMMENT '用户ID',
    total_amount DECIMAL(10, 2) NOT NULL COMMENT '订单总金额',
    order_status TINYINT NOT NULL COMMENT '订单状态 (0: 待支付, 1: 已支付 - 待发货, 2: 已发货 - 待收货, 3: 已完成)',
    address_id INT UNSIGNED NOT NULL COMMENT '收货地址ID',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (address_id) REFERENCES user_address(address_id)
);

CREATE INDEX idx_order_user_id ON order(user_id);
CREATE INDEX idx_order_address_id ON order(address_id);


-- 订单详情表
CREATE TABLE order_detail (
    order_detail_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '订单详情ID',
    order_id INT UNSIGNED NOT NULL COMMENT '订单ID',
    product_id INT UNSIGNED NOT NULL COMMENT '商品ID',
    quantity INT UNSIGNED NOT NULL COMMENT '商品数量',
    subtotal DECIMAL(10, 2) NOT NULL COMMENT '小计金额',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (order_id) REFERENCES order(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE INDEX idx_order_detail_order_id ON order_detail(order_id);
CREATE INDEX idx_order_detail_product_id ON order_detail(product_id);


-- 角色表
CREATE TABLE role (
    role_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '角色ID',
    name VARCHAR(50) NOT NULL COMMENT '角色名称',
    description TEXT COMMENT '角色描述',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
);

CREATE INDEX idx_role_name ON role(name);


-- 权限表
CREATE TABLE permission (
    permission_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '权限ID',
    name VARCHAR(50) NOT NULL COMMENT '权限名称',
    description TEXT COMMENT '权限描述',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
);

CREATE INDEX idx_permission_name ON permission(name);


-- 用户角色关联表
CREATE TABLE user_role (
    user_id INT UNSIGNED NOT NULL COMMENT '用户ID',
    role_id INT UNSIGNED NOT NULL COMMENT '角色ID',
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE INDEX idx_user_role_user_id ON user_role(user_id);
CREATE INDEX idx_user_role_role_id ON user_role(role_id);


-- 角色权限关联表
CREATE TABLE role_permission (
    role_id INT UNSIGNED NOT NULL COMMENT '角色ID',
    permission_id INT UNSIGNED NOT NULL COMMENT '权限ID',
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES role(role_id),
    FOREIGN KEY (permission_id) REFERENCES permission(permission_id)
);

CREATE INDEX idx_role_permission_role_id ON role_permission(role_id);
CREATE INDEX idx_role_permission_permission_id ON role_permission(permission_id);


-- 用户地址表
CREATE TABLE user_address (
    address_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '地址ID',
    user_id INT UNSIGNED NOT NULL COMMENT '用户ID',
    recipient_name VARCHAR(50) NOT NULL COMMENT '收件人姓名',
    phone_number VARCHAR(20) NOT NULL COMMENT '联系电话',
    province VARCHAR(50) COMMENT '省',
    city VARCHAR(50) COMMENT '市',
    district VARCHAR(50) COMMENT '区/县',
    detailed_address TEXT COMMENT '详细地址',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE INDEX idx_user_address_user_id ON user_address(user_id);
