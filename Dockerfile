# Sử dụng hình ảnh Nginx chính thức làm cơ sở
FROM nginx:alpine

# Đặt thư mục làm việc trong container
WORKDIR /usr/share/nginx/html

# Xóa các tệp mặc định của Nginx
RUN rm -rf ./*

# Sao chép tất cả các tệp từ project vào thư mục làm việc
COPY . .

# Expose cổng 80 để truy cập ứng dụng
EXPOSE 80

# Lệnh mặc định để chạy Nginx
CMD ["nginx", "-g", "daemon off;"]
