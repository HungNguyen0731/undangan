FROM node:18-alpine

# Đặt thư mục làm việc trong container
WORKDIR /app

# Sao chép package.json và package-lock.json trước để cache cài đặt dependencies
COPY package.json package-lock.json ./

# Cài đặt dependencies
RUN npm install && npm run build:public

# Sao chép toàn bộ source code vào container
COPY . .

# Mở cổng 80 để phục vụ ứng dụng
EXPOSE 80

# Chạy ứng dụng ở chế độ development
CMD ["npx", "esbuild", "js/*.js", "--bundle", "--outdir=dist", "--servedir=."]
