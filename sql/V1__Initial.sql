CREATE TABLE if not exists user (
    user_id CHAR(36) PRIMARY KEY DEFAULT (uuid()),
    first_name varchar(255) NOT NULL,
	middle_name varchar(255),
    last_name varchar(255) NOT NULL,
	email varchar(255) NOT NULL UNIQUE,
    password varchar(50) NOT NULL,
    role varchar(255),
	verified boolean
);

ALTER TABLE user
ADD CONSTRAINT constraint_email UNIQUE (email);

CREATE TABLE if not exists token (
	id CHAR(36) PRIMARY KEY DEFAULT (uuid()),
	user_id CHAR(36) NOT NULL,
	token varchar(255) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    confirmed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE token
ADD FOREIGN KEY (user_id) REFERENCES user(user_id);


CREATE TABLE if not exists tag (
	tag_id CHAR(36) PRIMARY KEY DEFAULT (uuid()),
	user_id CHAR(36) NOT NULL,
	name varchar(255) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE tag
ADD FOREIGN KEY (user_id) REFERENCES user(user_id);

CREATE TABLE if not exists list (
	list_id CHAR(36) PRIMARY KEY DEFAULT (uuid()),
	user_id CHAR(36) NOT NULL,
	name varchar(255) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE list
ADD FOREIGN KEY (user_id) REFERENCES user(user_id);

CREATE TABLE if not exists task (
	task_id CHAR(36) PRIMARY KEY DEFAULT (uuid()),
	list_id CHAR(36) NOT NULL,
	summary varchar(255) NOT NULL,
    task varchar(500) NOT NULL,
    due_date DATE NOT NULL,
    priority int NOT NULL,
    status int NOT NULL
);

ALTER TABLE task
ADD FOREIGN KEY (list_id) REFERENCES list(list_id);

CREATE TABLE task_tags (
    task_id CHAR(36),
    tag_id CHAR(36),
    FOREIGN KEY (task_id) REFERENCES task(task_id),
    FOREIGN KEY (tag_id) REFERENCES tag(tag_id)
);

CREATE TABLE if not exists remainder (
	remainder_id CHAR(36) PRIMARY KEY DEFAULT (uuid()),
	task_id CHAR(36) NOT NULL,
	message varchar(255) NOT NULL,
    sent_time DATETIME NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE remainder
ADD FOREIGN KEY (task_id) REFERENCES task(task_id);
