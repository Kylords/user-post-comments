# GraphQL Rails API

## 📌 Overview

This project is a **GraphQL API built with Ruby on Rails**.  
It demonstrates core GraphQL concepts including schema design, queries, mutations, subscriptions, filtering, and performance optimization using DataLoaders.

The project is intended as a **learning and portfolio project**, focusing on clean structure and correct GraphQL patterns.

---

## 🧱 Models & Associations

### Models

- `User`
- `Post`
- `Comment`

### Associations

- A `User` has many `Posts`
- A `Post` belongs to a `User`
- A `Post` has many `Comments`
- A `Comment` belongs to a `Post`
- A `Comment` belongs to a `User`

---

## 🔍 Queries

The API provides queries for retrieving data such as:

- All users
- All posts
- Posts filtered by specific fields
- Records ordered by date or alphabetically

### Supported features

- Filtering queries
- Ordering by:
  - `created_at`
  - Alphabetical fields (e.g. user name)

---

## ✏️ Mutations

Mutations are implemented for modifying data, including:

- Creating users
- Creating posts

All mutations perform input validation and return either the updated data or relevant errors.

---

## 🚀 Subscriptions

GraphQL subscriptions are used to support **real-time updates**.

Examples:
- Subscribe to newly created posts
- Automatically receive updates when records are created or modified

---

## ⚡ Performance (N+1 Prevention)

To avoid N+1 query issues, the project uses **GraphQL DataLoaders**:

- Batch-loading associations
- Minimizing database queries
- Improving query performance for nested fields

---

## 🔎 Filtering & Ordering

Basic filtering and ordering are supported:

- Filter posts based on search terms
- Order results by:
  - `created_at`
  - Alphabetical fields

---

## 🛠 Tech Stack

- **Ruby on Rails**
- **graphql-ruby**
- **PostgreSQL**

---

## 📄 License

This project is for educational purposes.
