# Gifty
[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

## Table of contents

[**About**](#about) |
[**Versions**](#versions) |
[**Setup**](#setup) |
[**Endpoints**](#endpoints) |
[**Examples**](#examples) |
[**Tests**](#tests) |
[**Database**](#database) |
[**Developers**](#developers) |


## About
The Gifty Backend is designed to support the Front end of the Gifty Application. Gifty is an application for people who need help remembering when their friends and families birthdays are occuring and add gifts to ensure they never forget the special day. 

## Versions
* Ruby 2.5.3
* Rails 5.2.5

## Setup
If you are running this API locally, follow the steps below:
  1. Fork and clone this repo
  2. Install gem packages by running `bundle`
  3. Setup the database: `rails db:(drop,create,migrate,seed)` or `rails db:setup`
  4. Run command `rails s` and navigate to http://localhost:3000 to consume API endpoints below via your browser or postman
  5. To determine active user ids in the application for use of create and conversation endpoints run `rails c` to open the rails console, then type `User.all` to return all users in the Database specificially refernce the User that will be used for all calls which should be `id: 1`

## Endpoints
| Method   | URL                                                        | Description                              | Accepted Params                               |
| -------- | -----------------------------------------------------------| ---------------------------------------- |-----------------------------------------------                       |
| `get`    | `/api/v1/users/:user_id/friends`                           | Fetch all user's friends                 |none                                                                   |
| `post`   | `/api/v1/users/:user_id/friends`                           | Create a user's friends                  |name: 'String', birthday: 'String', memo:'Text'                     |
| `get`    | `/api/v1/users/:user_id/friends/:friend_id`                | Fetch a specific user                    |none                                                                   |
| `delete` | `/api/v1/users/:user_id/friends/:friend_id`                | Delete a specific user's friend          |none                                                                   |
| `get`    | `/api/v1/users/:user_id/friends/:friend_id/gifts`          | Fetch a specific friend's gifts          |none                                                                   |
| `post`   | `/api/v1/users/:user_id/friends/:friend_id/gifts`          | Create a friends gift                    |name: 'String', description: 'String', status: 'Pending' || 'Purchased'|
| `get`    | `/api/v1/users/:user_id/friends/:friend_id/gifts/:gift_id` | Fetch a specific gift                    |none                                                                   |
| `delete` | `/api/v1/users/:user_id/friends/:friend_id/gifts/:gift_id` | Delete a specific gift                   |none                                                                   |

## Examples
 **Fetch all user's friends**
 ```
 {
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "name": "Dione Travis",
            "email": "user@email.com",
            "birthday": "2020-11-03"
        },
        "relationships": {
            "friends": {
                "data": [
                    {
                        "id": "1",
                        "type": "friend"
                    }
                ]
            }
        }
    },
    "included": [
        {
            "id": "1",
            "type": "friend",
            "attributes": {
                "name": "Kendall",
                "birthday": "2020-12-11",
                "id": 1,
                "memo": " Enjoys things",
                "need_gift": false
            },
            "relationships": {
                "gifts": {
                    "data": []
                }
            }
        }
    ]
}
```
**Create a user's friend**
```
{
    "data": {
        "id": "21",
        "type": "friend",
        "attributes": {
            "name": "Joey",
            "birthday": "1989-09-29",
            "id": 21,
            "memo": "Enh he is alright",
            "need_gift": true
        },
        "relationships": {
            "gifts": {
                "data": []
            }
        }
    }
}
```
**Fetch a specific user**
```
{
    "data": {
        "id": "1",
        "type": "friend",
        "attributes": {
            "name": "Kendall",
            "birthday": "2020-12-11",
            "id": 1,
            "memo": " Enjoys things",
            "need_gift": false
        },
        "relationships": {
            "gifts": {
                "data": [
                    {
                        "id": "1",
                        "type": "gift"
                    }
                ]
            }
        }
    },
    "included": [
        {
            "id": "1",
            "type": "gift",
            "attributes": {
                "name": "Lego",
                "description": "building blocks",
                "status": "purchased"
            }
        }
    ]
}
```
**Fetch a specific friends gifts**
```
{
    "data": {
        "id": "1",
        "type": "friend",
        "attributes": {
            "name": "Kendall",
            "birthday": "2020-12-11",
            "id": 1,
            "memo": " Enjoys things",
            "need_gift": false
        },
        "relationships": {
            "gifts": {
                "data": [
                    {
                        "id": "1",
                        "type": "gift"
                    }
                ]
            }
        }
    },
    "included": [
        {
            "id": "1",
            "type": "gift",
            "attributes": {
                "name": "Lego",
                "description": "building blocks",
                "status": "purchased"
            }
        }
    ]
}
```
**Create a gift**
```
{
    "data": {
        "id": "7",
        "type": "gift",
        "attributes": {
            "name": "Nintendo Switch",
            "description": "Nintendo video game",
            "status": "pending"
        }
    }
}
```
**Get a specific gift**
```
{
    "data": {
        "id": "1",
        "type": "gift",
        "attributes": {
            "name": "Lego",
            "description": "building blocks",
            "status": "purchased"
        }
    }
}
```

## Tests
All tests live within the spec folder to run the tests from your command line run `bundle exec rspec`

## Database
![Screen Shot 2021-07-15 at 11 12 19 PM](https://user-images.githubusercontent.com/75232735/125895328-f335dfb6-936a-477f-a12a-68fa960c9d3a.png)

## Developers 
