DROP USER IF EXISTS 'db_owner'@'localhost';
CREATE USER 'db_owner'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES
    ON instagram.*
    TO 'db_owner'@'localhost';

DROP USER IF EXISTS 'db_datareader'@'localhost';
CREATE USER 'db_datareader'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT 
	ON instagram.* 
	TO 'db_datareader'@'localhost';

DROP USER IF EXISTS 'db_datawriter'@'localhost';
CREATE USER 'db_datawriter'@'localhost' IDENTIFIED BY 'password';
GRANT INSERT, UPDATE, DELETE
    ON instagram.*
    TO 'db_datawriter'@'localhost';

DROP USER IF EXISTS 'db_security'@'localhost';
CREATE USER 'db_security'@'localhost' IDENTIFIED BY 'password';
GRANT GRANT OPTION
    ON instagram.*
    TO 'db_security'@'localhost';

GRANT EXECUTE ON FUNCTION get_comment_num TO 'db_datareader'@'localhost';
GRANT EXECUTE ON FUNCTION get_follower_num TO 'db_datareader'@'localhost';
GRANT EXECUTE ON FUNCTION get_following_num TO 'db_datareader'@'localhost';
GRANT EXECUTE ON FUNCTION get_like_num TO 'db_datareader'@'localhost';
GRANT EXECUTE ON FUNCTION get_name TO 'db_datareader'@'localhost';
GRANT EXECUTE ON FUNCTION get_photo_num TO 'db_datareader'@'localhost';
GRANT EXECUTE ON FUNCTION get_reply_num TO 'db_datareader'@'localhost';
GRANT EXECUTE ON FUNCTION get_avatar TO 'db_datareader'@'localhost';

GRANT EXECUTE ON FUNCTION get_comment_num TO 'db_owner'@'localhost';
GRANT EXECUTE ON FUNCTION get_follower_num TO 'db_owner'@'localhost';
GRANT EXECUTE ON FUNCTION get_following_num TO 'db_owner'@'localhost';
GRANT EXECUTE ON FUNCTION get_like_num TO 'db_owner'@'localhost';
GRANT EXECUTE ON FUNCTION get_name TO 'db_owner'@'localhost';
GRANT EXECUTE ON FUNCTION get_photo_num TO 'db_owner'@'localhost';
GRANT EXECUTE ON FUNCTION get_reply_num TO 'db_owner'@'localhost';
GRANT EXECUTE ON FUNCTION get_avatar TO 'db_owner'@'localhost';

GRANT EXECUTE ON PROCEDURE add_block TO 'db_owner'@'localhost';
GRANT EXECUTE ON PROCEDURE add_like TO 'db_owner'@'localhost';
GRANT EXECUTE ON PROCEDURE add_unlike TO 'db_owner'@'localhost';
GRANT EXECUTE ON PROCEDURE check_block TO 'db_owner'@'localhost';
GRANT EXECUTE ON PROCEDURE check_follow TO 'db_owner'@'localhost';
GRANT EXECUTE ON PROCEDURE check_private_acc TO 'db_owner'@'localhost';
GRANT EXECUTE ON PROCEDURE check_user_to_photo TO 'db_owner'@'localhost';




