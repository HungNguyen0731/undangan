FROM node:18-alpine AS build

# Đặt thư mục làm việc trong container
WORKDIR /app

# Sao chép package.json và package-lock.json trước để cache cài đặt dependencies
COPY package.json package-lock.json ./

# Cài đặt dependencies
RUN npm install && npm run build:public

# Sao chép toàn bộ source code vào container
COPY . .

# Giai đoạn production: sử dụng Nginx để phục vụ các tệp tĩnh
FROM nginx:alpine

# Sao chép thư mục public từ giai đoạn build sang Nginx
COPY --from=build /app/public /usr/share/nginx/html

# Expose cổng 80 để truy cập ứng dụng
EXPOSE 80

# Khởi động Nginx
CMD ["nginx", "-g", "daemon off;"]
