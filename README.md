# instagram-api-clone  


- `/login`
```json
{
  "username": "a",
  "password": "a"
}
```
Reponse: JWT in Authorization header

`Authorization: Ins eyJhbGciOiJIUzUxMiJ9.eyJqdGkiOiI2NjYxODJhMS1jM2RiLTRlZWItYThmMS04Njk1YjVlYjM3YzAiLCJzdWIiOiJhIiwiaWF0IjoxNTI1NDA1NDE5LCJleHAiOjE1MjU0NDg2MTl9.e5_DIjUpbEPVWBszE4YBGXgq3ZARaqUrvDeuLy9dL3exwf59ZXT-_jEoxF2lUVsHqMJo_zN7pvA8utcqCABSBw`

## Download
- `GET /download/photo/{photo_id}`
- `GET /download/avatar/{username}`
- `GET /download/story/{story_id}`

## Photo
- `GET /newfeed/{start}/{limit}`
- `GET /comment/{photo_id}/{start}/{limit}`
- `GET /reply/{comment_id}/{start}/{limit}`
- `GET /newfeed/all`

## Account
- `POST /signup`
```json
{
        "username": "usertest",
        "password": "passwordtest",
        "email": "email@gmail.com",
        "name": "Name",
}
```
- `GET /account`
- `PUT /account/updateInfo`
```json
{
        "username": "usertest",
        "email": "email@gmail.com",
        "name": "Name",
}
```
- `PUT /account/updatePassword`
```json
{
        "password": "passwordtest",
}
```
## Upload
- `POST /photo`
- `POST /avatar`
- `POST /story`
- 

