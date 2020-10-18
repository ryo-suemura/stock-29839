# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items

## itemsテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| number        | integer    | null: false       |
| name          | string     | null: false       |
| author        | string     | null: false       |
| stock         | integer    | null: false       |
| genre_id      | integer    | null: false       |
| code_id       | integer    | null: false       |
| publisher_id  | integer    | null: false       |
| user          | references | foreign_key: true |


## Association

- belongs_to :user
