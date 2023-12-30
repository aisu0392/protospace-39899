## テーブル設計

### Users テーブル
| カラム名            | データ型    | 制約             |
|--------------------|------------|-----------------|
| id                 | INTEGER    | PRIMARY KEY     |
| email              | string     | NOT NULL, UNIQUE|
| encrypted_password | string     | NOT NULL        |
| name               | string     | NOT NULL        |
| profile            | TEXT       | NOT NULL        |
| occupation         | TEXT       | NOT NULL        |
| position           | TEXT       | NOT NULL        |

### Prototypes テーブル
| カラム名        | データ型     | 制約                    |
|---------------|------------|------------------------|
| id            | INTEGER    | PRIMARY KEY            |
| title         | string     | NOT NULL               |
| catch_copy    | TEXT       | NOT NULL               |
| concept       | TEXT       | NOT NULL               |
| user_id       | INTEGER    | NOT NULL, FOREIGN KEY |

### Comments テーブル
| カラム名       | データ型     | 制約                    |
|--------------|------------|------------------------|
| id           | INTEGER    | PRIMARY KEY            |
| content      | TEXT       | NOT NULL               |
| prototype_id | INTEGER    | NOT NULL, FOREIGN KEY |
| user_id      | INTEGER    | NOT NULL, FOREIGN KEY |

