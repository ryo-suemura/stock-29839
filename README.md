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

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| author        | string  | null: false |
| publish_day   | date    | null: false |
| stock         | integer | null: false |
| genre_id      | integer | null: false |
| code_id       | integer | null: false |
| publisher_id  | integer | null: false |
| condition_id  | integer | null: false |
| remark        | text    |             |

## Association

- belongs_to :user
