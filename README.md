# 🎓 UNATION English Level Check — Complete Production Guide

Official, secure, mobile-first English Placement Test Platform built for **UNATION English School**.

---

## 🌟 Architecture Overview

- **Frontend:** React 18, TypeScript, Vite, Tailwind CSS, Lucide Icons, html2canvas (Digital Certificate Generator).
- **Backend:** Node.js, Express, TypeScript, Helmet, CORS, Rate Limiting, JWT Authentication, Bcrypt.
- **Database:** Supabase (PostgreSQL with Row Level Security and Atomic Concurrency).
- **Integrations:** Telegram Bot API & Telegram Mini App WebApp SDK.
- **Scoring Engine:** Server-side score validation across 120 authoritative questions with exact academic boundaries.

---

## 📋 Exact English Level Boundaries

| Total Score (out of 120) | Placement Level |
| :---: | :---: |
| **0 – 20** | **Beginner** |
| **21 – 35** | **Elementary** |
| **36 – 60** | **Pre-intermediate** |
| **61 – 85** | **Intermediate** |
| **86 – 100** | **Upper Intermediate** |
| **101 – 120** | **Advanced** |

---

## 🚀 STEP 1: Local Installation & Quick Start

### 1.1 Prerequisites
Make sure you have **Node.js** (v18 or v20 LTS) installed on your computer.
Check by opening your PowerShell / Terminal and running:
```powershell
node -v
npm -v
```

### 1.2 Install Dependencies
In your terminal, navigate to the project directory:
```powershell
cd "c:\Users\ASUS\Desktop\unition bot"
```

1. Install root dependencies:
```powershell
npm install
```

2. Install backend dependencies:
```powershell
cd backend
npm install
cd ..
```

3. Install frontend dependencies:
```powershell
cd frontend
npm install
cd ..
```

### 1.3 Run Locally (Development Mode)
You can run both Frontend and Backend concurrently with one command from the project root:
```powershell
npm run dev
```

Or run them in separate terminal windows:
- **Terminal 1 (Backend API):**
  ```powershell
  cd backend
  npm run dev
  ```
  *(Backend starts on `http://localhost:3001`)*

- **Terminal 2 (Frontend Client):**
  ```powershell
  cd frontend
  npm run dev
  ```
  *(Frontend opens on `http://localhost:5173`)*

Open your browser to: **`http://localhost:5173`**

---

## 🗄️ STEP 2: Supabase Database Setup

### 2.1 Create Supabase Account & Project
1. Go to [https://supabase.com](https://supabase.com) and sign up for a free account.
2. Click **"New project"**.
3. Choose an organization, enter a project name (e.g. `unation-placement-db`), choose a database password (save this securely), and select the closest region.
4. Click **"Create new project"** and wait ~1 minute for setup to finish.

### 2.2 Run Database Migration
1. In the Supabase Dashboard, look at the left sidebar and click on **SQL Editor** (icon looks like `>_`).
2. Click **"+ New Query"**.
3. Open the file `supabase/migrations/001_initial_schema.sql` on your computer.
4. Copy the entire contents of that file and paste it into the Supabase SQL Editor.
5. Click the green **"Run"** button in the bottom right.
6. You will see `Success. No rows returned`. All tables (`test_ids`, `students`, `test_sessions`, `results`, `admin_settings`) and Row-Level Security policies are now created!

### 2.3 Retrieve Supabase API Keys
1. In the left sidebar of Supabase, click **Project Settings** (gear icon at the bottom).
2. Click on **API**.
3. You will see:
   - **Project URL:** `https://xxxxxxxxxxxxxxxx.supabase.co`
   - **anon public key:** (starts with `ey...`)
   - **service_role secret key:** (starts with `ey...`) *(Keep this private!)*

---

## ⚙️ STEP 3: Environment Variables Configuration

### 3.1 Backend Configuration (`backend/.env`)
Open `backend/.env` in your text editor (VS Code, Notepad, etc.) and paste your values:

```env
PORT=3001
NODE_ENV=development

# Paste your Supabase values here:
SUPABASE_URL=https://your-project-id.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-supabase-service-role-key-here

# Admin Login Username
ADMIN_USERNAME=admin

# Generate your password hash using: cd backend && npm run setup-admin YourPassword
ADMIN_PASSWORD_HASH=$2a$12$e8g3J7eG9nB8uT3hR4f1i.5Q1yW8zZ3aB2cD4eF6gH8iJ0kL2mN4o
JWT_SECRET=your_long_random_jwt_secret_change_in_production

# Frontend URL (for CORS)
FRONTEND_URL=http://localhost:5173

# Optional: Telegram Bot Token (from BotFather)
TELEGRAM_BOT_TOKEN=
```

### 3.2 Setting Your Custom Admin Password
To create your own custom admin password:
```powershell
cd backend
npm run setup-admin MySecurePass2026
```
Copy the generated `ADMIN_PASSWORD_HASH=...` output and paste it into `backend/.env`.

---

## 🤖 STEP 4: Telegram Bot & Mini App Integration

### 4.1 Create the Bot with @BotFather
1. Open the Telegram app and search for **`@BotFather`**.
2. Click **Start** and send the command:
   ```
   /newbot
   ```
3. Enter a display name:
   ```
   UNATION English Level Check
   ```
4. Enter a unique username ending in `bot`:
   ```
   UnationLevelCheckBot
   ```
5. BotFather will provide your **HTTP API Token** (e.g. `7123456789:AAFnk...`).
6. Copy this token and put it in `backend/.env` under `TELEGRAM_BOT_TOKEN=`.

### 4.2 Configure the Telegram Mini App (Menu Button)
1. In **@BotFather**, send:
   ```
   /setmenubutton
   ```
2. Select your bot.
3. Enter the Web App URL (your deployed frontend URL on Vercel, e.g. `https://unation-level.vercel.app` or your local tunnel).
4. Enter the button title:
   ```
   🚀 Start Level Test
   ```
5. Now, whenever students open your bot on Telegram, they can tap **Start Level Test** and the test will run directly inside Telegram as a native Telegram Mini App!

---

## 🌐 STEP 5: Deploying to Production (Vercel)

### 5.1 Push to GitHub
1. Create a free account on [GitHub](https://github.com).
2. Click **"New repository"**, name it `unation-placement-test`, set it to **Private**, and click **"Create repository"**.
3. In your local terminal:
```powershell
cd "c:\Users\ASUS\Desktop\unition bot"
git init
git add .
git commit -m "feat: complete UNATION English Placement Test platform"
git branch -M main
git remote add origin https://github.com/YOUR_GITHUB_USERNAME/unation-placement-test.git
git push -u origin main
```

### 5.2 Deploy Backend to Vercel
1. Go to [Vercel](https://vercel.com) and log in with GitHub.
2. Click **"Add New"** → **"Project"** and select your repository.
3. Set **Root Directory** to `backend`.
4. In **Environment Variables**, add:
   - `SUPABASE_URL`
   - `SUPABASE_SERVICE_ROLE_KEY`
   - `ADMIN_USERNAME`
   - `ADMIN_PASSWORD_HASH`
   - `JWT_SECRET`
   - `FRONTEND_URL` = (URL of your frontend)
   - `TELEGRAM_BOT_TOKEN`
5. Click **"Deploy"**. Note your backend URL (e.g. `https://unation-backend.vercel.app`).

### 5.3 Deploy Frontend to Vercel
1. In Vercel, click **"Add New"** → **"Project"** again with the same repository.
2. Set **Root Directory** to `frontend`.
3. In **Environment Variables**, add:
   - `VITE_API_URL` = `https://unation-backend.vercel.app`
4. Click **"Deploy"**. Your live placement test site is ready!

---

## 🔐 STEP 6: Administrator Guide

### 6.1 Accessing the Admin Portal
- Navigate in your browser to: **`/admin`** (e.g. `http://localhost:5173/admin` or `https://your-site.vercel.app/admin`).
- Enter your admin username and password.

### 6.2 Generating Test IDs
1. Click on the **"Test IDs"** tab.
2. Select how many IDs you want to create (1, 5, 10, 25, or 50) and click **"Generate"**.
3. Unique codes formatted like `UNA-9F2-K8A` will be created.
4. Click the **Copy** button next to any code to copy it and send it to your student.
5. If an unused ID is no longer needed, you can click the **Trash** icon to revoke it.

### 6.3 Viewing Student Records & Results
1. Click the **"Student History"** tab.
2. Search by student name or test ID code.
3. Filter by English level (Beginner through Advanced).
4. Click **"Export CSV"** to download all completed student records as an Excel-compatible spreadsheet.

### 6.4 History Display Toggle
1. Click the **"Settings"** tab.
2. Toggle the **"Student History Browsing Display"** switch.
3. When toggled off, the browsing tab is hidden from the dashboard while all essential database records and security logs remain intact.

---

## 🧪 STEP 7: Testing & Verification Checklist

- [x] **Registration:** Validates that ID exists and is unused before starting.
- [x] **Timer Integrity:** Countdown starts at 60:00 and decreases based on server timestamp; refreshing the page preserves the timer without resetting.
- [x] **Navigation:** Questions 1–120 strictly follow the original order; answers do not auto-advance; student must click NEXT.
- [x] **Reading Section (101–120):** Shows scrollable reading passages for Gold (101–106), Burning Sun (107–112), and Tigers (113–120).
- [x] **Scoring Accuracy:** Verified against all 120 questions from the official answer key.
- [x] **Score Boundaries:**
  - `0 - 20` = Beginner
  - `21 - 35` = Elementary
  - `36 - 60` = Pre-intermediate
  - `61 - 85` = Intermediate
  - `86 - 100` = Upper Intermediate
  - `101 - 120` = Advanced
- [x] **Result & Certificate:** Generates a custom UNATION digital placement card with high-resolution PNG image download.
- [x] **Security:** Answer keys are never transmitted to the browser; only score and placement level are returned upon submission.
