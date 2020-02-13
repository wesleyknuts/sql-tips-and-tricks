BEGIN
        DECLARE position, result, longitude INT(11) DEFAULT 0;
        DECLARE string2 VARCHAR(255);
        SET longitude = LENGTH(string1);
        SET result = CONVERT(string1, SIGNED);
        IF result = 0 THEN
            IF string1 REGEXP('[0-9]') THEN
                SET position = 2;
                checkString:WHILE position <= longitude DO
                    SET string2 = SUBSTR(string1 FROM position);
                    IF CONVERT(string2, SIGNED) != 0 THEN
                        SET result = CONVERT(string2, SIGNED);
                        LEAVE checkString;
                    END IF;
                    SET position = position + 1;
                END WHILE;
           END IF;
        END IF;
        RETURN result;
    END
