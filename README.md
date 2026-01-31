# 🌾 AgriSell – CDAC Project

AgriSell is an online agricultural marketplace platform developed as part of the **CDAC final project**.  
It connects **farmers directly with buyers**, allowing farmers to sell agricultural products without middlemen, ensuring better profit and transparency.

---
## 📌 Project Repositories

This project is divided into two separate repositories:

### 🎨 Frontend Repository (React.js)
👉 https://github.com/Adi2212/CDAC-Project-AgriSell-Frontend

### 🔧 Backend Repository (Spring Boot)
👉 https://github.com/Adi2212/CDAC-Project-AgriSell-Backend

---
## 📌 Project Overview

AgriSell is designed to:

- Help farmers list products easily  
- Allow buyers to purchase fresh farm products online  
- Provide a smooth and secure e-commerce experience  
- Support direct communication between farmers and customers  

---

## 🚀 Features

### 👨‍🌾 Farmer Module
- Farmer Registration & Login  
- Add / Update / Delete Products  
- View Orders and Customer Details  
- Manage Profile  

### 🛒 Buyer Module
- Buyer Registration & Login  
- Browse Products by Category  
- Add to Cart & Place Orders  
- Track Order History  

### 🛠 Admin Module
- Manage Farmers and Buyers  
- Product Verification  
- Order Management  
- Dashboard Overview  

---

## 🏗 Tech Stack

### Frontend
- React.js  
- Bootstrap / Tailwind CSS  
- Axios  

### Backend
- Spring Boot (Java)  
- REST APIs  

### Database
- MySQL  

### Tools & Platforms
- GitHub  
- Postman  
- VS Code  
- Spring Tool Suite  

---

## 📂 Project Structure

```
CDAC-Project-AgriSell/
│
├── frontend/        # React UI
├── backend/         # Spring Boot APIs
└── README.md        # Documentation
```

---

## ⚙️ Installation & Setup

### ✅ Prerequisites
Make sure you have installed:

- Node.js & npm  
- Java 17+  
- MySQL Server  
- Maven  
- Git  

---

## 🔧 Backend Setup (Spring Boot)

1. Clone the repository:

```bash
git clone https://github.com/Adi2212/CDAC-Project-AgriSell.git
cd CDAC-Project-AgriSell/backend
```

2. Configure MySQL in `application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/agrisell
spring.datasource.username=root
spring.datasource.password=yourpassword
```

3. Run the backend server:

```bash
mvn spring-boot:run
```

Backend runs at:

```
http://localhost:8080
```

---

## 🎨 Frontend Setup (React)

1. Navigate to frontend folder:

```bash
cd ../frontend
```

2. Install dependencies:

```bash
npm install
```

3. Start the React application:

```bash
npm start
```

Frontend runs at:

```
http://localhost:3000
```

---

## 🗄 Database Setup

1. Create database in MySQL:

```sql
CREATE DATABASE agrisell;
```

2. Import SQL scripts .

---

## 📸 Screenshots

(Add screenshots of your project here)

Example:
- Login Page  
- Farmer Dashboard  
- Product Listing  
- Cart & Orders  

---

## 🎯 Future Enhancements

- Online Payment Integration  
- Delivery Tracking System   

---

## 👨‍💻 Contributor

- **Aditya Patil**  
  CDAC Student | Full Stack Developer  

---

## 📜 License

This project is developed for academic purposes under the CDAC curriculum.

---

## ⭐ Support

If you like this project, don’t forget to ⭐ star the repository!
