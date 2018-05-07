# instagram-api-clone  


### `/login`
```json
{
  "username": "a",
  "password": "a"
}
```
Reponse: JWT in Authorization header

`Authorization: Ins eyJhbGciOiJIUzUxMiJ9.eyJqdGkiOiI2NjYxODJhMS1jM2RiLTRlZWItYThmMS04Njk1YjVlYjM3YzAiLCJzdWIiOiJhIiwiaWF0IjoxNTI1NDA1NDE5LCJleHAiOjE1MjU0NDg2MTl9.e5_DIjUpbEPVWBszE4YBGXgq3ZARaqUrvDeuLy9dL3exwf59ZXT-_jEoxF2lUVsHqMJo_zN7pvA8utcqCABSBw`

## Download
### `/download/photo/{photo_id}`
### `/download/avatar/{username}`
### `/download/story/{story_id}`

## Photo
### `/newfeed/{start}/{limit}`
### `/comment/{photo_id}/{start}/{limit}`
### `/reply/{comment_id}/{start}/{limit}`
### `/newfeed/all`

## Account
### `POST /signup`
### `GET /account`
### `PUT /account/updateInfo`
### `PUT /account/updatePassword`

## Upload
### `upload/photo` or `upload/avatar` or `upload/story`
### 
```json
{
  "file": {file},
}
```


