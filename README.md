# Projects API

## Create
### Request
- type: POST
- path: /projects/
- content: JSON
- request body:
  ```
  {
    "user_id": integer,
    "name": string
  }
  ```
  
### Response:
- content: JSON
- codes:
  - 200 Ok - success
  - 400 Bad Request - prams missing/incorrect
- content on success:
  ```
  {
    "id": integer
  }
  ```
  
## Assign
### Request
- type: PUT
- path: /projects/:id/unassign
- content: JSON
- request body:
  ```
  {
    "user_id": integer
  }
  ```
  
### Response
- content: JSON
- codes:
  - 204 no content - success
  - 400 Bad Request - params missing/incorrect, user has already been assigned
  
## Unassign
### Request
- type: PUT
- path: /projects/:id/assign
- content: JSON
- request body:
  ```
  {
    "user_id": integer
  }
  ```
### Response
- content: JSON
- codes:
  - 204 no content - success
  - 400 Bad Request - params missing/incorrect, user has already been unassigned
  
## Index
### Request
- type: GET
- path: /projects/
- content: JSON
- request body:
  ```
  {
    "user_id": integer
  }
  ```
  
### Response
- content: JSON
- codes:
  - 200 Ok - success
  - 400 Bad Request - params missing or incorrect
- content on success:
  ```
  {
    [
      {
        "id": integer,
        "name": string
      }
    ]
  }
  ```

## Show
### Request
- type: GET
- path: /projects/:id
- content: JSON
  
### Response
- content: JSON
- codes:
  - 200 Ok - success
  - 400 Bad Request - params missing or incorrect
  - 404 Not Found - project does not exist
- content on success:
  ```
  {
    [
      {
        "created_at": datetime,
        "id": integer,
        "name": string,
        "updated_at": datetime
      }
    ]
  }
  ```
