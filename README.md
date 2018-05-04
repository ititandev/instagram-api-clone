# instagram-api-clone  


### `\login`
```json
{
  "username": "a",
  "password": "a"
}
```
Reponse: JWT in Authorization header

`Authorization: Ins eyJhbGciOiJIUzUxMiJ9.eyJqdGkiOiI2NjYxODJhMS1jM2RiLTRlZWItYThmMS04Njk1YjVlYjM3YzAiLCJzdWIiOiJhIiwiaWF0IjoxNTI1NDA1NDE5LCJleHAiOjE1MjU0NDg2MTl9.e5_DIjUpbEPVWBszE4YBGXgq3ZARaqUrvDeuLy9dL3exwf59ZXT-_jEoxF2lUVsHqMJo_zN7pvA8utcqCABSBw`


### `\download\photo\{photo_id}`
Response: image `photo_id.jpg`

### `\download\avatar\{username}`
Response: current avatar of `username`

### `\download\story\{story_id}`
Response: image `story_id.jpg`

### `upload\photo` or `upload\avatar` or `upload\story`
### 
```json
{
  "file": {file},
}
```
Response: 
```json
{
  "result": "success"
}
```
```json
{
  "result": "error"
}
```


