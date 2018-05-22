DELIMITER //
CREATE TRIGGER after_account_insert AFTER INSERT 
ON account
FOR EACH ROW
BEGIN
	INSERT INTO setting(username,private_acc)
    VALUES (NEW.username,1);
    INSERT INTO profile (username)
    VALUES (NEW.username);
END;
//

DELIMITER //
CREATE TRIGGER after_comment_insert AFTER INSERT 
ON comment
FOR EACH ROW
BEGIN
	DECLARE usern VARCHAR(50);
    SELECT username
    FROM photo
    WHERE photo_id = NEW.photo_id
    INTO usern;
    
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (usern,0,0,NEW.comment_id);
END;
//
DELIMITER //
CREATE TRIGGER after_reply_insert AFTER INSERT 
ON reply
FOR EACH ROW
BEGIN
	DECLARE usern VARCHAR(50);
    SELECT username
    FROM comment
    WHERE comment_id = NEW.comment_id
    INTO usern;
    
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (usern,0,1,NEW.reply_id);
END;
//
DELIMITER //
CREATE TRIGGER after_follow_insert AFTER INSERT 
ON follow
FOR EACH ROW
BEGIN
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (NEW.username2,0,2,NEW.follow_id);
END;
//
DELIMITER //
CREATE TRIGGER after_like_insert AFTER INSERT 
ON `like`
FOR EACH ROW
BEGIN
	DECLARE usern VARCHAR(50);
    SELECT username
    FROM photo
    WHERE photo_id = NEW.photo_id
    INTO usern;
    
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (usern,0,3,NEW.like_id);
END;
//
DELIMITER //
CREATE TRIGGER after_tag_in_photo_insert AFTER INSERT 
ON tag_in_photo
FOR EACH ROW
BEGIN
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (NEW.username,0,4,NEW.tag_in_photo_id);
END;
//
DELIMITER //
CREATE TRIGGER after_tag_in_comment_insert AFTER INSERT 
ON tag_in_comment
FOR EACH ROW
BEGIN
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (NEW.username,0,5,NEW.tag_in_comment_id);
END;
//
DELIMITER //
CREATE TRIGGER after_tag_in_reply_insert AFTER INSERT 
ON tag_in_reply
FOR EACH ROW
BEGIN
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (NEW.username,0,6,NEW.tag_in_reply_id);
END;
//

