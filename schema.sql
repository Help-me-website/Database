

CREATE TABLE if not exists  User (
    user_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, 
    reputation INT DEFAULT 0, 
    role ENUM('user', 'admin') DEFAULT 'user',
    account_status ENUM('active', 'suspended', 'deactivated') DEFAULT 'active',
    profile_picture TEXT,
    bio TEXT,
    last_login DATETIME DEFAULT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
);



CREATE TABLE  if not exists  Category (
    category_id INT AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (category_id)
);
CREATE TABLE if not exists  Question (
    question_id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    views INT DEFAULT 0,
    number_of_users INT DEFAULT 1,
    category_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (question_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Category(category_id) ON DELETE CASCADE
);

CREATE TABLE if not exists  Answer (
    answer_id INT AUTO_INCREMENT,
    question_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    is_accepted BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (answer_id),
    FOREIGN KEY (question_id) REFERENCES Question(question_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);


CREATE TABLE if not exists Comment (
    comment_id INT AUTO_INCREMENT,
    question_id INT DEFAULT NULL,
    answer_id INT DEFAULT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (question_id) REFERENCES Question(question_id) ON DELETE CASCADE,
    FOREIGN KEY (answer_id) REFERENCES Answer(answer_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);



-- CREATE TABLE if not exists  QuestionCategory (
--     question_id INT NOT NULL,
--     category_user_seqid INT NOT NULL,
--     PRIMARY KEY (question_id, category_id),
--     FOREIGN KEY (question_id) REFERENCES Question(question_id) ON DELETE CASCADE,
--     FOREIGN KEY (category_id) REFERENCES Category(category_id) ON DELETE CASCADE
-- );
-- Default Values for categories
INSERT INTO Category (name, description) 
VALUES 
    ('Tech', 'Questions related to technology, gadgets, and software.'),
    ('Edu', 'Educational topics, resources, and learning techniques.'),
    ('Dev', 'Software development, programming, and coding practices.'),
    ('Health', 'Health, wellness, and medical advice or discussions.'),
    ('Hoppies', 'Topics related to hobbies and recreational activities.'),
    ('Society', 'Social issues, culture, and community-related topics.'),
    ('Skills', 'Discussions about developing and improving skills.'),
    ('Science', 'Scientific discoveries, research, and discussions.'),
    ('Miscellaneous', 'General topics that do not fit into other categories.');
